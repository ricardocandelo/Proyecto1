-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2022 a las 10:10:18
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blognote`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edidtar_nota` (IN `param_id` SMALLINT(5), IN `param_titulo` VARCHAR(100), IN `param_texto` TEXT)   BEGIN
UPDATE note SET titulo = param_titulo, texto = param_texto WHERE note.id = param_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar` (IN `iden` SMALLINT(5), IN `titu` VARCHAR(100), IN `tex` TEXT, IN `ubi` VARCHAR(30), `rang` TIME)   BEGIN
UPDATE note
set titulo = titu, texto = tex, ubicacion = ubi, rango = rang WHERE id = iden;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar` (IN `ide` SMALLINT(5))   BEGIN
	DELETE from note WHERE id = ide;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_leer` (IN `param_id` SMALLINT(5))   BEGIN
	SELECT titulo, texto, fecha, ubicacion, rango From note WHERE note.id = param_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_notas` ()   BEGIN
	 SELECT id, titulo, texto, fecha FROM note;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nueva_nota` (IN `titulo` VARCHAR(100), IN `texto` TEXT)   INSERT into note(titulo, texto) values(titulo, texto)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `note`
--

CREATE TABLE `note` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `titulo` varchar(100) NOT NULL DEFAULT 'Sin tittulo',
  `texto` text NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `ubicacion` varchar(30) DEFAULT NULL,
  `rango` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `note`
--

INSERT INTO `note` (`id`, `titulo`, `texto`, `fecha`, `ubicacion`, `rango`) VALUES
(4, 'Prueba de editar', 'Estoy probando si esta vaina funciona o no', '2022-10-11 00:00:00', 'Nuevo campo', '04:20:30'),
(7, 'titulo3', 'prueba rango', '2022-10-18 02:31:50', '', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `note`
--
ALTER TABLE `note`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
