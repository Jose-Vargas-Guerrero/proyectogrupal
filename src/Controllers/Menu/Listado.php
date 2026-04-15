<?php

namespace Controllers\Menu;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Menu\Menu as MenuDAO;

class Listado extends PublicController
{
    public function run(): void
    {
        $categorias = MenuDAO::getCategorias();
        $menuData = [];

        foreach ($categorias as $categoria) {
            $menuData[] = [
                "categoria" => $categoria["categoria"],
                "items" => MenuDAO::getEspecialidadesByCategoria($categoria["categoria"])
            ];
        }

        $viewData = [
            "menuData" => $menuData
        ];

        Renderer::render("menu/listado", $viewData);
    }
}
?>