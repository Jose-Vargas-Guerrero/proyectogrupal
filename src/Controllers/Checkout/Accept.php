<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Accept extends PublicController
{
    public function run(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $dataView = array();
        $token = $_GET["token"] ?? "";
        $session_token = $_SESSION["orderid"] ?? "";

        if ($token !== "" && $token === $session_token) {
            $env = \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ENV");
            $paypalEnvironment = ($env === "LIVE") ? "live" : "sandbox";

            $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET"),
                $paypalEnvironment
            );

            $result = $PayPalRestApi->captureOrder($session_token);

            if (isset($result->status) && $result->status === "COMPLETED") {
                $usercod = \Utilities\Security::getUserId();
                $cart = $_SESSION["order_cart"] ?? [];

                $subtotal = 0;
                foreach ($cart as $item) {
                    $subtotal += ((float)$item["precio"] * (int)$item["cantidad"]);
                }
                $isv = $subtotal * 0.15;
                $total = $subtotal + $isv;

                if (
                    $usercod > 0 &&
                    count($cart) > 0 &&
                    !\Dao\Checkout\Transacciones::existeTransaccionPorOrderId($session_token)
                ) {
                    $transcod = \Dao\Checkout\Transacciones::crearTransaccion(
                        $usercod,
                        $session_token,
                        "PAYPAL",
                        $subtotal,
                        $isv,
                        $total,
                        "COMPLETED"
                    );

                    foreach ($cart as $item) {
                        \Dao\Checkout\Transacciones::agregarDetalle(
                            $transcod,
                            intval($item["id"]),
                            $item["nombre"],
                            floatval($item["precio"]),
                            intval($item["cantidad"])
                        );
                    }
                }

                unset($_SESSION["order_cart"]);
                unset($_SESSION["orderid"]);

                $dataView["paymentok"] = true;
                $dataView["paypal_orderid"] = $session_token;
                $dataView["total"] = number_format($total, 2);
            } else {
                $dataView["paymentok"] = false;
            }
        } else {
            $dataView["paymentok"] = false;
        }

        \Views\Renderer::render("paypal/accept", $dataView);
    }
}
?>