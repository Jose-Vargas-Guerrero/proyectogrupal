<?php

namespace Dao\Menu;

use Dao\Table;

class Menu extends Table
{
    public static function getAllEspecialidades(): array
    {
        $sqlstr = "SELECT * FROM especialidades WHERE estado = 'ACT' ORDER BY categoria, nombre;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getEspecialidadesByCategoria(string $categoria): array
    {
        $sqlstr = "SELECT * FROM especialidades 
                   WHERE estado = 'ACT' AND categoria = :categoria
                   ORDER BY nombre;";
        return self::obtenerRegistros($sqlstr, ["categoria" => $categoria]);
    }

    public static function getCategorias(): array
    {
        $sqlstr = "SELECT DISTINCT categoria 
                   FROM especialidades
                   WHERE estado = 'ACT'
                   ORDER BY categoria;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getDestacados(): array
    {
        $sqlstr = "SELECT * FROM especialidades
                   WHERE estado = 'ACT' AND destacado = 1
                   ORDER BY nombre;";
        return self::obtenerRegistros($sqlstr, []);
    }
}
?>