<?php

namespace Controllers\Menu;

use Controllers\PublicController;
use Views\Renderer;

class Cart extends PublicController
{
    public function run(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (!isset($_SESSION["order_cart"])) {
            $_SESSION["order_cart"] = [];
        }

        $action = $_GET["action"] ?? "";
        $id = intval($_GET["id"] ?? 0);
        $nombre = $_GET["nombre"] ?? "";
        $precio = floatval($_GET["precio"] ?? 0);
        $returnto = $_GET["returnto"] ?? "cart";
        $anchor = $_GET["anchor"] ?? "";

        if ($action !== "") {
            switch ($action) {
                case "add":
                    if ($id > 0) {
                        if (isset($_SESSION["order_cart"][$id])) {
                            $_SESSION["order_cart"][$id]["cantidad"]++;
                        } else {
                            $_SESSION["order_cart"][$id] = [
                                "id" => $id,
                                "nombre" => $nombre,
                                "precio" => $precio,
                                "cantidad" => 1
                            ];
                        }
                    }
                    $this->redirectAfterAction($returnto, $anchor);
                    break;

                case "sub":
                    if ($id > 0 && isset($_SESSION["order_cart"][$id])) {
                        $_SESSION["order_cart"][$id]["cantidad"]--;
                        if ($_SESSION["order_cart"][$id]["cantidad"] <= 0) {
                            unset($_SESSION["order_cart"][$id]);
                        }
                    }
                    $this->redirectAfterAction("cart", "");
                    break;

                case "clear":
                    $_SESSION["order_cart"] = [];
                    \Utilities\Site::redirectTo("index.php?page=Menu-Cart");
                    break;
            }
        }

        $cart = $_SESSION["order_cart"];
        $subtotal = 0;

        foreach ($cart as $item) {
            $subtotal += ((float)$item["precio"] * (int)$item["cantidad"]);
        }

        $isv = $subtotal * 0.15;
        $total = $subtotal + $isv;

        $viewData = [
            "has_items" => count($cart) > 0,
            "cart_items" => array_values($cart),
            "subtotal" => number_format($subtotal, 2),
            "isv" => number_format($isv, 2),
            "total" => number_format($total, 2)
        ];

        Renderer::render("menu/cart", $viewData);
    }

    private function redirectAfterAction(string $returnto, string $anchor): void
    {
        if ($returnto === "menu") {
            $url = "index.php?page=Menu-Listado";
            if ($anchor !== "") {
                $url .= "#" . $anchor;
            }
            \Utilities\Site::redirectTo($url);
        } else {
            \Utilities\Site::redirectTo("index.php?page=Menu-Cart");
        }
    }
}
?>