<?php

namespace Controllers\Historial;

use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Site;
use Controllers\PrivateNoAuthException;

class Detalle extends PrivateController
{
    public function run(): void
    {
        $transcod = intval($_GET["transcod"] ?? 0);
        if ($transcod <= 0) {
            Site::redirectTo("index.php?page=Historial_Listado");
        }

        $transaccion = \Dao\Checkout\Transacciones::getTransaccionById($transcod);
        if (!$transaccion) {
            Site::redirectTo("index.php?page=Historial_Listado");
        }

        $usercod = \Utilities\Security::getUserId();
        $esAdmin = \Utilities\Security::isInRol($usercod, "ADMIN");

        if (!$esAdmin && intval($transaccion["usercod"]) !== $usercod) {
            throw new PrivateNoAuthException();
        }

        $detalle = \Dao\Checkout\Transacciones::getDetalleByTransaccion($transcod);

        $viewData = [
            "transaccion" => $transaccion,
            "detalle" => $detalle
        ];

        Renderer::render("historial/detalle", $viewData);
    }
}
?>