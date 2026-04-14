<?php

namespace Controllers\Mantenimientos\FuncionesRoles;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Mantenimientos\FuncionesRoles as FuncionesRolesDAO;

const LIST_VIEW_TEMPLATE = "mantenimientos/funcionesroles/listado";

class Listado extends PrivateController
{
    private array $rolesList = [];

    public function run(): void
    {
        $this->rolesList = FuncionesRolesDAO::getAllRoles();
        Renderer::render(LIST_VIEW_TEMPLATE, $this->prepareViewData());
    }

    private function prepareViewData()
    {
        return [
            "roles" => $this->rolesList,
            "showAssign" => $this->isFeatureAutorized("mnt_funciones_roles"),
            "showDelete" => $this->isFeatureAutorized("mnt_funciones_roles")
        ];
    }
}