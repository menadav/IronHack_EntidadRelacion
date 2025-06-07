-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-06-2025 a las 17:40:47
-- Versión del servidor: 11.2.2-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taller`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nombre`, `correo`, `telefono`) VALUES
(1, 'David', 'mena@gmail.com', 612515371),
(2, 'Alex', 'alexmena@gmail.com', 712731273),
(3, 'ruben', 'ruben@gmail.com', 123123123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanico`
--

CREATE TABLE `mecanico` (
  `idmecanico` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `especialidad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mecanico`
--

INSERT INTO `mecanico` (`idmecanico`, `nombre`, `especialidad`) VALUES
(1, 'Paco', 'Chapa pintura'),
(2, 'Manolo', 'Montaje'),
(3, 'Paquito', 'Jefe Taller'),
(4, 'Paquito', 'Jefe Taller');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuesto`
--

CREATE TABLE `repuesto` (
  `idrepuesto` int(11) NOT NULL,
  `nombre` varchar(11) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `precio_unitario` decimal(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `repuesto`
--

INSERT INTO `repuesto` (`idrepuesto`, `nombre`, `marca`, `precio_unitario`) VALUES
(1, 'Ruedas', 'Michelin', 220),
(2, 'Aceite', 'Alcampo', 115),
(3, 'Volante', 'Peugot', 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `Idservicio` int(11) NOT NULL,
  `idmecanico` int(11) DEFAULT NULL,
  `patente` int(11) DEFAULT NULL,
  `idrepuesto` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `detalle` varchar(200) NOT NULL,
  `costo_total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`Idservicio`, `idmecanico`, `patente`, `idrepuesto`, `fecha`, `detalle`, `costo_total`) VALUES
(1, 3, 45261722, 3, '2025-06-10', 'Reparacion Volante', 300),
(2, 2, 968323, 2, '2025-06-15', 'Cambio de aceite', 340),
(3, 1, 1274382, 1, '2025-06-29', 'Cambio de ruedas', 450);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `patente` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `año` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`patente`, `idcliente`, `marca`, `modelo`, `año`) VALUES
(968323, 3, 'Citroen', 'Manda', '2016-06-16'),
(1274382, 2, 'Golf', 'Yundai', '2007-06-13'),
(45261722, 1, 'Peugot', '365', '2000-06-09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD PRIMARY KEY (`idmecanico`);

--
-- Indices de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  ADD PRIMARY KEY (`idrepuesto`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`Idservicio`),
  ADD UNIQUE KEY `idrepuesto` (`idrepuesto`),
  ADD UNIQUE KEY `idmecanico` (`idmecanico`),
  ADD UNIQUE KEY `idvehiculo` (`patente`),
  ADD UNIQUE KEY `patente` (`patente`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`patente`),
  ADD UNIQUE KEY `idcliente` (`idcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  MODIFY `idmecanico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  MODIFY `idrepuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `Idservicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `patente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45261723;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`idmecanico`) REFERENCES `mecanico` (`idmecanico`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `servicio_ibfk_2` FOREIGN KEY (`patente`) REFERENCES `vehiculo` (`patente`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `servicio_ibfk_3` FOREIGN KEY (`idrepuesto`) REFERENCES `repuesto` (`idrepuesto`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
