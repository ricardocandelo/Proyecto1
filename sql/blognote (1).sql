-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2022 a las 17:39:25
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar` (IN `i` SMALLINT(5), IN `titu` VARCHAR(100), IN `tex` TEXT, IN `ubic` VARCHAR(30), IN `rang` DATETIME)   BEGIN
UPDATE note
set titulo = titu, texto = tex, ubicacion = ubic, rango = rang WHERE id = i;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar` (IN `ide` SMALLINT(5))   BEGIN

	SET @s = ide;
    DELETE from note WHERE id = ide;

    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_leer` (IN `param_id` SMALLINT(5))   BEGIN
	SELECT id, titulo, texto, fecha, ubicacion, rango, tipo_actividad From note WHERE note.id = param_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_notas` ()   BEGIN
	 SELECT * FROM note;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nueva_nota` (IN `titu` VARCHAR(100), IN `tex` TEXT, IN `ubica` VARCHAR(30), IN `rang` DATETIME, IN `tipo` VARCHAR(45))   BEGIN
INSERT into note(titulo, texto, ubicacion, rango, tipo_actividad) values(titu, tex, ubica, rang, tipo);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `note`
--

CREATE TABLE `note` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `titulo` varchar(100) NOT NULL DEFAULT 'Sin tittulo',
  `tipo_actividad` varchar(45) NOT NULL DEFAULT 'Tipod de actividad no especificada',
  `texto` text NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `ubicacion` varchar(30) DEFAULT NULL,
  `rango` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `note`
--

INSERT INTO `note` (`id`, `titulo`, `tipo_actividad`, `texto`, `fecha`, `ubicacion`, `rango`) VALUES
(4, 'Prueba de editar', 'Tipod de actividad no especificada', 'Estoy probando si esta vaina funciona o no', '2022-10-11 00:00:00', 'Nuevo campo', '2022-10-18 00:00:00'),
(15, 'A ver si coloca bien la fecha', '2022-10-15', 'Estudios', '2022-10-19 09:29:02', 'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', '2022-10-21 00:00:00'),
(25, 'msm', 'prueba', 'editada', '2022-10-19 10:26:42', 'mmmmsm', '2022-10-23 00:00:00'),
(27, 'na', 'Trabajo', 'msms', '2022-10-19 10:29:24', 'msms', '2022-10-21 00:00:00'),
(28, 'mms', 'Trabajo', 'sns', '2022-10-19 10:30:37', 'sns', '2022-10-23 00:00:00');

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
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
