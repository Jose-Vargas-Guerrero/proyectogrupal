<?php

namespace Controllers;

// 1. Importamos el DAO de Especialidades
use Dao\Mantenimientos\Especialidades as EspecialidadesDao;
use Controllers\PublicController;
use Views\Renderer;

class Index extends PublicController
{
    public function run(): void
    {
        // 2. Obtenemos las especialidades reales de la DB
        $especialidadesDB = EspecialidadesDao::getAllEspecialidades();

        $viewData = array(
            "hero_title" => "Comida china e internacional",
            "hero_description" => "Disfruta de nuestros platillos preparados con ingredientes frescos, excelente sabor y una experiencia agradable para toda la familia.",

            "login_url" => "index.php?page=Sec_Login",
            "register_url" => "index.php?page=Sec_Register",
            "menu_url" => "index.php?page=Productos_Hello",
            "about_url" => "index.php",

            "welcome_title" => "Bienvenidos",
            "welcome_description" => "En Restaurante Hong Kong ofrecemos una variedad de platillos de comida china e internacional, preparados con esmero para brindar calidad, sabor y una atención especial a cada cliente.",

            "schedule_title" => "Horarios",
            "schedule_description" => "Lunes a Domingo de 10:00 AM a 9:00 PM",

            "location_title" => "Ubicación",
            "location_description" => "Tocoa, Colón, Barrio Colón. Frente a Proveedor Industrial.",

            "specialties_title" => "Nuestras Especialidades",

            // 3. Pasamos la lista de la DB a la vista
            "especialidades" => $especialidadesDB,

            "cta_title" => "Haz tu pedido ahora",
            "cta_description" => "Explora nuestro menú y disfruta de nuestros mejores platillos.",
            "cta_url" => "index.php?page=Productos_Hello",

            "SiteLinks" => array(
                "public/css/home.css"
            )
        );

        Renderer::render("index", $viewData);
    }
}