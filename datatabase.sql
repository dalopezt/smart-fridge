-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2024 at 07:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_fridge_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE `audit` (
  `id` int(11) NOT NULL,
  `action` varchar(10) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `record_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit`
--

INSERT INTO `audit` (`id`, `action`, `table_name`, `record_id`, `user_id`, `timestamp`) VALUES
(2, 'UPDATE', 'productos', 4, 0, '2024-02-16 11:58:13'),
(3, 'DELETE', 'productos', 3, 0, '2024-02-16 11:58:37'),
(4, 'INSERT', 'productos', 7, 0, '2024-02-16 16:03:50'),
(5, 'INSERT', 'inventario', 6, 0, '2024-02-16 16:04:13'),
(6, 'INSERT', 'recetas', 12, 0, '2024-02-16 16:07:52'),
(7, 'INSERT', 'materiales_receta', 16, 0, '2024-02-16 16:07:52'),
(8, 'INSERT', 'materiales_receta', 17, 0, '2024-02-16 16:07:52'),
(9, 'INSERT', 'materiales_receta', 18, 0, '2024-02-16 16:07:52'),
(10, 'INSERT', 'pasos_receta', 21, 0, '2024-02-16 16:07:52'),
(11, 'INSERT', 'pasos_receta', 22, 0, '2024-02-16 16:07:52'),
(12, 'INSERT', 'pasos_receta', 23, 0, '2024-02-16 16:07:52'),
(13, 'INSERT', 'productos', 8, 0, '2024-02-16 16:09:21'),
(14, 'INSERT', 'productos', 9, 0, '2024-02-16 16:09:32'),
(15, 'UPDATE', 'productos', 9, 0, '2024-02-16 16:09:45'),
(16, 'INSERT', 'productos', 10, 0, '2024-02-16 16:11:10'),
(17, 'INSERT', 'productos', 11, 0, '2024-02-16 16:11:59'),
(18, 'INSERT', 'usuarios', 2, 0, '2024-02-16 16:13:29'),
(19, 'INSERT', 'productos', 12, 0, '2024-02-16 16:14:22'),
(20, 'INSERT', 'categorias_producto', 8, 0, '2024-02-16 16:16:47'),
(21, 'INSERT', 'productos', 13, 0, '2024-02-16 16:17:14'),
(22, 'INSERT', 'productos', 14, 0, '2024-02-16 16:21:38'),
(23, 'INSERT', 'productos', 15, 0, '2024-02-16 16:21:56'),
(24, 'INSERT', 'productos', 16, 0, '2024-02-16 16:22:28'),
(25, 'INSERT', 'productos', 17, 0, '2024-02-16 16:24:54'),
(26, 'INSERT', 'recetas', 13, 0, '2024-02-16 16:38:58'),
(27, 'INSERT', 'materiales_receta', 19, 0, '2024-02-16 16:38:58'),
(28, 'INSERT', 'materiales_receta', 20, 0, '2024-02-16 16:38:58'),
(29, 'INSERT', 'materiales_receta', 21, 0, '2024-02-16 16:38:58'),
(30, 'INSERT', 'materiales_receta', 22, 0, '2024-02-16 16:38:58'),
(31, 'INSERT', 'materiales_receta', 23, 0, '2024-02-16 16:38:58'),
(32, 'INSERT', 'materiales_receta', 24, 0, '2024-02-16 16:38:58'),
(33, 'INSERT', 'materiales_receta', 25, 0, '2024-02-16 16:38:58'),
(34, 'INSERT', 'materiales_receta', 26, 0, '2024-02-16 16:38:58'),
(35, 'INSERT', 'materiales_receta', 27, 0, '2024-02-16 16:38:58'),
(36, 'INSERT', 'pasos_receta', 24, 0, '2024-02-16 16:38:58'),
(37, 'INSERT', 'pasos_receta', 25, 0, '2024-02-16 16:38:58'),
(38, 'INSERT', 'pasos_receta', 26, 0, '2024-02-16 16:38:58'),
(39, 'INSERT', 'pasos_receta', 27, 0, '2024-02-16 16:38:58'),
(40, 'INSERT', 'pasos_receta', 28, 0, '2024-02-16 16:38:58'),
(41, 'INSERT', 'pasos_receta', 29, 0, '2024-02-16 16:38:58'),
(42, 'INSERT', 'pasos_receta', 30, 0, '2024-02-16 16:38:58'),
(43, 'INSERT', 'pasos_receta', 31, 0, '2024-02-16 16:38:58'),
(44, 'INSERT', 'pasos_receta', 32, 0, '2024-02-16 16:38:58'),
(45, 'INSERT', 'pasos_receta', 33, 0, '2024-02-16 16:38:58'),
(46, 'INSERT', 'inventario', 7, 0, '2024-02-16 16:42:13'),
(47, 'INSERT', 'inventario', 8, 0, '2024-02-16 16:42:28'),
(48, 'INSERT', 'inventario', 9, 0, '2024-02-16 16:42:38'),
(49, 'INSERT', 'inventario', 10, 0, '2024-02-16 16:42:50');

-- --------------------------------------------------------

--
-- Table structure for table `categorias_producto`
--

CREATE TABLE `categorias_producto` (
  `id_categoria_producto` int(11) NOT NULL,
  `nombre_categoria_producto` varchar(50) NOT NULL,
  `descripcion_categoria_producto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorias_producto`
--

INSERT INTO `categorias_producto` (`id_categoria_producto`, `nombre_categoria_producto`, `descripcion_categoria_producto`) VALUES
(1, 'Fruta', 'Las frutas son alimentos ricos en vitaminas, minerales y antioxidantes, esenciales para la salud. Contribuyen a la hidratación, fortalecen el sistema inmunológico y promueven la salud cardiovascular.'),
(2, 'Verdura', 'Las verduras son alimentos nutritivos, cargados de vitaminas, minerales y fibra. Contribuyen a la salud óptima, fortalecen el sistema inmunológico, y ayudan en la prevención de enfermedades crónicas.'),
(3, 'Cereal', 'Los cereales son fuentes de carbohidratos, fibra y nutrientes esenciales. Brindan energía sostenible, favorecen la digestión y aportan vitaminas y minerales fundamentales para la salud general.'),
(4, 'Carne', 'Las carnes son ricas en proteínas, hierro y vitaminas B. Contribuyen al desarrollo muscular, fortalecen el sistema inmunológico y apoyan la salud ósea. Se deben consumir con moderación.'),
(5, 'Origen animal y derivados', 'Los productos de origen animal y derivados, como los lácteos, son fuentes de proteínas, calcio y vitaminas esenciales. Contribuyen a la salud ósea, muscular y dental, fortaleciendo el organismo.'),
(6, 'Especias', 'Las especia, como la cúrcuma y el jengibre, ofrecen beneficios antioxidantes y antiinflamatorios. Mejoran el sabor de los alimentos y pueden tener propiedades medicinales, promoviendo la salud.'),
(7, 'Condimento', 'Los condimentos agregan sabor a las comidas sin calorías adicionales. Algunos, como el ajo, también tienen propiedades antioxidantes y antiinflamatorias, beneficiando la salud cardiovascular y general.'),
(8, 'Legumbres', 'Las legumbres, como los frijoles y las lentejas, son ricas en proteínas, fibra y nutrientes esenciales. Contribuyen a la salud cardiovascular, la saciedad y la estabilidad glucémica.');

--
-- Triggers `categorias_producto`
--
DELIMITER $$
CREATE TRIGGER `after_delete_categorias_producto` AFTER DELETE ON `categorias_producto` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'categorias_producto', OLD.id_categoria_producto, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_categorias_producto` AFTER INSERT ON `categorias_producto` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'categorias_producto', NEW.id_categoria_producto, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_categorias_producto` AFTER UPDATE ON `categorias_producto` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'categorias_producto', NEW.id_categoria_producto, CURRENT_USER);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categorias_receta`
--

CREATE TABLE `categorias_receta` (
  `id_categoria_receta` int(11) NOT NULL,
  `nombre_categoria_receta` varchar(50) NOT NULL,
  `descripcion_categoria_receta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorias_receta`
--

INSERT INTO `categorias_receta` (`id_categoria_receta`, `nombre_categoria_receta`, `descripcion_categoria_receta`) VALUES
(1, 'Desayuno', 'El desayuno típicamente incluye alimentos como cereales, frutas, lácteos, pan, huevos y bebidas como café o jugo. Proporciona energía para iniciar el día y nutrientes esenciales.'),
(2, 'Entrada', 'En la comida, las entradas suelen consistir en platillos ligeros como ensaladas, sopas o aperitivos, preparando el paladar para el plato principal y proporcionando nutrientes adicionales.'),
(3, 'Plato fuerte', 'En la comida, los platos fuertes son porciones principales que incluyen proteínas como carnes, pescados o vegetales, acompañados de guarniciones. Satisfacen el apetito y proporcionan nutrientes esenciales.'),
(4, 'Postre', 'Los postres en la comida son dulces o preparaciones indulgentes que cierran la comida. Pueden incluir pasteles, helados, frutas o postres tradicionales, proporcionando un toque dulce y satisfactorio.'),
(5, 'Colación', 'Las colaciones son pequeños refrigerios entre comidas principales, como frutas, yogures, frutos secos o barritas energéticas. Proporcionan energía y nutrientes, manteniendo el hambre a raya.'),
(6, 'Cena', 'En la cena, se sirven platos ligeros y equilibrados, como proteínas magras, vegetales y granos. Contribuyen a una digestión tranquila y satisfacen el apetito antes de descansar.');

--
-- Triggers `categorias_receta`
--
DELIMITER $$
CREATE TRIGGER `after_delete_categorias_receta` AFTER DELETE ON `categorias_receta` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'categorias_receta', OLD.id_categoria_receta, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_categorias_receta` AFTER INSERT ON `categorias_receta` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'categorias_receta', NEW.id_categoria_receta, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_categorias_receta` AFTER UPDATE ON `categorias_receta` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'categorias_receta', NEW.id_categoria_receta, CURRENT_USER);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL,
  `existencia_inventario` int(11) NOT NULL,
  `fecha_compra_inventario` date NOT NULL,
  `fecha_caducidad_inventario` date NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `existencia_inventario`, `fecha_compra_inventario`, `fecha_caducidad_inventario`, `id_producto`) VALUES
(1, 5, '2024-02-14', '2024-02-21', 2),
(4, 5, '2024-02-16', '2024-02-19', 6),
(5, 1000, '2024-02-16', '2024-02-23', 1),
(6, 4, '2024-02-01', '2024-02-15', 7),
(7, 5, '2024-02-13', '2024-02-20', 2),
(8, 1000, '2024-02-15', '2024-02-29', 13),
(9, 30, '2024-02-13', '2024-02-18', 8),
(10, 10, '2024-02-14', '2024-02-19', 9);

--
-- Triggers `inventario`
--
DELIMITER $$
CREATE TRIGGER `after_delete_inventario` AFTER DELETE ON `inventario` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'inventario', OLD.id_inventario, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_inventario` AFTER INSERT ON `inventario` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'inventario', NEW.id_inventario, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_inventario` AFTER UPDATE ON `inventario` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'inventario', NEW.id_inventario, CURRENT_USER);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `materiales_receta`
--

CREATE TABLE `materiales_receta` (
  `id_materiales_receta` int(11) NOT NULL,
  `cantidad_materiales_receta` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materiales_receta`
--

INSERT INTO `materiales_receta` (`id_materiales_receta`, `cantidad_materiales_receta`, `id_receta`, `id_producto`) VALUES
(13, 10, 11, 1),
(14, 3, 11, 2),
(15, 3, 11, 6),
(16, 3, 12, 2),
(17, 3, 12, 7),
(18, 10, 12, 1),
(19, 20, 13, 8),
(20, 250, 13, 13),
(21, 4, 13, 10),
(22, 1, 13, 11),
(23, 14, 13, 12),
(24, 250, 13, 17),
(25, 1, 13, 14),
(26, 1, 13, 15),
(27, 3, 13, 16);

--
-- Triggers `materiales_receta`
--
DELIMITER $$
CREATE TRIGGER `after_delete_materiales_receta` AFTER DELETE ON `materiales_receta` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'materiales_receta', OLD.id_materiales_receta, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_materiales_receta` AFTER INSERT ON `materiales_receta` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'materiales_receta', NEW.id_materiales_receta, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_materiales_receta` AFTER UPDATE ON `materiales_receta` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'materiales_receta', NEW.id_materiales_receta, CURRENT_USER);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pasos_receta`
--

CREATE TABLE `pasos_receta` (
  `id_paso_receta` int(11) NOT NULL,
  `descripcion_paso_receta` varchar(255) NOT NULL,
  `tiempo_paso_receta` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasos_receta`
