-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2025 a las 16:34:30
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
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `autor` varchar(30) NOT NULL,
  `editorial` int(11) NOT NULL,
  `año de publicación` int(11) NOT NULL,
  `categoria` varchar(11) NOT NULL,
  `incluido_en_prestamo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `editorial`, `año de publicación`, `categoria`, `incluido_en_prestamo`) VALUES
(1, 'Señor de los anillos', 'Tholken', 1, 1950, 'Fantasia', 1),
(2, 'Señor de los anillos', 'Tholken', 11, 1950, 'Fantasia', 3),
(3, 'Marina', 'Carlos Ruiz Zafron', 2, 2024, 'Infantil', 2),
(4, 'Dune ', 'Felipe Reyes', 1, 1990, 'Ciencia ', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multa`
--

CREATE TABLE `multa` (
  `monto` float NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha de emision` int(11) NOT NULL,
  `id_prestamo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `multa`
--

INSERT INTO `multa` (`monto`, `descripcion`, `fecha de emision`, `id_prestamo`) VALUES
(100, '121', 6, 3),
(15, '20 dias tarde\r\n', 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `fecha prestamo` date NOT NULL,
  `fecha limite de devolucion` date NOT NULL,
  `id_prestamo` int(11) NOT NULL,
  `numero_socio` int(11) DEFAULT NULL,
  `fecha_real_devolucion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`fecha prestamo`, `fecha limite de devolucion`, `id_prestamo`, `numero_socio`, `fecha_real_devolucion`) VALUES
('2025-03-11', '2025-06-28', 1, 4, '2025-06-27'),
('2025-05-11', '2025-06-09', 3, 1, '2025-06-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `numero_socio` int(11) NOT NULL,
  `nombre_completo` varchar(20) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `fecha_inscripcion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`numero_socio`, `nombre_completo`, `direccion`, `correo`, `fecha_inscripcion`) VALUES
(1, 'David Mena', 'C/bragança', 'insti.dmena@gmail.com', '2025-02-18'),
(2, 'Daniel Suarez', 'Cerdanyola', 'danilasu@gmail.com', '2023-06-08'),
(3, 'Ruben Vizarroso', 'c/margarita', 'rubenviza@gmail.com', '2016-06-17'),
(4, 'Roger regor', 'Gracia', 'rogerfm@gmail.com', '2016-06-21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `incluido_en_prestamo` (`incluido_en_prestamo`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD UNIQUE KEY `numero_socios` (`numero_socio`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`numero_socio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`numero_socio`) REFERENCES `socio` (`numero_socio`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `prestamos_ibfk_3` FOREIGN KEY (`id_prestamo`) REFERENCES `libros` (`incluido_en_prestamo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
