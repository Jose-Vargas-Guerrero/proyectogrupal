
CREATE TABLE especialidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    imagenurl VARCHAR(255),
    categoria VARCHAR(50) DEFAULT 'Especialidades',
    estado CHAR(3) DEFAULT 'ACT',
);