--

INSERT INTO `pasos_receta` (`id_paso_receta`, `descripcion_paso_receta`, `tiempo_paso_receta`, `id_receta`) VALUES
(18, 'Mezclar el huevo, el jamon y la leche en un tazon. Agregar sal y pimienta al gusto. Agitar hasta que la mezcla sea homogenea.', 5, 11),
(19, 'Poner mantequilla en una sarten. Una vez caliente, colocar el jamon previamente cortado en cuadrados. Mover para que no se pegue.', 5, 11),
(20, 'Una vez que el jamon cambie de color en las orillas, agregar la mezcla del huevo. Subir a fuego alto. Mezclar hasta que todo quede cocido.', 5, 11),
(21, 'Revolver los huevos y leche en un tazon. Agregar sal y pimienta al gusto. Mezclar hasta que se vea homogenea', 5, 12),
(22, 'Poner en una sarten engrasada con mantequilla las salchichas previamente cortadas en rodajas. Mover para que no se peguen   ', 2, 12),
(23, 'Agregar el huevo y revolver hasta que todo esté cocido (subir a fuego medio alto)', 5, 12),
(24, 'Poner a hervir 1L de agua en una cazuela. Una vez que esté hirviendo, agregar un knor suiza, un pedazo de la cebolla (1/4), un manojo del cilantro picado (1 peso) y la soya. Dejar a fuego medio alto hasta el primer hervor. Bajar el fuego a medio bajo  y m', 25, 13),
(25, 'Poner 10 de los tomates a asar en un comal. Mover constantemente hasta que cambien de color a un tono claro/transparente y algo tatemados de la superficie.', 12, 13),
(26, 'Poner a cocer el resto de los tomates (10) en 1/2L de agua. Dejar cocer hasta que cambien de color a un tono mas claro/transparente.', 12, 13),
(27, 'Una vez que los tomates asados estén listos, apartar. Poner una cucharada de aceite en el comal y agregar los chiles y el ajo. Mover hasta que los chiles cambien de color.', 5, 13),
(28, 'Cuando estén los chiles, agregarlos a la licuadora junto con un el ajo y dos pizcas de sal y un poco de agua (1/4 de taza). Luego, agregar los tomates asados y licuar. Vaciar en un toper (esta es nuestra salsa picante). Lavar la licuadora', 5, 13),
(29, 'Una vez que estén cocidos los tomates en agua, licuarlos con 1 taza de esa misma agua y 2 pizcas de sal más. Vaciar en un toper (esta es nuestra salsa no picante).', 5, 13),
(30, 'Una vez que la soya esté cocida, separar y colar el agua. Aplastar con un cucharon para eliminar el exceso de agua. En la misma cazuela, poner a freir el tocino. Mover para que no se pegue. Una vez exprimida la soya, agregar nuevamente con el tocino y agr', 10, 13),
(31, 'Revolver y dejar mezclando. Comprobar que esté bien de sal, y agregar condimientos al gusto (ajo en polvo, pimienta).', 5, 13),
(32, 'Picar el resto de la cebolla y cilantro para servir en los tacos.', 5, 13),
(33, 'Servir en tortilla caliente la soya, agregar cebolla, cilantro y las salsas al gusto.', 5, 13);

