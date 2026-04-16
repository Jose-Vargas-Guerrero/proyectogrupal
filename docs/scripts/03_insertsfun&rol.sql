-- 1. ROLES
INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES
('ADMIN', 'Administrador', 'ACT'),
('CLIENTE', 'Cliente', 'ACT'),
('SUPERVISOR', 'Supervisor', 'ACT');

-- 2. FUNCIONES
INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES

-- CONTROLADORES (CTR)
('Controllers\\Mantenimientos\\Especialidades\\Formulario', 'Acceso al formulario de especialidades', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\Especialidades\\Listado', 'Acceso al listado de especialidades', 'ACT', 'CTR'),

('Controllers\\Mantenimientos\\FuncionesRoles\\Formulario', 'Acceso al formulario de funciones por rol', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\FuncionesRoles\\Listado', 'Acceso al listado de funciones por rol', 'ACT', 'CTR'),

('Controllers\\Mantenimientos\\RolesUsuarios\\Formulario', 'Acceso al formulario de roles por usuario', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\RolesUsuarios\\Listado', 'Acceso al listado de roles por usuario', 'ACT', 'CTR'),

-- MENÚ (MNU)
('Menu_Especialidades', 'Menu de especialidades', 'ACT', 'MNU'),
('Menu_FuncionesRoles', 'Menu_FuncionesRoles', 'ACT', 'MNU'),
('Menu_Menu', 'Menu público y privado del menú', 'ACT', 'MNU'),
('Menu_PaymentCheckout', 'Menu_PaymentCheckout', 'ACT', 'MNU'),
('Menu_RolesUsuarios', 'Menu_RolesUsuarios', 'ACT', 'MNU'),

-- FUNCIONES (FNC)
('mnt_especialidades', 'Mantenimiento de especialidades', 'ACT', 'FNC'),
('mnt_funciones', 'Mantenimiento de funciones', 'ACT', 'FNC'),
('mnt_funciones_roles', 'Asignar funciones a roles', 'ACT', 'FNC'),
('mnt_roles', 'Mantenimiento de roles', 'ACT', 'FNC'),
('mnt_roles_usuarios', 'Asignar roles a usuarios', 'ACT', 'FNC');

-- 3. PERMISOS ADMIN
INSERT INTO funciones_roles (rolescod, fncod, fnrolest)
SELECT 'ADMIN', fncod, 'ACT'
FROM funciones;

-- 4. CLIENTE
INSERT INTO funciones_roles (rolescod, fncod, fnrolest)
VALUES ('CLIENTE', 'Menu_Menu', 'ACT');

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES
('Menu_Historial', 'Menú de historial de compras', 'ACT', 'MNU'),
('Controllers\\Historial\\Listado', 'Listado de historial', 'ACT', 'CTR'),
('Controllers\\Historial\\Detalle', 'Detalle de historial', 'ACT', 'CTR');

INSERT INTO funciones_roles (rolescod, fncod, fnrolest) VALUES
('ADMIN', 'Menu_Historial', 'ACT'),
('ADMIN', 'Controllers\\Historial\\Listado', 'ACT'),
('ADMIN', 'Controllers\\Historial\\Detalle', 'ACT'),

('CLIENTE', 'Menu_Historial', 'ACT'),
('CLIENTE', 'Controllers\\Historial\\Listado', 'ACT'),
('CLIENTE', 'Controllers\\Historial\\Detalle', 'ACT');