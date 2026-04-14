<?php

namespace Controllers\Mantenimientos\FuncionesRoles;

use Dao\Mantenimientos\FuncionesRoles as FuncionesRolesDAO;
use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Site;
use Controllers\PrivateNoAuthException;

const FUNCIONESROLES_FORMULARIO_URL = "index.php?page=Mantenimientos-FuncionesRoles-Formulario";
const FUNCIONESROLES_LISTADO_URL = "index.php?page=Mantenimientos-FuncionesRoles-Listado";
const XSRF_KEY = "Mantenimientos_FuncionesRoles_Formulario";

class Formulario extends PrivateController
{
    private array $viewData = [];
    private array $modes = [
        "INS" => "Asignar Función al Rol %s",
        "DEL" => "Inactivar Función %s del Rol %s",
        "DSP" => "Detalle de Funciones del Rol %s"
    ];
    private array $accessControl = [
        "INS" => "mnt_funciones_roles",
        "DEL" => "mnt_funciones_roles",
        "DSP" => "mnt_funciones_roles"
    ];
    private array $confirmTooltips = [
        "INS" => "",
        "DEL" => "¿Está seguro de inactivar esta función para el rol?",
        "DSP" => ""
    ];

    private $rolescod = "";
    private $rolesdsc = "";
    private $fncod = "";
    private $fnrolest = "";
    private $xsrfToken = "";
    private $mode = "";

    private array $funcionesAsignadas = [];
    private array $funcionesDisponibles = [];

    public function run(): void
    {
        $this->LoadPage();
        if ($this->isPostBack()) {
            $this->CapturarDatos();
            if ($this->ValidarDatos()) {
                switch ($this->mode) {
                    case "INS":
                        if (
                            FuncionesRolesDAO::addFuncionToRol(
                                $this->rolescod,
                                $this->fncod
                            ) !== 0
                        ) {
                            Site::redirectToWithMsg(
                                FUNCIONESROLES_LISTADO_URL,
                                "Función asignada satisfactoriamente"
                            );
                        }
                        break;
                    case "DEL":
                        if (
                            FuncionesRolesDAO::removeFuncionFromRol(
                                $this->rolescod,
                                $this->fncod
                            ) !== 0
                        ) {
                            Site::redirectToWithMsg(
                                FUNCIONESROLES_LISTADO_URL,
                                "Función inactivada satisfactoriamente"
                            );
                        }
                        break;
                }
            }
        }
        $this->GenerarViewData();
        Renderer::render("mantenimientos/funcionesroles/formulario", $this->viewData);
    }

    private function LoadPage()
    {
        $this->mode = $_GET["mode"] ?? '';
        if (!isset($this->modes[$this->mode])) {
            Site::redirectToWithMsg(FUNCIONESROLES_LISTADO_URL, "Error al cargar formulario, intente de nuevo");
        }
        if (isset($this->accessControl[$this->mode]) && !$this->isFeatureAutorized($this->accessControl[$this->mode])) {
            throw new PrivateNoAuthException();
        }

        $this->rolescod = $_GET["rolescod"] ?? '';
        $this->fncod = $_GET["fncod"] ?? '';

        if ($this->rolescod === "") {
            Site::redirectToWithMsg(FUNCIONESROLES_LISTADO_URL, "Error al cargar formulario, se requiere código de rol");
        } else {
            $this->CargarDatos();
        }
    }

    private function CargarDatos()
    {
        $tmpRol = FuncionesRolesDAO::getRolById($this->rolescod);
        if (count($tmpRol) <= 0) {
            Site::redirectToWithMsg(FUNCIONESROLES_LISTADO_URL, "No se encontró el rol");
        }

        $this->rolesdsc = $tmpRol["rolesdsc"];
        $this->funcionesAsignadas = FuncionesRolesDAO::getFuncionesByRol($this->rolescod);
        $this->funcionesDisponibles = FuncionesRolesDAO::getFuncionesNoAsignadas($this->rolescod);
    }

    private function CapturarDatos()
    {
        $this->rolescod = $_POST["rolescod"] ?? '';
        $this->fncod = $_POST["fncod"] ?? '';
        $this->xsrfToken = $_POST["uuid"] ?? '';
    }

    private function ValidarDatos()
    {
        $sessionToken = $_SESSION[XSRF_KEY] ?? '';
        if ($this->xsrfToken !== $sessionToken) {
            Site::redirectToWithMsg(FUNCIONESROLES_LISTADO_URL, "Error al procesar formulario, inconsistencia en la petición");
        }

        $validateRolCod = $_GET["rolescod"] ?? '';
        if ($validateRolCod !== $this->rolescod) {
            return false;
        }

        if ($this->mode !== "INS" && $this->fncod === "") {
            return false;
        }

        return true;
    }

    private function GenerarViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["modeDsc"] = sprintf($this->modes[$this->mode], $this->fncod, $this->rolescod);
        if ($this->mode === "INS" || $this->mode === "DSP") {
            $this->viewData["modeDsc"] = sprintf($this->modes[$this->mode], $this->rolescod);
        }
        $this->viewData["rolescod"] = $this->rolescod;
        $this->viewData["rolesdsc"] = $this->rolesdsc;
        $this->viewData["fncod"] = $this->fncod;
        foreach ($this->funcionesAsignadas as $key => $funcion) 
        {
            $this->funcionesAsignadas[$key]["showInactivar"] = ($funcion["fnrolest"] === "ACT");
        }
        $this->viewData["funcionesAsignadas"] = $this->funcionesAsignadas;
        $this->viewData["funcionesDisponibles"] = $this->funcionesDisponibles;
        $this->viewData["isDelete"] = $this->mode === "DEL";
        $this->viewData["isInsert"] = $this->mode === "INS";
        $this->viewData["isDisplay"] = $this->mode === "DSP";
        $this->viewData["hideConfirm"] = $this->mode === "DSP";
        $this->viewData["confirmToolTip"] = $this->confirmTooltips[$this->mode];
        $this->viewData["xsrf_token"] = $this->GenerateXSRFToken();
    }

    private function GenerateXSRFToken()
    {
        $tmpStr = "funcionesroles_formulario" . time() . rand(10000, 99999);
        $this->xsrfToken = md5($tmpStr);
        $_SESSION[XSRF_KEY] = $this->xsrfToken;
        return $this->xsrfToken;
    }
}