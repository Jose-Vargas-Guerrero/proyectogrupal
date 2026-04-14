--crear base de datos restaurante
CREATE DATABASE IF NOT EXISTS restaurante;
USE restaurante;

--Crear tabla especialidades
CREATE TABLE IF NOT EXISTS especialidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    imagenurl VARCHAR(255)
);