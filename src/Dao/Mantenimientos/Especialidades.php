<?php

namespace Dao\Mantenimientos;
use Dao\Table;

class Especialidades extends Table
{
    public static function getAllEspecialidades(): array
    {
        $sqlstr = "SELECT * FROM especialidades;";
        return self::obtenerRegistros($sqlstr, []);
    }


    public static function getEspecialidadByID(int $id): array
    {
        $sqlstr = "SELECT * FROM especialidades WHERE id = :id;";
        $params = ["id" => $id];
        return self::obtenerUnRegistro($sqlstr, $params);
    }


    public static function crearEspecialidad(
        $nombre,
        $descripcion,
        $precio,
        $imagenurl
    ): int {
        $sqlstr = "INSERT INTO especialidades (nombre, descripcion, precio, imagenurl) 
                   VALUES (:nombre, :descripcion, :precio, :imagenurl);";
        
        $params = [
            "nombre"      => $nombre,
            "descripcion" => $descripcion,
            "precio"      => $precio,
            "imagenurl"   => $imagenurl
        ];

        return self::executeNonQuery($sqlstr, $params);
    }


    public static function actualizarEspecialidad(
        $id,
        $nombre,
        $descripcion,
        $precio,
        $imagenurl
    ): int {
        $sqlstr = "UPDATE especialidades 
                   SET nombre = :nombre, 
                       descripcion = :descripcion, 
                       precio = :precio, 
                       imagenurl = :imagenurl 
                   WHERE id = :id;";
        
        $params = [
            "id"          => $id,
            "nombre"      => $nombre,
            "descripcion" => $descripcion,
            "precio"      => $precio,
            "imagenurl"   => $imagenurl
        ];

        return self::executeNonQuery($sqlstr, $params);
    }


    public static function eliminarEspecialidad(int $id): int
    {
        $sqlstr = "DELETE FROM especialidades WHERE id = :id;";
        $params = ["id" => $id];
        return self::executeNonQuery($sqlstr, $params);
    }
}