--
-- Triggers `pasos_receta`
--
DELIMITER $$
CREATE TRIGGER `after_delete_pasos_receta` AFTER DELETE ON `pasos_receta` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'pasos_receta', OLD.id_paso_receta, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_pasos_receta` AFTER INSERT ON `pasos_receta` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'pasos_receta', NEW.id_paso_receta, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_pasos_receta` AFTER UPDATE ON `pasos_receta` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'pasos_receta', NEW.id_paso_receta, CURRENT_USER);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `precio_unitario` double NOT NULL,
  `vida_util` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `id_categoria_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `precio_unitario`, `vida_util`, `id_unidad`, `id_categoria_producto`) VALUES
(1, 'Leche', 0.02, 7, 3, 5),
(2, 'Huevo', 3, 7, 1, 5),
(4, 'Carne molida de las dos', 0.14, 6, 2, 4),
(6, 'Jamon', 3, 3, 1, 5),
(7, 'Salchicha', 2, 14, 1, 5),
(8, 'Tomates', 1, 5, 1, 1),
(9, 'Jitomates', 2, 5, 1, 1),
(10, 'Chile de árbol', 2, 100, 1, 1),
(11, 'Diente de ajo', 3, 100, 1, 2),
(12, 'Tortilla', 0.75, 7, 1, 3),
(13, 'Soya', 0.1, 14, 2, 8),
(14, 'Knor Suiza', 5, 100, 1, 7),
(15, 'Cebolla', 5, 14, 1, 2),
(16, 'Cilantro', 1, 21, 1, 2),
(17, 'Tocino', 0.14, 7, 2, 4);

--
-- Triggers `productos`
--
DELIMITER $$
CREATE TRIGGER `after_delete_productos` AFTER DELETE ON `productos` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'productos', OLD.id_producto, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_productos` AFTER INSERT ON `productos` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'productos', NEW.id_producto, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_productos` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'productos', NEW.id_producto, CURRENT_USER);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `recetas`
--

CREATE TABLE `recetas` (
  `id_receta` int(11) NOT NULL,
  `nombre_receta` varchar(100) NOT NULL,
  `tiempo_receta` int(11) NOT NULL,
  `id_categoria_receta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recetas`
--

INSERT INTO `recetas` (`id_receta`, `nombre_receta`, `tiempo_receta`, `id_categoria_receta`, `id_usuario`) VALUES
(11, 'Huevo con jamon', 15, 1, 1),
(12, 'Huevo con salchicha', 12, 1, 1),
(13, 'Tacos de soya', 89, 3, 2);

--
-- Triggers `recetas`
--
DELIMITER $$
CREATE TRIGGER `after_delete_recetas` AFTER DELETE ON `recetas` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'recetas', OLD.id_receta, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_recetas` AFTER INSERT ON `recetas` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'recetas', NEW.id_receta, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_recetas` AFTER UPDATE ON `recetas` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'recetas', NEW.id_receta, CURRENT_USER);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(20) NOT NULL,
  `descripcion_rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion_rol`) VALUES
(1, 'Administrador', 'Este rol tiene acceso global a la aplicación'),
(2, 'Colaborador', 'Este rol puede agregar recetas, pero no modificar inventarios'),
(3, 'Cocinero', 'Este rol puede agregar recetas y modificar inventarios');

--
-- Triggers `roles`
--
DELIMITER $$
CREATE TRIGGER `after_delete_roles` AFTER DELETE ON `roles` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'roles', OLD.id_rol, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_roles` AFTER INSERT ON `roles` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'roles', NEW.id_rol, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_roles` AFTER UPDATE ON `roles` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'roles', NEW.id_rol, CURRENT_USER);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `unidades`
--

CREATE TABLE `unidades` (
  `id_unidad` int(11) NOT NULL,
  `nombre_unidad` varchar(50) NOT NULL,
  `descripcion_unidad` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unidades`
