<?php

namespace Dao\Mantenimientos;

use Dao\Table;

class Especialidades extends Table
{
    public static function getAll(): array
    {
        $sqlstr = "SELECT * FROM especialidades;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getById(int $id)
    {
        $sqlstr = "SELECT * FROM especialidades WHERE id = :id;";
        return self::obtenerUnRegistro($sqlstr, ["id" => $id]);
    }

    public static function insert($nombre, $descripcion, $precio, $imagenurl): int
    {
        $sqlstr = "INSERT INTO especialidades (nombre, descripcion, precio, imagenurl)
                   VALUES (:nombre, :descripcion, :precio, :imagenurl);";

        return self::executeNonQuery($sqlstr, [
            "nombre" => $nombre,
            "descripcion" => $descripcion,
            "precio" => $precio,
            "imagenurl" => $imagenurl
        ]);
    }

    public static function update($id, $nombre, $descripcion, $precio, $imagenurl): int
    {
        $sqlstr = "UPDATE especialidades
                   SET nombre = :nombre, descripcion = :descripcion,
                       precio = :precio, imagenurl = :imagenurl
                   WHERE id = :id;";

        return self::executeNonQuery($sqlstr, [
            "id" => $id,
            "nombre" => $nombre,
            "descripcion" => $descripcion,
            "precio" => $precio,
            "imagenurl" => $imagenurl
        ]);
    }

    public static function delete($id): int
    {
        $sqlstr = "DELETE FROM especialidades WHERE id = :id;";
        return self::executeNonQuery($sqlstr, ["id" => $id]);
    }
}
?>