<?php

namespace Dao\Checkout;

use Dao\Table;

class Transacciones extends Table
{
    public static function existeTransaccionPorOrderId(string $paypalOrderId): bool
    {
        $sqlstr = "SELECT transcod FROM transacciones WHERE paypal_orderid = :paypal_orderid LIMIT 1;";
        $result = self::obtenerUnRegistro($sqlstr, ["paypal_orderid" => $paypalOrderId]);
        return is_array($result) && count($result) > 0;
    }

    public static function crearTransaccion(
        int $usercod,
        string $paypalOrderId,
        string $metodoPago,
        float $subtotal,
        float $isv,
        float $total,
        string $estado
    ): int {
        $sqlstr = "INSERT INTO transacciones
            (usercod, paypal_orderid, metodo_pago, subtotal, isv, total, estado, transfch)
            VALUES
            (:usercod, :paypal_orderid, :metodo_pago, :subtotal, :isv, :total, :estado, NOW());";

        self::executeNonQuery($sqlstr, [
            "usercod" => $usercod,
            "paypal_orderid" => $paypalOrderId,
            "metodo_pago" => $metodoPago,
            "subtotal" => $subtotal,
            "isv" => $isv,
            "total" => $total,
            "estado" => $estado
        ]);

        $lastId = self::obtenerUnRegistro("SELECT LAST_INSERT_ID() as id;", []);
        return intval($lastId["id"]);
    }

    public static function agregarDetalle(
        int $transcod,
        int $itemid,
        string $nombre,
        float $precio,
        int $cantidad
    ): int {
        $subtotalLinea = $precio * $cantidad;

        $sqlstr = "INSERT INTO transacciones_detalle
            (transcod, itemid, nombre, precio, cantidad, subtotal_linea)
            VALUES
            (:transcod, :itemid, :nombre, :precio, :cantidad, :subtotal_linea);";

        return self::executeNonQuery($sqlstr, [
            "transcod" => $transcod,
            "itemid" => $itemid,
            "nombre" => $nombre,
            "precio" => $precio,
            "cantidad" => $cantidad,
            "subtotal_linea" => $subtotalLinea
        ]);
    }

    public static function getHistorialByUser(int $usercod): array
    {
        $sqlstr = "SELECT t.*, u.useremail, u.username
                   FROM transacciones t
                   INNER JOIN usuario u ON t.usercod = u.usercod
                   WHERE t.usercod = :usercod
                   ORDER BY t.transfch DESC;";
        return self::obtenerRegistros($sqlstr, ["usercod" => $usercod]);
    }

    public static function getAllHistorial(): array
    {
        $sqlstr = "SELECT t.*, u.useremail, u.username
                   FROM transacciones t
                   INNER JOIN usuario u ON t.usercod = u.usercod
                   ORDER BY t.transfch DESC;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getTransaccionById(int $transcod)
    {
        $sqlstr = "SELECT t.*, u.useremail, u.username
                   FROM transacciones t
                   INNER JOIN usuario u ON t.usercod = u.usercod
                   WHERE t.transcod = :transcod
                   LIMIT 1;";
        return self::obtenerUnRegistro($sqlstr, ["transcod" => $transcod]);
    }

    public static function getDetalleByTransaccion(int $transcod): array
    {
        $sqlstr = "SELECT *
                   FROM transacciones_detalle
                   WHERE transcod = :transcod
                   ORDER BY transdetcod ASC;";
        return self::obtenerRegistros($sqlstr, ["transcod" => $transcod]);
    }
}
?>