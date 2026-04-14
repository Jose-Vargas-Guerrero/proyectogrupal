<?php

namespace Dao\Mantenimientos;

use Dao\Table;

class FuncionesRoles extends Table
{
    public static function getAllRoles(): array
    {
        $sqlstr = "SELECT * from roles;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getRolById(string $rolescod): array
    {
        $sqlstr = "SELECT * from roles where rolescod = :rolescod;";
        return self::obtenerUnRegistro($sqlstr, ["rolescod" => $rolescod]);
    }

    public static function getFuncionesByRol(string $rolescod): array
    {
        $sqlstr = "SELECT a.fncod, a.fndsc, a.fnest, a.fntyp, b.fnrolest, b.fnexp
                   from funciones a inner join funciones_roles b on a.fncod = b.fncod
                   where b.rolescod = :rolescod;";
        return self::obtenerRegistros($sqlstr, ["rolescod" => $rolescod]);
    }

    public static function getFuncionesNoAsignadas(string $rolescod): array
    {
        $sqlstr = "SELECT * from funciones
                   where fncod not in (
                        SELECT fncod
                        from funciones_roles
                        where rolescod = :rolescod and fnrolest = 'ACT'
                   );";
        return self::obtenerRegistros($sqlstr, ["rolescod" => $rolescod]);
    }

    public static function getFuncionRol(string $rolescod, string $fncod)
    {
        $sqlstr = "SELECT * from funciones_roles
                   where rolescod = :rolescod and fncod = :fncod;";
        return self::obtenerUnRegistro(
            $sqlstr,
            [
                "rolescod" => $rolescod,
                "fncod" => $fncod
            ]
        );
    }

    public static function addFuncionToRol(string $rolescod, string $fncod): int
    {
        $funcionRol = self::getFuncionRol($rolescod, $fncod);

        if ($funcionRol) {
            $sqlstr = "update funciones_roles
                       set fnrolest = 'ACT', fnexp = null
                       where rolescod = :rolescod and fncod = :fncod;";
            return self::executeNonQuery(
                $sqlstr,
                [
                    "rolescod" => $rolescod,
                    "fncod" => $fncod
                ]
            );
        } else {
            $sqlstr = "insert into funciones_roles (rolescod, fncod, fnrolest, fnexp)
                       values (:rolescod, :fncod, 'ACT', null);";
            return self::executeNonQuery(
                $sqlstr,
                [
                    "rolescod" => $rolescod,
                    "fncod" => $fncod
                ]
            );
        }
    }

    public static function removeFuncionFromRol(string $rolescod, string $fncod): int
    {
        $sqlstr = "update funciones_roles
                   set fnrolest = 'INA'
                   where rolescod = :rolescod and fncod = :fncod;";
        return self::executeNonQuery(
            $sqlstr,
            [
                "rolescod" => $rolescod,
                "fncod" => $fncod
            ]
        );
    }
}
?>