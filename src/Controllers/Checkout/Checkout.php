<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Checkout extends PublicController
{
    public function run(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (!isset($_SESSION["order_cart"]) || count($_SESSION["order_cart"]) === 0) {
            \Utilities\Site::redirectTo("index.php?page=Menu-Cart");
        }

        $cart = $_SESSION["order_cart"];
        $subtotal = 0;
        foreach ($cart as $item) {
            $subtotal += ((float)$item["precio"] * (int)$item["cantidad"]);
        }
        $isv = $subtotal * 0.15;
        $total = $subtotal + $isv;

        if ($this->isPostBack()) {
            $baseUrl = (
                ((isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] === "on") ? "https" : "http")
                . "://"
                . $_SERVER["HTTP_HOST"]
                . \Utilities\Context::getContextByKey("BASE_DIR")
            );

            $PayPalOrder = new \Utilities\PayPal\PayPalOrder(
                "ORD-" . time(),
                $baseUrl . "/index.php?page=Checkout_Error",
                $baseUrl . "/index.php?page=Checkout_Accept"
            );

            foreach ($cart as $item) {
                $precio = (float)$item["precio"];
                $cantidad = (int)$item["cantidad"];
                $impuestoUnitario = round($precio * 0.15, 2);

                $PayPalOrder->addItem(
                    $item["nombre"],
                    $item["nombre"],
                    "ESP-" . $item["id"],
                    $precio,
                    $impuestoUnitario,
                    $cantidad,
                    "PHYSICAL_GOODS"
                );
            }

            $env = \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ENV");
            $paypalEnvironment = ($env === "LIVE") ? "live" : "sandbox";

            $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET"),
                $paypalEnvironment
            );

            $PayPalRestApi->getAccessToken();
            $response = $PayPalRestApi->createOrder($PayPalOrder);

            if (isset($response->id)) {
                $_SESSION["orderid"] = $response->id;
            }

            if (isset($response->links)) {
                foreach ($response->links as $link) {
                    if ($link->rel === "approve") {
                        \Utilities\Site::redirectTo($link->href);
                    }
                }
            }

            \Utilities\Site::redirectTo("index.php?page=Checkout_Error");
        }

        $viewData = [
            "cart_items" => array_values($cart),
            "subtotal" => number_format($subtotal, 2),
            "isv" => number_format($isv, 2),
            "total" => number_format($total, 2)
        ];

        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
?>