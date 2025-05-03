
-- --------------------------------------------------------
-- Tabla cart
CREATE TABLE cart (
    id_cart INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    id_user INT NOT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NOT NULL
);
GO
-- --------------------------------------------------------
-- Relación entre la tabla cart y la tabla users
ALTER TABLE cart
ADD CONSTRAINT FK_cart_user FOREIGN KEY (id_user) REFERENCES users(id_user);
GO

-- --------------------------------------------------------
-- Tabla cart_productos
CREATE TABLE cart_productos (
    id_cart INT NOT NULL,
    id_product INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price_per_product DECIMAL(10, 0) NOT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NOT NULL,
    PRIMARY KEY (id_cart, id_product)
);
GO
-- Relación entre la tabla cart_productos y la tabla cart
ALTER TABLE cart_productos
ADD CONSTRAINT FK_cart FOREIGN KEY (id_cart) REFERENCES cart(id_cart);
GO

-- Relación entre la tabla cart_productos y la tabla product
ALTER TABLE cart_productos
ADD CONSTRAINT FK_product FOREIGN KEY (id_product) REFERENCES product(id_product);
GO


-- --------------------------------------------------------
-- Tabla orden
CREATE TABLE orden (
    id_order INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    id_user INT NOT NULL,
    total DECIMAL(10, 0) NOT NULL,
    status VARCHAR(20) CHECK (status IN ('pending', 'processed', 'cancelled')) NOT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NOT NULL
);
GO

-- Insertar datos en la tabla orden
INSERT INTO orden (id_user, total, status, createdAt, updatedAt)
VALUES
(2, 305, 'pending', '2025-02-27 15:35:13', '2025-02-27 15:35:13'),
(2, 1020, 'pending', '2025-02-27 16:09:19', '2025-02-27 16:09:19'),
(9, 610, 'pending', '2025-02-28 17:55:22', '2025-02-28 17:55:22');
GO

-- Relación entre la tabla orden y la tabla users
ALTER TABLE orden
ADD CONSTRAINT FK_order_user FOREIGN KEY (id_user) REFERENCES users(id_user);
GO




-- --------------------------------------------------------
-- Tabla orden_productos
CREATE TABLE orden_productos (
    id_order INT NOT NULL,
    id_product INT NOT NULL,
    quantity INT NOT NULL,
    price_at_a_purchase DECIMAL(10, 0) NOT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NOT NULL,
    PRIMARY KEY (id_order, id_product)
);
GO

-- Insertar datos en la tabla orden_productos
INSERT INTO orden_productos (id_order, id_product, quantity, price_at_a_purchase, createdAt, updatedAt)
VALUES
(3, 1, 1, 305, '2025-02-27 15:35:13', '2025-02-27 15:35:13'),
(4, 3, 3, 340, '2025-02-27 16:09:19', '2025-02-27 16:09:19'),
(5, 1, 2, 305, '2025-02-28 17:55:22', '2025-02-28 17:55:22');
GO

-- Relación entre la tabla orden_productos y las tablas orden y product
-- Relación entre la tabla orden_productos y la tabla orden
ALTER TABLE orden_productos
ADD CONSTRAINT FK_order_product FOREIGN KEY (id_order) REFERENCES orden(id_order);
GO
-- Relación entre la tabla orden_productos y la tabla product
ALTER TABLE orden_productos
ADD CONSTRAINT FK_product_order_product FOREIGN KEY (id_product) REFERENCES product(id_product);
GO

-- Verificar registros en orden_productos que no tienen id_order correspondiente en la tabla orden
-- Actualizar id_order huérfano en orden_productos






-- --------------------------------------------------------
-- Tabla product
CREATE TABLE product (
    id_product INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name_product VARCHAR(255) NOT NULL,
    price DECIMAL(10, 0) NOT NULL,
    stock INT NOT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NOT NULL
);
GO

