<?php

namespace Controllers\Mantenimientos\Especialidades;

use Dao\Mantenimientos\Especialidades as EspecialidadesDAO;
use Views\Renderer;
use Controllers\PrivateController;
use Utilities\Site;
use Controllers\PrivateNoAuthException;

const ESPECIALIDADES_FORMULARIO_URL = "index.php?page=Mantenimientos-Especialidades-Formulario";
const ESPECIALIDADES_LISTADO_URL = "index.php?page=Mantenimientos-Especialidades-Listado";
const XSRF_KEY = "Mantenimientos_Especialidades_Formulario";

class Formulario extends PrivateController
{
    private array $viewData = [];
    private array $modes = [
        "INS" => "Nueva Especialidad",
        "UPD" => "Actualizar %s %s",
        "DSP" => "Detalle de %s %s",
        "DEL" => "Eliminando %s %s"
    ];
    private array $accessControl = [
        "INS" => "mnt_especialidades",
        "UPD" => "mnt_especialidades",
        "DEL" => "mnt_especialidades",
        "DSP" => "mnt_especialidades"
    ];
    private array $confirmTooltips = [
        "INS" => "",
        "UPD" => "",
        "DSP" => "",
        "DEL" => "¿Está seguro de eliminar esta especialidad?"
    ];

    private $id = 0;
    private $nombre = "";
    private $descripcion = "";
    private $precio = 0;
    private $imagenurl = "";
    private $categoria = "Especialidades";
    private $mode = "";
    private $xsrfToken = "";

    public function run(): void
    {
        $this->LoadPage();

        if ($this->isPostBack()) {
            $this->CapturarDatos();
            if ($this->ValidarDatos()) {
                switch ($this->mode) {
                    case "INS":
                        if (EspecialidadesDAO::insert(
                            $this->nombre,
                            $this->descripcion,
                            $this->precio,
                            $this->imagenurl,
                            $this->categoria
                        ) !== 0) {
                            Site::redirectToWithMsg(
                                ESPECIALIDADES_LISTADO_URL,
                                "Especialidad creada satisfactoriamente"
                            );
                        }
                        break;

                    case "UPD":
                        if (EspecialidadesDAO::update(
                            $this->id,
                            $this->nombre,
                            $this->descripcion,
                            $this->precio,
                            $this->imagenurl,
                            $this->categoria
                        ) !== 0) {
                            Site::redirectToWithMsg(
                                ESPECIALIDADES_LISTADO_URL,
                                "Especialidad actualizada satisfactoriamente"
                            );
                        }
                        break;

                    case "DEL":
                        if (EspecialidadesDAO::delete($this->id) !== 0) {
                            Site::redirectToWithMsg(
                                ESPECIALIDADES_LISTADO_URL,
                                "Especialidad eliminada satisfactoriamente"
                            );
                        }
                        break;
                }
            }
        }

        $this->GenerarViewData();
        Renderer::render("mantenimientos/especialidades/formulario", $this->viewData);
    }

    private function LoadPage()
    {
        $this->mode = $_GET["mode"] ?? '';

        if (!isset($this->modes[$this->mode])) {
            Site::redirectToWithMsg(ESPECIALIDADES_LISTADO_URL, "Error al cargar formulario");
        }

        if (isset($this->accessControl[$this->mode]) && !$this->isFeatureAutorized($this->accessControl[$this->mode])) {
            throw new PrivateNoAuthException();
        }

        $this->id = intval($_GET["id"] ?? '0');

        if ($this->mode !== "INS" && $this->id <= 0) {
            Site::redirectToWithMsg(ESPECIALIDADES_LISTADO_URL, "Se requiere un ID válido");
        } else {
            if ($this->mode !== "INS") {
                $this->CargarDatos();
            }
        }
    }

    private function CargarDatos()
    {
        $tmp = EspecialidadesDAO::getById($this->id);
        if (!$tmp) {
            Site::redirectToWithMsg(ESPECIALIDADES_LISTADO_URL, "No se encontró el registro");
        }

        $this->nombre = $tmp["nombre"];
        $this->descripcion = $tmp["descripcion"];
        $this->precio = $tmp["precio"];
        $this->imagenurl = $tmp["imagenurl"];
        $this->categoria = $tmp["categoria"];
    }

    private function CapturarDatos()
    {
        $this->id = intval($_POST["id"] ?? "0");
        $this->nombre = $_POST["nombre"] ?? "";
        $this->descripcion = $_POST["descripcion"] ?? "";
        $this->precio = floatval($_POST["precio"] ?? "0");
        $this->imagenurl = $_POST["imagenurl"] ?? "";
        $this->categoria = $_POST["categoria"] ?? "Especialidades";
        $this->xsrfToken = $_POST["uuid"] ?? "";
    }

    private function ValidarDatos()
    {
        $sessionToken = $_SESSION[XSRF_KEY] ?? '';
        if ($this->xsrfToken !== $sessionToken) {
            Site::redirectToWithMsg(
                ESPECIALIDADES_LISTADO_URL,
                "Error al procesar formulario, inconsistencia en la petición"
            );
        }

        $validateId = intval($_GET["id"] ?? '0');
        if ($this->mode !== "INS" && $validateId !== $this->id) {
            return false;
        }

        return true;
    }

    private function GenerarViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["modeDsc"] = sprintf($this->modes[$this->mode], $this->id, $this->nombre);
        $this->viewData["id"] = $this->id;
        $this->viewData["nombre"] = $this->nombre;
        $this->viewData["descripcion"] = $this->descripcion;
        $this->viewData["precio"] = $this->precio;
        $this->viewData["imagenurl"] = $this->imagenurl;
        $this->viewData["categoria"] = $this->categoria;
        $this->viewData["readonly"] = ($this->mode === 'DEL' || $this->mode === 'DSP') ? 'readonly' : '';
        $this->viewData["showBtn"] = ($this->mode !== 'DSP');
        $this->viewData["confirmToolTip"] = $this->confirmTooltips[$this->mode];
        $this->viewData["xsrf_token"] = $this->GenerateXSRFToken();
        $this->viewData["isInsert"] = ($this->mode === "INS");

        $this->viewData["catMariscos"] = ($this->categoria === "Mariscos") ? 'selected' : '';
        $this->viewData["catArroces"] = ($this->categoria === "Arroces") ? 'selected' : '';
        $this->viewData["catPlatosFavoritos"] = ($this->categoria === "Platos Favoritos") ? 'selected' : '';
        $this->viewData["catEspecialidades"] = ($this->categoria === "Especialidades") ? 'selected' : '';
    }

    private function GenerateXSRFToken()
    {
        $tmpStr = "especialidades_formulario" . time() . rand(10000, 99999);
        $this->xsrfToken = md5($tmpStr);
        $_SESSION[XSRF_KEY] = $this->xsrfToken;
        return $this->xsrfToken;
    }
}
?>