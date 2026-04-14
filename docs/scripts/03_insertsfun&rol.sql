INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES
('ADMIN', 'Administrador', 'ACT'),
('CLIENTE', 'Cliente', 'ACT'),
('SUPERVISOR', 'Supervisor', 'ACT');

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES
('Mantenimientos-RolesUsuarios-Listado', 'Listado Roles por Usuario', 'ACT', 'CTR'),
('Mantenimientos-RolesUsuarios-Formulario', 'Formulario Roles por Usuario', 'ACT', 'CTR'),
('Mantenimientos-FuncionesRoles-Listado', 'Listado Funciones por Rol', 'ACT', 'CTR'),
('Mantenimientos-FuncionesRoles-Formulario', 'Formulario Funciones por Rol', 'ACT', 'CTR'),
('Menu_RolesUsuarios', 'Menu Roles Usuarios', 'ACT', 'MNU'),
('Menu_FuncionesRoles', 'Menu Funciones Roles', 'ACT', 'MNU');


INSERT INTO funciones_roles (rolescod, fncod, fnrolest) VALUES
('ADMIN', 'Mantenimientos-RolesUsuarios-Listado', 'ACT'),
('ADMIN', 'Mantenimientos-RolesUsuarios-Formulario', 'ACT'),
('ADMIN', 'Mantenimientos-FuncionesRoles-Listado', 'ACT'),
('ADMIN', 'Mantenimientos-FuncionesRoles-Formulario', 'ACT'),
('ADMIN', 'Menu_RolesUsuarios', 'ACT'),
('ADMIN', 'Menu_FuncionesRoles', 'ACT');