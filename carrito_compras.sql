-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-05-2025 a las 05:39:10
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carrito_compras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`id_cart`, `id_user`, `createdAt`, `updatedAt`) VALUES
(119, 5, '2025-03-05 15:02:23', '2025-03-05 15:02:23'),
(120, 2, '2025-03-06 18:22:55', '2025-03-06 18:22:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_productos`
--

CREATE TABLE `cart_productos` (
  `id_cart` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price_per_product` decimal(10,0) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id_order` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `status` enum('pending','processed','cancelled') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id_order`, `id_user`, `total`, `status`, `createdAt`, `updatedAt`) VALUES
(3, 2, 305, 'pending', '2025-02-27 15:35:13', '2025-02-27 15:35:13'),
(4, 2, 1020, 'pending', '2025-02-27 16:09:19', '2025-02-27 16:09:19'),
(5, 9, 610, 'pending', '2025-02-28 17:55:22', '2025-02-28 17:55:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_productos`
--

CREATE TABLE `orden_productos` (
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_a_purchase` decimal(10,0) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden_productos`
--

INSERT INTO `orden_productos` (`id_order`, `id_product`, `quantity`, `price_at_a_purchase`, `createdAt`, `updatedAt`) VALUES
(3, 1, 1, 305, '2025-02-27 15:35:13', '2025-02-27 15:35:13'),
(4, 3, 3, 340, '2025-02-27 16:09:19', '2025-02-27 16:09:19'),
(5, 1, 2, 305, '2025-02-28 17:55:22', '2025-02-28 17:55:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `stock` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id_product`, `name_product`, `price`, `stock`, `createdAt`, `updatedAt`) VALUES
(1, 'B2 First', 305, 57, '2025-02-10 19:07:00', '2025-02-28 17:55:22'),
(2, 'C1 Advanced', 335, 48, '2025-02-11 16:55:44', '2025-02-26 18:08:49'),
(3, 'C2 Proficiency', 340, 24, '2025-02-11 16:56:09', '2025-02-27 16:09:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `DNI` bigint(20) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `genero` enum('femenino','masculino','no binario','prefiero no decirlo') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `DNI`, `nombres`, `apellido`, `email`, `username`, `password`, `fecha_nacimiento`, `genero`, `createdAt`, `updatedAt`) VALUES
(2, 43795516, 'Esteban Miguel', 'Alvarez', 'em.alvarez020@gmail.com', 'ascenacuario_', '$2b$10$GkKOJOwzFMcTDzLuEyrnsOc5IvIYNNqRNpwf8zZ1Vt.Z1eduFLyFm', '2001-11-15 21:00:00', '', '2025-01-30 15:41:43', '2025-01-30 15:41:43'),
(3, 12193484, 'Aldo Raul', 'Alvarez', 'aldoraul923@gmail.com', 'aldoraul_1959', '$2b$10$YOgcIVWL6syEoUeDgS2YtOb8VbKl8uPJ/3dNiYSj865/fX8UeNUJS', '1958-02-19 21:00:00', 'masculino', '2025-01-30 17:36:59', '2025-01-30 17:36:59'),
(4, 13250799, 'Silvia Esther', 'Vela', 'velasilvia947@gmail.com', 'velasilvia947', '$2b$10$qJQa6NBWPKIyxIfNJ6iu7OKhFKBgqbeywxVd/54g3aqbtgFSOyNOS', '2001-11-15 21:00:00', 'femenino', '2025-02-10 17:20:08', '2025-02-10 17:20:08'),
(5, 39895459, 'Juan Cruz', 'Herrero', 'juanchi_capricorpus@gmail.com', 'linduro', '$2b$10$nbdoCP6Bf4Bk1W9.419ajOVOQKC1yhi2nwWGgIySXw.X6/.45oz02', '1994-12-27 21:00:00', 'masculino', '2025-02-12 16:08:38', '2025-02-12 16:08:38'),
(6, 41991328, 'Sol Micaela', 'Vega', 'solsv7@gmail.com', 'solsivega_', '$2b$10$j8jQxuW0sJOU4qLpav42lOk5GnBoWcTOBlrt56htWjxXWtK172/du', '1999-08-15 21:00:00', 'femenino', '2025-02-20 16:04:12', '2025-02-20 16:04:12'),
(7, 31589415, 'Juan Cruz', 'Herrero', 'capric0rpus94@gmail.com', 'herrerojuancruz', '$2b$10$ig4ZoBDGpcjm6BHi7iMtq.ix/7Ip/8vWrPZwyvALL.vy/JtG5tq6m', '1994-12-27 21:00:00', 'masculino', '2025-02-27 16:07:20', '2025-02-27 16:07:20'),
(8, 45155254, 'Aldo ', 'Alvarez', 'ascenlibbra@gmail.com', 'fotografo_1959', '$2b$10$b4TZa/odipmQkq0/Ze6dv.Ylzpwfi9VUhxTBIgp4e09GFYJ87BbRa', '1958-02-19 21:00:00', 'masculino', '2025-02-27 17:22:11', '2025-02-27 17:22:11'),
(9, 14256879, 'Fabiana', 'Quagliaroli', 'myriamfabquagliaroli70@gmail.com', 'fabiana.quagliaroli', '$2b$10$Mw9ognpogGreL9AV0bBnze8.c79DGuttxYMNHXTTHaq5p9lcIMU2i', '1970-07-14 21:00:00', 'femenino', '2025-02-28 17:33:30', '2025-02-28 17:33:30'),
(11, 78567412, 'Jorge ', 'de Leon', 'jorgedeleon80@gmail.com', 'jorgeeleon_', '$2b$10$3ET0qB80Fi.RpSP.LDM0duHdDHcY1q6KELRW3hQ..V3Ea0cn/xGE2', '2001-11-15 21:00:00', 'masculino', '2025-03-06 18:16:42', '2025-03-06 18:16:42');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `cart_productos`
--
ALTER TABLE `cart_productos`
  ADD PRIMARY KEY (`id_cart`,`id_product`),
  ADD UNIQUE KEY `cart_productos_id_product_id_cart_unique` (`id_cart`,`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `orden_productos`
--
ALTER TABLE `orden_productos`
  ADD PRIMARY KEY (`id_order`,`id_product`),
  ADD UNIQUE KEY `orden_productos_id_producto_id_orden_unique` (`id_order`,`id_product`),
  ADD KEY `id_producto` (`id_product`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `cart_productos`
--
ALTER TABLE `cart_productos`
  ADD CONSTRAINT `cart_productos_ibfk_1` FOREIGN KEY (`id_cart`) REFERENCES `cart` (`id_cart`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_productos_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden_productos`
--
ALTER TABLE `orden_productos`
  ADD CONSTRAINT `orden_productos_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orden` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_productos_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
