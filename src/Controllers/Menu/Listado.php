<?php

namespace Controllers\Menu;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Menu\Menu as MenuDAO;

class Listado extends PublicController
{
    public function run(): void
    {
        // 1. Iniciar sesión para leer el carrito
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }   

        $categorias = MenuDAO::getCategorias();
        $menuData = [];

        foreach ($categorias as $categoria) {
            $menuData[] = [
                "categoria" => $categoria["categoria"],
                "items" => MenuDAO::getEspecialidadesByCategoria($categoria["categoria"])
            ];
        }

        // 2. Procesar datos del carrito para la vista
        $cart = $_SESSION["order_cart"] ?? [];
        $subtotal = 0;
        foreach ($cart as $item) {
            $subtotal += ($item["precio"] * $item["cantidad"]);
        }

        $isv = $subtotal * 0.15;
        $total = $subtotal + $isv;

        $viewData = [
            "menuData" => $menuData,
            "cart_items" => array_values($cart), // Reindexamos para el foreach de la vista
            "subtotal" => number_format($subtotal, 2),
            "isv" => number_format($isv, 2),
            "total" => number_format($total, 2),
            "total_raw" => $total, // Útil para pasarelas de pago
            "has_items" => count($cart) > 0
        ];

        Renderer::render("menu/listado", $viewData);
    }
}