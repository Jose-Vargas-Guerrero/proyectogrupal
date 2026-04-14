<?php

namespace Controllers\Mantenimientos\RolesUsuarios;

use Dao\Mantenimientos\RolesUsuarios as RolesUsuariosDAO;
use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Site;
use Controllers\PrivateNoAuthException;

const ROLESUSUARIOS_FORMULARIO_URL = "index.php?page=Mantenimientos-RolesUsuarios-Formulario";
const ROLESUSUARIOS_LISTADO_URL = "index.php?page=Mantenimientos-RolesUsuarios-Listado";
const XSRF_KEY = "Mantenimientos_RolesUsuarios_Formulario";

class Formulario extends PrivateController
{
    private array $viewData = [];
    private array $modes = [
        "INS" => "Asignar Rol a Usuario %s",
        "DEL" => "Inactivar Rol %s del Usuario %s",
        "DSP" => "Detalle de Roles del Usuario %s"
    ];
    private array $accessControl = [
        "INS" => "mnt_roles_usuarios",
        "DEL" => "mnt_roles_usuarios",
        "DSP" => "mnt_roles_usuarios"
    ];
    private array $confirmTooltips = [
        "INS" => "",
        "DEL" => "¿Está seguro de inactivar este rol para el usuario?",
        "DSP" => ""
    ];

    private $usercod = 0;
    private $useremail = "";
    private $username = "";
    private $rolescod = "";
    private $roleuserest = "";
    private $xsrfToken = "";
    private $mode = "";

    private array $rolesAsignados = [];
    private array $rolesDisponibles = [];

    public function run(): void
    {
        $this->LoadPage();
        if ($this->isPostBack()) {
            $this->CapturarDatos();
            if ($this->ValidarDatos()) {
                switch ($this->mode) {
                    case "INS":
                        if (
                            RolesUsuariosDAO::addRolToUser(
                                intval($this->usercod),
                                $this->rolescod
                            ) !== 0
                        ) {
                            Site::redirectToWithMsg(
                                ROLESUSUARIOS_LISTADO_URL,
                                "Rol asignado satisfactoriamente"
                            );
                        }
                        break;
                    case "DEL":
                        if (
                            RolesUsuariosDAO::removeRolFromUser(
                                intval($this->usercod),
                                $this->rolescod
                            ) !== 0
                        ) {
                            Site::redirectToWithMsg(
                                ROLESUSUARIOS_LISTADO_URL,
                                "Rol inactivado satisfactoriamente"
                            );
                        }
                        break;
                }
            }
        }
        $this->GenerarViewData();
        Renderer::render("mantenimientos/rolesusuarios/formulario", $this->viewData);
    }

    private function LoadPage()
    {
        $this->mode = $_GET["mode"] ?? '';
        if (!isset($this->modes[$this->mode])) {
            Site::redirectToWithMsg(ROLESUSUARIOS_LISTADO_URL, "Error al cargar formulario, intente de nuevo");
        }
        if (isset($this->accessControl[$this->mode]) && !$this->isFeatureAutorized($this->accessControl[$this->mode])) {
            throw new PrivateNoAuthException();
        }

        $this->usercod = intval($_GET["usercod"] ?? '0');
        $this->rolescod = $_GET["rolescod"] ?? '';

        if ($this->usercod <= 0) {
            Site::redirectToWithMsg(ROLESUSUARIOS_LISTADO_URL, "Error al cargar formulario, se requiere código de usuario");
        } else {
            $this->CargarDatos();
        }
    }

    private function CargarDatos()
    {
        $tmpUsuario = RolesUsuariosDAO::getUsuarioById(intval($this->usercod));
        if (count($tmpUsuario) <= 0) {
            Site::redirectToWithMsg(ROLESUSUARIOS_LISTADO_URL, "No se encontró el usuario");
        }

        $this->useremail = $tmpUsuario["useremail"];
        $this->username = $tmpUsuario["username"];
        $this->rolesAsignados = RolesUsuariosDAO::getRolesByUsuario(intval($this->usercod));
        $this->rolesDisponibles = RolesUsuariosDAO::getRolesNoAsignados(intval($this->usercod));
    }

    private function CapturarDatos()
    {
        $this->usercod = intval($_POST["usercod"] ?? '0');
        $this->rolescod = $_POST["rolescod"] ?? '';
        $this->xsrfToken = $_POST["uuid"] ?? '';
    }

    private function ValidarDatos()
    {
        $sessionToken = $_SESSION[XSRF_KEY] ?? '';
        if ($this->xsrfToken !== $sessionToken) {
            Site::redirectToWithMsg(ROLESUSUARIOS_LISTADO_URL, "Error al procesar formulario, inconsistencia en la petición");
        }

        $validateUserCod = intval($_GET["usercod"] ?? '0');
        if ($validateUserCod !== intval($this->usercod)) {
            return false;
        }

        if ($this->mode !== "INS" && $this->rolescod === "") {
            return false;
        }

        return true;
    }

    private function GenerarViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["modeDsc"] = sprintf($this->modes[$this->mode], $this->rolescod, $this->useremail);
        if ($this->mode === "INS" || $this->mode === "DSP") {
            $this->viewData["modeDsc"] = sprintf($this->modes[$this->mode], $this->useremail);
        }
        $this->viewData["usercod"] = $this->usercod;
        $this->viewData["useremail"] = $this->useremail;
        $this->viewData["username"] = $this->username;
        $this->viewData["rolescod"] = $this->rolescod;
        foreach ($this->rolesAsignados as $key => $rol) 
        {
            $this->rolesAsignados[$key]["showInactivar"] = ($rol["roleuserest"] === "ACT");
        }
        $this->viewData["rolesAsignados"] = $this->rolesAsignados;
        $this->viewData["rolesDisponibles"] = $this->rolesDisponibles;
        $this->viewData["isDelete"] = $this->mode === "DEL";
        $this->viewData["isInsert"] = $this->mode === "INS";
        $this->viewData["isDisplay"] = $this->mode === "DSP";
        $this->viewData["hideConfirm"] = $this->mode === "DSP";
        $this->viewData["confirmToolTip"] = $this->confirmTooltips[$this->mode];
        $this->viewData["xsrf_token"] = $this->GenerateXSRFToken();
    }

    private function GenerateXSRFToken()
    {
        $tmpStr = "rolesusuarios_formulario" . time() . rand(10000, 99999);
        $this->xsrfToken = md5($tmpStr);
        $_SESSION[XSRF_KEY] = $this->xsrfToken;
        return $this->xsrfToken;
    }
}