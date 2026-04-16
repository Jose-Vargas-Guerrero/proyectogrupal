CREATE TABLE usuario (
    usercod BIGINT(10) NOT NULL AUTO_INCREMENT,
    useremail VARCHAR(80) NOT NULL,
    username VARCHAR(80) NOT NULL,
    userpswd VARCHAR(128) NOT NULL,
    userfching DATETIME DEFAULT CURRENT_TIMESTAMP,
    userpswdest CHAR(3) DEFAULT 'ACT',
    userpswdexp DATETIME,
    userest CHAR(3) DEFAULT 'ACT',
    useractcod VARCHAR(128),
    userpswdchg DATETIME,
    usertipo CHAR(3) DEFAULT 'PBL',
    PRIMARY KEY (usercod),
    UNIQUE KEY unique_useremail (useremail)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE roles (
    rolescod VARCHAR(128) NOT NULL,
    rolesdsc VARCHAR(100),
    rolesest CHAR(3) DEFAULT 'ACT',
    PRIMARY KEY (rolescod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE roles_usuarios (
    usercod BIGINT(10) NOT NULL,
    rolescod VARCHAR(128) NOT NULL,
    roleuserest CHAR(3) DEFAULT 'ACT',
    roleuserfch DATETIME DEFAULT CURRENT_TIMESTAMP,
    roleuserexp DATETIME,
    PRIMARY KEY (usercod, rolescod),
    CONSTRAINT fk_rolesusuarios_usuario
        FOREIGN KEY (usercod) REFERENCES usuario(usercod)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_rolesusuarios_roles
        FOREIGN KEY (rolescod) REFERENCES roles(rolescod)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE funciones (
    fncod VARCHAR(255) NOT NULL,
    fndsc VARCHAR(255),
    fnest CHAR(3) DEFAULT 'ACT',
    fntyp CHAR(3) DEFAULT 'CTR',
    PRIMARY KEY (fncod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE funciones_roles (
    rolescod VARCHAR(128) NOT NULL,
    fncod VARCHAR(255) NOT NULL,
    fnrolest CHAR(3) DEFAULT 'ACT',
    fnexp DATETIME,
    PRIMARY KEY (rolescod, fncod),
    CONSTRAINT fk_funcionesroles_roles
        FOREIGN KEY (rolescod) REFERENCES roles(rolescod)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_funcionesroles_funciones
        FOREIGN KEY (fncod) REFERENCES funciones(fncod)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE transacciones (
    transcod INT AUTO_INCREMENT PRIMARY KEY,
    usercod BIGINT(10) NOT NULL,
    paypal_orderid VARCHAR(100) NOT NULL,
    metodo_pago VARCHAR(30) NOT NULL DEFAULT 'PAYPAL',
    subtotal DECIMAL(10,2) NOT NULL,
    isv DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'COMPLETED',
    transfch DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk_paypal_orderid (paypal_orderid),
    CONSTRAINT fk_transacciones_usuario
        FOREIGN KEY (usercod) REFERENCES usuario(usercod)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE transacciones_detalle (
    transdetcod INT AUTO_INCREMENT PRIMARY KEY,
    transcod INT NOT NULL,
    itemid INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL,
    subtotal_linea DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_transdetalle_transaccion
        FOREIGN KEY (transcod) REFERENCES transacciones(transcod)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);