<?php

namespace Controllers\Mantenimientos\RolesUsuarios;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Mantenimientos\RolesUsuarios as RolesUsuariosDAO;

const LIST_VIEW_TEMPLATE = "mantenimientos/rolesusuarios/listado";

class Listado extends PrivateController
{
    private array $usuariosList = [];

    public function run(): void
    {
        $this->usuariosList = RolesUsuariosDAO::getAllUsuarios();
        Renderer::render(LIST_VIEW_TEMPLATE, $this->prepareViewData());
    }

    private function prepareViewData()
    {
        return [
            "usuarios" => $this->usuariosList,
            "showAssign" => $this->isFeatureAutorized("mnt_roles_usuarios"),
            "showDelete" => $this->isFeatureAutorized("mnt_roles_usuarios")
        ];
    }
}