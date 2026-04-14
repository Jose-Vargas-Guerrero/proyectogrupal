<?php

namespace Dao\Mantenimientos;

use Dao\Table;

class RolesUsuarios extends Table
{
    public static function getAllUsuarios(): array
    {
        $sqlstr = "SELECT * from usuario;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getUsuarioById(int $usercod): array
    {
        $sqlstr = "SELECT * from usuario where usercod = :usercod;";
        return self::obtenerUnRegistro($sqlstr, ["usercod" => $usercod]);
    }

    public static function getRolesByUsuario(int $usercod): array
    {
        $sqlstr = "SELECT a.rolescod, a.rolesdsc, b.roleuserest, b.roleuserfch, b.roleuserexp
                   from roles a inner join roles_usuarios b on a.rolescod = b.rolescod
                   where b.usercod = :usercod;";
        return self::obtenerRegistros($sqlstr, ["usercod" => $usercod]);
    }

    public static function getRolesNoAsignados(int $usercod): array
    {
        $sqlstr = "SELECT * from roles
                   where rolescod not in (
                        SELECT rolescod
                        from roles_usuarios
                        where usercod = :usercod and roleuserest = 'ACT'
                   );";
        return self::obtenerRegistros($sqlstr, ["usercod" => $usercod]);
    }

    public static function getRolUsuario(int $usercod, string $rolescod)
    {
        $sqlstr = "SELECT * from roles_usuarios
                   where usercod = :usercod and rolescod = :rolescod;";
        return self::obtenerUnRegistro(
            $sqlstr,
            [
                "usercod" => $usercod,
                "rolescod" => $rolescod
            ]
        );
    }

    public static function addRolToUser(int $usercod, string $rolescod): int
    {
        $rolUsuario = self::getRolUsuario($usercod, $rolescod);

        if ($rolUsuario) {
            $sqlstr = "update roles_usuarios
                       set roleuserest = 'ACT', roleuserfch = now(), roleuserexp = null
                       where usercod = :usercod and rolescod = :rolescod;";
            return self::executeNonQuery(
                $sqlstr,
                [
                    "usercod" => $usercod,
                    "rolescod" => $rolescod
                ]
            );
        } else {
            $sqlstr = "insert into roles_usuarios (usercod, rolescod, roleuserest, roleuserfch, roleuserexp)
                       values (:usercod, :rolescod, 'ACT', now(), null);";
            return self::executeNonQuery(
                $sqlstr,
                [
                    "usercod" => $usercod,
                    "rolescod" => $rolescod
                ]
            );
        }
    }

    public static function removeRolFromUser(int $usercod, string $rolescod): int
    {
        $sqlstr = "update roles_usuarios
                   set roleuserest = 'INA'
                   where usercod = :usercod and rolescod = :rolescod;";
        return self::executeNonQuery(
            $sqlstr,
            [
                "usercod" => $usercod,
                "rolescod" => $rolescod
            ]
        );
    }

    public static function getAllRoles(): array
    {
        $sqlstr = "SELECT * from roles;";
        return self::obtenerRegistros($sqlstr, []);
    }
}
?>