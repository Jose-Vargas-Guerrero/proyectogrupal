<?php
namespace Controllers\Menu;

use Controllers\PublicController;
use Views\Renderer;

class Checkout extends PublicController {
    public function run(): void {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (!isset($_SESSION["order_cart"]) || count($_SESSION["order_cart"]) === 0) {
            \Utilities\Site::redirectTo("index.php?page=Menu-Listado");
        }

        $cart = $_SESSION["order_cart"];
        $subtotal = 0;
        foreach ($cart as $item) {
            $subtotal += ($item["precio"] * $item["cantidad"]);
        }
        $isv = $subtotal * 0.15;
        $total = $subtotal + $isv;

        $viewData = [
            "total_paypal" => number_format($total, 2, '.', ''), 
            "total_mostrar" => number_format($total, 2),
            "cart_items" => array_values($cart)
        ];

        Renderer::render("menu/checkout", $viewData);
    }
}