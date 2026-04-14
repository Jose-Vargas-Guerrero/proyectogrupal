<?php

namespace Controllers\Mantenimientos\Especialidades;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mantenimientos\Especialidades as EspecialidadesDao;


const LIST_VIEW_TEMPLATE = "mantenimientos/especialidades/listado";

class Listado extends PublicController {

    private array $especialidadesList = [];

    public function run(): void {

        $this->especialidadesList = EspecialidadesDao::getAllEspecialidades();

        Renderer::render(LIST_VIEW_TEMPLATE, $this->prepareViewData());
    }

    private function prepareViewData(): array {
        return [
            "especialidades" => $this->especialidadesList
        ];
    }
}