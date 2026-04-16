<?php

namespace Dao\Mantenimientos;

use Dao\Table;

class Especialidades extends Table
{
    public static function getAll(): array
    {
        $sqlstr = "SELECT * FROM especialidades ORDER BY categoria, nombre;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getById(int $id)
    {
        $sqlstr = "SELECT * FROM especialidades WHERE id = :id;";
        return self::obtenerUnRegistro($sqlstr, ["id" => $id]);
    }

    public static function insert($nombre, $descripcion, $precio, $imagenurl, $categoria): int
    {
        $sqlstr = "INSERT INTO especialidades (nombre, descripcion, precio, imagenurl, categoria)
                   VALUES (:nombre, :descripcion, :precio, :imagenurl, :categoria);";

        return self::executeNonQuery($sqlstr, [
            "nombre" => $nombre,
            "descripcion" => $descripcion,
            "precio" => $precio,
            "imagenurl" => $imagenurl,
            "categoria" => $categoria
        ]);
    }

    public static function update($id, $nombre, $descripcion, $precio, $imagenurl, $categoria): int
    {
        $sqlstr = "UPDATE especialidades
                   SET nombre = :nombre,
                       descripcion = :descripcion,
                       precio = :precio,
                       imagenurl = :imagenurl,
                       categoria = :categoria
                   WHERE id = :id;";

        return self::executeNonQuery($sqlstr, [
            "id" => $id,
            "nombre" => $nombre,
            "descripcion" => $descripcion,
            "precio" => $precio,
            "imagenurl" => $imagenurl,
            "categoria" => $categoria
        ]);
    }

    public static function delete($id): int
    {
        $sqlstr = "DELETE FROM especialidades WHERE id = :id;";
        return self::executeNonQuery($sqlstr, ["id" => $id]);
    }
}
?>