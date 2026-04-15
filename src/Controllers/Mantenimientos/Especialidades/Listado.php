<?php

namespace Controllers\Mantenimientos\Especialidades;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Mantenimientos\Especialidades as DaoEspecialidades;
use Controllers\PrivateNoAuthException;

const LIST_VIEW_TEMPLATE = "mantenimientos/especialidades/listado";

class Listado extends PrivateController
{
    private array $especialidadesList = [];

    public function run(): void
    {
        if (!$this->isFeatureAutorized("mnt_especialidades")) {
            throw new PrivateNoAuthException();
        }

        $this->especialidadesList = DaoEspecialidades::getAll();

        Renderer::render(LIST_VIEW_TEMPLATE, $this->prepareViewData());
    }

    private function prepareViewData()
    {
        return [
            "especialidades" => $this->especialidadesList,
            "showNew" => $this->isFeatureAutorized("mnt_especialidades"),
            "showUpdate" => $this->isFeatureAutorized("mnt_especialidades"),
            "showDelete" => $this->isFeatureAutorized("mnt_especialidades")
        ];
    }
}
?>