-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2023 a las 11:30:50
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pirates`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `usuario` varchar(300) NOT NULL,
  `contraseña` varchar(300) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(300) NOT NULL,
  `correo` varchar(300) NOT NULL,
  `telefono` int(9) NOT NULL,
  `direccion` varchar(400) NOT NULL,
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`usuario`, `contraseña`, `nombre`, `apellidos`, `correo`, `telefono`, `direccion`, `id`) VALUES
('lucio', '$2y$10$0YsmA4z9sguDw.hRAU71JOSxfWm.4wmwpoj6BXIf9G4pfsSrT3B4m', 'Luccio', 'Pirlo Bonucci', 'yoel.pirates@gmail.com', 678546633, 'Calle de cigueñas, 13', 1),
('prueba', '$2y$10$WPSkUfEg01IXRymlzxZsoeFdrn7UUWY92rBXuY80SiRwjLcKCHx5e', 'yyyy', 'feewfgiefwiug', 'mm@vvv555', 3333, 'Calle de Pilas, 12, 1ºD', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(300) NOT NULL,
  `contraseña` varchar(300) NOT NULL,
  `correo` varchar(300) NOT NULL,
  `telefono` int(9) NOT NULL,
  `Puesto` varchar(100) NOT NULL,
  `id_empleados` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`nombre`, `apellidos`, `contraseña`, `correo`, `telefono`, `Puesto`, `id_empleados`) VALUES
('Yoel', 'Urquijo Barroso', '$2y$10$y0IU4uKJa6rDnQDO2L42Q.230TRd1gN2jySgBbv1tB5UJTrDDFXXS', 'yur@pirates.eus', 619559973, 'Tienda', 1),
('Maria', 'Ruiz Ayala', '$2y$10$I583jfzfokscrAxBJez0YeVo/Sl8pESoQyjIQrUGWeK.iV5Rkp3fC', 'mra@pirates.eus', 666789943, 'Soporte', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `usuario` varchar(30) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `precio` varchar(100) NOT NULL,
  `id_productos` int(10) NOT NULL,
  `id_pedido` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`usuario`, `nombre`, `apellidos`, `direccion`, `producto`, `precio`, `id_productos`, `id_pedido`) VALUES
('lucio', 'Luccio', 'Pirlo Bonucci', 'Calle de cigueñas, 13', 'Sombrero', '80$', 1, 7);

--
-- Disparadores `pedidos`
--
DELIMITER $$
CREATE TRIGGER `restar_stock` AFTER INSERT ON `pedidos` FOR EACH ROW BEGIN
UPDATE productos, pedidos
SET productos.Unidades = productos.Unidades - 1
WHERE productos.id_productos= pedidos.id_productos;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_productos` int(11) NOT NULL,
  `Nombre_producto` varchar(50) NOT NULL,
  `precios` varchar(100) NOT NULL,
  `Unidades` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_productos`, `Nombre_producto`, `precios`, `Unidades`) VALUES
(1, 'Sombrero', '80$', 99),
(2, 'Garfio', '88,00$', 120),
(3, 'Disfraz', '60$', 60),
(4, 'Espada', '30$', 153);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleados`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_productos` (`id_productos`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_productos`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleados` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id_productos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
