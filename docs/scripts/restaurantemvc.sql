-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2026 at 11:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurantemvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `bitacora`
--

CREATE TABLE `bitacora` (
  `bitacoracod` int(11) NOT NULL,
  `bitacorafch` datetime DEFAULT NULL,
  `bitprograma` varchar(255) DEFAULT NULL,
  `bitdescripcion` varchar(255) DEFAULT NULL,
  `bitobservacion` mediumtext DEFAULT NULL,
  `bitTipo` char(3) DEFAULT NULL,
  `bitusuario` bigint(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `especialidades`
--

CREATE TABLE `especialidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagenurl` varchar(255) DEFAULT NULL,
  `categoria` varchar(50) NOT NULL DEFAULT 'Especialidades',
  `estado` char(3) NOT NULL DEFAULT 'ACT'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `especialidades`
--

INSERT INTO `especialidades` (`id`, `nombre`, `descripcion`, `precio`, `imagenurl`, `categoria`, `estado`) VALUES
(8, 'Alitas', 'Deliciosas alitas bañadas en salsa barbacoa con papas y arroz.', 150.00, 'public/imgs/especialidades/alitas.jpeg', 'Especialidades', 'ACT'),
(9, 'Arroz mixto', 'Increible arroz mixto con todo (cerdo, pollo, res).', 240.00, 'public/imgs/especialidades/arroz_completo.jpeg', 'Arroces', 'ACT'),
(10, 'Camarones en Salsa', 'Camarones en salsa en una cama de lechuga, acompañada con arroz, papas fritas y ensalada.', 210.00, 'public/imgs/especialidades/camarones_salsa.jpeg', 'Mariscos', 'ACT'),
(11, 'Camarones al Ajillo', 'Camarones al ajillo acompañados con arroz de la casa, papas fritas y ensalada.', 120.00, 'public/imgs/especialidades/camarones.jpeg', 'Mariscos', 'ACT'),
(12, 'Carne con barbacoa', 'Carne de cerdo con salsa barbacoa acompañada con papas fritas, ensalada y arroz de la casa', 180.00, 'public/imgs/especialidades/carne.jpeg', 'Especialidades', 'ACT'),
(13, 'Sopa de camaron', 'Sopa de camaron acompañado con tostones y arroz.', 300.00, 'public/imgs/especialidades/sopa.jpeg', 'Platos Favoritos', 'ACT'),
(14, 'Chow Mein Mixto', 'Arroz con chow mein para saborear.', 250.00, 'public/imgs/hero/mixto.jpeg', 'Arroces', 'ACT'),
(15, 'Chuleta', 'Deliciosa chuleta con papas', 190.00, 'public/imgs/hero/chuleta.jpeg', 'Platos Favoritos', 'ACT');

-- --------------------------------------------------------

--
-- Table structure for table `funciones`
--

CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(255) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `funciones`
--

INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
('Controllers\\Historial\\Detalle', 'Detalle de historial', 'ACT', 'CTR'),
('Controllers\\Historial\\Listado', 'Listado de historial', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\Especialidades\\Formulario', 'Acceso al formulario de especialidades', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\Especialidades\\Listado', 'Acceso al listado de especialidades', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\FuncionesRoles\\Formulario', 'Acceso al formulario de funciones por rol', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\FuncionesRoles\\Listado', 'Acceso al listado de funciones por rol', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\RolesUsuarios\\Formulario', 'Controllers\\Mantenimientos\\RolesUsuarios\\Formulario', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\RolesUsuarios\\Listado', 'Controllers\\Mantenimientos\\RolesUsuarios\\Listado', 'ACT', 'CTR'),
('Mantenimientos-RolesUsuarios-Formulario', 'Acceso al formulario de roles por usuario', 'ACT', 'CTR'),
('Mantenimientos-RolesUsuarios-Listado', 'Acceso al listado de roles por usuario', 'ACT', 'CTR'),
('Menu_Especialidades', 'Menu de especialidades', 'ACT', 'MNU'),
('Menu_FuncionesRoles', 'Menu_FuncionesRoles', 'ACT', 'MNU'),
('Menu_Historial', 'Menú de historial de compras', 'ACT', 'MNU'),
('Menu_Menu', 'Menu público y privado del menú', 'ACT', 'MNU'),
('Menu_PaymentCheckout', 'Menu_PaymentCheckout', 'ACT', 'MNU'),
('Menu_RolesUsuarios', 'Menu_RolesUsuarios', 'ACT', 'MNU'),
('mnt_especialidades', 'Mantenimiento de especialidades', 'ACT', 'FNC'),
('mnt_funciones', 'Mantenimiento de funciones', 'ACT', 'FNC'),
('mnt_funciones_roles', 'Asignar funciones a roles', 'ACT', 'FNC'),
('mnt_roles', 'Mantenimiento de roles', 'ACT', 'FNC'),
('mnt_roles_usuarios', 'Asignar roles a usuarios', 'ACT', 'FNC');

-- --------------------------------------------------------

--
-- Table structure for table `funciones_roles`
--

CREATE TABLE `funciones_roles` (
  `rolescod` varchar(128) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `funciones_roles`
--

INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`, `fnexp`) VALUES
('ADMIN', 'Controllers\\Historial\\Detalle', 'ACT', NULL),
('ADMIN', 'Controllers\\Historial\\Listado', 'ACT', NULL),
('ADMIN', 'Controllers\\Mantenimientos\\Especialidades\\Formulario', 'ACT', NULL),
('ADMIN', 'Controllers\\Mantenimientos\\Especialidades\\Listado', 'ACT', NULL),
('ADMIN', 'Controllers\\Mantenimientos\\FuncionesRoles\\Formulario', 'ACT', NULL),
('ADMIN', 'Controllers\\Mantenimientos\\FuncionesRoles\\Listado', 'ACT', NULL),
('ADMIN', 'Controllers\\Mantenimientos\\RolesUsuarios\\Formulario', 'ACT', NULL),
('ADMIN', 'Controllers\\Mantenimientos\\RolesUsuarios\\Listado', 'ACT', NULL),
('ADMIN', 'Mantenimientos-RolesUsuarios-Formulario', 'ACT', NULL),
('ADMIN', 'Mantenimientos-RolesUsuarios-Listado', 'ACT', NULL),
('ADMIN', 'Menu_Especialidades', 'ACT', NULL),
('ADMIN', 'Menu_FuncionesRoles', 'ACT', NULL),
('ADMIN', 'Menu_Historial', 'ACT', NULL),
('ADMIN', 'Menu_Menu', 'ACT', NULL),
('ADMIN', 'Menu_RolesUsuarios', 'ACT', NULL),
('ADMIN', 'mnt_especialidades', 'ACT', NULL),
('ADMIN', 'mnt_funciones', 'ACT', NULL),
('ADMIN', 'mnt_funciones_roles', 'ACT', NULL),
('ADMIN', 'mnt_roles', 'ACT', NULL),
('ADMIN', 'mnt_roles_usuarios', 'ACT', NULL),
('CLIENTE', 'Controllers\\Historial\\Detalle', 'ACT', NULL),
('CLIENTE', 'Controllers\\Historial\\Listado', 'ACT', NULL),
('CLIENTE', 'Menu_Historial', 'ACT', NULL),
('CLIENTE', 'Menu_Menu', 'ACT', NULL),
('SUPERVISOR', 'Controllers\\Mantenimientos\\FuncionesRoles\\Listado', 'INA', NULL),
('SUPERVISOR', 'Mantenimientos-RolesUsuarios-Listado', 'ACT', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `rolescod` varchar(128) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`rolescod`, `rolesdsc`, `rolesest`) VALUES
('ADMIN', 'Administrador', 'ACT'),
('CLIENTE', 'Cliente', 'ACT'),
('SUPERVISOR', 'Supervisor', 'ACT');

-- --------------------------------------------------------

--
-- Table structure for table `roles_usuarios`
--

CREATE TABLE `roles_usuarios` (
  `usercod` bigint(10) NOT NULL,
  `rolescod` varchar(128) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles_usuarios`
--

INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserest`, `roleuserfch`, `roleuserexp`) VALUES
(1, 'ADMIN', 'ACT', '2026-04-13 16:46:40', NULL),
(1, 'CLIENTE', 'INA', '2026-04-16 15:19:02', NULL),
(2, 'ADMIN', 'INA', '2026-04-13 21:17:43', NULL),
(2, 'CLIENTE', 'ACT', '2026-04-13 21:07:58', NULL),
(3, 'CLIENTE', 'ACT', '2026-04-15 03:13:14', NULL),
(3, 'SUPERVISOR', 'INA', '2026-04-15 03:40:52', NULL),
(4, 'ADMIN', 'ACT', '2026-04-15 03:50:45', NULL),
(4, 'CLIENTE', 'INA', '2026-04-15 03:51:02', NULL),
(5, 'CLIENTE', 'ACT', '2026-04-16 15:24:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transacciones`
--

CREATE TABLE `transacciones` (
  `transcod` int(11) NOT NULL,
  `usercod` bigint(10) NOT NULL,
  `paypal_orderid` varchar(100) NOT NULL,
  `metodo_pago` varchar(30) NOT NULL DEFAULT 'PAYPAL',
  `subtotal` decimal(10,2) NOT NULL,
  `isv` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'COMPLETED',
  `transfch` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transacciones`
--

INSERT INTO `transacciones` (`transcod`, `usercod`, `paypal_orderid`, `metodo_pago`, `subtotal`, `isv`, `total`, `estado`, `transfch`) VALUES
(1, 3, '2SL69842G64628315', 'PAYPAL', 480.00, 72.00, 552.00, 'COMPLETED', '2026-04-16 02:06:55'),
(2, 3, '6GP97936TM5316535', 'PAYPAL', 720.00, 108.00, 828.00, 'COMPLETED', '2026-04-16 02:28:31'),
(3, 3, '0K3884653C546264E', 'PAYPAL', 390.00, 58.50, 448.50, 'COMPLETED', '2026-04-16 02:35:01'),
(4, 3, '97843229FR403854B', 'PAYPAL', 550.00, 82.50, 632.50, 'COMPLETED', '2026-04-16 03:30:51'),
(5, 3, '7HM5013656499461T', 'PAYPAL', 870.00, 130.50, 1000.50, 'COMPLETED', '2026-04-16 15:17:22'),
(6, 5, '3S125571PS691500Y', 'PAYPAL', 490.00, 73.50, 563.50, 'COMPLETED', '2026-04-16 15:25:52');

-- --------------------------------------------------------

--
-- Table structure for table `transacciones_detalle`
--

CREATE TABLE `transacciones_detalle` (
  `transdetcod` int(11) NOT NULL,
  `transcod` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal_linea` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transacciones_detalle`
--

INSERT INTO `transacciones_detalle` (`transdetcod`, `transcod`, `itemid`, `nombre`, `precio`, `cantidad`, `subtotal_linea`) VALUES
(1, 1, 9, 'Arroz mixto', 240.00, 2, 480.00),
(2, 2, 7, 'Filete con papas', 120.00, 6, 720.00),
(3, 3, 7, 'Filete con papas', 120.00, 2, 240.00),
(4, 3, 8, 'Alitas', 150.00, 1, 150.00),
(5, 4, 14, 'Chow Mein Mixto', 250.00, 1, 250.00),
(6, 4, 13, 'Sopa de camaron', 300.00, 1, 300.00),
(7, 5, 11, 'Camarones al Ajillo', 120.00, 1, 120.00),
(8, 5, 12, 'Carne con barbacoa', 180.00, 3, 540.00),
(9, 5, 10, 'Camarones en Salsa', 210.00, 1, 210.00),
(10, 6, 15, 'Chuleta', 190.00, 1, 190.00),
(11, 6, 13, 'Sopa de camaron', 300.00, 1, 300.00);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `usercod` bigint(10) NOT NULL,
  `useremail` varchar(80) NOT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`usercod`, `useremail`, `username`, `userpswd`, `userfching`, `userpswdest`, `userpswdexp`, `userest`, `useractcod`, `userpswdchg`, `usertipo`) VALUES
(1, 'admin@restaurante.com', 'Administrador', '$2y$10$qXQoTClXR6qZnXOmtw/sT.Ya2wFkMIdzggyUjOy3ELT3ojpHxIC7m', '2026-04-13 16:44:17', 'ACT', '2026-07-12 00:00:00', 'ACT', 'c8dee120148c3ff0e0678e5f4fdd98147e640d26022e156a92ece3fa1600cc55', '2026-04-13 16:44:17', 'ADM'),
(2, 'cliente1@restaurante.com', 'Cliente', '$2y$10$kf6v3d4vpR4Lv.g/GD3kr..nu0ywdxC.qQTOaauYnM1wEOnBUtl1q', '2026-04-13 21:07:58', 'ACT', '2026-07-12 00:00:00', 'ACT', '09daa823d0d338a0d09ac7caeabc55fcdb93fa5e430e59e16a74eb3fc1a23437', '2026-04-13 21:07:58', 'PBL'),
(3, 'cliente2@restaurante.com', 'Cliente', '$2y$10$F7MeE0Kv8dYl9x/w1lf2D.xJM7mPIRI3Pn.FyfSurN.HttsjhZ3LO', '2026-04-15 03:13:14', 'ACT', '2026-07-14 00:00:00', 'ACT', '9615549a1c47ba1d2cf24a6c19187a989a10c93ea95f17319da0c2f7faeb61b2', '2026-04-15 03:13:14', 'PBL'),
(4, 'joserobe167@gmail.com', 'Cliente', '$2y$10$jygnE.QiNMPkxphzqHzn9OcX7Ud2WPyBD2gp08/.EMezKWxxINdGC', '2026-04-15 03:49:44', 'ACT', '2026-07-14 00:00:00', 'ACT', 'd48b5147f1dd7e6e42da1dec7014f6711e61a55c71055f74c91e10003d6ae654', '2026-04-15 03:49:44', 'PBL'),
(5, 'cliente3@yahoo.com', 'Cliente', '$2y$10$xX7zzJDBBor.vrc4zZxS..8SDH0ezhTwGa2pOu.68lx8/uL/sgN5K', '2026-04-16 15:24:56', 'ACT', '2026-07-15 00:00:00', 'ACT', '78b8b958d50e48b87c627c2e4911b081331a290b993d80e97d266c68bdbf9cb8', '2026-04-16 15:24:56', 'PBL');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`bitacoracod`);

--
-- Indexes for table `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funciones`
--
ALTER TABLE `funciones`
  ADD PRIMARY KEY (`fncod`);

--
-- Indexes for table `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD PRIMARY KEY (`rolescod`,`fncod`),
  ADD KEY `rol_funcion_key_idx` (`fncod`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rolescod`);

--
-- Indexes for table `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD PRIMARY KEY (`usercod`,`rolescod`),
  ADD KEY `rol_usuario_key_idx` (`rolescod`);

--
-- Indexes for table `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`transcod`),
  ADD UNIQUE KEY `uk_paypal_orderid` (`paypal_orderid`),
  ADD KEY `fk_transacciones_usuario` (`usercod`);

--
-- Indexes for table `transacciones_detalle`
--
ALTER TABLE `transacciones_detalle`
  ADD PRIMARY KEY (`transdetcod`),
  ADD KEY `fk_transdetalle_transaccion` (`transcod`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usercod`),
  ADD UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  ADD KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `bitacoracod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `transcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transacciones_detalle`
--
ALTER TABLE `transacciones_detalle`
  MODIFY `transdetcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usercod` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `fk_transacciones_usuario` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transacciones_detalle`
--
ALTER TABLE `transacciones_detalle`
  ADD CONSTRAINT `fk_transdetalle_transaccion` FOREIGN KEY (`transcod`) REFERENCES `transacciones` (`transcod`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
