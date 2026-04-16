<?php

namespace Controllers\Historial;

use Controllers\PrivateController;
use Views\Renderer;
use Controllers\PrivateNoAuthException;

class Listado extends PrivateController
{
    public function run(): void
    {
        $usercod = \Utilities\Security::getUserId();

        $puedeVer = \Utilities\Security::isInRol($usercod, "ADMIN") || \Utilities\Security::isInRol($usercod, "CLIENTE");
        if (!$puedeVer) {
            throw new PrivateNoAuthException();
        }

        $esAdmin = \Utilities\Security::isInRol($usercod, "ADMIN");

        if ($esAdmin) {
            $historial = \Dao\Checkout\Transacciones::getAllHistorial();
        } else {
            $historial = \Dao\Checkout\Transacciones::getHistorialByUser($usercod);
        }

        $viewData = [
            "historial" => $historial,
            "titulo" => $esAdmin ? "Historial General de Transacciones" : "Mi Historial de Compras"
        ];

        Renderer::render("historial/listado", $viewData);
    }
}
?>