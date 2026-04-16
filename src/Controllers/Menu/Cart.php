<?php
namespace Controllers\Menu; // Sincronizado con Listado.php

use Controllers\PublicController;
use Utilities\Site;

class Cart extends PublicController {
    public function run(): void {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $id = $_GET["id"] ?? "";
        $nombre = $_GET["nombre"] ?? "";
        $precio = floatval($_GET["precio"] ?? 0);
        $action = $_GET["action"] ?? "add";

        if (!isset($_SESSION["order_cart"])) {
            $_SESSION["order_cart"] = [];
        }

        switch ($action) {
            case "add":
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
                break;
            case "sub":
                if (isset($_SESSION["order_cart"][$id])) {
                    $_SESSION["order_cart"][$id]["cantidad"]--;
                    if ($_SESSION["order_cart"][$id]["cantidad"] <= 0) {
                        unset($_SESSION["order_cart"][$id]);
                    }
                }
                break;
            case "clear":
                unset($_SESSION["order_cart"]);
                break;
        }

        // Redirigir a la página correcta (Menu-Listado)
        Site::redirectTo("index.php?page=Menu-Listado");
    }
}