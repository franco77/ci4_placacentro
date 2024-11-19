-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-10-2023 a las 01:24:51
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ion_auth_ci4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assortments`
--

CREATE TABLE `assortments` (
  `id` int(11) NOT NULL,
  `id_cut` int(11) NOT NULL,
  `status_assortment` enum('sin_surtir','surtido') COLLATE utf8_bin DEFAULT 'sin_surtir',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `assortments`
--

INSERT INTO `assortments` (`id`, `id_cut`, `status_assortment`, `created_at`, `updated_at`) VALUES
(32, 41, 'sin_surtir', '2023-08-11 13:30:16', '2023-08-11 13:30:16'),
(33, 42, 'sin_surtir', '2023-08-11 13:35:37', '2023-08-11 13:35:37'),
(34, 43, 'sin_surtir', '2023-08-11 13:39:35', '2023-08-11 13:39:35'),
(35, 44, 'sin_surtir', '2023-08-11 16:30:07', '2023-08-11 16:30:07'),
(36, 45, 'sin_surtir', '2023-08-11 17:03:33', '2023-08-11 17:03:33'),
(37, 46, 'sin_surtir', '2023-08-11 17:03:58', '2023-08-11 17:03:58'),
(38, 47, 'sin_surtir', '2023-08-21 21:49:47', '2023-08-21 21:49:47'),
(39, 48, 'sin_surtir', '2023-08-21 21:52:33', '2023-08-21 21:52:33'),
(40, 49, 'sin_surtir', '2023-08-22 13:33:27', '2023-08-22 13:33:27'),
(41, 50, 'sin_surtir', '2023-08-22 20:34:22', '2023-08-22 20:34:22'),
(42, 51, 'sin_surtir', '2023-08-22 20:38:19', '2023-08-22 20:38:19'),
(43, 52, 'sin_surtir', '2023-08-22 21:06:51', '2023-08-22 21:06:51'),
(44, 53, 'sin_surtir', '2023-08-22 21:09:58', '2023-08-22 21:09:58'),
(45, 54, 'sin_surtir', '2023-08-22 21:10:45', '2023-08-22 21:10:45'),
(46, 55, 'sin_surtir', '2023-08-22 21:21:25', '2023-08-22 21:21:25'),
(47, 56, 'sin_surtir', '2023-08-22 21:24:37', '2023-08-22 21:24:37'),
(48, 57, 'sin_surtir', '2023-08-22 21:28:12', '2023-08-22 21:28:12'),
(49, 58, 'sin_surtir', '2023-08-22 21:30:01', '2023-08-22 21:30:01'),
(50, 59, 'sin_surtir', '2023-08-22 21:52:26', '2023-08-22 21:52:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `brand` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `brand`, `description`, `created_at`, `updated_at`) VALUES
(5, 'MASISA', 'Productos Masisa ', '2023-08-06 09:38:59', '2023-08-06 09:38:59'),
(6, 'ARAUCO', 'Productos Arauco', '2023-08-06 09:57:16', '2023-08-06 17:02:10'),
(7, 'PELIKANO', 'Pelikano', '2023-08-09 17:15:23', '2023-08-09 17:15:23'),
(8, 'BONUIT', 'Productos bonuit herrajes y otra cosas', '2023-08-09 17:18:48', '2023-08-09 17:18:48'),
(15, '3M', '3M', '2023-08-09 17:48:36', '2023-08-09 17:48:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `title`, `description`) VALUES
(5, 'Cocacola', 'Dainter'),
(6, 'Kandace', 'MacConneely'),
(7, 'Bevan', 'Barbery'),
(8, 'Blanca', 'Czajkowski'),
(9, 'Hercules', 'Knill'),
(10, 'Maure', 'Goodlet'),
(12, 'Cortes', 'Melamina RH Sahara');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_ex_in`
--

CREATE TABLE `cat_ex_in` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `cat_ex_in`
--

INSERT INTO `cat_ex_in` (`id`, `title`, `description`, `type`, `created_at`) VALUES
(1, 'Anatomy', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'Gastos', '2023-01-11'),
(2, 'Hider in the House', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'Gastos', '2023-01-07'),
(3, 'Barbarian Queen', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'Ingresos', '2022-10-22'),
(4, 'White Nights', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'Gastos', '2023-04-03'),
(5, 'Cooler, The', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Gastos', '2022-10-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `country` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `currency` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `symbol` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `currency`
--

INSERT INTO `currency` (`id`, `country`, `currency`, `code`, `symbol`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek'),
(2, 'America', 'Dollars', 'USD', '$'),
(3, 'Afghanistan', 'Afghanis', 'AFN', '؋'),
(4, 'Argentina', 'Pesos', 'ARS', '$'),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ'),
(6, 'Australia', 'Dollars', 'AUD', '$'),
(7, 'Azerbaijan', 'New Manats', 'AZN', 'ман'),
(8, 'Bahamas', 'Dollars', 'BSD', '$'),
(9, 'Barbados', 'Dollars', 'BBD', '$'),
(10, 'Belarus', 'Rubles', 'BYR', 'p.'),
(11, 'Belgium', 'Euro', 'EUR', '€'),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$'),
(13, 'Bermuda', 'Dollars', 'BMD', '$'),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b'),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM'),
(16, 'Botswana', 'Pula', 'BWP', 'P'),
(17, 'Bulgaria', 'Leva', 'BGN', 'лв'),
(18, 'Brazil', 'Reais', 'BRL', 'R$'),
(19, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£'),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$'),
(21, 'Cambodia', 'Riels', 'KHR', '៛'),
(22, 'Canada', 'Dollars', 'CAD', '$'),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$'),
(24, 'Chile', 'Pesos', 'CLP', '$'),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥'),
(26, 'Colombia', 'Pesos', 'COP', '$'),
(27, 'Costa Rica', 'Colón', 'CRC', '₡'),
(28, 'Croatia', 'Kuna', 'HRK', 'kn'),
(29, 'Cuba', 'Pesos', 'CUP', '₱'),
(30, 'Cyprus', 'Euro', 'EUR', '€'),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč'),
(32, 'Denmark', 'Kroner', 'DKK', 'kr'),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$'),
(34, 'East Caribbean', 'Dollars', 'XCD', '$'),
(35, 'Egypt', 'Pounds', 'EGP', '£'),
(36, 'El Salvador', 'Colones', 'SVC', '$'),
(37, 'England (United Kingdom)', 'Pounds', 'GBP', '£'),
(38, 'Euro', 'Euro', 'EUR', '€'),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£'),
(40, 'Fiji', 'Dollars', 'FJD', '$'),
(41, 'France', 'Euro', 'EUR', '€'),
(42, 'Ghana', 'Cedis', 'GHC', '¢'),
(43, 'Gibraltar', 'Pounds', 'GIP', '£'),
(44, 'Greece', 'Euro', 'EUR', '€'),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q'),
(46, 'Guernsey', 'Pounds', 'GGP', '£'),
(47, 'Guyana', 'Dollars', 'GYD', '$'),
(48, 'Holland (Netherlands)', 'Euro', 'EUR', '€'),
(49, 'Honduras', 'Lempiras', 'HNL', 'L'),
(50, 'Hong Kong', 'Dollars', 'HKD', '$'),
(51, 'Hungary', 'Forint', 'HUF', 'Ft'),
(52, 'Iceland', 'Kronur', 'ISK', 'kr'),
(53, 'India', 'Rupees', 'INR', 'Rp'),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp'),
(55, 'Iran', 'Rials', 'IRR', '﷼'),
(56, 'Ireland', 'Euro', 'EUR', '€'),
(57, 'Isle of Man', 'Pounds', 'IMP', '£'),
(58, 'Israel', 'New Shekels', 'ILS', '₪'),
(59, 'Italy', 'Euro', 'EUR', '€'),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$'),
(61, 'Japan', 'Yen', 'JPY', '¥'),
(62, 'Jersey', 'Pounds', 'JEP', '£'),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв'),
(64, 'Korea (North)', 'Won', 'KPW', '₩'),
(65, 'Korea (South)', 'Won', 'KRW', '₩'),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв'),
(67, 'Laos', 'Kips', 'LAK', '₭'),
(68, 'Latvia', 'Lati', 'LVL', 'Ls'),
(69, 'Lebanon', 'Pounds', 'LBP', '£'),
(70, 'Liberia', 'Dollars', 'LRD', '$'),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF'),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt'),
(73, 'Luxembourg', 'Euro', 'EUR', '€'),
(74, 'Macedonia', 'Denars', 'MKD', 'ден'),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM'),
(76, 'Malta', 'Euro', 'EUR', '€'),
(77, 'Mauritius', 'Rupees', 'MUR', '₨'),
(78, 'Mexico', 'Pesos', 'MXN', '$'),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮'),
(80, 'Mozambique', 'Meticais', 'MZN', 'MT'),
(81, 'Namibia', 'Dollars', 'NAD', '$'),
(82, 'Nepal', 'Rupees', 'NPR', '₨'),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ'),
(84, 'Netherlands', 'Euro', 'EUR', '€'),
(85, 'New Zealand', 'Dollars', 'NZD', '$'),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$'),
(87, 'Nigeria', 'Nairas', 'NGN', '₦'),
(88, 'North Korea', 'Won', 'KPW', '₩'),
(89, 'Norway', 'Krone', 'NOK', 'kr'),
(90, 'Oman', 'Rials', 'OMR', '﷼'),
(91, 'Pakistan', 'Rupees', 'PKR', '₨'),
(92, 'Panama', 'Balboa', 'PAB', 'B/.'),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs'),
(94, 'Peru', 'Nuevos Soles', 'PEN', 'S/.'),
(95, 'Philippines', 'Pesos', 'PHP', 'Php'),
(96, 'Poland', 'Zlotych', 'PLN', 'zł'),
(97, 'Qatar', 'Rials', 'QAR', '﷼'),
(98, 'Romania', 'New Lei', 'RON', 'lei'),
(99, 'Russia', 'Rubles', 'RUB', 'руб'),
(100, 'Saint Helena', 'Pounds', 'SHP', '£'),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼'),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.'),
(103, 'Seychelles', 'Rupees', 'SCR', '₨'),
(104, 'Singapore', 'Dollars', 'SGD', '$'),
(105, 'Slovenia', 'Euro', 'EUR', '€'),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$'),
(107, 'Somalia', 'Shillings', 'SOS', 'S'),
(108, 'South Africa', 'Rand', 'ZAR', 'R'),
(109, 'South Korea', 'Won', 'KRW', '₩'),
(110, 'Spain', 'Euro', 'EUR', '€'),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨'),
(112, 'Sweden', 'Kronor', 'SEK', 'kr'),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF'),
(114, 'Suriname', 'Dollars', 'SRD', '$'),
(115, 'Syria', 'Pounds', 'SYP', '£'),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$'),
(117, 'Thailand', 'Baht', 'THB', '฿'),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$'),
(119, 'Turkey', 'Lira', 'TRY', 'TL'),
(120, 'Turkey', 'Liras', 'TRL', '£'),
(121, 'Tuvalu', 'Dollars', 'TVD', '$'),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴'),
(123, 'United Kingdom', 'Pounds', 'GBP', '£'),
(124, 'United States of America', 'Dollars', 'USD', '$'),
(125, 'Uruguay', 'Pesos', 'UYU', '$U'),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв'),
(127, 'Vatican City', 'Euro', 'EUR', '€'),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs'),
(129, 'Vietnam', 'Dong', 'VND', '₫'),
(130, 'Yemen', 'Rials', 'YER', '﷼'),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$'),
(132, 'India', 'Rupees', 'INR', '₹');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `ic` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('Masculino','Femenino') COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `department` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `notes` text COLLATE utf8_bin,
  `registered_by` int(11) DEFAULT NULL,
  `registered_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `ic`, `first_name`, `last_name`, `email`, `birthdate`, `gender`, `address`, `department`, `city`, `phone`, `notes`, `registered_by`, `registered_on`, `updated_on`) VALUES
(1, '94392468', 'HUMBERTO ', 'VILLEGAS DUARTE ', 'VILKOM.COM@GIMAIL.COM', '2021-02-09', 'Masculino', 'CALLE 39 # 33A 12', '70', 'Los Palmitos', '3175127557', '<p>Ninguna</p>', 1, NULL, NULL),
(2, '94392468', 'FARID ', 'ESMATJOO ', 'SILVERINE.IR@GMAIL.COM', NULL, 'Masculino', 'CARRE 36 #31-07', '76', 'Tulua', '3152270722', '<p><br></p>', 1, NULL, NULL),
(3, '75038852', 'CARLOS ALBERTO', 'MEDINA RAMIREZ', 'INTEGRALESC&A@GMAIL.COM', NULL, NULL, 'CALLEJON SIETE VUELTAS CASA 38', '76', 'Tulua', '3162458819', '', 1, '2023-01-30', NULL),
(4, '6500029', 'GEOVANNY ', 'PUERTA MONTOYA', 'GIOVANNYPUERTA1@GMAIL.COM', NULL, NULL, 'CARRERA 26A 41a 79', '76', 'Tulua', '3233256170', '', 1, '2023-01-30', NULL),
(5, '14796074', 'LUIS GUILLERMO', 'GARCIA NUÑEZ', 'MA82LOTE@HOTMAIL,COM', NULL, NULL, 'CARRERA 28 A 19-99', '76', 'Tulua', '3162880781', '', 1, '2023-01-30', NULL),
(6, '1130655920', 'CESAR ALBEIRO', 'MARIN TORRES', 'DYLAN.ALBEIRO.CM@GMAIL.COM', NULL, NULL, 'DIAGONAL 23A #8-02', '76', 'Tulua', '3154477002', '', 1, '2023-01-30', NULL),
(7, '94230615', 'CARLOS ANDRES', 'OVIEDO ', '', NULL, NULL, 'CARRERA 6ta 15-38', '76', 'Zarzal', '3157044289', '', 1, '2023-01-30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuts`
--

CREATE TABLE `cuts` (
  `id` int(11) NOT NULL,
  `machine_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `notes` text COLLATE utf8_bin,
  `productcode` varchar(250) COLLATE utf8_bin NOT NULL,
  `items` text COLLATE utf8_bin NOT NULL,
  `price` text COLLATE utf8_bin NOT NULL,
  `qty` text COLLATE utf8_bin NOT NULL,
  `total` text COLLATE utf8_bin NOT NULL,
  `category` text COLLATE utf8_bin NOT NULL,
  `express` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `status` enum('activo','pausado','terminado','entregado','eliminado','enchapado','cortado','inactivo') COLLATE utf8_bin NOT NULL DEFAULT 'inactivo',
  `total_days` int(11) NOT NULL,
  `date_generated_delivery` date DEFAULT NULL,
  `date_delivered` date DEFAULT NULL,
  `qty_boards` decimal(7,1) NOT NULL,
  `qty_perforations` int(11) DEFAULT NULL,
  `quantity_cuts` int(11) DEFAULT '0',
  `total_meters_edge` int(11) DEFAULT NULL,
  `stiff_edge` enum('no','si') COLLATE utf8_bin DEFAULT 'no',
  `name_edge_bander` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `registered_on` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `cuts`
--

INSERT INTO `cuts` (`id`, `machine_id`, `customer_id`, `notes`, `productcode`, `items`, `price`, `qty`, `total`, `category`, `express`, `status`, `total_days`, `date_generated_delivery`, `date_delivered`, `qty_boards`, `qty_perforations`, `quantity_cuts`, `total_meters_edge`, `stiff_edge`, `name_edge_bander`, `created_by`, `registered_on`, `updated_on`) VALUES
(1, 1, 3, '', '[\"RH-M001\",\"RH-M002\",\"RH-M003\"]', '[\"RH Melamina Sahara\",\"RH Melamina Cava\",\"RH Melamina Bosco\"]', '[\"2000\",\"1000\",\"2000\"]', '[\"2\",\"1\",\"2.5\"]', '[\"2000\",\"1000\",\"2000\"]', '[\"TABLEROS\",\"TABLEROS\",\"TABLEROS\"]', 'no', 'entregado', 8, '2023-04-13', NULL, 5.5, 120, 452, 321, 'si', NULL, 1, '2023-08-11 12:44:00', '2023-08-11 12:44:00'),
(2, 3, 4, '', '[\"RH-M001\",\"RH-M002\",\"RH-M003\",\"RH-M004\"]', '[\"RH Melamina Sahara\",\"RH Melamina Cava\",\"RH Melamina Bosco\",\"RH Melamina Nogal Amazonico\"]', '[\"2000\",\"1000\",\"2000\",\"1000\"]', '[\"2\",\"1\",\"1\",\"2\"]', '[\"2000\",\"1000\",\"2000\",\"2000\"]', '[\"TABLEROS\",\"TABLEROS\",\"TABLEROS\",\"TABLEROS\"]', 'si', 'activo', 8, '2023-06-07', NULL, 6.0, 25, 114, 87, 'si', NULL, 1, '2023-08-11 12:44:26', '2023-08-11 12:44:26'),
(4, 1, 5, 'sdfsd', '[\"00006\"]', '[\"CASTA\\u00d1O BLANCO RH 15\"]', '[\"1000.00\"]', '[\"1\"]', '[\"1000\"]', '[\"TABLEROS\"]', 'si', 'inactivo', 8, '2023-08-23', NULL, 1.0, 32, 78, 125, 'no', NULL, 1, '2023-08-15 12:56:23', '2023-08-15 12:56:23'),
(33, 1, 4, NULL, '[\"00002\",\"00003\"]', '[\"BLANCO MASISA RH 15\",\"CEDRO PORON RH 15\"]', '[\"1000\",\"1000\"]', '[\"2\",\"1\"]', '[\"2000\",\"1000\"]', '[\"TABLEROS\",\"TABLEROS\"]', 'si', 'inactivo', 8, '2023-08-21', NULL, 3.0, 32, 78, 125, 'no', NULL, 1, '2023-08-15 12:56:19', '2023-08-15 12:56:19'),
(44, 1, 1, 'dfsdfsdf', '[\"00041\",\"00547\"]', '[\"ALUMINIO RH 15\",\"CANTERA RH 15\"]', '[\"1000.00\",\"1000.00\"]', '[\"1\",\"1\"]', '[\"1000\",\"1000\"]', '[\"TABLEROS \",\"TABLEROS \"]', 'si', 'inactivo', 8, '2023-08-23', NULL, 2.0, 52, 34, 25, 'no', NULL, 1, '2023-08-11 04:30:07', '2023-08-11 16:30:07'),
(45, 1, 1, 'Nada', '[\"00002\",\"00547\",\"00003\"]', '[\"BLANCO MASISA RH 15\",\"CANTERA RH 15\",\"CEDRO PORON RH 15\"]', '[\"1000.00\",\"1000.00\",\"1000.00\"]', '[\"2\",\"2\",\"1\"]', '[\"2000.00\",\"2000.00\",\"1000.00\"]', '[\"TABLEROS \",\"TABLEROS \",\"TABLEROS \"]', 'no', 'inactivo', 8, '2023-08-23', NULL, 5.0, 52, 34, 25, 'no', NULL, 1, '2023-08-11 05:03:33', '2023-08-11 17:03:33'),
(46, 1, 1, 'Nada', '[\"00002\",\"00547\",\"00003\"]', '[\"BLANCO MASISA RH 15\",\"CANTERA RH 15\",\"CEDRO PORON RH 15\"]', '[\"1000.00\",\"1000.00\",\"1000.00\"]', '[\"2\",\"2\",\"1\"]', '[\"2000.00\",\"2000.00\",\"1000.00\"]', 'null', 'no', 'inactivo', 8, '2023-08-23', NULL, 5.0, 52, 34, 25, 'no', NULL, 1, '2023-08-11 21:12:59', '2023-08-11 09:12:59'),
(47, 3, 7, 'fgdgdf', '[\"00547\"]', '[\"CANTERA RH 15\"]', '[\"1000.00\"]', '[\"1\"]', '[\"1000\"]', '[\"TABLEROS \"]', 'si', 'inactivo', 9, '2023-09-04', NULL, 1.0, 12, 12, 0, 'no', NULL, 1, '2023-08-21 09:49:47', '2023-08-21 21:49:47'),
(48, 3, 2, 'No', '[\"00003\"]', '[\"CEDRO PORON RH 15\"]', '[\"1000.00\"]', '[\"1\"]', '[\"1000\"]', '[\"TABLEROS \"]', 'no', 'inactivo', 10, '2023-09-05', NULL, 1.0, 52, 34, 25, 'no', NULL, 1, '2023-08-21 09:52:33', '2023-08-21 21:52:33'),
(49, 3, 5, 'Nada', '[\"00006\"]', '[\"CASTA\\u00d1O BLANCO RH 15\"]', '[\"1000.00\"]', '[\"1\"]', '[\"1000\"]', '[\"TABLEROS \"]', 'si', 'inactivo', 8, '2023-09-01', NULL, 1.0, 32, 78, 125, 'no', NULL, 1, '2023-08-22 01:33:27', '2023-08-22 13:33:27'),
(50, 3, 3, 'Nada', '[\"00003\"]', '[\"CEDRO PORON RH 15\"]', '[\"1000.00\"]', '[\"1\"]', '[\"1000\"]', '[\"TABLEROS \"]', 'si', 'inactivo', 8, '2023-09-04', NULL, 1.0, 32, 78, 125, 'no', NULL, 1, '2023-08-22 08:34:22', '2023-08-22 20:34:22'),
(51, 1, 4, 'Nada', '[\"00007\",\"00514\"]', '[\"CAVA RH 15\",\"COLINA RH 15\"]', '[\"1000.00\",\"1000.00\"]', '[\"2\",\"1\"]', '[\"2000.00\",\"1000\"]', '[\"TABLEROS \",\"TABLEROS \"]', 'si', 'inactivo', 8, '2023-09-04', NULL, 3.0, 32, 78, 125, 'no', NULL, 1, '2023-08-22 08:38:19', '2023-08-22 20:38:19'),
(52, 1, 4, 'Nada', '[\"00005\"]', '[\"CARVALO RH 15\"]', '[\"1000.00\"]', '[\"1\"]', '[\"1000\"]', '[\"TABLEROS \"]', 'si', 'inactivo', 8, '2023-09-05', NULL, 1.0, 32, 78, 125, 'no', NULL, 1, '2023-08-22 09:06:51', '2023-08-22 21:06:51'),
(53, 3, 3, 'Nada', '[\"00515\",\"00020\"]', '[\"PACIFICO RH 15\",\"CONCRETO RH 15\"]', '[\"1000.00\",\"1000.00\"]', '[\"1\",\"1\"]', '[\"1000\",\"1000\"]', '[\"TABLEROS \",\"TABLEROS \"]', 'si', 'inactivo', 8, '2023-09-05', NULL, 2.0, 45, 78, 200, 'si', NULL, 1, '2023-08-22 09:09:58', '2023-08-22 21:09:58'),
(54, 1, 1, 'No', '[\"00041\"]', '[\"ALUMINIO RH 15\"]', '[\"1000.00\"]', '[\"1\"]', '[\"1000\"]', '[\"TABLEROS \"]', 'si', 'inactivo', 8, '2023-09-05', NULL, 1.0, 32, 78, 125, 'no', NULL, 1, '2023-08-22 09:10:45', '2023-08-22 21:10:45'),
(55, 1, 1, 'Nada', '[\"00006\"]', '[\"CASTA\\u00d1O BLANCO RH 15\"]', '[\"1000.00\"]', '[\"1\"]', '[\"1000\"]', '[\"TABLEROS \"]', 'si', 'inactivo', 8, '2023-09-05', NULL, 1.0, 45, 78, 125, 'no', NULL, 1, '2023-08-22 09:21:25', '2023-08-22 21:21:25'),
(56, 3, 1, 'No', '[\"00515\"]', '[\"PACIFICO RH 15\"]', '[\"1000.00\"]', '[\"1\"]', '[\"1000\"]', '[\"TABLEROS \"]', 'si', 'inactivo', 8, '2023-09-05', NULL, 1.0, 32, 78, 125, 'si', NULL, 1, '2023-08-22 09:24:37', '2023-08-22 21:24:37'),
(57, 3, 4, 'No', '[\"00023\"]', '[\"LINO RH 15\"]', '[\"1000.00\"]', '[\"1\"]', '[\"1000\"]', '[\"TABLEROS \"]', 'no', 'inactivo', 8, '2023-09-06', NULL, 1.0, 32, 78, 125, 'no', NULL, 1, '2023-08-22 09:28:12', '2023-08-22 21:28:12'),
(58, 3, 4, 'No', '[\"00547\",\"00143\"]', '[\"CANTERA RH 15\",\"BOSCO RH 15\"]', '[\"1000.00\",\"1000.00\"]', '[\"1\",\"1\"]', '[\"1000\",\"1000\"]', '[\"TABLEROS \",\"TABLEROS \"]', 'no', 'inactivo', 8, '2023-09-07', NULL, 2.0, 54, 98, 78, 'no', NULL, 1, '2023-08-22 09:30:01', '2023-08-22 21:30:01'),
(59, 1, 1, 'No', '[\"00002\"]', '[\"BLANCO MASISA RH 15\"]', '[\"1000.00\"]', '[\"1\"]', '[\"1000\"]', '[\"TABLEROS \"]', 'no', 'inactivo', 8, '2023-09-08', NULL, 1.0, 32, 98, 78, 'no', NULL, 1, '2023-08-22 09:52:26', '2023-08-22 21:52:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(2) UNSIGNED NOT NULL,
  `depart_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `depart_name`) VALUES
