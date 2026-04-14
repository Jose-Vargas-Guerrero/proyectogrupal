<?php

namespace Controllers\Mantenimientos\Especialidades;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mantenimientos\Especialidades as DaoEspecialidades;

class Listado extends PublicController {

    public function run(): void {
        $viewData = [
            "especialidades" => DaoEspecialidades::getAll()
        ];

        Renderer::render("mantenimientos/especialidades/listado", $viewData);
    }
}