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