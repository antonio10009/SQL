-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2021 a las 20:25:47
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `juegosindie`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `usu_tipoA` varchar(5) NOT NULL,
  `usu_permisoA` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `cate_codigo` varchar(20) NOT NULL,
  `cate_nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comun`
--

CREATE TABLE `comun` (
  `usu_tipoB` varchar(5) NOT NULL,
  `usu_permisoB` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consola`
--

CREATE TABLE `consola` (
  `con_codigo` varchar(20) NOT NULL,
  `con_nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `jue_codigo` int(10) NOT NULL,
  `jue_nombre` varchar(50) NOT NULL,
  `jue_calificacion` varchar(1) NOT NULL,
  `cate_codigo` varchar(20) NOT NULL,
  `jue_descripcion` varchar(1000) DEFAULT NULL,
  `con_codigo` varchar(25) NOT NULL,
  `jue_img` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listado`
--

CREATE TABLE `listado` (
  `list` int(10) NOT NULL,
  `jue_codigo` int(10) DEFAULT NULL,
  `usu_codigo` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usu_codigo` int(10) NOT NULL,
  `usu_nombre` varchar(50) NOT NULL,
  `usu_correo` varchar(100) NOT NULL,
  `usu_pass` varchar(255) NOT NULL,
  `tipo_usuA` varchar(5) DEFAULT NULL,
  `tipo_usuB` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`usu_tipoA`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cate_codigo`);

--
-- Indices de la tabla `comun`
--
ALTER TABLE `comun`
  ADD PRIMARY KEY (`usu_tipoB`);

--
-- Indices de la tabla `consola`
--
ALTER TABLE `consola`
  ADD PRIMARY KEY (`con_codigo`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`jue_codigo`),
  ADD KEY `cate1` (`cate_codigo`),
  ADD KEY `cons1` (`con_codigo`);

--
-- Indices de la tabla `listado`
--
ALTER TABLE `listado`
  ADD PRIMARY KEY (`list`),
  ADD KEY `jue1` (`jue_codigo`),
  ADD KEY `usu1` (`usu_codigo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_codigo`),
  ADD KEY `usu_tipo1` (`tipo_usuA`),
  ADD KEY `usu_tipo2` (`tipo_usuB`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `jue_codigo` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_codigo` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `juego`
--
ALTER TABLE `juego`
  ADD CONSTRAINT `cate1` FOREIGN KEY (`cate_codigo`) REFERENCES `categoria` (`cate_codigo`),
  ADD CONSTRAINT `cons1` FOREIGN KEY (`con_codigo`) REFERENCES `consola` (`con_codigo`);

--
-- Filtros para la tabla `listado`
--
ALTER TABLE `listado`
  ADD CONSTRAINT `jue1` FOREIGN KEY (`jue_codigo`) REFERENCES `juego` (`jue_codigo`),
  ADD CONSTRAINT `usu1` FOREIGN KEY (`usu_codigo`) REFERENCES `usuario` (`usu_codigo`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usu_tipo1` FOREIGN KEY (`tipo_usuA`) REFERENCES `admin` (`usu_tipoA`),
  ADD CONSTRAINT `usu_tipo2` FOREIGN KEY (`tipo_usuB`) REFERENCES `comun` (`usu_tipoB`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