(5, 'Antioquia'),
(8, 'Atlantico'),
(11, 'Bogota'),
(13, 'Bolivar'),
(15, 'Boyaca'),
(17, 'Caldas'),
(18, 'Caqueta'),
(19, 'Cauca'),
(20, 'Cesar'),
(23, 'Cordoba'),
(25, 'Cundinamarca'),
(27, 'Choco'),
(41, 'Huila'),
(44, 'La Guajira'),
(47, 'Magdalena'),
(50, 'Meta'),
(52, 'Nariño'),
(54, 'N. De Santander'),
(63, 'Quindio'),
(66, 'Risaralda'),
(68, 'Santander'),
(70, 'Sucre'),
(73, 'Tolima'),
(76, 'Valle Del Cauca'),
(81, 'Arauca'),
(85, 'Casanare'),
(86, 'Putumayo'),
(88, 'San Andres'),
(91, 'Amazonas'),
(94, 'Guainia'),
(95, 'Guaviare'),
(97, 'Vaupes'),
(99, 'Vichada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estimates`
--

CREATE TABLE `estimates` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `notes` text COLLATE utf8_bin,
  `productcode` varchar(250) COLLATE utf8_bin NOT NULL,
  `items` text COLLATE utf8_bin NOT NULL,
  `price` text COLLATE utf8_bin NOT NULL,
  `qty` text COLLATE utf8_bin NOT NULL,
  `total` text COLLATE utf8_bin NOT NULL,
  `category` text COLLATE utf8_bin NOT NULL,
  `status` enum('activo','inactivo','eliminado') COLLATE utf8_bin NOT NULL DEFAULT 'activo',
  `created_by` int(11) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `registered_on` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `estimates`
--

INSERT INTO `estimates` (`id`, `customer_id`, `notes`, `productcode`, `items`, `price`, `qty`, `total`, `category`, `status`, `created_by`, `expiry_date`, `registered_on`, `updated_on`) VALUES
(1, 3, 'Modificado', '[\"00002\",\"00547\",\"000457\"]', '[\"BLANCO MASISA RH 15\",\"CANTERA RH 15\",\"CANTO ALUMINIO RIGIDO 33MM SUELTO\"]', '[\"1000.00\",\"1000.00\",\"1000.00\"]', '[\"1\",\"1\",\"1\"]', '[\"1000\",\"1000\",\"1000\"]', '[\"TABLEROS \",\"TABLEROS \",\"CANTO SUELTO\"]', 'inactivo', 1, '2023-08-30', '2023-08-13 13:32:27', '2023-08-13 06:32:27'),
(2, 6, 'Laminas enteras ', '[\"00006\",\"00005\",\"00514\"]', '[\"CASTA\\u00d1O BLANCO RH 15\",\"CARVALO RH 15\",\"COLINA RH 15\"]', '[\"1000.00\",\"1000.00\",\"1000.00\"]', '[\"1\",\"2\",\"1\"]', '[\"1000.00\",\"2000.00\",\"1000.00\"]', '[\"TABLEROS \",\"TABLEROS \",\"TABLEROS \"]', 'activo', 1, '2023-08-31', '2023-08-13 13:31:46', '2023-08-13 06:31:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expenses`
--

CREATE TABLE `expenses` (
  `id` int(4) UNSIGNED ZEROFILL NOT NULL,
  `ex_in_cat_id` int(11) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `expenses`
--

INSERT INTO `expenses` (`id`, `ex_in_cat_id`, `title`, `amount`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(0001, 1, 'Clinical Specialist', 420966, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 2, '2022-09-22 00:00:00', '2022-09-06 00:00:00'),
(0002, 3, 'Physical Therapy Assistant', 5544965, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1, '2023-01-02 00:00:00', '2022-09-01 00:00:00'),
(0003, 4, 'Safety Technician IV', 2880008, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 2, '2023-08-12 00:00:00', '2022-10-11 00:00:00'),
(0004, 1, 'Occupational Therapist', 122333, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1, '2022-10-28 00:00:00', '2022-10-31 00:00:00'),
(0005, 2, 'General Manager', 3396744, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1, '2022-10-08 00:00:00', '2023-01-14 00:00:00'),
(0006, 1, 'Account Representative I', 5671244, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1, '2023-05-11 00:00:00', '2022-11-22 00:00:00'),
(0007, 2, 'Web Developer III', 8301832, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1, '2023-01-26 00:00:00', '2022-12-28 00:00:00'),
(0008, 3, 'Administrative Assistant IV', 3204813, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 2, '2023-04-05 00:00:00', '2023-06-16 00:00:00'),
(0009, 3, 'Nurse Practicioner', 7221672, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 2, '2022-09-11 00:00:00', '2022-11-03 00:00:00'),
(0010, 1, 'Geological Engineer', 679157, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1, '2022-11-24 00:00:00', '2022-10-08 00:00:00'),
(0011, 1, 'Software Engineer II', 1497562, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1, '2023-05-19 00:00:00', '2022-12-17 00:00:00'),
(0012, 2, 'Project Manager', 9363943, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 2, '2022-11-27 00:00:00', '2023-02-23 00:00:00'),
(0013, 3, 'Graphic Designer', 4153121, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 2, '2023-02-06 00:00:00', '2023-04-25 00:00:00'),
(0014, 1, 'Media Manager III', 5642580, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1, '2023-04-16 00:00:00', '2023-04-02 00:00:00'),
(0015, 2, 'GIS Technical Architect', 527137, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1, '2023-08-09 00:00:00', '2023-03-10 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(7, 'payments', 'Payments'),
(8, 'employee', 'Employee');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL,
  `month` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `holidays`
--

INSERT INTO `holidays` (`id`, `title`, `date`, `month`) VALUES
(21, 'Dia 1', '2023-08-24', '2023-08-24'),
(22, 'Dia 2 ', '2023-08-25', '2023-08-25'),
(23, 'Dia 3', '2023-08-28', '2023-08-28'),
(24, 'Dia 4', '2023-08-29', '2023-08-29'),
(25, 'Dia 5', '2023-08-30', '2023-08-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `installments`
--

CREATE TABLE `installments` (
  `id` int(11) NOT NULL,
  `cod_cut` int(11) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `amount` bigint(20) NOT NULL,
  `status` varchar(250) COLLATE utf8_bin NOT NULL DEFAULT 'Activo',
  `ip_address` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `time` time NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `installments`
--

INSERT INTO `installments` (`id`, `cod_cut`, `title`, `type`, `description`, `amount`, `status`, `ip_address`, `created_by`, `updated_by`, `created_at`, `time`, `updated_at`, `deleted_at`) VALUES
(1, 4, 'Computer Systems Analyst IV', 'efectivo', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 3245668, 'Inactivo', '158.112.209.212', 1, 1, '2023-05-27', '00:00:00', '2023-08-20 23:12:10', '2023-08-20 23:12:10'),
(2, 2, 'Help Desk Technician', 'efectivo', 'Fusce consequat. Nulla nisl. Nunc nisl.\r\n\r\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 3450798, 'Activo', '122.250.46.60', 1, 1, '2023-05-27', '00:00:00', '2023-08-19 22:22:42', '2023-08-19 22:22:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `item_code` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `item_name` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `item_description` tinytext COLLATE utf8_bin NOT NULL,
  `quantity` decimal(7,1) NOT NULL DEFAULT '0.0',
  `buy_price` decimal(7,2) NOT NULL DEFAULT '1000.00',
  `status` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `category` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `id_brand` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`id`, `item_code`, `item_name`, `item_description`, `quantity`, `buy_price`, `status`, `category`, `id_brand`, `created_at`, `updated_at`) VALUES
(2, '00041', 'ALUMINIO RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', 1, '2023-08-01 02:33:59', '2023-08-11 13:27:15'),
(3, '00002', 'BLANCO MASISA RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', 1, '2023-08-01 02:33:59', '2023-08-11 13:27:19'),
(4, '00143', 'BOSCO RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', 2, '2023-08-01 02:33:59', '2023-08-11 13:27:21'),
(5, '00547', 'CANTERA RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', 2, '2023-08-01 02:33:59', '2023-08-11 13:27:24'),
(6, '00005', 'CARVALO RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', 2, '2023-08-01 02:33:59', '2023-08-11 13:27:26'),
(7, '00006', 'CASTAÑO BLANCO RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-11 13:27:29'),
(8, '00007', 'CAVA RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-11 13:27:31'),
(9, '00003', 'CEDRO PORON RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-11 13:27:34'),
(10, '00514', 'COLINA RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-11 13:27:37'),
(11, '00020', 'CONCRETO RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-11 13:27:40'),
(12, '00505', 'CUMBRE RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-11 13:27:43'),
(13, '00021', 'FAROLA RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-11 13:27:47'),
(14, '00144', 'FIBRA RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-11 13:27:49'),
(15, '00008', 'FRESNO HUMO RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-11 13:27:52'),
(16, '00162', 'GRES RH 15', 'Lorem ipsum dolor sit amet consectetur adipiscing elit molestie dignissim proin, bibendum urna facilisis lectus mollis interdum facilisi ridiculus rhoncus', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-11 13:27:55'),
(17, '00022', 'LARICINA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(18, '00023', 'LINO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(19, '00145', 'MAGMA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(20, '00024', 'MANTO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(21, '00042', 'NARANJA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(22, '00039', 'NEGRO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(23, '00009', 'NOGAL AMAZONICO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(24, '00010', 'NOGAL CENIZA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(25, '00011', 'OLMO ALPINO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(26, '00515', 'PACIFICO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(27, '00012', 'ROBLE ANTRACITA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(28, '00025', 'ROBLE MILANO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(29, '00004', 'ROBLE MORO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(30, '00013', 'ROBLE SANTANA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(31, '00043', 'ROJO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(32, '00014', 'SAHARA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(33, '00015', 'SANTORINI RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(34, '00146', 'SAVIA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(35, '00513', 'SIERRA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(36, '00040', 'TECA ITALIA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(37, '00026', 'TECA LIMO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(38, '00512', 'VALLE RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(39, '00506', 'VERDE GLACIAL RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(40, '', 'MASISA RH 5.5', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(41, '00071', 'FONDO BLANCO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(42, '00147', 'FONDO BOSCO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(43, '00072', 'FONDO CACAO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(44, '00112', 'FONDO CARVALO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(45, '00113', 'FONDO CASTAÑO BLANCO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(46, '00163', 'FONDO CAVA RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(47, '00119', 'FONDO CEDRO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(48, '00516', 'FONDO COLINA RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(49, '00086', 'FONDO CONCRETO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(50, '00507', 'FONDO CUMBRE RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(51, '00198', 'FONDO FAROLA RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(52, '00148', 'FONDO FIBRA RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(53, '00088', 'FONDO FRESNO HUMORH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(54, '00075', 'FONDO LINO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(55, '00149', 'FONDO MAGMA RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(56, '00089', 'FONDO MANTO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(57, '00110', 'FONDO NOGAL AMAZONICO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(58, '00114', 'FONDO NOGAL CENIZA RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(59, '00136', 'FONDO OLMO ALPINO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(60, '00508', 'FONDO PACIFICO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(61, '00111', 'FONDO ROBLE ANTRACITA RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(62, '00077', 'FONDO ROBLE MILANO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(63, '00016', 'FONDO ROBLE MORO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(64, '00092', 'FONDO ROBLE OSCURO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(65, '00487', 'FONDO ROBLE SANTANA RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(66, '00097', 'FONDO SAHARA RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(67, '00108', 'FONDO SANTORINI RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(68, '00150', 'FONDO SAVIA RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(69, '00509', 'FONDO SIERRA RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(70, '00199', 'FONDO TECA ITALI RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(71, '00196', 'FONDO TECA LIMO RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(72, '00510', 'FONDO VALLE RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(73, '00511', 'FONDO VERDE GLACIAL RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(75, '00181', 'BOSCO ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(76, '00193', 'CARVALO ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(77, '00503', 'CASTAÑO ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(78, '00483', 'CEDRO MDF 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(79, '00541', 'COLINA ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(80, '00182', 'FIBRA ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(81, '00188', 'FRESNO HUMO ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(82, '00189', 'LINO ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(83, '00183', 'MAGMA ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(84, '00191', 'MANTO ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(85, '00504', 'NOGAL AMAZONICO ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(86, '00197', 'NOGAL CENIZA ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(87, '00195', 'RBLE SANTANA ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(88, '00544', 'ROBLE MORO ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(89, '00192', 'SANTORINI ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(90, '00180', 'SAVIA ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(91, '00190', 'TECA ITALIA ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(92, '00542', 'VALLE ESTANDA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(94, '00089', 'FONDO MANTO MDF 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(95, '00154', 'FONDO SAHARA MDF 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(96, '00082', 'FONDO CACAO MDF 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(97, '00073', 'FONDO CEDRO MDF 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(98, '00087', 'FONDO FAROLA MDF 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(99, '', 'MASISA MDF 3', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(100, '00161', 'FONDO BLANCO 3MM MDF PINTADO', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(101, '00185', 'FONDO TECA LIMO 3MM MDF PINTADO', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(102, '00186', 'FONDO ROBLE ANTRACITA 3MM MDF PINTADO', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(103, '', 'MASISA RH 3', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(104, '00060', 'FONDO BLANCO 3MM RH PINTADO', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(105, '', 'MASISA RH 36', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(106, '00116', 'ROBLE ANTRACITA RH 36', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(107, '00098', 'ROBLE SANTANA RH 36', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(108, '', 'TABLAS DE PINO ', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(109, '11006', 'TABLA 3X14X 396', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(110, '11007', 'TABLA 3X19X396', '', 0.0, 1000.00, 'INACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(111, '11018', 'TABLA 2X19X396', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(112, '11015', 'TABLA 2X14X396', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(113, '11016', 'TABLA 2X12X396 (RUSTICA)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS ', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(115, '000333', 'CANTO ALUMINIO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(116, '000384', 'CANTO ALUMINIO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(117, '000548', 'CANTO ALUMINIO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(118, '000457', 'CANTO ALUMINIO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(119, '001227', 'CANTO ANTALYA FLEXIBLE 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(120, '000241', 'CANTO BLANCO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(121, '000238', 'CANTO BLANCO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(122, '000240', 'CANTO BLANCO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(123, '000239', 'CANTO BLANCO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(124, '000242', 'CANTO BLANCO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(125, '000454', 'CANTO BLANCO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(126, '000385', 'CANTO BOSCO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(127, '000387', 'CANTO BOSCO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(128, '000389', 'CANTO BOSCO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(129, '000386', 'CANTO BOSCO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(130, '000388', 'CANTO BOSCO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(131, '000455', 'CANTO BOSCO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(132, '000268', 'CANTO CACAO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(133, '000266', 'CANTO CACAO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(134, '000265', 'CANTO CACAO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(135, '000267', 'CANTO CACAO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(136, '000269', 'CANTO CACAO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(137, '000270', 'CANTO CACAO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(138, '001223', 'CANTO CARAMEL FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(139, '001222', 'CANTO CARAMEL FLEXIBLE 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(140, '000200', 'CANTO CARVALO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(141, '000201', 'CANTO CARVALO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(142, '000202', 'CANTO CARVALO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(143, '000203', 'CANTO CARVALO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(144, '000204', 'CANTO CARVALO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(145, '000205', 'CANTO CARVALO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(146, '000206', 'CANTO CASTAÑO BLANCO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(147, '000207', 'CANTO CASTAÑO BLANCO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(148, '000208', 'CANTO CASTAÑO BLANCO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(149, '000211', 'CANTO CASTAÑO BLANCO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(150, '000209', 'CANTO CASTAÑO BLANCO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(151, '000210', 'CANTO CASTAÑO BLANCO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(152, '000380', 'CANTO CAVA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(153, '000212', 'CANTO CAVA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(154, '000213', 'CANTO CAVA FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(155, '000214', 'CANTO CAVA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(156, '000215', 'CANTO CAVA RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(157, '000216', 'CANTO CAVA RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(158, '0002300', 'CANTO CEDRO ARAUCO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(159, '000230', 'CANTO CEDRO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(160, '000328', 'CANTO CEDRO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(161, '000331', 'CANTO CEDRO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(162, '000329', 'CANTO CEDRO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(163, '000330', 'CANTO CEDRO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(164, '000231', 'CANTO CEDRO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(165, '000521', 'CANTO COLINA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(166, '000523', 'CANTO COLINA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(167, '000524', 'CANTO COLINA FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(168, '000522', 'CANTO COLINA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(169, '000263', 'CANTO CONCRETO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(170, '000261', 'CANTO CONCRETO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(171, '000264', 'CANTO CONCRETO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(172, '000262', 'CANTO CONCRETO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(173, '000382', 'CANTO CONCRETO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(174, '000456', 'CANTO CONCRETO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(175, '000525', 'CANTO CUMBRE FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(176, '000527', 'CANTO CUMBRE FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(177, '000528', 'CANTO CUMBRE FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(178, '000526', 'CANTO CUMBRE RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(179, '000243', 'CANTO FAROLA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(180, '000244', 'CANTO FAROLA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(181, '000245', 'CANTO FAROLA FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(182, '000246', 'CANTO FAROLA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(183, '000247', 'CANTO FAROLA RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(184, '000248', 'CANTO FAROLA RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(185, '000391', 'CANTO FIBRA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(186, '000393', 'CANTO FIBRA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(187, '000395', 'CANTO FIBRA FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(188, '000392', 'CANTO FIBRA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(189, '000394', 'CANTO FIBRA RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(190, '000396', 'CANTO FIBRA RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(191, '000218', 'CANTO FRESNO HUMO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(192, '000221', 'CANTO FRESNO HUMO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(193, '000219', 'CANTO FRESNO HUMO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(194, '000217', 'CANTO FRESNO HUMO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(195, '000222', 'CANTO FRESNO HUMO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(196, '000220', 'CANTO FRESNO HUMO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(197, '000480', 'CANTO GRES FLEXIBLE 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(198, '000279', 'CANTO LARICINA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(199, '000278', 'CANTO LARICINA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(200, '000277', 'CANTO LARICINA FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(201, '000282', 'CANTO LARICINA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(202, '000281', 'CANTO LARICINA RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(203, '000280', 'CANTO LARICINA RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(204, '000252', 'CANTO LINO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(205, '000251', 'CANTO LINO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(206, '000250', 'CANTO LINO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(207, '000249', 'CANTO LINO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(208, '000253', 'CANTO LINO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(209, '000254', 'CANTO LINO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(210, '000472', 'CANTO LINOSA CINZA FLEXIBLE 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(211, '000397', 'CANTO MAGMA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(212, '000399', 'CANTO MAGMA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(213, '000445', 'CANTO MAGMA FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(214, '000398', 'CANTO MAGMA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(215, '000444', 'CANTO MAGMA RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(216, '000446', 'CANTO MAGMA RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(217, '000255', 'CANTO MANTO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(218, '000257', 'CANTO MANTO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(219, '000259', 'CANTO MANTO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(220, '000256', 'CANTO MANTO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(221, '000258', 'CANTO MANTO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(222, '000260', 'CANTO MANTO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(223, '000334', 'CANTO NARANJA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(224, '000375', 'CANTO NARANJA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(225, '000453', 'CANTO NARANJA RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(226, '000364', 'CANTO NEGRO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(227, '000342', 'CANTO NEGRO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(228, '000341', 'CANTO NEGRO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(229, '000351', 'CANTO NEGRO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'INACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(230, '000349', 'CANTO NEGRO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(231, '000350', 'CANTO NEGRO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(232, '000226', 'CANTO NOGAL AMAZONICO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(233, '000223', 'CANTO NOGAL AMAZONICO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(234, '000347', 'CANTO NOGAL AMAZONICO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(235, '000225', 'CANTO NOGAL AMAZONICO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(236, '000227', 'CANTO NOGAL AMAZONICO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(237, '000224', 'CANTO NOGAL AMAZONICO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(238, '000338', 'CANTO NOGAL CENIZA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(239, '000339', 'CANTO NOGAL CENIZA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(240, '000340', 'CANTO NOGAL CENIZA FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(241, '000354', 'CANTO NOGAL CENIZA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(242, '000352', 'CANTO NOGAL CENIZA RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(243, '000353', 'CANTO NOGAL CENIZA RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(244, '000471', 'CANTO NOGAL TERRACOTA FLEXIBLE 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(245, '000228', 'CANTO OLMO ALPINO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(246, '000229', 'CANTO OLMO ALPINO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(247, '000303', 'CANTO OLMO ALPINO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(248, '000306', 'CANTO OLMO ALPINO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(249, '000304', 'CANTO OLMO ALPINO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(250, '000305', 'CANTO OLMO ALPINO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(251, '000473', 'CANTO OLMO PARDO FLEXIBLE 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(252, '000517', 'CANTO PACIFICO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(253, '000519', 'CANTO PACIFICO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(254, '000520', 'CANTO PACIFICO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(255, '000518', 'CANTO PACIFICO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(256, '000307', 'CANTO ROBLE ANTRACITA FLEXIBLE  44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(257, '000309', 'CANTO ROBLE ANTRACITA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(258, '000308', 'CANTO ROBLE ANTRACITA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(259, '000362', 'CANTO ROBLE ANTRACITA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(260, '000310', 'CANTO ROBLE ANTRACITA RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(261, '000311', 'CANTO ROBLE ANTRACITA RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(262, '000355', 'CANTO ROBLE MILANO  RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(263, '000356', 'CANTO ROBLE MILANO  RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(264, '000372', 'CANTO ROBLE MILANO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(265, '000284', 'CANTO ROBLE MILANO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(266, '000283', 'CANTO ROBLE MILANO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(267, '000286', 'CANTO ROBLE MILANO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(268, '000237', 'CANTO ROBLE MORO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(269, '000232', 'CANTO ROBLE MORO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(270, '000234', 'CANTO ROBLE MORO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(271, '000236', 'CANTO ROBLE MORO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(272, '000233', 'CANTO ROBLE MORO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(273, '000235', 'CANTO ROBLE MORO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(274, '000367', 'CANTO ROBLE OSCURO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(275, '000368', 'CANTO ROBLE OSCURO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(276, '000369', 'CANTO ROBLE OSCURO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(277, '000370', 'CANTO ROBLE OSCURO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(278, '000371', 'CANTO ROBLE OSCURO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(279, '000381', 'CANTO ROBLE OSCURO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(280, '001171', 'CANTO ROBLE PROVENZAL FLEXIBLE 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(281, '000478', 'CANTO ROBLE RUSTICO FLEXIBLE 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(282, '000313', 'CANTO ROBLE SANTANA FLEXIBLE  44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(283, '000316', 'CANTO ROBLE SANTANA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(284, '000314', 'CANTO ROBLE SANTANA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(285, '000315', 'CANTO ROBLE SANTANA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(286, '000317', 'CANTO ROBLE SANTANA RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(287, '000318', 'CANTO ROBLE SANTANA RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(288, '000374', 'CANTO ROJO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'INACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(289, '000383', 'CANTO ROJO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(290, '000379', 'CANTO ROJO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(291, '000482', 'CANTO ROJO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(292, '000321', 'CANTO SAHARA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(293, '000319', 'CANTO SAHARA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(294, '000344', 'CANTO SAHARA FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(295, '000320', 'CANTO SAHARA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(296, '000322', 'CANTO SAHARA RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(297, '000323', 'CANTO SAHARA RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(298, '000348', 'CANTO SANTORINI FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(299, '000324', 'CANTO SANTORINI FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(300, '000345', 'CANTO SANTORINI FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(301, '000325', 'CANTO SANTORINI RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(302, '000326', 'CANTO SANTORINI RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(303, '000327', 'CANTO SANTORINI RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(304, '000448', 'CANTO SAVIA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(305, '000449', 'CANTO SAVIA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(306, '000451', 'CANTO SAVIA FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(307, '000447', 'CANTO SAVIA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(308, '000450', 'CANTO SAVIA RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(309, '000452', 'CANTO SAVIA RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(310, '000529', 'CANTO SIERRA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(311, '000531', 'CANTO SIERRA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(312, '000532', 'CANTO SIERRA FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(313, '000530', 'CANTO SIERRA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(314, '001170', 'CANTO TECA ARTICO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(315, '0011700', 'CANTO TECA ARTICO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(316, '000335', 'CANTO TECA ITALIA FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(317, '000336', 'CANTO TECA ITALIA FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(318, '000337', 'CANTO TECA ITALIA FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(319, '000346', 'CANTO TECA ITALIA RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(320, '000357', 'CANTO TECA ITALIA RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(321, '000358', 'CANTO TECA ITALIA RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(322, '000274', 'CANTO TECA LIMO FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(323, '000271', 'CANTO TECA LIMO FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(324, '000275', 'CANTO TECA LIMO FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(325, '000273', 'CANTO TECA LIMO RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(326, '000276', 'CANTO TECA LIMO RIGIDO 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(327, '000272', 'CANTO TECA LIMO RIGIDO 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(328, '000533', 'CANTO VALLE FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(329, '000535', 'CANTO VALLE FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(330, '000536', 'CANTO VALLE FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(331, '000534', 'CANTO VALLE RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(332, '000537', 'CANTO VERDE GLACIAR FLEXIBLE 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(333, '000539', 'CANTO VERDE GLACIAR FLEXIBLE 33MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(334, '000540', 'CANTO VERDE GLACIAR FLEXIBLE 44MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(335, '000538', 'CANTO VERDE GLACIAR RIGIDO 19MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(337, '00333', 'CANTO ALUMINIO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(338, '00384', 'CANTO ALUMINIO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(339, '00548', 'CANTO ALUMINIO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15');
INSERT INTO `items` (`id`, `item_code`, `item_name`, `item_description`, `quantity`, `buy_price`, `status`, `category`, `id_brand`, `created_at`, `updated_at`) VALUES
(340, '00457', 'CANTO ALUMINIO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(341, '01227', 'CANTO ANTALYA FLEXIBLE 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(342, '00241', 'CANTO BLANCO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(343, '00238', 'CANTO BLANCO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(344, '00240', 'CANTO BLANCO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(345, '00239', 'CANTO BLANCO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(346, '00242', 'CANTO BLANCO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(347, '00454', 'CANTO BLANCO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(348, '00385', 'CANTO BOSCO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(349, '00387', 'CANTO BOSCO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(350, '00389', 'CANTO BOSCO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(351, '00386', 'CANTO BOSCO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(352, '00388', 'CANTO BOSCO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(353, '00455', 'CANTO BOSCO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(354, '00268', 'CANTO CACAO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(355, '00266', 'CANTO CACAO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(356, '00265', 'CANTO CACAO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(357, '00267', 'CANTO CACAO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(358, '00269', 'CANTO CACAO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(359, '00270', 'CANTO CACAO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(360, '01223', 'CANTO CARAMEL FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(361, '01222', 'CANTO CARAMEL FLEXIBLE 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(362, '00200', 'CANTO CARVALO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(363, '00201', 'CANTO CARVALO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(364, '00202', 'CANTO CARVALO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(365, '00203', 'CANTO CARVALO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(366, '00204', 'CANTO CARVALO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(367, '00205', 'CANTO CARVALO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(368, '00206', 'CANTO CASTAÑO BLANCO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(369, '00207', 'CANTO CASTAÑO BLANCO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(370, '00208', 'CANTO CASTAÑO BLANCO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(371, '00211', 'CANTO CASTAÑO BLANCO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(372, '00209', 'CANTO CASTAÑO BLANCO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(373, '00210', 'CANTO CASTAÑO BLANCO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(374, '00380', 'CANTO CAVA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(375, '00212', 'CANTO CAVA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(376, '00213', 'CANTO CAVA FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(377, '00214', 'CANTO CAVA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(378, '00215', 'CANTO CAVA RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(379, '00216', 'CANTO CAVA RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(380, '002300', 'CANTO CEDRO ARAUCO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(381, '00230', 'CANTO CEDRO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(382, '00328', 'CANTO CEDRO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(383, '00331', 'CANTO CEDRO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(384, '00329', 'CANTO CEDRO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(385, '00330', 'CANTO CEDRO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(386, '00231', 'CANTO CEDRO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(387, '00521', 'CANTO COLINA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(388, '00523', 'CANTO COLINA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(389, '00524', 'CANTO COLINA FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(390, '00522', 'CANTO COLINA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(391, '00263', 'CANTO CONCRETO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(392, '00261', 'CANTO CONCRETO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(393, '00264', 'CANTO CONCRETO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(394, '00262', 'CANTO CONCRETO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(395, '00382', 'CANTO CONCRETO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(396, '00456', 'CANTO CONCRETO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(397, '00525', 'CANTO CUMBRE FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(398, '00527', 'CANTO CUMBRE FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(399, '00528', 'CANTO CUMBRE FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(400, '00526', 'CANTO CUMBRE RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(401, '00243', 'CANTO FAROLA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(402, '00244', 'CANTO FAROLA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(403, '00245', 'CANTO FAROLA FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(404, '00246', 'CANTO FAROLA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(405, '00247', 'CANTO FAROLA RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(406, '00248', 'CANTO FAROLA RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(407, '00391', 'CANTO FIBRA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(408, '00393', 'CANTO FIBRA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(409, '00395', 'CANTO FIBRA FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(410, '00392', 'CANTO FIBRA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(411, '00394', 'CANTO FIBRA RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(412, '00396', 'CANTO FIBRA RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(413, '00218', 'CANTO FRESNO HUMO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(414, '00221', 'CANTO FRESNO HUMO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(415, '00219', 'CANTO FRESNO HUMO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(416, '00217', 'CANTO FRESNO HUMO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(417, '00222', 'CANTO FRESNO HUMO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(418, '00220', 'CANTO FRESNO HUMO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(419, '00480', 'CANTO GRES FLEXIBLE 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(420, '00279', 'CANTO LARICINA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(421, '00278', 'CANTO LARICINA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(422, '00277', 'CANTO LARICINA FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(423, '00282', 'CANTO LARICINA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(424, '00281', 'CANTO LARICINA RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(425, '00280', 'CANTO LARICINA RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(426, '00252', 'CANTO LINO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(427, '00251', 'CANTO LINO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(428, '00250', 'CANTO LINO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(429, '00249', 'CANTO LINO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(430, '00253', 'CANTO LINO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(431, '00254', 'CANTO LINO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(432, '00472', 'CANTO LINOSA CINZA FLEXIBLE 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(433, '00397', 'CANTO MAGMA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(434, '00399', 'CANTO MAGMA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(435, '00445', 'CANTO MAGMA FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(436, '00398', 'CANTO MAGMA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(437, '00444', 'CANTO MAGMA RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(438, '00446', 'CANTO MAGMA RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(439, '00255', 'CANTO MANTO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(440, '00257', 'CANTO MANTO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(441, '00259', 'CANTO MANTO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(442, '00256', 'CANTO MANTO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(443, '00258', 'CANTO MANTO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(444, '00260', 'CANTO MANTO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(445, '00334', 'CANTO NARANJA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(446, '00375', 'CANTO NARANJA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(447, '00453', 'CANTO NARANJA RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(448, '00364', 'CANTO NEGRO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(449, '00342', 'CANTO NEGRO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(450, '00341', 'CANTO NEGRO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(451, '00351', 'CANTO NEGRO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'INACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(452, '00349', 'CANTO NEGRO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(453, '00350', 'CANTO NEGRO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(454, '00226', 'CANTO NOGAL AMAZONICO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(455, '00223', 'CANTO NOGAL AMAZONICO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(456, '00347', 'CANTO NOGAL AMAZONICO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(457, '00225', 'CANTO NOGAL AMAZONICO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(458, '00227', 'CANTO NOGAL AMAZONICO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(459, '00224', 'CANTO NOGAL AMAZONICO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(460, '00338', 'CANTO NOGAL CENIZA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(461, '00339', 'CANTO NOGAL CENIZA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(462, '00340', 'CANTO NOGAL CENIZA FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(463, '00354', 'CANTO NOGAL CENIZA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(464, '00352', 'CANTO NOGAL CENIZA RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(465, '00353', 'CANTO NOGAL CENIZA RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(466, '00471', 'CANTO NOGAL TERRACOTA FLEXIBLE 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(467, '00228', 'CANTO OLMO ALPINO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(468, '00229', 'CANTO OLMO ALPINO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(469, '00303', 'CANTO OLMO ALPINO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(470, '00306', 'CANTO OLMO ALPINO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(471, '00304', 'CANTO OLMO ALPINO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(472, '00305', 'CANTO OLMO ALPINO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(473, '00473', 'CANTO OLMO PARDO FLEXIBLE 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(474, '00517', 'CANTO PACIFICO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(475, '00519', 'CANTO PACIFICO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(476, '00520', 'CANTO PACIFICO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(477, '00518', 'CANTO PACIFICO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(478, '00307', 'CANTO ROBLE ANTRACITA FLEXIBLE  44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(479, '00309', 'CANTO ROBLE ANTRACITA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(480, '00308', 'CANTO ROBLE ANTRACITA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(481, '00362', 'CANTO ROBLE ANTRACITA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(482, '00310', 'CANTO ROBLE ANTRACITA RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(483, '00311', 'CANTO ROBLE ANTRACITA RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(484, '00355', 'CANTO ROBLE MILANO  RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(485, '00356', 'CANTO ROBLE MILANO  RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(486, '00372', 'CANTO ROBLE MILANO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(487, '00284', 'CANTO ROBLE MILANO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(488, '00283', 'CANTO ROBLE MILANO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(489, '00286', 'CANTO ROBLE MILANO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(490, '00237', 'CANTO ROBLE MORO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(491, '00232', 'CANTO ROBLE MORO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(492, '00234', 'CANTO ROBLE MORO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(493, '00236', 'CANTO ROBLE MORO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(494, '00233', 'CANTO ROBLE MORO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(495, '00235', 'CANTO ROBLE MORO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(496, '00367', 'CANTO ROBLE OSCURO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(497, '00368', 'CANTO ROBLE OSCURO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(498, '00369', 'CANTO ROBLE OSCURO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(499, '00370', 'CANTO ROBLE OSCURO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(500, '00371', 'CANTO ROBLE OSCURO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(501, '00381', 'CANTO ROBLE OSCURO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(502, '01171', 'CANTO ROBLE PROVENZAL FLEXIBLE 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(503, '00478', 'CANTO ROBLE RUSTICO FLEXIBLE 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(504, '00313', 'CANTO ROBLE SANTANA FLEXIBLE  44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(505, '00316', 'CANTO ROBLE SANTANA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(506, '00314', 'CANTO ROBLE SANTANA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(507, '00315', 'CANTO ROBLE SANTANA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(508, '00317', 'CANTO ROBLE SANTANA RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(509, '00318', 'CANTO ROBLE SANTANA RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(510, '00374', 'CANTO ROJO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'INACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(511, '00383', 'CANTO ROJO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(512, '00379', 'CANTO ROJO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(513, '00482', 'CANTO ROJO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(514, '00321', 'CANTO SAHARA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(515, '00319', 'CANTO SAHARA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(516, '00344', 'CANTO SAHARA FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(517, '00320', 'CANTO SAHARA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(518, '00322', 'CANTO SAHARA RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(519, '00323', 'CANTO SAHARA RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(520, '00348', 'CANTO SANTORINI FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(521, '00324', 'CANTO SANTORINI FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(522, '00345', 'CANTO SANTORINI FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(523, '00325', 'CANTO SANTORINI RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(524, '00326', 'CANTO SANTORINI RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(525, '00327', 'CANTO SANTORINI RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(526, '00448', 'CANTO SAVIA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(527, '00449', 'CANTO SAVIA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(528, '00451', 'CANTO SAVIA FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(529, '00447', 'CANTO SAVIA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(530, '00450', 'CANTO SAVIA RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(531, '00452', 'CANTO SAVIA RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(532, '00529', 'CANTO SIERRA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(533, '00531', 'CANTO SIERRA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(534, '00532', 'CANTO SIERRA FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(535, '00530', 'CANTO SIERRA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(536, '01170', 'CANTO TECA ARTICO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(537, '011700', 'CANTO TECA ARTICO FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(538, '00335', 'CANTO TECA ITALIA FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(539, '00336', 'CANTO TECA ITALIA FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(540, '00337', 'CANTO TECA ITALIA FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(541, '00346', 'CANTO TECA ITALIA RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(542, '00357', 'CANTO TECA ITALIA RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(543, '00358', 'CANTO TECA ITALIA RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(544, '00274', 'CANTO TECA LIMO FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(545, '00271', 'CANTO TECA LIMO FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(548, '00273', 'CANTO TECA LIMO RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(549, '00276', 'CANTO TECA LIMO RIGIDO 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(550, '00272', 'CANTO TECA LIMO RIGIDO 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(551, '00533', 'CANTO VALLE FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(552, '00535', 'CANTO VALLE FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(553, '00536', 'CANTO VALLE FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(554, '00534', 'CANTO VALLE RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(555, '00537', 'CANTO VERDE GLACIAR FLEXIBLE 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(556, '00539', 'CANTO VERDE GLACIAR FLEXIBLE 33MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(557, '00540', 'CANTO VERDE GLACIAR FLEXIBLE 44MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(558, '00538', 'CANTO VERDE GLACIAR RIGIDO 19MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(560, '000287', 'CANTO ALTO BRILLO BLANCO UNICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(561, '000289', 'CANTO ALTO BRILLO BERENGENA UNICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(562, '000293', 'CANTO ALTO BRILLO NARANJA BICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(563, '000295', 'CANTO ALTO BRILLO PINO LINEAL BICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(564, '000296', 'CANTO ALTO BRILLO ALUMINIO BICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(565, '000297', 'CANTO ALTO BRILLO WUENGUE BICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(566, '000298', 'CANTO ALTO BRILLO CEDRO BICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(567, '000300', 'CANTO ALTO BRILLO NEGRO BICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(568, '000301', 'CANTO ALTO BRILLO ROJO BICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(569, '001252', 'CANTO ALTO BRILLO BLANCO PERLADO UNICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(570, '001253', 'CANTO ALTO BRILLO NEGRO UNICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(571, '001254', 'CANTO ALTO BRILLO METALIC GRAY UNICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(572, '001256', 'CANTO ALTO BRILLO ANTRACITA UNICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(573, '000294', 'CANTO ALTO BRILLO VERDE BICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(574, '000302', 'CANTO ALTO BRILLO MOCA BICOLOR SEMIRIGIDO 22MM SUELTO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO SUELTO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(576, '00287', 'CANTO ALTO BRILLO BLANCO UNICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(577, '00289', 'CANTO ALTO BRILLO BERENGENA UNICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(578, '00293', 'CANTO ALTO BRILLO NARANJA BICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(579, '00295', 'CANTO ALTO BRILLO PINO LINEAL BICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(580, '00296', 'CANTO ALTO BRILLO ALUMINIO BICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(581, '00297', 'CANTO ALTO BRILLO WUENGUE BICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(582, '00298', 'CANTO ALTO BRILLO CEDRO BICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(583, '00300', 'CANTO ALTO BRILLO NEGRO BICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(584, '00301', 'CANTO ALTO BRILLO ROJO BICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(585, '01252', 'CANTO ALTO BRILLO BLANCO PERLADO UNICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(586, '01253', 'CANTO ALTO BRILLO NEGRO UNICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(587, '01254', 'CANTO ALTO BRILLO METALIC GRAY UNICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(588, '01256', 'CANTO ALTO BRILLO ANTRACITA UNICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(589, '00294', 'CANTO ALTO BRILLO VERDE BICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(590, '00302', 'CANTO ALTO BRILLO MOCA BICOLOR SEMIRIGIDO 22MM PEGADO', '', 0.0, 1000.00, 'ACTIVO', 'CANTO PEGADO', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(592, '00400', 'HV 321 2L', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(593, '00423', 'HV 321 375ML', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(594, '00488', 'HV 321 4K', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(595, '00412', 'HV 321 5L', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(596, '00401', 'HV 321 750 ML', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(597, '01271', 'BONDEX K 100ML', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(598, '01273', 'BONDEX K 2LITROS', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(599, '01270', 'BONDEX K 375ML', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(600, '01274', 'BONDEX K 5LITROS', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(601, '01272', 'BONDEX K 750ML', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(602, '00418', ' CARPINCOL MR60 20KG (BALDE)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(603, '00405', 'CARPINCOL MR60 1KG', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(604, '00403', 'CARPINCOL MR60 250 GR', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(605, '00411', 'CARPINCOL MR60 4KG', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(606, '00404', 'CARPINCOL MR60 500GR', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(607, '00408', 'PL 32L', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(608, '00406', 'PL 375ML', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(609, '00420', 'PL 5L', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(610, '00407', 'PL 750ML', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(611, '01267', 'PREMACOL 1/4', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(612, '01269', 'PREMACOL 20KG', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(613, '01268', 'PREMACOL 4KG', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(614, '01266', 'PREMACOL 500GR', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(615, '', 'BISAGRAS', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(616, '00413', 'BISAGRA SEMIPARCHE (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(617, '01034', 'BISAGRA PARCHE (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(618, '01023', 'BISAGRA GOLPE NIQUELADA (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(619, '01196', 'BISAGRA DE CODO CURVA (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(620, '01241', 'BISAGRA PARCHE PUSH (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(621, '01242', 'BISAGRA PARCHE ESQUINERA 165 GRADOS (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(622, '01244', 'BISAGRA PARCHE ESQUINERA 135 GRADOS (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(623, '01245', 'PUSH OPEN COMPLEMENTO 160 (UÑA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(624, '01260', 'TRIO BISAGRA OMEGA', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(625, '00440', 'BISAGRA PUERTA 444 ACERO', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(626, '00475', 'BISAGRA OMEGA 5 * 3 CON BALINERA (INDUMA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(627, '00475', 'BISAGRA OMEGA 5 * 3 CON BALINERA (GER)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(628, '14011', 'BISAGRA DE PARCHE CIERRE LENTO (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(629, '14011', 'BISAGRA DE PARCHE CIERRE LENTO (VENECIA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(630, '00441', 'BISAGRA 333 PUERTA 76.2 * 76.2 ACERO', '', 0.0, 1000.00, 'INACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(631, '01292', 'BISAGRA PARCHE (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(632, '01293', 'BISAGRA SEMIPARCHE (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(633, '00442', 'SEMIPARCHE CIERRE LENTO 35MM  (MASISA $6.100)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(634, '00442', 'SEMIPARCHE CIERRE LENTO 35MM (BONUIT $6.100)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(635, '00442', 'SEMIPARCHE CIERRE LENTO 35MM (VENECIA $4.500)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(636, '', 'BRAZOS NEWMATICOS - GATOS', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(637, '00424', 'BRAZO NEUMATICO 80N (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(638, '00425', 'BRAZO NEUMATICO 100N (MATCH)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(639, '00426', 'BRAZO NEUMATICO 120N (MATCH)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(640, '00476', 'BRAZO NEUMATICO 60N MINI (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(641, '01264', 'BRAZO CIERRE LENTO DE 80N (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(642, '01265', 'BRAZO CIERRE LENTO DE 120N (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(643, '00442', 'SEMIPARCHE CIERRE LENTO 35MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(644, '', 'CHAPAS - CERRADURAS', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(645, '00428', 'CHAPA PALANCA ALCOBA (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(646, '00429', 'CHAPA PALANCA BAÑO (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(647, '00415', 'CHAPA DE SEGURIDAD (HONEY WELL)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(648, '00458', 'CHAPA BOLA O POMO ALCOBA (MATCH)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(649, '00458', 'CHAPA BOLA O POMO ALCOBA (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(650, '00458', 'CHAPA BOLA O POMO BAÑO (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(651, '', 'TORNILLOS', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(652, '00430', 'TORNILLO DRYWALL 5/8', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(653, '00431', 'TORNILLO DRYWALL 3/4', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(654, '00432', 'TORNILLO DRYWALL 2 PULGADAS', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(655, '00433', 'TORNILLO DRYWALL 1 1/2', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(656, '00434', 'TORNILLO DRYWALL 1 PULGADA', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(657, '00465', 'TORNILLO DRYWALL 2 1/2', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(658, '', 'RIEL PARA PUERTA Y COMPLEMENTARIOS', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(659, '00435', 'RIEL JJ 3MT', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(660, '00436', 'RIEL JJ 2MT', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(661, '00437', 'SISTEMA COLGANTE PUERTA', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(662, '14027', 'RIEL PUERTA ESCONDIDA 40CM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(663, '14028', 'RIEL PUERTA ESCONDIDA 45CM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(664, '14029', 'RIEL PUERTA ESCONDIDA 50CM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(665, '', 'CANTONERA - L - SOPORTE', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(666, '00438', 'CANTONERA 2 HUECOS O L (700)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(667, '00438', 'CANTONERA 2 HUECOS O L (300)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(668, '00438', 'CANTONERA 2 HUECOS O L (200)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(669, '00439', 'CANTONERA 4 HUECOS O L (PLATADAS)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(670, '00439', 'CANTONERA 4 HUECOS O L (DORADAS)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(671, '', 'MOLDURAS', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(672, '00489', 'GUARDA POLVO GP21', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(673, '00490', 'GUARDA POLVO GP18', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(674, '00491', 'GUARDA POLVO GP17', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(675, '00492', 'PILASTRA PL10', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(676, '00493', 'CUBRE JUNTA CJ14', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(677, '00494', 'PILASTRA PL11', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(678, '00495', 'CUBRE JUNTA CJ13', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(679, '00496', 'JUNQUILLO J3', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(680, '00497', 'JUNQUILLO J4', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(681, '00498', 'MEDIA CAÑA MC7', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(682, '00499', 'MEDIA CAÑA MC8', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(683, '00500', 'JUNQUILLO CR1', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(684, '00501', 'JUNQUILLO CR2', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(685, '00502', 'GUARDA POLVO GP22', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(686, '', 'RIEL PARA CAJON', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15');
INSERT INTO `items` (`id`, `item_code`, `item_name`, `item_description`, `quantity`, `buy_price`, `status`, `category`, `id_brand`, `created_at`, `updated_at`) VALUES
(687, '14026', 'RIEL CIERRE LENTO 35MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(688, '14020', 'RIEL CIERRE LENTO 400 MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(689, '14020', 'RIEL CIERRE LENTO 400 MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(690, '14021', 'RIEL CIERRE LENTO 450 MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(691, '14021', 'RIEL CIERRE LENTO 450 MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(692, '14025', 'RIEL CIERRE LENTO 50MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(693, '14025', 'RIEL CIERRE LENTO 50MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(694, '14023', 'RIEL CIERRE LENTO 550MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(695, '14023', 'RIEL CIERRE LENTO 550MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(696, '01014', 'RIEL FULL EXTENSION 30 CM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(697, '001031', 'RIEL FULL EXTENSION 35 CM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(698, '01031', 'RIEL MEDIANO 35MM (MATCH)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(699, '14003', 'RIEL MEDIANO 40 MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(700, '14004', 'RIEL MEDIANO 45 MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(701, '14005', 'RIEL MEDIANO 50 MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(702, '14018', 'RIEL MEDIANO 55 MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(703, '14022', 'RIEL MINI 55 MM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(704, '01239', 'RIEL PESADO 300MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(705, '01207', 'RIEL PESADO 35MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(706, '01205', 'RIEL PESADO 40MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(707, '01206', 'RIEL PESADO 45MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(708, '01236', 'RIEL PESADO 50CM(MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(709, '14016', 'RIEL PUSH TO 350 MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(710, '14016', 'RIEL PUSH TO 350 MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(711, '14014', 'RIEL PUSH TO 400 MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(712, '14014', 'RIEL PUSH TO 400 MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(713, '14015', 'RIEL PUSH TO 450 MM (BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(714, '14015', 'RIEL PUSH TO 450 MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(715, '14017', 'RIEL PUSH TO 500 MM(BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(716, '14017', 'RIEL PUSH TO 500 MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(717, '14024', 'RIEL PUSH TO 550 MM(BONUIT)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(718, '14024', 'RIEL PUSH TO 550 MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(719, '', 'ROLLOS DE PLASTICO', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(720, '01018', 'ROLLOS PLASTICOS 12 CM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(721, '01019', 'ROLLOS PLASTICOS 30 CM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(722, '01020', 'ROLLOS PLASTICOS 44 CM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(723, '', 'MANIJAS', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(724, '001026', 'BOTONES METALICO EN L', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(725, '01026', 'BOTONES METALICO TAPIZADO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(726, '011011', 'AGARRADERA METALICA 002', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(727, '011012', 'AGARRADERA METALICA 003', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(728, '011013', 'AGARRADERA METALICA 003', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(729, '011014', 'AGARRADERA METALICA 005', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(730, '011015', 'AGARRADERA METALICA 006', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(731, '011016', 'AGARRADERA METALICA 128', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(732, '011017', 'AGARRADERA METALICA 09 (LIVIANA)', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(733, '011018', 'AGARRADERA METALICA 011', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(734, '011019', 'AGARRADERA METALICA 012', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(736, '001128', 'M D F 2.5 (ARAUCO)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(737, '01128', 'M D F 2.5 (TAILANDES)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(738, '01275', 'M D F 2.8 (CHINO)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(739, '001138', 'M D F 3 (ARAUCO)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(740, '01138', 'M D F 3 (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(741, '01142', 'M D F 4  (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(742, '01139', 'M D F 5.5 (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(743, '001033', 'M D F 9 MM (ARAUCO)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(744, '01033', 'M D F 9 MM (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(745, '01141', 'M D F 12 (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(746, '01140', 'M D F 15 (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(747, '01150', 'M D F 18  (MASISA)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(748, '', 'ARAUCO RH 15 - 18', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(749, '01213', 'ANTALYA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(750, '01188', 'ASERRADO NORDICO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(751, '01204', 'ASERRADO NORDICO RH 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(752, '01217', 'AWUORA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(753, '01179', 'AWUORA RH 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(754, '01145', 'BLANCO ARAUCO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(755, '01199', 'CARAMEL RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(756, '01200', 'CENDDRA ESCANDINAVO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(757, '01182', 'CENDRA ESCANDINAVO RH 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(758, '01218', 'EXPRESSO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(759, '01129', 'EXPRESSO RH 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(760, '01215', 'JEREZ RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(761, '01132', 'OLO PARDO RH 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(762, '01180', 'POBLE PROVENZAL RH 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(763, '01221', 'ROBLE AMERICANO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(764, '01131', 'ROBLE AMERICANO RH 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(765, '01276', 'ROBLE CAVA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(766, '01201', 'ROBLE PROVENZAL RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(767, '01136', 'ROBLE RUSTICO RH 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(768, '01183', 'SEDA GIORNO RH 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(769, '01203', 'TEKA ARTICO RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(770, '01185', 'TOSCANA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(771, '01198', 'TOSCANA RH 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(772, '', 'ARAUCO RH - ESTANDAR 6', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(773, '01143', 'FONDO CHOCOLATE RH 6', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(774, '01144', 'FONDO CHOCOLATE ESTANDAR 6', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(775, '01189', 'FONDO TOSCANA RH 6', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(776, '01197', 'FONDO NOGAL TERRACOTA RH 6', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(777, '01208', 'FONDO ROBLE CAVA RH 6', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(778, '01209', 'FONDO AWUORA RH 6', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(779, '01210', 'FONDO EXPRESSO RH 6', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(780, '01211', 'FONDO ROBLE AMERICANO RH 6', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(781, '01212', 'FONDO ANTALYA RH 6 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(782, '01277', 'FONDO TEKA ARTICO RH 6', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(784, '01237', 'BLANCO FANTASIA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(785, '01158', 'DUNA RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(786, '01159', 'COÑAC RH 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(788, '01162', 'MADECRIL CAOBA 220G', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(789, '01163', 'MADECRIL CREMA CLARO 220G', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(790, '01164', 'MADECRIL BLANCO 220G', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(791, '01165', 'MADECRIL NEGRO 220G', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(792, '01166', 'MADECRIL CARAMELO 220G', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(793, '01167', 'MADECRIL MIEL 220G', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(794, '01168', 'MADECRIL WENGUE 220G', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(795, '01169', 'MADECRIL GRIS HUMO 220G', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(797, '01187', 'CEDRO ARAUCO ESTANDAR 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(798, '01195', 'BLANCO ARAUCO ESTANDAR DE 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(799, '01224', 'AWUORA ESTANDAR DE 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(801, '01228', 'TABLERO ROBLE 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(802, '01230', 'TABLERO PATULA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(803, '01231', 'TABLERO PATULA 18 ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(804, '01232', 'TABLERO TEKA 15', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(805, '01233', 'TABLERO TEKA 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(806, '01234', 'TABLERO HAYA 20', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(807, '01235', 'TABLERO AMARILLO 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(809, '01153', 'ANTO BRILLO BLANCO PVC RH 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(810, '01246', 'ALTO BRILLO BLANCO ACRILICO RH 19', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(811, '01247', 'ALO BRILLO ACRILICO ANTRACITA RH 19', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(812, '01248', 'ALTO BRILLO NEGRO ACRILICO ANTIRAYONES RH 19', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(813, '01249', 'ALTO BRILLO METALLIC GREY ACRILICO ANTI RAYONES RH 18MM', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(814, '01250', 'ALTO BRILLO PVC WHITE GALAXY RH 18 (BLANCO PERLADO)', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(815, '01301', 'ALTO BRILLO PVC ROCK GREY RH 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(816, '00029', 'ALTO BRILLO ROJO MDF 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(818, '23013', 'PEGANTE JOWAT .70', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(819, '23014', 'PEGANTE JOWAT .40', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(821, '01278', 'FONDO BLANCO LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(822, '01279', 'FONDO WUENGUE LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(823, '01280', 'FONDO ROMA LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(824, '01281', 'FONDO TURIN LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(825, '01282', 'FONDO FIRENZE LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(826, '01283', 'FONDO GERMANY LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(827, '01284', 'FONDO GENOVA LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(828, '01285', 'FONDO CEDRO LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(829, '01286', 'FONDO CARAMELLO LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(830, '01287', 'FONDO VENECIA LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(831, '01288', 'FONDO TOSCANA LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(832, '01289', 'FONDO PALERMO LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(833, '01290', 'FONDO CENIZO LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(834, '01291', 'FONDO PARMA LAMINADO RH 3', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(836, '01302', 'WALL PANEL ANTRACITA MDF PVC', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(837, '01303', 'WALL PANEL EBRU MDF PVC', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(838, '01304', 'WALL PANEL TEAK MDF PVC', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(839, '01305', 'WALL PANEL AMALFI MDF PVC', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(841, '06109', 'COLCH EMPERADOR PLUS D 100 100 X 190 X 25', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(842, '06140', 'COLCH EMPERADOR PLUS D 100 120 X 190 X 25', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(843, '06130', 'COLCH EMPERADOR PLUS D 100 140 X 190 X 25', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(844, '06141', 'COLCH EMPERADOR PLUS D 100 160 X 190 X 25', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(845, '06142', 'COLCH EMPERADOR PLUS D 100 200 X 200 X 25', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(846, '06191', 'COLCHON CASATA ELITE 100 X 190', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(847, '06187', 'COLCHON CASATA ELITE 120 X 190', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(848, '06184', 'COLCHON CASATA ELITE 140 X 190', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(849, '06186', 'COLCHON CASATA ELITE 160 X 190', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(850, '06185', 'COLCHON CASATA ELITE 200 * 200', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(851, '06131', 'COLCHON EMPERADOR PLUS DENSIDAD 100 100 X 190 X 30 JAC', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(852, '06008', 'COLCHON EMPERADOR PLUS DENSIDAD 100 120 X 190 X 30 ', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(853, '06006', 'COLCHON EMPERADOR PLUS DENSIDAD 100 140 X 190 X 30', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(854, '06010', 'COLCHON EMPERADOR PLUS DENSIDAD 100 160 X 190 X 30', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(855, '06007', 'COLCHON EMPERADOR PLUS DENSIDAD 100 200 X 200 X 30 ', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(856, '06217', 'COLCHON ESSENCIAL BONELL 120 X 190 ', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(857, '06218', 'COLCHON ESSENCIAL BONELL 140 X 190', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(858, '06015', 'COLCHON ORTOPEDICO DUROBLAN DENSIDAD 100 - 100 X 190 X 18 ', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(859, '06019', 'COLCHON ORTOPEDICO DUROBLAN DENSIDAD 100 - 120 X 190 X 18', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(860, '06016', 'COLCHON ORTOPEDICO DUROBLAN DENSIDAD 100 - 140 X 190 X 18', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(861, '06017', 'COLCHON ORTOPEDICO DUROBLAN DENSIDAD 100 - 160 X 190 X 20', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(862, '06018', 'COLCHON ORTOPEDICO DUROBLAN DENSIDAD 100 200 X 200 X 18', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(863, '06194', 'COLCHON PILLOW RESORTADO 100 RENACER', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(864, '06195', 'COLCHON PILLOW RESORTADO 120 RENACER', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(865, '06192', 'COLCHON PILLOW RESORTADO 140 RENACER', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(866, '06196', 'COLCHON PILLOW RESORTADO 160 RENACER', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(867, '06193', 'COLCHON PILLOW RESORTADO 2 * 2 RENACER', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(868, '06209', 'COLCHON POCKET 120', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(869, '06210', 'COLCHON POCKET 140', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(870, '06211', 'COLCHON POCKET 160', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(871, '06212', 'COLCHON POCKET 200', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(872, '06156', 'COLCHON RENACER 120 GARANTIA 3AÑOS', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(873, '06205', 'COLCHON RENACER FALSO PILLOW 120 TELA CARBON', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(874, '06203', 'COLCHON RENACER FALSO PILLOW 160 TELA CARBON', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(875, '06204', 'COLCHON RENACER FALSO PILLOW 2 * 2 TELA CARBON', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(876, '06154', 'COLCHON RENACER ORTOPEDICO 100 D 100', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(877, '06153', 'COLCHON RENACER ORTOPEDICO 120 D 100', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(878, '06152', 'COLCHON RENACER ORTOPEDICO 140 D 100', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(879, '06155', 'COLCHON RENACER ORTOPEDICO 160 D 100', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(880, '06216', 'COLCHON RENACER RESORTAD 200 * 200', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(881, '06163', ' COLCHON RENACER PILLOW SEMIORTOP 140', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(882, '06164', 'COLCHON RENACER RESORTADO SEMI ORTOPEDICO 140', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(883, '06003', 'COLCHON RENACER SEMIORTOP RESORTADO 120', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(884, '06102', 'COLCHON RENACER SEMIORTOPEDICO 120', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(885, '06198', 'COLCHON RENACER SEMIORTOPEDICO 200 * 200', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(886, '07031', 'COLCHON RENACER SEMIORTOPEDICO RESORTADO 160', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(887, '06214', 'COLCHON RESORTADO RENACER 140 * 190', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(888, '06206', 'COLCHON SEMIORTOPEDICO RESORTADO 100', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(889, '07030', 'COLCHON SUPER PILLOW RESORTADO 120', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(890, '06062', 'COLCHON SUPER RELAX 100 X 190 X 18 DENSIDAD 23 (GARANTIA 3 AÑOS)', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(891, '06065', 'COLCHON SUPER RELAX 120 X 190 X 18 D 23 (GARANTIA 3 AÑOS)', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(892, '06067', 'COLCHON SUPER RELAX 140 X 190 X 18 D 23 (GARANTIA 3 AÑOS)', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(893, '07028', 'COLCHONETA CRETONA 100x190x14', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(894, '07027', 'COLCHONETA CRETONA 120x190x14', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(895, '07026', 'COLCHONETA CRETONA 140x190x14', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(896, '06202', ' COLCHON PILLOW TOP 100 RENACER', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(897, '06179', 'COLCHON PILLOW TOP 120 RENACER', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(898, '06197', 'COLCHON PILLOW TOP RENACER 140', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(899, '06168', 'COLCHON PILLOW RENACER 160 D100', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(900, '06157', 'COLCHON RENACER DENSIDAD 26 100 X 190 X 200', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(901, '06025', 'COLCHON RENACER DENSIDAD 26  140 X 190 ', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(902, '06178', 'COLCHON RENACER DENSIDAD 26 160 X 190 ', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(903, '06169', 'COLCHON RENACER ORTOPEDICO PILLOW 200 X 200', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(904, '06188', 'COLCHON RENACER PILLOW ORTOPEDICO 120', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(905, '06201', 'COLCHON RENACER PILLOWTOP SEMI 140 TELA CARBON', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(906, '06171', 'COLCHON FALSO PILLOWTOP 140 X 190', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(907, '06172', 'COLCHON RENACER D100 2 * 2', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(908, '06200', 'COLCHON RENACER FALSO PILLOW TELA CARBON 100', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(909, '06199', 'COLCHON RENACER FALSO PILLOW TELA CARBON 140', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(910, '06213', 'COLCHON PLEGABLE PILLOWTOP ORTOPEDICO 2MTS', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(911, '06207', 'COLCHON POCKET SUPER PILLOW RESORTADO 200', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(913, '14007', 'PLATERO ACERO 600MM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(914, '14008', 'PLATERO ACERO 700MM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(915, '14009', 'PLATERO ACERO 800MM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(916, '14010', 'PLATERO ACERO 900MM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(917, '14019', 'PLATERO ACERO 500MM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(918, '', 'CLAVILLOS Y GRAPAS', '', 0.0, 1000.00, '', '', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(919, '22004', 'CLAVILLO 2´´', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(920, '23000', 'CLAVILLO 1´´', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(921, '23001', 'CLAVILLO 1 1/2', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(922, '23003', 'CLAVILLO 1 1/4ïï', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(923, '23005', 'CLAVILLO 3/4', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(924, '23006', 'CLAVILLO 3/8', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(925, '23007', 'CLAVILLO 5/8', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(926, '23008', 'GRAPA 80 / 10', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(928, '00170', 'BLANCO RANURADO MDF 18', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(929, '00416', 'AGLOMERADO RH 18 CRUDO ', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(930, '00419', 'PUERTAS TERMINADAS', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(931, '00427', 'CORTES', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(932, '00332', 'PERFORACIONES', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(933, '00545', 'MDP ESTANDAR 25', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(934, '01156', 'MDF RH 9MM', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(935, '01157', 'MDF RH 12MM', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(936, '01161', 'FORMICA BLANCA TEXTURIZADA', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(937, '01193', 'FORMALETA 18MM 183*244', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(938, '01299', 'MDF RH 5.5', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(939, '01300', 'MDF RH 3MM', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(941, '01006', 'CHAPETAS X UNIDAD', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(942, '01103', 'TUBO OVALADO', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(943, '01135', 'TUBO REDONDO', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(944, '01081', 'PATA GRUESA CON NIVELADOR 10 CM', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(945, '01146', 'SOPORTE ENTREPAÑO PLASTICO TRANSPARENTE', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(946, '00477', 'SOPORTE PARA ENTREPAÑO PLASTICO', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(947, '01243', 'TOPE PARA PUERTA', '', 0.0, 1000.00, 'INACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(948, '01238', 'PASADOR CUADRADO DE 1 1/2', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(949, '14006', 'SOPORTE PARA TUBO', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(950, '14012', 'PERFIL MANIJA RANURADO', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(951, '14013', 'PERFIL MANIJA NO RANURA', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(953, '01011', 'FORRO PROTECTOR GENERO 100 X 190', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(954, '01012', 'FORRO PROTECTOR GENERO 120 X 190', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(955, '01013', 'FORRO PROTECTOR GENERO 140 X 190', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(956, '01024', 'FORRO COLCHON 1:20 X 190 X 18', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(957, '01025', 'FORRO COLCHON 1:40 X 190 X 18', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(958, '01027', 'FORRO PROTECTOR GENERO 160 X 190', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(959, '01030', 'FORRO PROTECTOR GENERO 2 X 2', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(960, '01032', 'FORRO CON CIERRE 140 X 190 X 18', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(961, '01051', 'FORRO COLCHONETA DE 140 X 14', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(962, '01104', 'ESPUMA AMARILLA', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(963, '01106', 'ESPUMA NARANJA', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(964, '01154', 'ESPUMA PENTA', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(965, '06136', 'ESPUMA ROSADA', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(966, '25009', 'PROTECTOR 140', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(967, '25010', 'PROTECTOR 160', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(968, '25011', 'PROTECTOR 120', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(969, '25012', 'PROTECTOR 100', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', 5, '2023-08-01 02:33:59', '2023-08-06 12:59:57'),
(970, '25019', 'PROTECTOR DE 2 X 2', '', 200.0, 1000.00, 'ACTIVO', 'COLCHONES', 6, '2023-08-01 02:33:59', '2023-08-06 12:46:16'),
(971, '01029', 'COJIN TV EUROPEO SAPORITI 48', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(972, '01079', 'ALMOHADA INTELIGENTE', '', 0.0, 1000.00, 'ACTIVO', 'COLCHONES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(974, '00549', 'MICRORIPADO CARVALO', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(975, '00550', 'MICRORIPADO BOSCO', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(976, '00551', 'RIPADO CARVALO', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(977, '00552', 'RIPADO BOSCO', '', 0.0, 1000.00, 'ACTIVO', 'TABLEROS', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(979, '004211', 'TAPA TORNILLO ALUMINIO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(980, '004212', 'TAPA TORNILLO AZUL PACIFICO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(981, '004213', 'TAPA TORNILLO BOSCO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(982, '004214', 'TAPA TORNILLO BLANCO MASISA', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(983, '004215', 'TAPA TORNILLO CARVALO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(984, '004216', 'TAPA TORNILLO CASTAÑO BLANCO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(985, '004217', 'TAPA TORNILLO CAVA ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(986, '004218', 'TAPA TORNILLO CEDRO PORON O BRILLANTE ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(987, '004219', 'TAPA TORNILLO COLINA ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(988, '004220', 'TAPA TORNILLO CONCRETO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(989, '004221', 'TAPA TORNILLO CUMBRE ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(990, '004222', 'TAPA TORNILLO FAROLA ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(991, '004223', 'TAPA TORNILLO FIBRA ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(992, '004224', 'TAPA TORNILLO FRESNO HUMO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(993, '004225', 'TAPA TORNILLO GRES ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(994, '004226', 'TAPA TORNILLO LARICINA ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(995, '004227', 'TAPA TORNILLO LINO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(996, '004228', 'TAPA TORNILLO MAGMA ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(997, '004229', 'TAPA TORNILLO MANTO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(998, '004230', 'TAPA TORNILLO NEGRO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(999, '004231', 'TAPA TORNILLO NOGAL AMAZONICO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1000, '004232', 'TAPA TORNILLO NOGAL CENIZA ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1001, '004233', 'TAPA TORNILLO OLMO ALPINO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1002, '004234', 'TAPA TORNILLO ROBLE ANTRACITA ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1003, '004235', 'TAPA TORNILLO ROBLE MILANO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1004, '004236', 'TAPA TORNILLO ROBLE MORO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1005, '004237', 'TAPA TORNILLO ROBLE SANTANA ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1006, '004238', 'TAPA TORNILLO ROJO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1007, '004239', 'TAPA TORNILLO SAHARA ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1008, '004240', 'TAPA TORNILLO SANTORINI', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1009, '004241', 'TAPA TORNILLO SAVIA 15 ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1010, '004242', 'TAPA TORNILLO SIERRA ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1011, '004243', 'TAPA TORNILLO TECA ITALIA ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1012, '004244', 'TAPA TORNILLO TECA LIMO ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1013, '004245', 'TAPA TORNILLO VALLE ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15'),
(1014, '004246', 'TAPA TORNILLO VERDE GLACIAL ', '', 0.0, 1000.00, 'ACTIVO', 'HERRAJES', NULL, '2023-08-01 02:33:59', '2023-08-01 12:58:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_type` int(11) NOT NULL,
  `leave_time` varchar(120) DEFAULT NULL,
  `start_date` varchar(64) DEFAULT NULL,
  `end_date` varchar(64) DEFAULT NULL,
  `hours_leave` varchar(128) DEFAULT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `status` enum('Aprovado','Desaprovado','Rechazada') NOT NULL DEFAULT 'Desaprovado',
  `apply_date` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `leaves`
--

INSERT INTO `leaves` (`id`, `id_user`, `id_type`, `leave_time`, `start_date`, `end_date`, `hours_leave`, `reason`, `status`, `apply_date`) VALUES
(1, 1, 3, 'Half Day', '2023-09-02', '', '8', 'None none none', 'Desaprovado', NULL),
(2, 1, 1, 'Half Day', '2023-09-09', '', '6', 'Lorem ipsum dolor sit amet consectetur adipiscing elit, natoque nec et augue nam conubia sed duis, class viverra leo congue consequat nulla. Phasellus pellentesque bibendum porta at ornare nibh penatibus, praesent felis inceptos pharetra primis id.', 'Desaprovado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `leave_day` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `leave_types`
--

INSERT INTO `leave_types` (`id`, `name`, `leave_day`, `status`) VALUES
(1, 'Permiso Informal', '21', 1),
(2, 'Licencia por enfermedad', '15', 1),
(3, 'Licencia por maternidad', '90', 1),
(4, 'Licencia por paternidad', '7', 1),
(5, 'Vacaciones ganadas', '16', 1),
(7, 'Día festivo', '0', 1),
(8, 'Licencia Opcional', '0', 1),
(9, 'Salir sin paga', '0', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loans`
--

CREATE TABLE `loans` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `loan_amount` decimal(10,2) DEFAULT NULL,
  `total_installments` int(11) NOT NULL,
  `interests` decimal(7,2) NOT NULL DEFAULT '0.00',
  `fee_amount` decimal(10,2) DEFAULT NULL,
  `loan_date` date DEFAULT NULL,
  `loan_end_date` date DEFAULT NULL,
  `status` varchar(250) COLLATE utf8_bin NOT NULL DEFAULT 'activo',
  `created_by` int(11) NOT NULL,
  `registered_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `loans`
--

INSERT INTO `loans` (`id`, `id_user`, `loan_amount`, `total_installments`, `interests`, `fee_amount`, `loan_date`, `loan_end_date`, `status`, `created_by`, `registered_on`, `updated_on`) VALUES
(1, 1, 1500000.00, 6, 20.00, 264784.00, '2023-08-29', '2023-08-31', 'sin_pagar', 1, '2023-08-30 01:17:18', '2023-08-29 20:17:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_installment`
--

CREATE TABLE `loan_installment` (
  `id` int(14) NOT NULL,
  `loan_id` int(14) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `loan_number` varchar(256) DEFAULT NULL,
  `install_amount` varchar(256) DEFAULT NULL,
  `pay_amount` varchar(64) DEFAULT NULL,
  `app_date` varchar(256) DEFAULT NULL,
  `receiver` varchar(256) DEFAULT NULL,
  `install_no` varchar(256) DEFAULT NULL,
  `notes` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `loan_installment`
--

INSERT INTO `loan_installment` (`id`, `loan_id`, `emp_id`, `loan_number`, `install_amount`, `pay_amount`, `app_date`, `receiver`, `install_no`, `notes`) VALUES
(27, 33, 'Isl1385', '4008291', '5000', NULL, '2018-04-21', 'dsf dsf ds fds fdsf ds', '1', 'sf ds fsd fds fsd fdsf ds fsd'),
(28, 33, 'Isl1385', '4008291', '5000', NULL, '2018-04-04', 'dsdsff dsf ds f', '0', 'f dsfdsf dsfs'),
(29, 34, 'EMP1254478', '18194827', '5000', NULL, '2018-04-05', NULL, '4', NULL),
(30, 34, 'EMP1254478', '18194827', '5000', NULL, '2018-06-05', NULL, '3', NULL),
(31, 34, 'EMP1254478', '18194827', '5000', NULL, '2018-06-07', NULL, '2', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_bin NOT NULL,
  `login` varchar(100) COLLATE utf8_bin NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `machines`
--

CREATE TABLE `machines` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `name_machine` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cod` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `machines`
--

INSERT INTO `machines` (`id`, `id_user`, `name_machine`, `cod`, `status`) VALUES
(1, 1, 'Seccionadora #1', '011', 1),
(3, 1, 'Seccionadora #2', '78pp', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `username` varchar(250) COLLATE utf8_bin NOT NULL,
  `message` tinytext COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `messages`
--

INSERT INTO `messages` (`id`, `username`, `message`, `created_at`) VALUES
(1, 'administrador', 'dfgdfgdfg', '2023-08-24 14:09:35'),
(2, 'administrador', 'gdfgdfgdfgdfg', '2023-08-24 14:09:35'),
(3, 'loaiza-77@hotmail.com', 'hello', '2023-08-24 14:09:35'),
(4, 'loaiza-77@hotmail.com', 'fhghfgh', '2023-08-24 14:09:35'),
(5, 'loaiza-77@hotmail.com', 'hfghf', '2023-08-24 14:09:35'),
(6, 'loaiza-77@hotmail.com', '444', '2023-08-24 14:09:35'),
(7, 'loaiza-77@hotmail.com', 'gfgdgdf', '2023-08-24 14:10:03'),
(8, 'loaiza-77@hotmail.com', 'ghfghfg', '2023-08-24 14:29:07'),
(9, 'administrador', 'holis', '2023-08-24 14:50:19'),
(10, 'administrador', 'hkjhkjhk', '2023-08-24 14:50:39'),
(11, 'administrador', 'sdfsdfsdf', '2023-08-24 18:05:19'),
(12, 'loaiza-77@hotmail.com', 'dfsdfsdfsdfsdfs', '2023-08-24 18:07:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) COLLATE utf8_bin NOT NULL,
  `class` varchar(255) COLLATE utf8_bin NOT NULL,
  `group` varchar(255) COLLATE utf8_bin NOT NULL,
  `namespace` varchar(255) COLLATE utf8_bin NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2021-07-04-041948', 'CodeIgniter\\Settings\\Database\\Migrations\\CreateSettingsTable', 'default', 'CodeIgniter\\Settings', 1691257330, 1),
(2, '2021-11-14-143905', 'CodeIgniter\\Settings\\Database\\Migrations\\AddContextColumn', 'default', 'CodeIgniter\\Settings', 1691257330, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mop`
--

CREATE TABLE `mop` (
  `id` int(11) NOT NULL,
  `code` varchar(250) COLLATE utf8_bin NOT NULL,
  `item_code` text COLLATE utf8_bin NOT NULL,
  `item_name` text COLLATE utf8_bin NOT NULL,
  `quantity` text COLLATE utf8_bin NOT NULL,
  `price` text COLLATE utf8_bin NOT NULL,
  `total` text COLLATE utf8_bin NOT NULL,
  `category` varchar(250) COLLATE utf8_bin NOT NULL,
  `type` varchar(250) COLLATE utf8_bin NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `mop`
--

INSERT INTO `mop` (`id`, `code`, `item_code`, `item_name`, `quantity`, `price`, `total`, `category`, `type`, `created_by`, `created_at`) VALUES
(2, 'BG1HL', '00041', 'ALUMINIO RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-11 22:05:38'),
(3, 'BG1HL', '00547', 'CANTERA RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-11 22:05:43'),
(4, 'BF1HL', '00002', 'BLANCO MASISA RH 15', '2', '1000.00', '2000.00', 'TABLEROS ', 'Cuts', 1, '2023-08-11 10:03:58'),
(5, 'BF1HL', '00547', 'CANTERA RH 15', '2', '1000.00', '2000.00', 'TABLEROS ', 'Cuts', 1, '2023-08-11 10:03:58'),
(6, 'BF1HL', '00003', 'CEDRO PORON RH 15', '1', '1000.00', '1000.00', 'TABLEROS ', 'Cuts', 1, '2023-08-11 10:03:58'),
(7, '41sKI', '00002', 'BLANCO MASISA RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-12 17:18:06'),
(8, 'OWZap', '00008', 'FRESNO HUMO RH 15', '4', '1000.00', '4000.00', 'TABLEROS ', 'Orders', 1, '2023-08-14 06:56:21'),
(9, 'OWZap', '00014', 'SAHARA RH 15', '3', '1000.00', '3000.00', 'TABLEROS ', 'Orders', 1, '2023-08-14 06:56:21'),
(10, 'OWZap', '00002', 'BLANCO MASISA RH 15', '7', '1000.00', '7000.00', 'TABLEROS ', 'Orders', 1, '2023-08-14 06:56:21'),
(11, 'dCBmo', '00547', 'CANTERA RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-21 14:49:47'),
(12, 'wkxJ0', '00003', 'CEDRO PORON RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-21 14:52:33'),
(13, 'pIhHw', '00006', 'CASTAÑO BLANCO RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 06:33:27'),
(14, 'ckp7z', '00003', 'CEDRO PORON RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 13:34:22'),
(15, 'FoVrb', '00007', 'CAVA RH 15', '2', '1000.00', '2000.00', 'TABLEROS ', 'Cuts', 1, '2023-08-22 13:38:19'),
(16, 'FoVrb', '00514', 'COLINA RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 13:38:19'),
(17, 'PzK7k', '00005', 'CARVALO RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 14:06:51'),
(18, 'N0K2v', '00515', 'PACIFICO RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 14:09:58'),
(19, 'N0K2v', '00020', 'CONCRETO RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 14:09:58'),
(20, 'vcIBl', '00041', 'ALUMINIO RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 14:10:45'),
(21, 'P6kTc', '00006', 'CASTAÑO BLANCO RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 14:21:25'),
(22, 'KzGOx', '00515', 'PACIFICO RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 14:24:37'),
(23, 'Xh6Ev', '00023', 'LINO RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 14:28:12'),
(24, 'Ie03R', '00547', 'CANTERA RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 14:30:02'),
(25, 'Ie03R', '00143', 'BOSCO RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 14:30:02'),
(26, '6EMfP', '00002', 'BLANCO MASISA RH 15', '1', '1000.00', '1000', 'TABLEROS ', 'Cuts', 1, '2023-08-22 14:52:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id` int(6) UNSIGNED NOT NULL,
  `city` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `depart_id` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id`, `city`, `depart_id`) VALUES
(5001, 'Medellín', 5),
(5002, 'Abejorral', 5),
(5004, 'Abriaqui', 5),
(5021, 'Alejandria', 5),
(5030, 'Amaga', 5),
(5031, 'Amalfi', 5),
(5034, 'Andes', 5),
(5036, 'Angelopolis', 5),
(5038, 'Angostura', 5),
(5040, 'Anori', 5),
(5042, 'Santafe De Antioquia', 5),
(5044, 'Anza', 5),
(5045, 'Apartado', 5),
(5051, 'Arboletes', 5),
(5055, 'Argelia', 5),
(5059, 'Armenia', 5),
(5079, 'Barbosa', 5),
(5086, 'Belmira', 5),
(5088, 'Bello', 5),
(5091, 'Betania', 5),
(5093, 'Betulia', 5),
(5101, 'Ciudad Bolivar', 5),
(5107, 'Briceño', 5),
(5113, 'Buritica', 5),
(5120, 'Caceres', 5),
(5125, 'Caicedo', 5),
(5129, 'Caldas', 5),
(5134, 'Campamento', 5),
(5138, 'Cañasgordas', 5),
(5142, 'Caracoli', 5),
(5145, 'Caramanta', 5),
(5147, 'Carepa', 5),
(5148, 'El Carmen De Viboral', 5),
(5150, 'Carolina', 5),
(5154, 'Caucasia', 5),
(5172, 'Chigorodo', 5),
(5190, 'Cisneros', 5),
(5197, 'Cocorna', 5),
(5206, 'Concepcion', 5),
(5209, 'Concordia', 5),
(5212, 'Copacabana', 5),
(5234, 'Dabeiba', 5),
(5237, 'Don Matias', 5),
(5240, 'Ebejico', 5),
(5250, 'El Bagre', 5),
(5264, 'Entrerrios', 5),
(5266, 'Envigado', 5),
(5282, 'Fredonia', 5),
(5284, 'Frontino', 5),
(5306, 'Giraldo', 5),
(5308, 'Girardota', 5),
(5310, 'Gomez Plata', 5),
(5313, 'Granada', 5),
(5315, 'Guadalupe', 5),
(5318, 'Guarne', 5),
(5321, 'Guatape', 5),
(5347, 'Heliconia', 5),
(5353, 'Hispania', 5),
(5360, 'Itagui', 5),
(5361, 'Ituango', 5),
(5364, 'Jardin', 5),
(5368, 'Jerico', 5),
(5376, 'La Ceja', 5),
(5380, 'La Estrella', 5),
(5390, 'La Pintada', 5),
(5400, 'La Union', 5),
(5411, 'Liborina', 5),
(5425, 'Maceo', 5),
(5440, 'Marinilla', 5),
(5467, 'Montebello', 5),
(5475, 'Murindo', 5),
(5480, 'Mutata', 5),
(5483, 'Nariño', 5),
(5490, 'Necocli', 5),
(5495, 'Nechi', 5),
(5501, 'Olaya', 5),
(5541, 'Peðol', 5),
(5543, 'Peque', 5),
(5576, 'Pueblorrico', 5),
(5579, 'Puerto Berrio', 5),
(5585, 'Puerto Nare', 5),
(5591, 'Puerto Triunfo', 5),
(5604, 'Remedios', 5),
(5607, 'Retiro', 5),
(5615, 'Rionegro', 5),
(5628, 'Sabanalarga', 5),
(5631, 'Sabaneta', 5),
(5642, 'Salgar', 5),
(5647, 'San Andres De Cuerquia', 5),
(5649, 'San Carlos', 5),
(5652, 'San Francisco', 5),
(5656, 'San Jeronimo', 5),
(5658, 'San Jose De La Montaña', 5),
(5659, 'San Juan De Uraba', 5),
(5660, 'San Luis', 5),
(5664, 'San Pedro', 5),
(5665, 'San Pedro De Uraba', 5),
(5667, 'San Rafael', 5),
(5670, 'San Roque', 5),
(5674, 'San Vicente', 5),
(5679, 'Santa Barbara', 5),
(5686, 'Santa Rosa De Osos', 5),
(5690, 'Santo Domingo', 5),
(5697, 'El Santuario', 5),
(5736, 'Segovia', 5),
(5756, 'Sonson', 5),
(5761, 'Sopetran', 5),
(5789, 'Tamesis', 5),
(5790, 'Taraza', 5),
(5792, 'Tarso', 5),
(5809, 'Titiribi', 5),
(5819, 'Toledo', 5),
(5837, 'Turbo', 5),
(5842, 'Uramita', 5),
(5847, 'Urrao', 5),
(5854, 'Valdivia', 5),
(5856, 'Valparaiso', 5),
(5858, 'Vegachi', 5),
(5861, 'Venecia', 5),
(5873, 'Vigia Del Fuerte', 5),
(5885, 'Yali', 5),
(5887, 'Yarumal', 5),
(5890, 'Yolombo', 5),
(5893, 'Yondo', 5),
(5895, 'Zaragoza', 5),
(8001, 'Barranquilla', 8),
(8078, 'Baranoa', 8),
(8137, 'Campo De La Cruz', 8),
(8141, 'Candelaria', 8),
(8296, 'Galapa', 8),
(8372, 'Juan De Acosta', 8),
(8421, 'Luruaco', 8),
(8433, 'Malambo', 8),
(8436, 'Manati', 8),
(8520, 'Palmar De Varela', 8),
(8549, 'Piojo', 8),
(8558, 'Polonuevo', 8),
(8560, 'Ponedera', 8),
(8573, 'Puerto Colombia', 8),
(8606, 'Repelon', 8),
(8634, 'Sabanagrande', 8),
(8638, 'Sabanalarga', 8),
(8675, 'Santa Lucia', 8),
(8685, 'Santo Tomas', 8),
(8758, 'Soledad', 8),
(8770, 'Suan', 8),
(8832, 'Tubara', 8),
(8849, 'Usiacuri', 8),
(11001, 'Bogota, D.C.', 11),
(13001, 'Cartagena', 13),
(13006, 'Achi', 13),
(13030, 'Altos Del Rosario', 13),
(13042, 'Arenal', 13),
(13052, 'Arjona', 13),
(13062, 'Arroyohondo', 13),
(13074, 'Barranco De Loba', 13),
(13140, 'Calamar', 13),
(13160, 'Cantagallo', 13),
(13188, 'Cicuco', 13),
(13212, 'Cordoba', 13),
(13222, 'Clemencia', 13),
(13244, 'El Carmen De Bolivar', 13),
(13248, 'El Guamo', 13),
(13268, 'El Peñon', 13),
(13300, 'Hatillo De Loba', 13),
(13430, 'Magangue', 13),
(13433, 'Mahates', 13),
(13440, 'Margarita', 13),
(13442, 'Maria La Baja', 13),
(13458, 'Montecristo', 13),
(13468, 'Mompos', 13),
(13473, 'Morales', 13),
(13490, 'Norosi', 13),
(13549, 'Pinillos', 13),
(13580, 'Regidor', 13),
(13600, 'Rio Viejo', 13),
(13620, 'San Cristobal', 13),
(13647, 'San Estanislao', 13),
(13650, 'San Fernando', 13),
(13654, 'San Jacinto', 13),
(13655, 'San Jacinto Del Cauca', 13),
(13657, 'San Juan Nepomuceno', 13),
(13667, 'San Martin De Loba', 13),
(13670, 'San Pablo', 13),
(13673, 'Santa Catalina', 13),
(13683, 'Santa Rosa', 13),
(13688, 'Santa Rosa Del Sur', 13),
(13744, 'Simiti', 13),
(13760, 'Soplaviento', 13),
(13780, 'Talaigua Nuevo', 13),
(13810, 'Tiquisio', 13),
(13836, 'Turbaco', 13),
(13838, 'Turbana', 13),
(13873, 'Villanueva', 13),
(13894, 'Zambrano', 13),
(15001, 'Tunja', 15),
(15022, 'Almeida', 15),
(15047, 'Aquitania', 15),
(15051, 'Arcabuco', 15),
(15087, 'Belen', 15),
(15090, 'Berbeo', 15),
(15092, 'Beteitiva', 15),
(15097, 'Boavita', 15),
(15104, 'Boyaca', 15),
(15106, 'Briceño', 15),
(15109, 'Buenavista', 15),
(15114, 'Busbanza', 15),
(15131, 'Caldas', 15),
(15135, 'Campohermoso', 15),
(15162, 'Cerinza', 15),
(15172, 'Chinavita', 15),
(15176, 'Chiquinquira', 15),
(15180, 'Chiscas', 15),
(15183, 'Chita', 15),
(15185, 'Chitaraque', 15),
(15187, 'Chivata', 15),
(15189, 'Cienega', 15),
(15204, 'Combita', 15),
(15212, 'Coper', 15),
(15215, 'Corrales', 15),
(15218, 'Covarachia', 15),
(15223, 'Cubara', 15),
(15224, 'Cucaita', 15),
(15226, 'Cuitiva', 15),
(15232, 'Chiquiza', 15),
(15236, 'Chivor', 15),
(15238, 'Duitama', 15),
(15244, 'El Cocuy', 15),
(15248, 'El Espino', 15),
(15272, 'Firavitoba', 15),
(15276, 'Floresta', 15),
(15293, 'Gachantiva', 15),
(15296, 'Gameza', 15),
(15299, 'Garagoa', 15),
(15317, 'Guacamayas', 15),
(15322, 'Guateque', 15),
(15325, 'Guayata', 15),
(15332, 'Gsican', 15),
(15362, 'Iza', 15),
(15367, 'Jenesano', 15),
(15368, 'Jerico', 15),
(15377, 'Labranzagrande', 15),
(15380, 'La Capilla', 15),
(15401, 'La Victoria', 15),
(15403, 'La Uvita', 15),
(15407, 'Villa De Leyva', 15),
(15425, 'Macanal', 15),
(15442, 'Maripi', 15),
(15455, 'Miraflores', 15),
(15464, 'Mongua', 15),
(15466, 'Mongui', 15),
(15469, 'Moniquira', 15),
(15476, 'Motavita', 15),
(15480, 'Muzo', 15),
(15491, 'Nobsa', 15),
(15494, 'Nuevo Colon', 15),
(15500, 'Oicata', 15),
(15507, 'Otanche', 15),
(15511, 'Pachavita', 15),
(15514, 'Paez', 15),
(15516, 'Paipa', 15),
(15518, 'Pajarito', 15),
(15522, 'Panqueba', 15),
(15531, 'Pauna', 15),
(15533, 'Paya', 15),
(15537, 'Paz De Rio', 15),
(15542, 'Pesca', 15),
(15550, 'Pisba', 15),
(15572, 'Puerto Boyaca', 15),
(15580, 'Quipama', 15),
(15599, 'Ramiriqui', 15),
(15600, 'Raquira', 15),
(15621, 'Rondon', 15),
(15632, 'Saboya', 15),
(15638, 'Sachica', 15),
(15646, 'Samaca', 15),
(15660, 'San Eduardo', 15),
(15664, 'San Jose De Pare', 15),
(15667, 'San Luis De Gaceno', 15),
(15673, 'San Mateo', 15),
(15676, 'San Miguel De Sema', 15),
(15681, 'San Pablo De Borbur', 15),
(15686, 'Santana', 15),
(15690, 'Santa Maria', 15),
(15693, 'Santa Rosa De Viterbo', 15),
(15696, 'Santa Sofia', 15),
(15720, 'Sativanorte', 15),
(15723, 'Sativasur', 15),
(15740, 'Siachoque', 15),
(15753, 'Soata', 15),
(15755, 'Socota', 15),
(15757, 'Socha', 15),
(15759, 'Sogamoso', 15),
(15761, 'Somondoco', 15),
(15762, 'Sora', 15),
(15763, 'Sotaquira', 15),
(15764, 'Soraca', 15),
(15774, 'Susacon', 15),
(15776, 'Sutamarchan', 15),
(15778, 'Sutatenza', 15),
(15790, 'Tasco', 15),
(15798, 'Tenza', 15),
(15804, 'Tibana', 15),
(15806, 'Tibasosa', 15),
(15808, 'Tinjaca', 15),
(15810, 'Tipacoque', 15),
(15814, 'Toca', 15),
(15816, 'Togsi', 15),
(15820, 'Topaga', 15),
(15822, 'Tota', 15),
(15832, 'Tunungua', 15),
(15835, 'Turmeque', 15),
(15837, 'Tuta', 15),
(15839, 'Tutaza', 15),
(15842, 'Umbita', 15),
(15861, 'Ventaquemada', 15),
(15879, 'Viracacha', 15),
(15897, 'Zetaquira', 15),
(17001, 'Manizales', 17),
(17013, 'Aguadas', 17),
(17042, 'Anserma', 17),
(17050, 'Aranzazu', 17),
(17088, 'Belalcazar', 17),
(17174, 'Chinchina', 17),
(17272, 'Filadelfia', 17),
(17380, 'La Dorada', 17),
(17388, 'La Merced', 17),
(17433, 'Manzanares', 17),
(17442, 'Marmato', 17),
(17444, 'Marquetalia', 17),
(17446, 'Marulanda', 17),
(17486, 'Neira', 17),
(17495, 'Norcasia', 17),
(17513, 'Pacora', 17),
(17524, 'Palestina', 17),
(17541, 'Pensilvania', 17),
(17614, 'Riosucio', 17),
(17616, 'Risaralda', 17),
(17653, 'Salamina', 17),
(17662, 'Samana', 17),
(17665, 'San Jose', 17),
(17777, 'Supia', 17),
(17867, 'Victoria', 17),
(17873, 'Villamaria', 17),
(17877, 'Viterbo', 17),
(18001, 'Florencia', 18),
(18029, 'Albania', 18),
(18094, 'Belen De Los Andaquies', 18),
(18150, 'Cartagena Del Chaira', 18),
(18205, 'Curillo', 18),
(18247, 'El Doncello', 18),
(18256, 'El Paujil', 18),
(18410, 'La Montañita', 18),
(18460, 'Milan', 18),
(18479, 'Morelia', 18),
(18592, 'Puerto Rico', 18),
(18610, 'San Jose Del Fragua', 18),
(18753, 'San Vicente Del Caguan', 18),
(18756, 'Solano', 18),
(18785, 'Solita', 18),
(18860, 'Valparaiso', 18),
(19001, 'Popayan', 19),
(19022, 'Almaguer', 19),
(19050, 'Argelia', 19),
(19075, 'Balboa', 19),
(19100, 'Bolivar', 19),
(19110, 'Buenos Aires', 19),
(19130, 'Cajibio', 19),
(19137, 'Caldono', 19),
(19142, 'Caloto', 19),
(19212, 'Corinto', 19),
(19256, 'El Tambo', 19),
(19290, 'Florencia', 19),
(19300, 'Guachene', 19),
(19318, 'Guapi', 19),
(19355, 'Inza', 19),
(19364, 'Jambalo', 19),
(19392, 'La Sierra', 19),
(19397, 'La Vega', 19),
(19418, 'Lopez', 19),
(19450, 'Mercaderes', 19),
(19455, 'Miranda', 19),
(19473, 'Morales', 19),
(19513, 'Padilla', 19),
(19517, 'Paez', 19),
(19532, 'Patia', 19),
(19533, 'Piamonte', 19),
(19548, 'Piendamo', 19),
(19573, 'Puerto Tejada', 19),
(19585, 'Purace', 19),
(19622, 'Rosas', 19),
(19693, 'San Sebastian', 19),
(19698, 'Santander De Quilichao', 19),
(19701, 'Santa Rosa', 19),
(19743, 'Silvia', 19),
(19760, 'Sotara', 19),
(19780, 'Suarez', 19),
(19785, 'Sucre', 19),
(19807, 'Timbio', 19),
(19809, 'Timbiqui', 19),
(19821, 'Toribio', 19),
(19824, 'Totoro', 19),
(19845, 'Villa Rica', 19),
(20001, 'Valledupar', 20),
(20011, 'Aguachica', 20),
(20013, 'Agustin Codazzi', 20),
(20032, 'Astrea', 20),
(20045, 'Becerril', 20),
(20060, 'Bosconia', 20),
(20175, 'Chimichagua', 20),
(20178, 'Chiriguana', 20),
(20228, 'Curumani', 20),
(20238, 'El Copey', 20),
(20250, 'El Paso', 20),
(20295, 'Gamarra', 20),
(20310, 'Gonzalez', 20),
(20383, 'La Gloria', 20),
(20400, 'La Jagua De Ibirico', 20),
(20443, 'Manaure', 20),
(20517, 'Pailitas', 20),
(20550, 'Pelaya', 20),
(20570, 'Pueblo Bello', 20),
(20614, 'Rio De Oro', 20),
(20621, 'La Paz', 20),
(20710, 'San Alberto', 20),
(20750, 'San Diego', 20),
(20770, 'San Martin', 20),
(20787, 'Tamalameque', 20),
(23001, 'Monteria', 23),
(23068, 'Ayapel', 23),
(23079, 'Buenavista', 23),
(23090, 'Canalete', 23),
(23162, 'Cerete', 23),
(23168, 'Chima', 23),
(23182, 'Chinu', 23),
(23189, 'Cienaga De Oro', 23),
(23300, 'Cotorra', 23),
(23350, 'La Apartada', 23),
(23417, 'Lorica', 23),
(23419, 'Los Cordobas', 23),
(23464, 'Momil', 23),
(23466, 'Montelibano', 23),
(23500, 'Moñitos', 23),
(23555, 'Planeta Rica', 23),
(23570, 'Pueblo Nuevo', 23),
(23574, 'Puerto Escondido', 23),
(23580, 'Puerto Libertador', 23),
(23586, 'Purisima', 23),
(23660, 'Sahagun', 23),
(23670, 'San Andres Sotavento', 23),
(23672, 'San Antero', 23),
(23675, 'San Bernardo Del Viento', 23),
(23678, 'San Carlos', 23),
(23686, 'San Pelayo', 23),
(23807, 'Tierralta', 23),
(23855, 'Valencia', 23),
(25001, 'Agua De Dios', 25),
(25019, 'Alban', 25),
(25035, 'Anapoima', 25),
(25040, 'Anolaima', 25),
(25053, 'Arbelaez', 25),
(25086, 'Beltran', 25),
(25095, 'Bituima', 25),
(25099, 'Bojaca', 25),
(25120, 'Cabrera', 25),
(25123, 'Cachipay', 25),
(25126, 'Cajica', 25),
(25148, 'Caparrapi', 25),
(25151, 'Caqueza', 25),
(25154, 'Carmen De Carupa', 25),
(25168, 'Chaguani', 25),
(25175, 'Chia', 25),
(25178, 'Chipaque', 25),
(25181, 'Choachi', 25),
(25183, 'Choconta', 25),
(25200, 'Cogua', 25),
(25214, 'Cota', 25),
(25224, 'Cucunuba', 25),
(25245, 'El Colegio', 25),
(25258, 'El Peñon', 25),
(25260, 'El Rosal', 25),
(25269, 'Facatativa', 25),
(25279, 'Fomeque', 25),
(25281, 'Fosca', 25),
(25286, 'Funza', 25),
(25288, 'Fuquene', 25),
(25290, 'Fusagasuga', 25),
(25293, 'Gachala', 25),
(25295, 'Gachancipa', 25),
(25297, 'Gacheta', 25),
(25299, 'Gama', 25),
(25307, 'Girardot', 25),
(25312, 'Granada', 25),
(25317, 'Guacheta', 25),
(25320, 'Guaduas', 25),
(25322, 'Guasca', 25),
(25324, 'Guataqui', 25),
(25326, 'Guatavita', 25),
(25328, 'Guayabal De Siquima', 25),
(25335, 'Guayabetal', 25),
(25339, 'Gutierrez', 25),
(25368, 'Jerusalen', 25),
(25372, 'Junin', 25),
(25377, 'La Calera', 25),
(25386, 'La Mesa', 25),
(25394, 'La Palma', 25),
(25398, 'La Peña', 25),
(25402, 'La Vega', 25),
(25407, 'Lenguazaque', 25),
(25426, 'Macheta', 25),
(25430, 'Madrid', 25),
(25436, 'Manta', 25),
(25438, 'Medina', 25),
(25473, 'Mosquera', 25),
(25483, 'Nariño', 25),
(25486, 'Nemocon', 25),
(25488, 'Nilo', 25),
(25489, 'Nimaima', 25),
(25491, 'Nocaima', 25),
(25506, 'Venecia', 25),
(25513, 'Pacho', 25),
(25518, 'Paime', 25),
(25524, 'Pandi', 25),
(25530, 'Paratebueno', 25),
(25535, 'Pasca', 25),
(25572, 'Puerto Salgar', 25),
(25580, 'Puli', 25),
(25592, 'Quebradanegra', 25),
(25594, 'Quetame', 25),
(25596, 'Quipile', 25),
(25599, 'Apulo', 25),
(25612, 'Ricaurte', 25),
(25645, 'San Antonio Del Tequendama', 25),
(25649, 'San Bernardo', 25),
(25653, 'San Cayetano', 25),
(25658, 'San Francisco', 25),
(25662, 'San Juan De Rio Seco', 25),
(25718, 'Sasaima', 25),
(25736, 'Sesquile', 25),
(25740, 'Sibate', 25),
(25743, 'Silvania', 25),
(25745, 'Simijaca', 25),
(25754, 'Soacha', 25),
(25758, 'Sopo', 25),
(25769, 'Subachoque', 25),
(25772, 'Suesca', 25),
(25777, 'Supata', 25),
(25779, 'Susa', 25),
(25781, 'Sutatausa', 25),
(25785, 'Tabio', 25),
(25793, 'Tausa', 25),
(25797, 'Tena', 25),
(25799, 'Tenjo', 25),
(25805, 'Tibacuy', 25),
(25807, 'Tibirita', 25),
(25815, 'Tocaima', 25),
(25817, 'Tocancipa', 25),
(25823, 'Topaipi', 25),
(25839, 'Ubala', 25),
(25841, 'Ubaque', 25),
(25843, 'Villa De San Diego De Ubate', 25),
(25845, 'Une', 25),
(25851, 'Utica', 25),
(25862, 'Vergara', 25),
(25867, 'Viani', 25),
(25871, 'Villagomez', 25),
(25873, 'Villapinzon', 25),
(25875, 'Villeta', 25),
(25878, 'Viota', 25),
(25885, 'Yacopi', 25),
(25898, 'Zipacon', 25),
(25899, 'Zipaquira', 25),
(27001, 'Quibdo', 27),
(27006, 'Acandi', 27),
(27025, 'Alto Baudo', 27),
(27050, 'Atrato', 27),
(27073, 'Bagado', 27),
(27075, 'Bahia Solano', 27),
(27077, 'Bajo Baudo', 27),
(27099, 'Bojaya', 27),
(27135, 'El Canton Del San Pablo', 27),
(27150, 'Carmen Del Darien', 27),
(27160, 'Certegui', 27),
(27205, 'Condoto', 27),
(27245, 'El Carmen De Atrato', 27),
(27250, 'El Litoral Del San Juan', 27),
(27361, 'Istmina', 27),
(27372, 'Jurado', 27),
(27413, 'Lloro', 27),
(27425, 'Medio Atrato', 27),
(27430, 'Medio Baudo', 27),
(27450, 'Medio San Juan', 27),
(27491, 'Novita', 27),
(27495, 'Nuqui', 27),
(27580, 'Rio Iro', 27),
(27600, 'Rio Quito', 27),
(27615, 'Riosucio', 27),
(27660, 'San Jose Del Palmar', 27),
(27745, 'Sipi', 27),
(27787, 'Tado', 27),
(27800, 'Unguia', 27),
(27810, 'Union Panamericana', 27),
(41001, 'Neiva', 41),
(41006, 'Acevedo', 41),
(41013, 'Agrado', 41),
(41016, 'Aipe', 41),
(41020, 'Algeciras', 41),
(41026, 'Altamira', 41),
(41078, 'Baraya', 41),
(41132, 'Campoalegre', 41),
(41206, 'Colombia', 41),
(41244, 'Elias', 41),
(41298, 'Garzon', 41),
(41306, 'Gigante', 41),
(41319, 'Guadalupe', 41),
(41349, 'Hobo', 41),
(41357, 'Iquira', 41),
(41359, 'Isnos', 41),
(41378, 'La Argentina', 41),
(41396, 'La Plata', 41),
(41483, 'Nataga', 41),
(41503, 'Oporapa', 41),
(41518, 'Paicol', 41),
(41524, 'Palermo', 41),
(41530, 'Palestina', 41),
(41548, 'Pital', 41),
(41551, 'Pitalito', 41),
(41615, 'Rivera', 41),
(41660, 'Saladoblanco', 41),
(41668, 'San Agustin', 41),
(41676, 'Santa Maria', 41),
(41770, 'Suaza', 41),
(41791, 'Tarqui', 41),
(41797, 'Tesalia', 41),
(41799, 'Tello', 41),
(41801, 'Teruel', 41),
(41807, 'Timana', 41),
(41872, 'Villavieja', 41),
(41885, 'Yaguara', 41),
(44001, 'Riohacha', 44),
(44035, 'Albania', 44),
(44078, 'Barrancas', 44),
(44090, 'Dibulla', 44),
(44098, 'Distraccion', 44),
(44110, 'El Molino', 44),
(44279, 'Fonseca', 44),
(44378, 'Hatonuevo', 44),
(44420, 'La Jagua Del Pilar', 44),
(44430, 'Maicao', 44),
(44560, 'Manaure', 44),
(44650, 'San Juan Del Cesar', 44),
(44847, 'Uribia', 44),
(44855, 'Urumita', 44),
(44874, 'Villanueva', 44),
(47001, 'Santa Marta', 47),
(47030, 'Algarrobo', 47),
(47053, 'Aracataca', 47),
(47058, 'Ariguani', 47),
(47161, 'Cerro San Antonio', 47),
(47170, 'Chibolo', 47),
(47189, 'Cienaga', 47),
(47205, 'Concordia', 47),
(47245, 'El Banco', 47),
(47258, 'El Piñon', 47),
(47268, 'El Reten', 47),
(47288, 'Fundacion', 47),
(47318, 'Guamal', 47),
(47460, 'Nueva Granada', 47),
(47541, 'Pedraza', 47),
(47545, 'Pijiño Del Carmen', 47),
(47551, 'Pivijay', 47),
(47555, 'Plato', 47),
(47570, 'Puebloviejo', 47),
(47605, 'Remolino', 47),
(47660, 'Sabanas De San Angel', 47),
(47675, 'Salamina', 47),
(47692, 'San Sebastian De Buenavista', 47),
(47703, 'San Zenon', 47),
(47707, 'Santa Ana', 47),
(47720, 'Santa Barbara De Pinto', 47),
(47745, 'Sitionuevo', 47),
(47798, 'Tenerife', 47),
(47960, 'Zapayan', 47),
(47980, 'Zona Bananera', 47),
(50001, 'Villavicencio', 50),
(50006, 'Acacias', 50),
(50110, 'Barranca De Upia', 50),
(50124, 'Cabuyaro', 50),
(50150, 'Castilla La Nueva', 50),
(50223, 'Cubarral', 50),
(50226, 'Cumaral', 50),
(50245, 'El Calvario', 50),
(50251, 'El Castillo', 50),
(50270, 'El Dorado', 50),
(50287, 'Fuente De Oro', 50),
(50313, 'Granada', 50),
(50318, 'Guamal', 50),
(50325, 'Mapiripan', 50),
(50330, 'Mesetas', 50),
(50350, 'La Macarena', 50),
(50370, 'Uribe', 50),
(50400, 'Lejanias', 50),
(50450, 'Puerto Concordia', 50),
(50568, 'Puerto Gaitan', 50),
(50573, 'Puerto Lopez', 50),
(50577, 'Puerto Lleras', 50),
(50590, 'Puerto Rico', 50),
(50606, 'Restrepo', 50),
(50680, 'San Carlos De Guaroa', 50),
(50683, 'San Juan De Arama', 50),
(50686, 'San Juanito', 50),
(50689, 'San Martin', 50),
(50711, 'Vistahermosa', 50),
(52001, 'Pasto', 52),
(52019, 'Alban', 52),
(52022, 'Aldana', 52),
(52036, 'Ancuya', 52),
(52051, 'Arboleda', 52),
(52079, 'Barbacoas', 52),
(52083, 'Belen', 52),
(52110, 'Buesaco', 52),
(52203, 'Colon', 52),
(52207, 'Consaca', 52),
(52210, 'Contadero', 52),
(52215, 'Cordoba', 52),
(52224, 'Cuaspud', 52),
(52227, 'Cumbal', 52),
(52233, 'Cumbitara', 52),
(52240, 'Chachagsi', 52),
(52250, 'El Charco', 52),
(52254, 'El Peñol', 52),
(52256, 'El Rosario', 52),
(52258, 'El Tablon De Gomez', 52),
(52260, 'El Tambo', 52),
(52287, 'Funes', 52),
(52317, 'Guachucal', 52),
(52320, 'Guaitarilla', 52),
(52323, 'Gualmatan', 52),
(52352, 'Iles', 52),
(52354, 'Imues', 52),
(52356, 'Ipiales', 52),
(52378, 'La Cruz', 52),
(52381, 'La Florida', 52),
(52385, 'La Llanada', 52),
(52390, 'La Tola', 52),
(52399, 'La Union', 52),
(52405, 'Leiva', 52),
(52411, 'Linares', 52),
(52418, 'Los Andes', 52),
(52427, 'Magsi', 52),
(52435, 'Mallama', 52),
(52473, 'Mosquera', 52),
(52480, 'Nariño', 52),
(52490, 'Olaya Herrera', 52),
(52506, 'Ospina', 52),
(52520, 'Francisco Pizarro', 52),
(52540, 'Policarpa', 52),
(52560, 'Potosi', 52),
(52565, 'Providencia', 52),
(52573, 'Puerres', 52),
(52585, 'Pupiales', 52),
(52612, 'Ricaurte', 52),
(52621, 'Roberto Payan', 52),
(52678, 'Samaniego', 52),
(52683, 'Sandona', 52),
(52685, 'San Bernardo', 52),
(52687, 'San Lorenzo', 52),
(52693, 'San Pablo', 52),
(52694, 'San Pedro De Cartago', 52),
(52696, 'Santa Barbara', 52),
(52699, 'Santacruz', 52),
(52720, 'Sapuyes', 52),
(52786, 'Taminango', 52),
(52788, 'Tangua', 52),
(52835, 'San Andres De Tumaco', 52),
(52838, 'Tuquerres', 52),
(52885, 'Yacuanquer', 52),
(54001, 'Cucuta', 54),
(54003, 'Abrego', 54),
(54051, 'Arboledas', 54),
(54099, 'Bochalema', 54),
(54109, 'Bucarasica', 54),
(54125, 'Cacota', 54),
(54128, 'Cachira', 54),
(54172, 'Chinacota', 54),
(54174, 'Chitaga', 54),
(54206, 'Convencion', 54),
(54223, 'Cucutilla', 54),
(54239, 'Durania', 54),
(54245, 'El Carmen', 54),
(54250, 'El Tarra', 54),
(54261, 'El Zulia', 54),
(54313, 'Gramalote', 54),
(54344, 'Hacari', 54),
(54347, 'Herran', 54),
(54377, 'Labateca', 54),
(54385, 'La Esperanza', 54),
(54398, 'La Playa', 54),
(54405, 'Los Patios', 54),
(54418, 'Lourdes', 54),
(54480, 'Mutiscua', 54),
(54498, 'Ocaña', 54),
(54518, 'Pamplona', 54),
(54520, 'Pamplonita', 54),
(54553, 'Puerto Santander', 54),
(54599, 'Ragonvalia', 54),
(54660, 'Salazar', 54),
(54670, 'San Calixto', 54),
(54673, 'San Cayetano', 54),
(54680, 'Santiago', 54),
(54720, 'Sardinata', 54),
(54743, 'Silos', 54),
(54800, 'Teorama', 54),
(54810, 'Tibu', 54),
(54820, 'Toledo', 54),
(54871, 'Villa Caro', 54),
(54874, 'Villa Del Rosario', 54),
(63001, 'Armenia', 63),
(63111, 'Buenavista', 63),
(63130, 'Calarca', 63),
(63190, 'Circasia', 63),
(63212, 'Cordoba', 63),
(63272, 'Filandia', 63),
(63302, 'Genova', 63),
(63401, 'La Tebaida', 63),
(63470, 'Montenegro', 63),
(63548, 'Pijao', 63),
(63594, 'Quimbaya', 63),
(63690, 'Salento', 63),
(66001, 'Pereira', 66),
(66045, 'Apia', 66),
(66075, 'Balboa', 66),
(66088, 'Belen De Umbria', 66),
(66170, 'Dosquebradas', 66),
(66318, 'Guatica', 66),
(66383, 'La Celia', 66),
(66400, 'La Virginia', 66),
(66440, 'Marsella', 66),
(66456, 'Mistrato', 66),
(66572, 'Pueblo Rico', 66),
(66594, 'Quinchia', 66),
(66682, 'Santa Rosa De Cabal', 66),
(66687, 'Santuario', 66),
(68001, 'Bucaramanga', 68),
(68013, 'Aguada', 68),
(68020, 'Albania', 68),
(68051, 'Aratoca', 68),
(68077, 'Barbosa', 68),
(68079, 'Barichara', 68),
(68081, 'Barrancabermeja', 68),
(68092, 'Betulia', 68),
(68101, 'Bolivar', 68),
(68121, 'Cabrera', 68),
(68132, 'California', 68),
(68147, 'Capitanejo', 68),
(68152, 'Carcasi', 68),
(68160, 'Cepita', 68),
(68162, 'Cerrito', 68),
(68167, 'Charala', 68),
(68169, 'Charta', 68),
(68176, 'Chima', 68),
(68179, 'Chipata', 68),
(68190, 'Cimitarra', 68),
(68207, 'Concepcion', 68),
(68209, 'Confines', 68),
(68211, 'Contratacion', 68),
(68217, 'Coromoro', 68),
(68229, 'Curiti', 68),
(68235, 'El Carmen De Chucuri', 68),
(68245, 'El Guacamayo', 68),
(68250, 'El Peñon', 68),
(68255, 'El Playon', 68),
(68264, 'Encino', 68),
(68266, 'Enciso', 68),
(68271, 'Florian', 68),
(68276, 'Floridablanca', 68),
(68296, 'Galan', 68),
(68298, 'Gambita', 68),
(68307, 'Giron', 68),
(68318, 'Guaca', 68),
(68320, 'Guadalupe', 68),
(68322, 'Guapota', 68),
(68324, 'Guavata', 68),
(68327, 'Gsepsa', 68),
(68344, 'Hato', 68),
(68368, 'Jesus Maria', 68),
(68370, 'Jordan', 68),
(68377, 'La Belleza', 68),
(68385, 'Landazuri', 68),
(68397, 'La Paz', 68),
(68406, 'Lebrija', 68),
(68418, 'Los Santos', 68),
(68425, 'Macaravita', 68),
(68432, 'Malaga', 68),
(68444, 'Matanza', 68),
(68464, 'Mogotes', 68),
(68468, 'Molagavita', 68),
(68498, 'Ocamonte', 68),
(68500, 'Oiba', 68),
(68502, 'Onzaga', 68),
(68522, 'Palmar', 68),
(68524, 'Palmas Del Socorro', 68),
(68533, 'Paramo', 68),
(68547, 'Piedecuesta', 68),
(68549, 'Pinchote', 68),
(68572, 'Puente Nacional', 68),
(68573, 'Puerto Parra', 68),
(68575, 'Puerto Wilches', 68),
(68615, 'Rionegro', 68),
(68655, 'Sabana De Torres', 68),
(68669, 'San Andres', 68),
(68673, 'San Benito', 68),
(68679, 'San Gil', 68),
(68682, 'San Joaquin', 68),
(68684, 'San Jose De Miranda', 68),
(68686, 'San Miguel', 68),
(68689, 'San Vicente De Chucuri', 68),
(68705, 'Santa Barbara', 68),
(68720, 'Santa Helena Del Opon', 68),
(68745, 'Simacota', 68),
(68755, 'Socorro', 68),
(68770, 'Suaita', 68),
(68773, 'Sucre', 68),
(68780, 'Surata', 68),
(68820, 'Tona', 68),
(68855, 'Valle De San Jose', 68),
(68861, 'Velez', 68),
(68867, 'Vetas', 68),
(68872, 'Villanueva', 68),
(68895, 'Zapatoca', 68),
(70001, 'Sincelejo', 70),
(70110, 'Buenavista', 70),
(70124, 'Caimito', 70),
(70204, 'Coloso', 70),
(70215, 'Corozal', 70),
(70221, 'Coveñas', 70),
(70230, 'Chalan', 70),
(70233, 'El Roble', 70),
(70235, 'Galeras', 70),
(70265, 'Guaranda', 70),
(70400, 'La Union', 70),
(70418, 'Los Palmitos', 70),
(70429, 'Majagual', 70),
(70473, 'Morroa', 70),
(70508, 'Ovejas', 70),
(70523, 'Palmito', 70),
(70670, 'Sampues', 70),
(70678, 'San Benito Abad', 70),
(70702, 'San Juan De Betulia', 70),
(70708, 'San Marcos', 70),
(70713, 'San Onofre', 70),
(70717, 'San Pedro', 70),
(70742, 'San Luis De Since', 70),
(70771, 'Sucre', 70),
(70820, 'Santiago De Tolu', 70),
(70823, 'Tolu Viejo', 70),
(73001, 'Ibague', 73),
(73024, 'Alpujarra', 73),
(73026, 'Alvarado', 73),
(73030, 'Ambalema', 73),
(73043, 'Anzoategui', 73),
(73055, 'Armero', 73),
(73067, 'Ataco', 73),
(73124, 'Cajamarca', 73),
(73148, 'Carmen De Apicala', 73),
(73152, 'Casabianca', 73),
(73168, 'Chaparral', 73),
(73200, 'Coello', 73),
(73217, 'Coyaima', 73),
(73226, 'Cunday', 73),
(73236, 'Dolores', 73),
(73268, 'Espinal', 73),
(73270, 'Falan', 73),
(73275, 'Flandes', 73),
(73283, 'Fresno', 73),
(73319, 'Guamo', 73),
(73347, 'Herveo', 73),
(73349, 'Honda', 73),
(73352, 'Icononzo', 73),
(73408, 'Lerida', 73),
(73411, 'Libano', 73),
(73443, 'Mariquita', 73),
(73449, 'Melgar', 73),
(73461, 'Murillo', 73),
(73483, 'Natagaima', 73),
(73504, 'Ortega', 73),
(73520, 'Palocabildo', 73),
(73547, 'Piedras', 73),
(73555, 'Planadas', 73),
(73563, 'Prado', 73),
(73585, 'Purificacion', 73),
(73616, 'Rioblanco', 73),
(73622, 'Roncesvalles', 73),
(73624, 'Rovira', 73),
(73671, 'Saldaña', 73),
(73675, 'San Antonio', 73),
(73678, 'San Luis', 73),
(73686, 'Santa Isabel', 73),
(73770, 'Suarez', 73),
(73854, 'Valle De San Juan', 73),
(73861, 'Venadillo', 73),
(73870, 'Villahermosa', 73),
(73873, 'Villarrica', 73),
(76001, 'Cali', 76),
(76020, 'Alcala', 76),
(76036, 'Andalucia', 76),
(76041, 'Ansermanuevo', 76),
(76054, 'Argelia', 76),
(76100, 'Bolivar', 76),
(76109, 'Buenaventura', 76),
(76111, 'Guadalajara De Buga', 76),
(76113, 'Bugalagrande', 76),
(76122, 'Caicedonia', 76),
(76126, 'Calima', 76),
(76130, 'Candelaria', 76),
(76147, 'Cartago', 76),
(76233, 'Dagua', 76),
(76243, 'El Aguila', 76),
(76246, 'El Cairo', 76),
(76248, 'El Cerrito', 76),
(76250, 'El Dovio', 76),
(76275, 'Florida', 76),
(76306, 'Ginebra', 76),
(76318, 'Guacari', 76),
(76364, 'Jamundi', 76),
(76377, 'La Cumbre', 76),
(76400, 'La Union', 76),
(76403, 'La Victoria', 76),
(76497, 'Obando', 76),
(76520, 'Palmira', 76),
(76563, 'Pradera', 76),
(76606, 'Restrepo', 76),
(76616, 'Riofrio', 76),
(76622, 'Roldanillo', 76),
(76670, 'San Pedro', 76),
(76736, 'Sevilla', 76),
(76823, 'Toro', 76),
(76828, 'Trujillo', 76),
(76834, 'Tulua', 76),
(76845, 'Ulloa', 76),
(76863, 'Versalles', 76),
(76869, 'Vijes', 76),
(76890, 'Yotoco', 76),
(76892, 'Yumbo', 76),
(76895, 'Zarzal', 76),
(81001, 'Arauca', 81),
(81065, 'Arauquita', 81),
(81220, 'Cravo Norte', 81),
(81300, 'Fortul', 81),
(81591, 'Puerto Rondon', 81),
(81736, 'Saravena', 81),
(81794, 'Tame', 81),
(85001, 'Yopal', 85),
(85010, 'Aguazul', 85),
(85015, 'Chameza', 85),
(85125, 'Hato Corozal', 85),
(85136, 'La Salina', 85),
(85139, 'Mani', 85),
(85162, 'Monterrey', 85),
(85225, 'Nunchia', 85),
(85230, 'Orocue', 85),
(85250, 'Paz De Ariporo', 85),
(85263, 'Pore', 85),
(85279, 'Recetor', 85),
(85300, 'Sabanalarga', 85),
(85315, 'Sacama', 85),
(85325, 'San Luis De Palenque', 85),
(85400, 'Tamara', 85),
(85410, 'Tauramena', 85),
(85430, 'Trinidad', 85),
(85440, 'Villanueva', 85),
(86001, 'Mocoa', 86),
(86219, 'Colon', 86),
(86320, 'Orito', 86),
(86568, 'Puerto Asis', 86),
(86569, 'Puerto Caicedo', 86),
(86571, 'Puerto Guzman', 86),
(86573, 'Leguizamo', 86),
(86749, 'Sibundoy', 86),
(86755, 'San Francisco', 86),
(86757, 'San Miguel', 86),
(86760, 'Santiago', 86),
(86865, 'Valle Del Guamuez', 86),
(86885, 'Villagarzon', 86),
(88001, 'San Andres', 88),
(88564, 'Providencia', 88),
(91001, 'Leticia', 91),
(91263, 'El Encanto', 91),
(91405, 'La Chorrera', 91),
(91407, 'La Pedrera', 91),
(91430, 'La Victoria', 91),
(91460, 'Miriti - Parana', 91),
(91530, 'Puerto Alegria', 91),
(91536, 'Puerto Arica', 91),
(91540, 'Puerto Nariño', 91),
(91669, 'Puerto Santander', 91),
(91798, 'Tarapaca', 91),
(94001, 'Inirida', 94),
(94343, 'Barranco Minas', 94),
(94663, 'Mapiripana', 94),
(94883, 'San Felipe', 94),
(94884, 'Puerto Colombia', 94),
(94885, 'La Guadalupe', 94),
(94886, 'Cacahual', 94),
(94887, 'Pana Pana', 94),
(94888, 'Morichal', 94),
(95001, 'San Jose Del Guaviare', 95),
(95015, 'Calamar', 95),
(95025, 'El Retorno', 95),
(95200, 'Miraflores', 95),
(97001, 'Mitu', 97),
(97161, 'Caruru', 97),
(97511, 'Pacoa', 97),
(97666, 'Taraira', 97),
(97777, 'Papunaua', 97),
(97889, 'Yavarate', 97),
(99001, 'Puerto Carreño', 99),
(99524, 'La Primavera', 99),
(99624, 'Santa Rosalia', 99),
(99773, 'Cumaribo', 99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(4) UNSIGNED ZEROFILL NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `productcode` varchar(250) COLLATE utf8_bin NOT NULL,
  `items` text COLLATE utf8_bin NOT NULL,
  `price` text COLLATE utf8_bin,
  `qty` text COLLATE utf8_bin,
  `total` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `category` text COLLATE utf8_bin NOT NULL,
  `notes` text COLLATE utf8_bin,
  `status` enum('sin_pagar','pago','pausado') COLLATE utf8_bin NOT NULL DEFAULT 'sin_pagar',
  `delivery` enum('sin_entregar','entregado') COLLATE utf8_bin NOT NULL DEFAULT 'sin_entregar',
  `created_by` int(11) DEFAULT NULL,
  `registered_on` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `productcode`, `items`, `price`, `qty`, `total`, `category`, `notes`, `status`, `delivery`, `created_by`, `registered_on`, `updated_on`) VALUES
(0001, 1, '[\"RH-M001\",\"RH-M004\",\"RH-M2403\"]', '[\"RH Melamina Sahara\",\"RH Melamina Nogal Amazonico\",\"RH Melamina Blanco\"]', '[\"4000\",\"3000\",\"1000\"]', '[\"4\",\"3\",\"1\"]', '[\"16000.00\",\"9000.00\",\"1000.00\"]', '', '<ul><li>Lorem ipsum dolor sit amet.</li> <li>Et turpis convallis conubia.</li> <li>Facilisi non dignissim suscipit.</li> <li>Faucibus fames donec non.</li><li>Faucibus fames donec non.</li></ul>', 'pago', 'sin_entregar', 1, '2023-08-08 21:33:07', '2023-08-08 21:33:07'),
(0008, 3, '[\"06140\",\"06131\"]', '[\"COLCH EMPERADOR PLUS D 100 120 X 190 X 25\",\"COLCHON EMPERADOR PLUS DENSIDAD 100 100 X 190 X 30 JAC\"]', '[\"1000.00\",\"1000.00\"]', '[\"2\",\"1\"]', '[\"2000.00\",\"1000.00\"]', '', NULL, 'sin_pagar', 'sin_entregar', 1, NULL, '2023-08-07 16:55:19'),
(0009, 1, '[\"00006\",\"00003\"]', '[\"CASTA\\u00d1O BLANCO RH 15\",\"CEDRO PORON RH 15\"]', '[\"1000.00\",\"1000.00\"]', '[\"2\",\"1\"]', '[\"2000.00\",\"1000\"]', '', NULL, 'sin_pagar', 'sin_entregar', 1, NULL, '2023-08-07 16:57:39'),
(0010, 5, '[\"00005\",\"00007\",\"00431\"]', '[\"CARVALO RH 15\",\"CAVA RH 15\",\"TORNILLO DRYWALL 3\\/4\"]', '[\"1000.00\",\"1000.00\",\"1000.00\"]', '[\"2\",\"1\",\"20\"]', '[\"2000.00\",\"1000\",\"20000.00\"]', '', 'Lorem ipsum dolor sit amet consectetur adipiscing elit mattis quam, sociis mi mauris habitasse congue rhoncus dapibus posuere', 'sin_pagar', 'sin_entregar', 1, '2023-08-07 10:03:53', '2023-08-07 17:03:53'),
(0011, 3, '[\"00003\"]', '[\"CEDRO PORON RH 15\"]', '[\"1000.00\"]', '[\"2\"]', '[\"2000.00\"]', '', 'None', 'sin_pagar', 'sin_entregar', 1, '2023-08-09 03:01:37', '2023-08-08 22:01:37'),
(0012, 2, '[\"00002\"]', '[\"BLANCO MASISA RH 15\"]', '[\"1000.00\"]', '[\"1\"]', '[\"1000\"]', '[\"TABLEROS \"]', 'none', 'sin_pagar', 'sin_entregar', 1, '2023-08-12 12:18:06', '2023-08-12 07:18:06'),
(0013, 5, '[\"00008\",\"00014\",\"00002\"]', '[\"FRESNO HUMO RH 15\",\"SAHARA RH 15\",\"BLANCO MASISA RH 15\"]', '[\"1000.00\",\"1000.00\",\"1000.00\"]', '[\"4\",\"3\",\"7\"]', '[\"4000.00\",\"3000.00\",\"7000.00\"]', '[\"TABLEROS \",\"TABLEROS \",\"TABLEROS \"]', 'Nada', 'pago', 'entregado', 1, '2023-08-14 01:56:21', '2023-08-13 20:56:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_receipts`
--

CREATE TABLE `payment_receipts` (
  `receipt_id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payroll`
--

CREATE TABLE `payroll` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `salario_base` decimal(10,2) DEFAULT NULL,
  `dias_trabajados` int(11) DEFAULT NULL,
  `deducciones` decimal(10,2) DEFAULT NULL,
  `bonificaciones` decimal(10,2) DEFAULT NULL,
  `total_pago` decimal(10,2) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `productCode` varchar(15) COLLATE utf8_bin NOT NULL,
  `productName` varchar(70) COLLATE utf8_bin NOT NULL,
  `productDescription` mediumtext COLLATE utf8_bin NOT NULL,
  `productImage` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `quantityInStock` smallint(6) NOT NULL,
  `buyPrice` double NOT NULL,
  `mrp` double NOT NULL,
  `uuid` varchar(65) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `productCode`, `productName`, `productDescription`, `productImage`, `quantityInStock`, `buyPrice`, `mrp`, `uuid`) VALUES
(1, 'S10_167', '1969 Harley Davidson Ultimate Chopper', 'This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.', '', 7931, 48.81, 95.7, '36fc7436-1ba0-11e5-93b7-b870f4adf235'),
(2, 'S10_1949', '1952 Alpine Renault 1300', 'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', '', 7190, 98.58, 214.3, '36fda74a-1ba0-11e5-93b7-b870f4adf235'),
(3, 'S10_2016', '1996 Moto Guzzi 1100i', 'Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', '', 6624, 68.99, 118.94, '36fda8bf-1ba0-11e5-93b7-b870f4adf235'),
(4, 'S10_4698', '2003 Harley-Davidson Eagle Drag Bike', 'Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\r\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine', '', 5570, 91.02, 193.66, '36fda9f7-1ba0-11e5-93b7-b870f4adf235'),
(5, 'S10_4757', '1972 Alfa Romeo GTA', 'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', '', 3252, 85.68, 136, '36fdd090-1ba0-11e5-93b7-b870f4adf235'),
(6, 'S10_4962', '1962 LanciaA Delta 16V', 'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', '', 6791, 103.42, 147.74, '36fdd1c9-1ba0-11e5-93b7-b870f4adf235'),
(7, 'S12_1099', '1968 Ford Mustang', 'Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.', '', 68, 95.34, 194.57, '36fdd2ce-1ba0-11e5-93b7-b870f4adf235'),
(8, 'S12_1108', '2001 Ferrari Enzo', 'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', '', 3619, 95.59, 207.8, '36fdd3ae-1ba0-11e5-93b7-b870f4adf235'),
(9, 'S12_1666', '1958 Setra Bus', 'Model features 30 windows, skylights & glare resistant glass, working steering system, original logos', '', 1579, 77.9, 136.67, '36fdd480-1ba0-11e5-93b7-b870f4adf235'),
(10, 'S12_2823', '2002 Suzuki XREO', 'Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', '', 9996, 66.27, 150.62, '36fdd560-1ba0-11e5-93b7-b870f4adf235'),
(11, 'S12_3148', '1969 Corvair Monza', '1:18 scale die-cast about 10\" long doors open, hood opens, trunk opens and wheels roll', '', 6906, 89.14, 151.08, '36fdd64e-1ba0-11e5-93b7-b870f4adf235'),
(12, 'S12_3380', '1968 Dodge Charger', '1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black', '', 9123, 75.16, 117.44, '36fdd729-1ba0-11e5-93b7-b870f4adf235'),
(13, 'S12_3891', '1969 Ford Falcon', 'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', '', 1049, 83.05, 173.02, '36fdd7c3-1ba0-11e5-93b7-b870f4adf235'),
(14, 'S12_3990', '1970 Plymouth Hemi Cuda', 'Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.', '', 5663, 31.92, 79.8, '36fdd853-1ba0-11e5-93b7-b870f4adf235'),
(15, 'S12_4473', '1957 Chevy Pickup', '1:12 scale die-cast about 20\" long Hood opens, Rubber wheels', '', 6125, 55.7, 118.5, '36fdd8ed-1ba0-11e5-93b7-b870f4adf235'),
(16, 'S12_4675', '1969 Dodge Charger', 'Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.', '', 7323, 58.73, 115.16, '36fdd983-1ba0-11e5-93b7-b870f4adf235'),
(17, 'S18_1097', '1940 Ford Pickup Truck', 'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', '', 2613, 58.33, 116.67, '36fdda13-1ba0-11e5-93b7-b870f4adf235'),
(18, 'S18_1129', '1993 Mazda RX-7', 'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.', '', 3975, 83.51, 141.54, '36fddac0-1ba0-11e5-93b7-b870f4adf235'),
(19, 'S18_1342', '1937 Lincoln Berline', 'Features opening engine cover, doors, trunk, and fuel filler cap. Color black', '', 8693, 60.62, 102.74, '36fddb55-1ba0-11e5-93b7-b870f4adf235'),
(20, 'S18_1367', '1936 Mercedes-Benz 500K Special Roadster', 'This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.', '', 8635, 24.26, 53.91, '36fddbef-1ba0-11e5-93b7-b870f4adf235'),
(21, 'S18_1589', '1965 Aston Martin DB5', 'Die-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.', '', 9042, 65.96, 124.44, '36fddc92-1ba0-11e5-93b7-b870f4adf235'),
(22, 'S18_1662', '1980s Black Hawk Helicopter', '1:18 scale replica of actual Army\'s UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.', '', 533, 77.27, 157.69, '36fddd28-1ba0-11e5-93b7-b870f4adf235'),
(23, 'S18_1749', '1917 Grand Touring Sedan', 'This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.', '', 2724, 86.7, 170, '36fdddbd-1ba0-11e5-93b7-b870f4adf235'),
(24, 'S18_1889', '1948 Porsche 356-A Roadster', 'This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', '', 8826, 53.9, 77, '36fdde52-1ba0-11e5-93b7-b870f4adf235'),
(25, 'S18_1984', '1995 Honda Civic', 'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.', '', 9772, 93.89, 142.25, '36fddee8-1ba0-11e5-93b7-b870f4adf235'),
(26, 'S18_2238', '1998 Chrysler Plymouth Prowler', 'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', '', 4724, 101.51, 163.73, '36fddf78-1ba0-11e5-93b7-b870f4adf235'),
(27, 'S18_2248', '1911 Ford Town Car', 'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system.', '', 540, 33.3, 60.54, '36fde01b-1ba0-11e5-93b7-b870f4adf235'),
(28, 'S18_2319', '1964 Mercedes Tour Bus', 'Exact replica. 100+ parts. working steering system, original logos', '', 8258, 74.86, 122.73, '36fde0b1-1ba0-11e5-93b7-b870f4adf235'),
(29, 'S18_2325', '1932 Model A Ford J-Coupe', 'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine', '', 9354, 58.48, 127.13, '36fde14f-1ba0-11e5-93b7-b870f4adf235'),
(30, 'S18_2432', '1926 Ford Fire Engine', 'Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.', '', 2018, 24.92, 60.77, '36fde1f7-1ba0-11e5-93b7-b870f4adf235'),
(31, 'S18_2581', 'P-51-D Mustang', 'Has retractable wheels and comes with a stand', '', 992, 49, 84.48, '36fde28d-1ba0-11e5-93b7-b870f4adf235'),
(32, 'S18_2625', '1936 Harley Davidson El Knucklehead', 'Intricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.', '', 4357, 24.23, 60.57, '36fde31d-1ba0-11e5-93b7-b870f4adf235'),
(33, 'S18_2795', '1928 Mercedes-Benz SSK', 'This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.', '', 548, 72.56, 168.75, '36fde3b2-1ba0-11e5-93b7-b870f4adf235'),
(34, 'S18_2870', '1999 Indy 500 Monte Carlo SS', 'Features include opening and closing doors. Color: Red', '', 8164, 56.76, 132, '36fde5af-1ba0-11e5-93b7-b870f4adf235'),
(35, 'S18_2949', '1913 Ford Model T Speedster', 'This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.', '', 4189, 60.78, 101.31, '36fde644-1ba0-11e5-93b7-b870f4adf235'),
(36, 'S18_2957', '1934 Ford V8 Coupe', 'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', '', 5649, 34.35, 62.46, '36fde6d5-1ba0-11e5-93b7-b870f4adf235'),
(37, 'S18_3029', '1999 Yamaha Speed Boat', 'Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', '', 4259, 51.61, 86.02, '36fde765-1ba0-11e5-93b7-b870f4adf235'),
(38, 'S18_3136', '18th Century Vintage Horse Carriage', 'Hand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts.\r\n\r\nThis collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.', '', 5992, 60.74, 104.72, '36fde987-1ba0-11e5-93b7-b870f4adf235'),
(39, 'S18_3140', '1903 Ford Model A', 'Features opening trunk,  working steering system', '', 3913, 68.3, 136.59, '36fdea2f-1ba0-11e5-93b7-b870f4adf235'),
(40, 'S18_3232', '1992 Ferrari 360 Spider red', 'his replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', '', 8347, 77.9, 169.34, '36fdeac5-1ba0-11e5-93b7-b870f4adf235'),
(41, 'S18_3233', '1985 Toyota Supra', 'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', '', 7733, 57.01, 107.57, '36fdecaa-1ba0-11e5-93b7-b870f4adf235'),
(42, 'S18_3259', 'Collectable Wooden Train', 'Hand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.', '', 6450, 67.56, 100.84, '36fded3a-1ba0-11e5-93b7-b870f4adf235'),
(43, 'S18_3278', '1969 Dodge Super Bee', 'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', '', 1917, 49.05, 80.41, '36fdedd0-1ba0-11e5-93b7-b870f4adf235'),
(44, 'S18_3320', '1917 Maxwell Touring Car', 'Features Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', '', 7913, 57.54, 99.21, '36fdefa2-1ba0-11e5-93b7-b870f4adf235'),
(45, 'S18_3482', '1976 Ford Gran Torino', 'Highly detailed 1976 Ford Gran Torino \"Starsky and Hutch\" diecast model. Very well constructed and painted in red and white patterns.', '', 9127, 73.49, 146.99, '36fdf03c-1ba0-11e5-93b7-b870f4adf235'),
(46, 'S18_3685', '1948 Porsche Type 356 Roadster', 'This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap,  and 4 opening doors.', '', 8990, 62.16, 141.28, '36fdf0cd-1ba0-11e5-93b7-b870f4adf235'),
(47, 'S18_3782', '1957 Vespa GS150', 'Features rotating wheels , working kick stand. Comes with stand.', '', 7689, 32.95, 62.17, '36fdf2b2-1ba0-11e5-93b7-b870f4adf235'),
(48, 'S18_3856', '1941 Chevrolet Special Deluxe Cabriolet', 'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.', '', 2378, 64.58, 105.87, '36fdf347-1ba0-11e5-93b7-b870f4adf235'),
(49, 'S18_4027', '1970 Triumph Spitfire', 'Features include opening and closing doors. Color: White.', '', 5545, 91.92, 143.62, '36fdf3dc-1ba0-11e5-93b7-b870f4adf235'),
(50, 'S18_4409', '1932 Alfa Romeo 8C2300 Spider Sport', 'This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.', '', 6553, 43.26, 92.03, '36fdf468-1ba0-11e5-93b7-b870f4adf235'),
(51, 'S18_4522', '1904 Buick Runabout', 'Features opening trunk,  working steering system', '', 8290, 52.66, 87.77, '36fdf644-1ba0-11e5-93b7-b870f4adf235'),
(52, 'S18_4600', '1940s Ford truck', 'This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940\'s Pick-Up truck is painted in classic dark green color, and features rotating wheels.', '', 3128, 84.76, 121.08, '36fdf6f6-1ba0-11e5-93b7-b870f4adf235'),
(53, 'S18_4668', '1939 Cadillac Limousine', 'Features completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles', '', 6645, 23.14, 50.31, '36fdf78b-1ba0-11e5-93b7-b870f4adf235'),
(54, 'S18_4721', '1957 Corvette Convertible', '1957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.', '', 1249, 69.93, 148.8, '36fdf96b-1ba0-11e5-93b7-b870f4adf235'),
(55, 'S18_4933', '1957 Ford Thunderbird', 'This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.', '', 3209, 34.21, 71.27, '36fdf9fc-1ba0-11e5-93b7-b870f4adf235'),
(56, 'S24_1046', '1970 Chevy Chevelle SS 454', 'This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.', '', 4, 49.24, 73.49, '36fe184f-1ba0-11e5-93b7-b870f4adf235'),
(57, 'S24_1444', '1970 Dodge Coronet', '1:24 scale die-cast about 18\" long doors open, hood opens and rubber wheels', '', 4054, 32.37, 57.8, '36fe1917-1ba0-11e5-93b7-b870f4adf235'),
(58, 'S24_1578', '1997 BMW R 1100 S', 'Detailed scale replica with working suspension and constructed from over 70 parts', '', 7003, 60.86, 112.7, '36fe1af3-1ba0-11e5-93b7-b870f4adf235'),
(59, 'S24_1628', '1966 Shelby Cobra 427 S/C', 'This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it\'s own display case.', '', 8196, 29.18, 50.31, '36fe1b96-1ba0-11e5-93b7-b870f4adf235'),
(60, 'S24_1785', '1928 British Royal Navy Airplane', 'Official logos and insignias', '', 3627, 66.74, 109.42, '36fe1d64-1ba0-11e5-93b7-b870f4adf235'),
(61, 'S24_1937', '1939 Chevrolet Deluxe Coupe', 'This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.', '', 7332, 22.57, 33.19, '36fe1df5-1ba0-11e5-93b7-b870f4adf235'),
(62, 'S24_2000', '1960 BSA Gold Star DBD34', 'Detailed scale replica with working suspension and constructed from over 70 parts', '', 0, 37.32, 76.17, '36fe1fbe-1ba0-11e5-93b7-b870f4adf235'),
(63, 'S24_2011', '18th century schooner', 'All wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.', '', 1888, 82.34, 122.89, '36fe204f-1ba0-11e5-93b7-b870f4adf235'),
(64, 'S24_2022', '1938 Cadillac V-16 Presidential Limousine', 'This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.', '', 2847, 20.61, 44.8, '36fe2218-1ba0-11e5-93b7-b870f4adf235'),
(65, 'S24_2300', '1962 Volkswagen Microbus', 'This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.', '', 2327, 61.34, 127.79, '36fe23f4-1ba0-11e5-93b7-b870f4adf235'),
(66, 'S24_2360', '1982 Ducati 900 Monster', 'Features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', '', 6840, 47.1, 69.26, '36fe25c6-1ba0-11e5-93b7-b870f4adf235'),
(67, 'S24_2766', '1949 Jaguar XK 120', 'Precision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', '', 2350, 47.25, 90.87, '36fe88b0-1ba0-11e5-93b7-b870f4adf235'),
(68, 'S24_2840', '1958 Chevy Corvette Limited Edition', 'The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.', '', 2542, 15.91, 35.36, '36fe8b9b-1ba0-11e5-93b7-b870f4adf235'),
(69, 'S24_2841', '1900s Vintage Bi-Plane', 'Hand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.', '', 5942, 34.25, 68.51, '36fe8d80-1ba0-11e5-93b7-b870f4adf235'),
(70, 'S24_2887', '1952 Citroen-15CV', 'Precision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.', '', 1452, 72.82, 117.44, '36fe8fa7-1ba0-11e5-93b7-b870f4adf235'),
(71, 'S24_2972', '1982 Lamborghini Diablo', 'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', '', 7723, 16.24, 37.76, '36fe91cd-1ba0-11e5-93b7-b870f4adf235'),
(72, 'S24_3151', '1912 Ford Model T Delivery Wagon', 'This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.', '', 9173, 46.91, 88.51, '36fe93e6-1ba0-11e5-93b7-b870f4adf235'),
(73, 'S24_3191', '1969 Chevrolet Camaro Z28', '1969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.', '', 4695, 50.51, 85.61, '36fe9603-1ba0-11e5-93b7-b870f4adf235'),
(74, 'S24_3371', '1971 Alpine Renault 1600s', 'This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', '', 7995, 38.58, 61.23, '36fe981b-1ba0-11e5-93b7-b870f4adf235'),
(75, 'S24_3420', '1937 Horch 930V Limousine', 'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system', '', 2902, 26.3, 65.75, '36fe9a34-1ba0-11e5-93b7-b870f4adf235'),
(76, 'S24_3432', '2002 Chevy Corvette', 'The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.', '', 9446, 62.11, 107.08, '36fe9c71-1ba0-11e5-93b7-b870f4adf235'),
(77, 'S24_3816', '1940 Ford Delivery Sedan', 'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.', '', 6621, 48.64, 83.86, '36fe9e8f-1ba0-11e5-93b7-b870f4adf235'),
(78, 'S24_3856', '1956 Porsche 356A Coupe', 'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', '', 6600, 98.3, 140.43, '36fedcae-1ba0-11e5-93b7-b870f4adf235'),
(79, 'S24_3949', 'Corsair F4U ( Bird Cage)', 'Has retractable wheels and comes with a stand. Official logos and insignias.', '', 6812, 29.34, 68.24, '36fedd7b-1ba0-11e5-93b7-b870f4adf235'),
(80, 'S24_3969', '1936 Mercedes Benz 500k Roadster', 'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.', '', 2081, 21.75, 41.03, '36fede15-1ba0-11e5-93b7-b870f4adf235'),
(81, 'S24_4048', '1992 Porsche Cayenne Turbo Silver', 'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', '', 6582, 69.78, 118.28, '36fedeaa-1ba0-11e5-93b7-b870f4adf235'),
(82, 'S24_4258', '1936 Chrysler Airflow', 'Features opening trunk,  working steering system. Color dark green.', '', 4710, 57.46, 97.39, '36fedf40-1ba0-11e5-93b7-b870f4adf235'),
(83, 'S24_4278', '1900s Vintage Tri-Plane', 'Hand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.', '', 2756, 36.23, 72.45, '36fedfd0-1ba0-11e5-93b7-b870f4adf235'),
(84, 'S24_4620', '1961 Chevrolet Impala', 'This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.', '', 7869, 32.33, 80.84, '36fee061-1ba0-11e5-93b7-b870f4adf235'),
(85, 'S32_1268', '1980’s GM Manhattan Express', 'This 1980’s era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.', '', 5099, 53.93, 96.31, '36fee109-1ba0-11e5-93b7-b870f4adf235'),
(86, 'S32_1374', '1997 BMW F650 ST', 'Features official die-struck logos and baked enamel finish. Comes with stand.', '', 178, 66.92, 99.89, '36fee1b1-1ba0-11e5-93b7-b870f4adf235'),
(87, 'S32_2206', '1982 Ducati 996 R', 'Features rotating wheels , working kick stand. Comes with stand.', '', 9241, 24.14, 40.23, '36fefa59-1ba0-11e5-93b7-b870f4adf235'),
(88, 'S32_2509', '1954 Greyhound Scenicruiser', 'Model features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos', '', 2874, 25.98, 54.11, '36fefb26-1ba0-11e5-93b7-b870f4adf235'),
(89, 'S32_3207', '1950\'s Chicago Surface Lines Streetcar', 'This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', '', 8601, 26.72, 62.14, '36fefbc0-1ba0-11e5-93b7-b870f4adf235'),
(90, 'S32_3522', '1996 Peterbilt 379 Stake Bed with Outrigger', 'This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab', '', 814, 33.61, 64.64, '36fefc5a-1ba0-11e5-93b7-b870f4adf235'),
(91, 'S32_4289', '1928 Ford Phaeton Deluxe', 'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system', '', 136, 33.02, 68.79, '36fefcf4-1ba0-11e5-93b7-b870f4adf235'),
(92, 'S32_4485', '1974 Ducati 350 Mk3 Desmo', 'This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', '', 3341, 56.13, 102.05, '36fefd85-1ba0-11e5-93b7-b870f4adf235'),
(93, 'S50_1341', '1930 Buick Marquette Phaeton', 'Features opening trunk,  working steering system', '', 7062, 27.06, 43.64, '36fefe10-1ba0-11e5-93b7-b870f4adf235'),
(94, 'S50_1392', 'Diamond T620 Semi-Skirted Tanker', 'This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.', '', 1016, 68.29, 115.75, '36ff0004-1ba0-11e5-93b7-b870f4adf235'),
(95, 'S50_1514', '1962 City of Detroit Streetcar', 'This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', '', 1645, 37.49, 58.58, '36ff00a7-1ba0-11e5-93b7-b870f4adf235'),
(96, 'S50_4713', '2002 Yamaha YZR M1', 'Features rotating wheels , working kick stand. Comes with stand.', '', 600, 34.17, 81.36, '36ff013c-1ba0-11e5-93b7-b870f4adf235'),
(97, 'S700_1138', 'The Schooner Bluenose', 'All wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras.\r\nThe schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.', '', 1897, 34, 66.67, '36ff01e4-1ba0-11e5-93b7-b870f4adf235'),
(98, 'S700_1691', 'American Airlines: B767-300', 'Exact replia with official logos and insignias and retractable wheels', '', 5841, 51.15, 91.34, '36ff028c-1ba0-11e5-93b7-b870f4adf235'),
(99, 'S700_1938', 'The Mayflower', 'Measures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches Wide\r\nAll wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.', '', 737, 43.3, 86.61, '36ff0463-1ba0-11e5-93b7-b870f4adf235'),
(100, 'S700_2047', 'HMS Bounty', 'Measures 30 inches Long x 27 1/2 inches High x 4 3/4 inches Wide. \r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', '', 3501, 39.83, 90.52, '36ff04f9-1ba0-11e5-93b7-b870f4adf235'),
(101, 'S700_2466', 'America West Airlines B757-200', 'Official logos and insignias. Working steering system. Rotating jet engines', '', 9653, 68.8, 99.72, '36ff058e-1ba0-11e5-93b7-b870f4adf235'),
(102, 'S700_2610', 'The USS Constitution Ship', 'All wood with canvas sails. Measures 31 1/2\" Length x 22 3/8\" High x 8 1/4\" Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.', '', 7083, 33.97, 72.28, '36ff061e-1ba0-11e5-93b7-b870f4adf235'),
(103, 'S700_2824', '1982 Camaro Z28', 'Features include opening and closing doors. Color: White. \r\nMeasures approximately 9 1/2\" Long.', '', 6934, 46.53, 101.15, '36ff06af-1ba0-11e5-93b7-b870f4adf235'),
(104, 'S700_2834', 'ATA: B757-300', 'Exact replia with official logos and insignias and retractable wheels', '', 7106, 59.33, 118.65, '36ff0740-1ba0-11e5-93b7-b870f4adf235'),
(105, 'S700_3167', 'F/A 18 Hornet 1/72', '10\" Wingspan with retractable landing gears.Comes with pilot', '', 551, 54.4, 80, '36ff07d0-1ba0-11e5-93b7-b870f4adf235'),
(106, 'S700_3505', 'The Titanic', 'Completed model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.', '', 1956, 51.09, 100.17, '36ff09a3-1ba0-11e5-93b7-b870f4adf235'),
(107, 'S700_3962', 'The Queen Mary', 'Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', '', 5088, 53.63, 99.31, '36ff0a38-1ba0-11e5-93b7-b870f4adf235'),
(108, 'S700_4002', 'American Airlines: MD-11S', 'Polished finish. Exact replia with official logos and insignias and retractable wheels', '', 8820, 36.27, 74.03, '36ff0ae5-1ba0-11e5-93b7-b870f4adf235'),
(109, 'S72_1253', 'Boeing X-32A JSF', '10\" Wingspan with retractable landing gears.Comes with pilot', '', 4857, 32.77, 49.66, '36ff0b75-1ba0-11e5-93b7-b870f4adf235'),
(110, 'S72_3212', 'Pont Yacht', 'Measures 38 inches Long x 33 3/4 inches High. Includes a stand.\r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged', '', 414, 33.3, 54.6, '36ff0c06-1ba0-11e5-93b7-b870f4adf235'),
(139, '45645', '346456', '46456', '14168647313307icon.png', 3345, 3453, 345, '55d9dc0fd17a8'),
(140, 's24234', 'Test', 'Test', NULL, 33, 2342, 243, '55d9e18e2da71');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

CREATE TABLE `providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `contact_name` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `contact_title` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `address` varchar(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `city` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '',
  `region` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '',
  `country` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '',
  `phone` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '',
  `email` varchar(250) COLLATE utf8_bin NOT NULL,
  `website` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `providers`
--

INSERT INTO `providers` (`id`, `company`, `contact_name`, `contact_title`, `address`, `city`, `region`, `country`, `phone`, `email`, `website`) VALUES
(1, 'Masisa', 'Andres Gimenez', 'Vendedor Masisa', 'Carreara 77 con calle 25', 'Bogota, D.C.', 'Bogota', 'Colombia', '3158745587', 'andresgimenez@gmail.com', 'https://colombia.masisa.com/'),
(2, 'Arauco', 'Fabio Camargo Peña', 'Asesor comercial Arauco', 'CARRERA 6ta 15-38', 'Medellin', 'Bello', 'Colombia', '3157845625', 'fabio77@hotmail.com', 'https://www.arauco.cl/colombia/'),
(3, 'Bonuit', 'Luz Alejandra Navarrete', 'Vendedora Herrrajes', 'Carreara 77 con calle 25', 'Pereira', 'Dos quebradas', 'Colombia', '3157845625', 'navarrete55@gmail.com', 'https://tecnifacil.com.co/marca/bonuit/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salaries`
--

CREATE TABLE `salaries` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `deductions` decimal(10,2) NOT NULL,
  `bonuses` decimal(10,2) NOT NULL,
  `net_salary` decimal(10,2) NOT NULL,
  `pay_biweekly` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `salaries`
--

INSERT INTO `salaries` (`id`, `id_user`, `amount`, `deductions`, `bonuses`, `net_salary`, `pay_biweekly`, `created_on`, `created_by`, `updated_by`) VALUES
(1, 1, 1450000.00, 100000.00, 0.00, 1350000.00, '675000', '2023-08-25 06:06:17', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(9) NOT NULL,
  `class` varchar(255) COLLATE utf8_bin NOT NULL,
  `key` varchar(255) COLLATE utf8_bin NOT NULL,
  `value` text COLLATE utf8_bin,
  `type` varchar(31) COLLATE utf8_bin NOT NULL DEFAULT 'string',
  `context` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `class`, `key`, `value`, `type`, `context`, `created_at`, `updated_at`) VALUES
(1, 'Config\\App', 'siteName', 'Citrux', 'string', NULL, '2023-08-28 01:31:28', '2023-08-28 01:31:28'),
(2, 'Config\\App', 'address', 'Carrera 55 #4-78', 'string', NULL, '2023-08-28 01:31:28', '2023-08-28 01:31:28'),
(3, 'Config\\App', 'email', 'juanfranco561@gmail.com', 'string', NULL, '2023-08-28 01:31:28', '2023-08-28 01:31:28'),
(4, 'Config\\App', 'money', 'Peso Colombiano', 'string', NULL, '2023-08-28 01:31:28', '2023-08-28 01:31:28'),
(5, 'Config\\App', 'title', 'Citruxx', 'string', NULL, '2023-04-06 04:46:31', '2023-04-06 04:46:31'),
(6, 'Config\\App', 'theme', 'https://bootswatch.com/5/yeti/bootstrap.min.css', 'string', NULL, '2023-08-28 01:31:28', '2023-08-28 01:31:28'),
(7, 'Config\\App', 'phone', '3186519077', 'string', NULL, '2023-08-28 01:31:28', '2023-08-28 01:31:28'),
(8, 'Config\\App', 'sidebar', 'light', 'string', NULL, '2023-08-28 01:31:28', '2023-08-28 01:31:28'),
(9, 'Config\\App', 'table_style', 'table-responsive table-bordered table-sm', 'string', NULL, '2023-08-28 01:31:28', '2023-08-28 01:31:28'),
(10, 'Config\\App', 'number_format', '3', 'string', NULL, '2023-08-28 01:31:28', '2023-08-28 01:31:28'),
(11, 'Config\\App', 'currency_symbol', 'COP', 'string', NULL, '2023-08-28 01:31:28', '2023-08-28 01:31:28'),
(12, 'Config\\App', 'date_format', '5', 'string', NULL, '2023-08-28 01:31:28', '2023-08-28 01:31:28'),
(13, 'Config\\App', 'file', 'Logo-curvas.png', 'string', NULL, '2023-08-13 17:49:46', '2023-08-13 17:49:46'),
(14, 'Config\\App', 'table_header_style', '-', 'string', NULL, '2023-08-28 01:31:28', '2023-08-28 01:31:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplies`
--

CREATE TABLE `supplies` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `subject` varchar(250) COLLATE utf8_bin NOT NULL,
  `productcode` varchar(250) COLLATE utf8_bin NOT NULL,
  `items` text COLLATE utf8_bin,
  `price` varchar(250) COLLATE utf8_bin NOT NULL,
  `qty` text COLLATE utf8_bin NOT NULL,
  `total` varchar(250) COLLATE utf8_bin NOT NULL,
  `category` text COLLATE utf8_bin NOT NULL,
  `notes` tinytext COLLATE utf8_bin NOT NULL,
  `deliver_date` date DEFAULT NULL,
  `created_by` varchar(250) COLLATE utf8_bin NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `supplies`
--

INSERT INTO `supplies` (`id`, `id_user`, `subject`, `productcode`, `items`, `price`, `qty`, `total`, `category`, `notes`, `deliver_date`, `created_by`, `created_at`, `updated_at`) VALUES
(1619281078, 1, 'Entrega de Casco', '[\"CS-001\",\"PO-002\"]', '[\"Casco Protector\",\"Protectores para oidos\"]', '[\"1000\",\"1000\"]', '[\"1\",\"1\"]', '[\"1000\",\"1000\"]', '[\"TABLEROS \",\"TABLEROS \"]', 'none', '2023-04-02', '1', '2023-08-13 13:49:24', '2023-08-13 13:49:24'),
(1619281079, 1, 'Entrega de Casco', '[\"CS-001\"]', '[\"Casco Protector\"]', '[\"1000\"]', '[\"2\"]', '[\"2000\"]', '[\"TABLEROS \"]', 'None', '2023-04-24', '1', '2023-08-13 13:49:16', '2023-08-13 13:49:16'),
(1619281080, 1, 'Demo', '[\"PO-002\"]', '[\"Protectores para oidos\"]', '[\"1000\"]', '[\"2\"]', '[\"2000\"]', '[\"TABLEROS \"]', 'None', '2023-03-13', '1', '2023-08-13 13:49:21', '2023-08-13 13:49:21'),
(1619281082, 1, 'Entrega de Casco', '[\"CS-001\",\"PO-002\"]', '[\"Casco Protector\",\"Protectores para oidos\"]', '[\"1000\",\"1000\"]', '[\"1\",\"1\"]', '[\"1000\",\"1000\"]', '[\"TABLEROS \",\"TABLEROS \"]', 'Modificado2', '2023-01-30', '1', '2023-08-13 13:49:04', '2023-08-13 13:49:04'),
(1619281083, 1, 'Demo', '[\"00005\",\"00006\"]', '[\"CARVALO RH 15\",\"CASTA\\u00d1O BLANCO RH 15\"]', '[\"1000.00\",\"1000.00\"]', '[\"1\",\"1\"]', '[\"1000\",\"1000\"]', '[\"TABLEROS \",\"TABLEROS \"]', 'Nada2', '2023-08-30', '1', '2023-08-13 14:04:53', '2023-08-13 07:04:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task_list`
--

CREATE TABLE `task_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_details` mediumtext COLLATE utf8_bin NOT NULL,
  `task_status` enum('no','yes') COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `task_list`
--

INSERT INTO `task_list` (`id`, `user_id`, `task_details`, `task_status`) VALUES
(24, 1, 'Kilo', 'yes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `ticket_title` varchar(500) COLLATE utf8_bin NOT NULL,
  `ticket_description` mediumtext COLLATE utf8_bin NOT NULL,
  `priority` enum('Bajo','Medio','Alto') COLLATE utf8_bin NOT NULL DEFAULT 'Medio',
  `status` enum('activo','leido','cerrado') COLLATE utf8_bin NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `id_user`, `id_category`, `ticket_title`, `ticket_description`, `priority`, `status`, `created_on`, `created_by`, `updated_on`, `updated_by`) VALUES
(1, 2, 12, 'Entrega de reporte 22-01-23', '<span style=\"color: rgba(0, 0, 0, 0.8); font-family: \" source=\"\" sans=\"\" pro\",=\"\" sans-serif;=\"\" font-size:=\"\" 16.2px;=\"\" letter-spacing:=\"\" -0.0486px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet consectetur adipiscing elit, pharetra aliquet per velit fermentum aptent, sociosqu dictum leo laoreet neque ridiculus. Metus quam eros cras montes proin etiam ridiculus litora lectus, facilisi ad.</span>', 'Alto', 'cerrado', '2023-03-11 03:12:10', 1, '2023-03-11 03:31:25', 1),
(2, 1, 9, 'Entrega Pedido', '<p>Lorem ipsum dolor sit amet consectetur, adipiscing elit pretium donec \r\nrutrum, duis in a auctor. Fringilla eget neque accumsan primis quis \r\nlibero laoreet hendrerit potenti cum.</p>', 'Alto', 'leido', '2023-03-11 11:54:28', 2, '2023-03-11 06:54:28', NULL),
(4, 1, 8, 'Reporte de enchapadora', '<p>Lorem ipsum dolor sit amet consectetur, adipiscing elit pretium donec \r\nrutrum, duis in a auctor. Fringilla eget neque accumsan primis quis \r\nlibero laoreet hendrerit potenti cum.</p>', 'Medio', 'leido', '2023-03-11 12:02:54', 2, '2023-03-11 07:02:54', NULL),
(5, 1, 5, 'Recibido el reporte', '<p>Lorem ipsum dolor sit amet consectetur, adipiscing elit pretium donec \r\nrutrum, duis in a auctor. Fringilla eget neque accumsan primis quis \r\nlibero laoreet hendrerit potenti cum</p>', 'Bajo', 'activo', '2023-03-11 12:10:08', 2, '2023-03-11 07:10:08', NULL),
(9, 1, 12, 'Problemas con el proyecto #6', 'El Proyecto Numero-6 se encuentra con algunos problemas', 'Alto', 'leido', '2023-05-30 09:59:56', 2, '2023-05-30 16:59:56', NULL),
(10, 1, 12, 'Problemas con el proyecto #6', 'El Proyecto Numero-6 se encuentra con algunos problemas pido apersonarce lo antes posible', 'Alto', 'activo', '2023-05-30 10:13:56', 2, '2023-05-30 17:13:56', NULL),
(12, 1, 12, 'Proyecto finalizado #4', 'El Proyecto Numero-4 se encuentra cortado sin ninguna novedad', 'Alto', 'activo', '2023-06-23 05:49:37', 2, '2023-06-23 12:49:37', NULL),
(13, 1, 12, 'Entrega de reporte de prueba 22', 'sdsdfsdfsdfs', 'Alto', 'activo', '2023-08-10 11:09:39', 2, '2023-08-10 18:09:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ic` bigint(20) NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_bin NOT NULL,
  `username` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `profile` text COLLATE utf8_bin,
  `photo` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `activation_selector` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `activation_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `forgotten_password_selector` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `forgotten_password_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remember_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `admission_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `ic`, `ip_address`, `username`, `password`, `email`, `profile`, `photo`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `birthdate`, `company`, `phone`, `admission_date`) VALUES
(1, 12323589745, '127.0.0.1', 'administrador', '$2y$12$AntOWo4oVJRLZPqBv5BxeeJxJf9cruaPDkj.BH1MWZMPU.w9BQ/cW', 'juanfranco561@gmail.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce congue lectus enim, at tempor metus convallis feugiat. Duis semper pretium erat, ac faucibus metus vehicula pulvinar. Morbi lacinia, purus vel aliquet rhoncus, libero orci viverra neque, quis ', 'png-clipart.png', 'a52cbed58053dd8b40f8', '$2y$10$bEHPOcSUDmD23ebb1sYrm.2jBaZxSqAr0ynO/Djah8g4EfD5sZ166', NULL, NULL, NULL, NULL, NULL, 1268889823, 1697495264, 1, 'Juan', 'Perez', '1985-11-11', 'Administrador', '3186519077', '2021-11-11'),
(2, 94475593, '127.0.0.1', 'loaiza-77@hotmail.com', '$2y$10$fKOU3YMQMEZzDMyFEokbe.EYd3j5n1tNCyuwN9NIaFLxF3LkJ1FJy', 'loaiza-77@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1692325617, 1692627654, 1, 'Juan Camilo', 'Restrepo', NULL, 'Pagos', '3157845625', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(103, 1, 1),
(101, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_data`
--

CREATE TABLE `user_data` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `address_1` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `contact_number_2` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(70) COLLATE utf8_bin NOT NULL,
  `experience` text COLLATE utf8_bin NOT NULL,
  `disabilities` tinytext COLLATE utf8_bin,
  `number_children` int(10) DEFAULT NULL,
  `names_children` text COLLATE utf8_bin,
  `age_children` text COLLATE utf8_bin,
  `civil_status` varchar(70) COLLATE utf8_bin NOT NULL,
  `name_couple` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `user_data`
--

INSERT INTO `user_data` (`id`, `id_user`, `address_1`, `contact_number_2`, `gender`, `experience`, `disabilities`, `number_children`, `names_children`, `age_children`, `civil_status`, `name_couple`) VALUES
(1, 1, 'Carrera 77 #45-56', '0624587455', 'Masculino', 'Lorem ipsum dolor sit amet consectetur adipiscing elit, leo tincidunt gravida aptent justo ultrices euismod lectus', 'Lorem ipsum dolor sit amet consectetur adipiscing.', 2, '[\"Juan Jose Duque\",\"Pedro Esteban Duque\"]', '[\"18\",\"18\"]', 'Soltero', 'No');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `assortments`
--
ALTER TABLE `assortments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_ex_in`
--
ALTER TABLE `cat_ex_in`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuts`
--
ALTER TABLE `cuts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers` (`customer_id`),
  ADD KEY `machines` (`machine_id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estimates`
--
ALTER TABLE `estimates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Customer` (`customer_id`);

--
-- Indices de la tabla `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Expense` (`ex_in_cat_id`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `installments`
--
ALTER TABLE `installments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Leaves` (`id_user`),
  ADD KEY `Type` (`id_type`);

--
-- Indices de la tabla `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `loan_installment`
--
ALTER TABLE `loan_installment`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mop`
--
ALTER TABLE `mop`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departamento_id` (`depart_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment_receipts`
--
ALTER TABLE `payment_receipts`
  ADD PRIMARY KEY (`receipt_id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `task_list`
--
ALTER TABLE `task_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`id_category`),
  ADD KEY `users` (`id_user`) USING BTREE;

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indices de la tabla `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `assortments`
--
ALTER TABLE `assortments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `cat_ex_in`
--
ALTER TABLE `cat_ex_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cuts`
--
ALTER TABLE `cuts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `estimates`
--
ALTER TABLE `estimates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `installments`
--
ALTER TABLE `installments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1015;

--
-- AUTO_INCREMENT de la tabla `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `loan_installment`
--
ALTER TABLE `loan_installment`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `machines`
--
ALTER TABLE `machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mop`
--
ALTER TABLE `mop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99774;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT de la tabla `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `supplies`
--
ALTER TABLE `supplies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1619281084;

--
-- AUTO_INCREMENT de la tabla `task_list`
--
ALTER TABLE `task_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuts`
--
ALTER TABLE `cuts`
  ADD CONSTRAINT `customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `machines` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`);

--
-- Filtros para la tabla `estimates`
--
ALTER TABLE `estimates`
  ADD CONSTRAINT `Customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Filtros para la tabla `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `Expense` FOREIGN KEY (`ex_in_cat_id`) REFERENCES `cat_ex_in` (`id`);

--
-- Filtros para la tabla `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `Type` FOREIGN KEY (`id_type`) REFERENCES `leave_types` (`id`);

--
-- Filtros para la tabla `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user_data` (`id`);

--
-- Filtros para la tabla `payment_receipts`
--
ALTER TABLE `payment_receipts`
  ADD CONSTRAINT `payment_receipts_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user_data` (`id`);

--
-- Filtros para la tabla `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `Salary` FOREIGN KEY (`id_user`) REFERENCES `user_data` (`id`);

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);

--
-- Filtros para la tabla `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