--

INSERT INTO `unidades` (`id_unidad`, `nombre_unidad`, `descripcion_unidad`) VALUES
(1, 'Piezas', 'Un ejemplar. Utilizado para medir cantidades discretas (1 huevo, 3 jitomates)'),
(2, 'Gramos', 'Unidad de masa'),
(3, 'Mililitros', 'Unidad de volumen');

--
-- Triggers `unidades`
--
DELIMITER $$
CREATE TRIGGER `after_delete_unidades` AFTER DELETE ON `unidades` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'unidades', OLD.id_unidad, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_unidades` AFTER INSERT ON `unidades` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'unidades', NEW.id_unidad, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_unidades` AFTER UPDATE ON `unidades` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'unidades', NEW.id_unidad, CURRENT_USER);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `apellido_usuario` varchar(50) NOT NULL,
  `cuenta_usuario` varchar(20) NOT NULL,
  `password_usuario` varchar(100) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apellido_usuario`, `cuenta_usuario`, `password_usuario`, `id_rol`) VALUES
(1, 'David', 'Lopez', 'buronsuave', '6d98604341953c8c4348bed03ddb47a9', 1),
(2, 'Andrea', 'Torres', 'andytorres', '4ca11b5d1f2fe9594bea3a41c14ca809', 1);

--
-- Triggers `usuarios`
--
DELIMITER $$
CREATE TRIGGER `after_delete_usuarios` AFTER DELETE ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'usuarios', OLD.id_usuario, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_usuarios` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'usuarios', NEW.id_usuario, CURRENT_USER);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_usuarios` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'usuarios', NEW.id_usuario, CURRENT_USER);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorias_producto`
--
ALTER TABLE `categorias_producto`
  ADD PRIMARY KEY (`id_categoria_producto`);