-- Insertar datos en la tabla product
INSERT INTO product (name_product, price, stock, createdAt, updatedAt)
VALUES
('B2 First', 305, 57, '2025-02-10 19:07:00', '2025-02-28 17:55:22'),
('C1 Advanced', 335, 48, '2025-02-11 16:55:44', '2025-02-26 18:08:49'),
('C2 Proficiency', 340, 24, '2025-02-11 16:56:09', '2025-02-27 16:09:19');
GO

-- --------------------------------------------------------
-- Tabla users
CREATE TABLE users (
    id_user INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    DNI BIGINT NOT NULL UNIQUE,
    nombres VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fecha_nacimiento DATETIME NOT NULL,
    genero VARCHAR(50) CHECK (genero IN ('femenino', 'masculino', 'no binario', 'prefiero no decirlo')) NOT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NOT NULL
);
GO

-- Insertar datos en la tabla users
INSERT INTO users (DNI, nombres, apellido, email, username, password, fecha_nacimiento, genero, createdAt, updatedAt)
VALUES
(43795516, 'Esteban Miguel', 'Alvarez', 'em.alvarez020@gmail.com', 'ascenacuario_', '$2b$10$GkKOJOwzFMcTDzLuEyrnsOc5IvIYNNqRNpwf8zZ1Vt.Z1eduFLyFm', '2001-11-15 21:00:00', 'masculino', '2025-01-30 15:41:43', '2025-01-30 15:41:43'),
(12193484, 'Aldo Raul', 'Alvarez', 'aldoraul923@gmail.com', 'aldoraul_1959', '$2b$10$YOgcIVWL6syEoUeDgS2YtOb8VbKl8uPJ/3dNiYSj865/fX8UeNUJS', '1958-02-19 21:00:00', 'masculino', '2025-01-30 17:36:59', '2025-01-30 17:36:59'),
(13250799, 'Silvia Esther', 'Vela', 'velasilvia947@gmail.com', 'velasilvia947', '$2b$10$qJQa6NBWPKIyxIfNJ6iu7OKhFKBgqbeywxVd/54g3aqbtgFSOyNOS', '2001-11-15 21:00:00', 'femenino', '2025-02-10 17:20:08', '2025-02-10 17:20:08'),
(39895459, 'Juan Cruz', 'Herrero', 'juanchi_capricorpus@gmail.com', 'linduro', '$2b$10$nbdoCP6Bf4Bk1W9.419ajOVOQKC1yhi2nwWGgIySXw.X6/.45oz02', '1994-12-27 21:00:00', 'masculino', '2025-02-12 16:08:38', '2025-02-12 16:08:38'),
(41991328, 'Sol Micaela', 'Vega', 'solsv7@gmail.com', 'solsivega_', '$2b$10$j8jQxuW0sJOU4qLpav42lOk5GnBoWcTOBlrt56htWjxXWtK172/du', '1999-08-15 21:00:00', 'femenino', '2025-02-20 16:04:12', '2025-02-20 16:04:12'),
(31589415, 'Juan Cruz', 'Herrero', 'capric0rpus94@gmail.com', 'herrerojuancruz', '$2b$10$ig4ZoBDGpcjm6BHi7iMtq.ix/7Ip/8vWrPZwyvALL.vy/JtG5tq6m', '1994-12-27 21:00:00', 'masculino', '2025-02-27 16:07:20', '2025-02-27 16:07:20'),
(45155254, 'Aldo ', 'Alvarez', 'ascenlibbra@gmail.com', 'fotografo_1959', '$2b$10$b4TZa/odipmQkq0/Ze6dv.Ylzpwfi9VUhxTBIgp4e09GFYJ87BbRa', '1958-02-19 21:00:00', 'masculino', '2025-02-27 17:22:11', '2025-02-27 17:22:11'),
(14256879, 'Fabiana', 'Quagliaroli', 'myriamfabquagliaroli70@gmail.com', 'fabiana.quagliaroli', '$2b$10$Mw9ognpogGreL9AV0bBnze8.c79DGuttxYMNHXTTHaq5p9lcIMU2i', '1970-07-28 21:00:00', 'femenino', '2025-02-27 17:27:51', '2025-02-27 17:27:51');
GO
