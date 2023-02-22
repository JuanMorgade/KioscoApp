/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icono` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `orden` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double NOT NULL,
  `pedido` json NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoriaId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Producto_categoriaId_fkey` (`categoriaId`),
  CONSTRAINT `Producto_categoriaId_fkey` FOREIGN KEY (`categoriaId`) REFERENCES `categoria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('2a780465-b549-483c-9eef-9a8484b57573', 'ec9a5b675dd855d209c09fffe4ea363d6d442a47f419628c91285db5c3265aae', '2023-02-22 18:12:29.262', '20230222181229_agregar_estado', NULL, NULL, '2023-02-22 18:12:29.239', 1);
INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('6f5c066c-0625-405c-b65b-1a9ab5450091', 'a95dec0fde2a69dae5501ef366105fe918bac2bba73a79a3418d17b6f891c38a', '2023-02-14 18:52:58.770', '20230214185258_ordenes', NULL, NULL, '2023-02-14 18:52:58.740', 1);
INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('d3d63bcc-d170-4f98-a21b-003907c7006a', '4341a488b28d0fa2fbddee0a25204e68af11b8097898855835284285b6d3ed73', '2023-02-14 18:45:38.807', '20230214184538_quioscoapp', NULL, NULL, '2023-02-14 18:45:38.699', 1);

INSERT INTO `categoria` (`id`, `nombre`, `icono`) VALUES
(1, 'Café', 'cafe');
INSERT INTO `categoria` (`id`, `nombre`, `icono`) VALUES
(2, 'Hamburguesas', 'hamburguesa');
INSERT INTO `categoria` (`id`, `nombre`, `icono`) VALUES
(3, 'Pizzas', 'pizza');
INSERT INTO `categoria` (`id`, `nombre`, `icono`) VALUES
(4, 'Donas', 'dona'),
(5, 'Totas', 'pastel'),
(6, 'Galletas', 'galletas');

INSERT INTO `orden` (`id`, `nombre`, `fecha`, `total`, `pedido`, `estado`) VALUES
(1, 'Pexx', '1676578371057', 4182.8, '[{\"id\": 60, \"imagen\": \"cafe_01\", \"nombre\": \"Café Caramel con Chocolate\", \"precio\": 590.5, \"cantidad\": 2}, {\"id\": 95, \"imagen\": \"hamburguesas_010\", \"nombre\": \"Hamburguesa Triple Nashe con Queso\", \"precio\": 1500.9, \"cantidad\": 2}]', 0);
INSERT INTO `orden` (`id`, `nombre`, `fecha`, `total`, `pedido`, `estado`) VALUES
(2, 'Pexx', '1676578668563', 4182.8, '[{\"id\": 60, \"imagen\": \"cafe_01\", \"nombre\": \"Café Caramel con Chocolate\", \"precio\": 590.5, \"cantidad\": 2}, {\"id\": 95, \"imagen\": \"hamburguesas_010\", \"nombre\": \"Hamburguesa Triple Nashe con Queso\", \"precio\": 1500.9, \"cantidad\": 2}]', 0);
INSERT INTO `orden` (`id`, `nombre`, `fecha`, `total`, `pedido`, `estado`) VALUES
(3, 'Prueba', '1676578712369', 1181, '[{\"id\": 60, \"imagen\": \"cafe_01\", \"nombre\": \"Café Caramel con Chocolate\", \"precio\": 590.5, \"cantidad\": 2}]', 0);
INSERT INTO `orden` (`id`, `nombre`, `fecha`, `total`, `pedido`, `estado`) VALUES
(4, 'Pexx', '1677089608323', 3501.7, '[{\"id\": 95, \"imagen\": \"hamburguesas_010\", \"nombre\": \"Hamburguesa Triple Nashe con Queso\", \"precio\": 1500.9, \"cantidad\": 2}, {\"id\": 101, \"imagen\": \"hamburguesas_07\", \"nombre\": \"Super Panchos\", \"precio\": 499.9, \"cantidad\": 1}]', 0),
(5, 'entimepo real', '1677094942561', 999.8, '[{\"id\": 61, \"imagen\": \"cafe_02\", \"nombre\": \"Café Frio con Chocolate Grande\", \"precio\": 499.9, \"cantidad\": 2}]', 0);

INSERT INTO `producto` (`id`, `nombre`, `precio`, `imagen`, `categoriaId`) VALUES
(60, 'Café Caramel con Chocolate', 590.5, 'cafe_01', 1);
INSERT INTO `producto` (`id`, `nombre`, `precio`, `imagen`, `categoriaId`) VALUES
(61, 'Café Frio con Chocolate Grande', 499.9, 'cafe_02', 1);
INSERT INTO `producto` (`id`, `nombre`, `precio`, `imagen`, `categoriaId`) VALUES
(62, 'Latte Frio con Chocolate Grande', 549.9, 'cafe_03', 1);
INSERT INTO `producto` (`id`, `nombre`, `precio`, `imagen`, `categoriaId`) VALUES
(63, 'Latte Frio con Chocolate Grande', 549.9, 'cafe_04', 1),
(64, 'Malteada Fria con Chocolate Grande', 549.9, 'cafe_05', 1),
(65, 'Café Mocha Caliente Chico', 399.9, 'cafe_06', 1),
(66, 'Café Mocha Caliente Grande con Chocolate', 599.9, 'cafe_07', 1),
(67, 'Café Caliente Capuchino Grande', 599.9, 'cafe_08', 1),
(68, 'Café Mocha Caliente Mediano', 499.9, 'cafe_09', 1),
(69, 'Café Mocha Frio con Caramelo Mediano', 499.9, 'cafe_10', 1),
(70, 'Café Mocha Frio con Chocolate Mediano', 499.9, 'cafe_11', 1),
(71, 'Café Espresso', 299.9, 'cafe_12', 1),
(72, 'Café Capuchino Grande con Caramelo', 599.9, 'cafe_13', 1),
(73, 'Café Caramelo Grande', 599.9, 'cafe_14', 1),
(74, 'Paquete de 3 donas de Chocolate', 399.9, 'donas_01', 4),
(75, 'Paquete de 3 donas Glaseadas', 399.9, 'donas_02', 4),
(76, 'Dona de Frutilla ', 199.9, 'donas_03', 4),
(77, 'Dona con Galleta de Chocolate ', 199.9, 'donas_04', 4),
(78, 'Dona glass con Chispas Sabor Frutilla ', 199.9, 'donas_05', 4),
(79, 'Dona glass con Chocolate ', 199.9, 'donas_06', 4),
(80, 'Dona de Chocolate con MÁS Chocolate ', 199.9, 'donas_07', 4),
(81, 'Paquete de 3 donas de Chocolate ', 399.9, 'donas_08', 4),
(82, 'Paquete de 3 donas con Vainilla y Chocolate ', 399.9, 'donas_09', 4),
(83, 'Paquete de 6 Donas', 699.9, 'donas_10', 4),
(84, 'Paquete de 3 Variadas', 399.9, 'donas_11', 4),
(85, 'Dona Natural con Chocolate', 199.9, 'donas_12', 4),
(86, 'Paquete de 3 Donas de Chocolate con Chispas', 399.9, 'donas_13', 4),
(87, 'Dona Chocolate y Coco', 199.9, 'donas_14', 4),
(88, 'Paquete Galletas de Chocolate', 299.9, 'galletas_01', 6),
(89, 'Paquete Galletas de Chocolate y Avena', 399.9, 'galletas_02', 6),
(90, 'Paquete de Muffins de Vainilla', 399.9, 'galletas_03', 6),
(91, 'Paquete de 4 Galletas de Avena', 249.9, 'galletas_04', 6),
(92, 'Galletas de Mantequilla Variadas', 399.9, 'galletas_05', 6),
(93, 'Galletas de sabores frutales', 399.9, 'galletas_06', 6),
(94, 'Hamburguesa Sencilla', 1199.9, 'hamburguesas_01', 2),
(95, 'Hamburguesa Triple Nashe con Queso', 1500.9, 'hamburguesas_010', 2),
(96, 'Hamburguesa de Pollo', 1299.9, 'hamburguesas_02', 2),
(97, 'Hamburguesa de Pollo y Chili', 1399.9, 'hamburguesas_03', 2),
(98, 'Hamburguesa Queso y  Pepinos', 1299.9, 'hamburguesas_04', 2),
(99, 'Hamburguesa Cuarto de Libra', 1299.9, 'hamburguesas_05', 2),
(100, 'Hamburguesa Doble Queso', 1350.5, 'hamburguesas_06', 2),
(101, 'Super Panchos', 499.9, 'hamburguesas_07', 2),
(102, 'Paquete 2 Panchos', 699.9, 'hamburguesas_08', 2),
(103, '4 Rebanadas de Pay de Queso', 699.9, 'pastel_01', 5),
(104, 'Waffle Especial', 499.9, 'pastel_02', 5),
(105, 'Croissants De la casa', 399.9, 'pastel_03', 5),
(106, 'Pay de Queso', 199.9, 'pastel_04', 5),
(107, 'Torta de Chocolate', 299.9, 'pastel_05', 5),
(108, 'Rebanada Torta de Chocolate', 299.9, 'pastel_06', 5),
(109, 'Pizza Spicy con Doble Queso', 699.9, 'pizzas_01', 3),
(110, 'Pizza Jamón y Queso', 699.9, 'pizzas_02', 3),
(111, 'Pizza Doble Queso', 699.9, 'pizzas_03', 3),
(112, 'Pizza Especial de la Casa', 699.9, 'pizzas_04', 3),
(113, 'Pizza Chorizo', 699.9, 'pizzas_05', 3),
(114, 'Pizza Hawaiana', 699.9, 'pizzas_06', 3),
(115, 'Pizza Tocino', 699.9, 'pizzas_07', 3),
(116, 'Pizza Vegetales y Queso', 699.9, 'pizzas_08', 3),
(117, 'Pizza Pepperoni y Queso', 699.9, 'pizzas_09', 3),
(118, 'Pizza Aceitunas y Queso', 699.9, 'pizzas_10', 3),
(119, 'Pizza Queso, Jamón y Champiñones', 699.9, 'pizzas_11', 3);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;