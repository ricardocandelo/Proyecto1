-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2022 a las 20:13:43
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtrar_actividad` (IN `param_campo` VARCHAR(250), IN `param_valor` VARCHAR(250))   BEGIN

	SET @s = CONCAT("SELECT id, titulo, tipo_actividad, texto, ubicacion, fecha, rango FROM note WHERE ", param_campo ," LIKE CONCAT('%", param_valor ,"%')");
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
 END$$

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
(37, 'Priekje', 'Trabajo', 'nsnsnns', '2022-10-19 18:37:47', 'snjsnsnn', '2022-10-21 00:00:00'),
(38, 'hola', 'Trabajo', 'nasns', '2022-10-19 18:38:42', 'nsnas', '2022-10-19 00:00:00');

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
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