--
-- Indexes for table `categorias_receta`
--
ALTER TABLE `categorias_receta`
  ADD PRIMARY KEY (`id_categoria_receta`);

--
-- Indexes for table `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `fk_producto_inventario` (`id_producto`);

--
-- Indexes for table `materiales_receta`
--
ALTER TABLE `materiales_receta`
  ADD PRIMARY KEY (`id_materiales_receta`),
  ADD KEY `fg_receta_materiales` (`id_receta`),
  ADD KEY `fg_producto_materiales` (`id_producto`);

--
-- Indexes for table `pasos_receta`
--
ALTER TABLE `pasos_receta`
  ADD PRIMARY KEY (`id_paso_receta`),
  ADD KEY `fg_receta_paso` (`id_receta`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_unidad_producto` (`id_unidad`),
  ADD KEY `fk_categoria_producto` (`id_categoria_producto`);

--
-- Indexes for table `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id_receta`),
  ADD KEY `fk_categoria_receta` (`id_categoria_receta`),
  ADD KEY `fk_usuario_receta` (`id_usuario`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indexes for table `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id_unidad`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_rol_usuario` (`id_rol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit`
--
ALTER TABLE `audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `categorias_producto`
--
ALTER TABLE `categorias_producto`
  MODIFY `id_categoria_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categorias_receta`
--
ALTER TABLE `categorias_receta`
  MODIFY `id_categoria_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `materiales_receta`
--
ALTER TABLE `materiales_receta`
  MODIFY `id_materiales_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pasos_receta`
--
ALTER TABLE `pasos_receta`
  MODIFY `id_paso_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_producto_inventario` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Constraints for table `materiales_receta`
--
ALTER TABLE `materiales_receta`
  ADD CONSTRAINT `fg_producto_materiales` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `fg_receta_materiales` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id_receta`);

--
-- Constraints for table `pasos_receta`
--
ALTER TABLE `pasos_receta`
  ADD CONSTRAINT `fg_receta_paso` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id_receta`);

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`id_categoria_producto`) REFERENCES `categorias_producto` (`id_categoria_producto`),
  ADD CONSTRAINT `fk_unidad_producto` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id_unidad`);

--
-- Constraints for table `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `fk_categoria_receta` FOREIGN KEY (`id_categoria_receta`) REFERENCES `categorias_receta` (`id_categoria_receta`),
  ADD CONSTRAINT `fk_usuario_receta` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_rol_usuario` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;