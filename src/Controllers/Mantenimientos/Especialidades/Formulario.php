<?php

namespace Controllers\Mantenimientos\Especialidades;

use Dao\Mantenimientos\Especialidades as EspecialidadesDAO;
use Views\Renderer;
use Controllers\PublicController;
use Utilities\Site;

const ESPECIALIDADES_LISTADO_URL = "index.php?page=Mantenimientos-Especialidades-Listado";

class Formulario extends PublicController {
    private array $viewData = [];
    private array $modes = [
        "INS" => "Nueva Especialidad",
        "UPD" => "Actualizar %s %s",
        "DSP" => "Detalle de %s %s",
        "DEL" => "Eliminando %s %s"
    ];

    private $id;
    private $nombre;
    private $descripcion;
    private $precio;
    private $imagenurl;
    private $mode;

    public function run(): void
    {
        $this->LoadPage();
        if ($this->isPostBack()) {
            $this->CapturarDatos();
            if ($this->validarDatos()) {
                switch ($this->mode) {
                    case "INS":
                        if (EspecialidadesDAO::insert(
                            $this->nombre,
                            $this->descripcion,
                            $this->precio,
                            $this->imagenurl
                        ) !== 0) {
                            Site::redirectTo(ESPECIALIDADES_LISTADO_URL, "Especialidad creada");
                        }
                        break;

                    case "UPD":
                        if (EspecialidadesDAO::update(
                            $this->id,
                            $this->nombre,
                            $this->descripcion,
                            $this->precio,
                            $this->imagenurl
                        ) !== 0) {
                            Site::redirectTo(ESPECIALIDADES_LISTADO_URL, "Especialidad actualizada");
                        }
                        break;

                    case "DEL":
                        if (EspecialidadesDAO::delete($this->id) !== 0) {
                            Site::redirectTo(ESPECIALIDADES_LISTADO_URL, "Especialidad eliminada");
                        }
                        break;
                }
            }
        }
        $this->GenerarViewData();
        Renderer::render("mantenimientos/especialidades/formulario", $this->viewData);
    }

    private function LoadPage() {
        $this->mode = $_GET["mode"] ?? '';
        if (!isset($this->modes[$this->mode])) {
            Site::redirectToWithMsg(ESPECIALIDADES_LISTADO_URL, "Error al cargar formulario");
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

    private function CargarDatos() {
        $tmp = EspecialidadesDAO::getById($this->id);
        if (!$tmp) {
            Site::redirectToWithMsg(ESPECIALIDADES_LISTADO_URL, "No se encontró el registro");
        }

        $this->nombre = $tmp["nombre"];
        $this->descripcion = $tmp["descripcion"];
        $this->precio = $tmp["precio"];
        $this->imagenurl = $tmp["imagenurl"];
    }

    private function CapturarDatos() {
        $this->id = intval($_POST["id"] ?? "0");
        $this->nombre = $_POST["nombre"] ?? "";
        $this->descripcion = $_POST["descripcion"] ?? "";
        $this->precio = floatval($_POST["precio"] ?? "0");
        $this->imagenurl = $_POST["imagenurl"] ?? "";
    }

    private function validarDatos() {
        // Validación básica de coherencia de ID
        $validateId = intval($_GET["id"] ?? '0');
        if ($this->mode !== "INS" && $validateId !== $this->id) {
            return false;
        }
        // Puedes agregar validaciones de campos vacíos aquí
        return true;
    }

    private function GenerarViewData() {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["modeDsc"] = sprintf($this->modes[$this->mode], $this->id, $this->nombre);
        $this->viewData["id"] = $this->id;
        $this->viewData["nombre"] = $this->nombre;
        $this->viewData["descripcion"] = $this->descripcion;
        $this->viewData["precio"] = $this->precio;
        $this->viewData["imagenurl"] = $this->imagenurl;
        
        // Deshabilitar campos si es modo eliminar o mostrar
        $this->viewData["readonly"] = ($this->mode === 'DEL' || $this->mode === 'DSP') ? 'readonly' : '';
        $this->viewData["showBtn"] = ($this->mode !== 'DSP');
    }
}