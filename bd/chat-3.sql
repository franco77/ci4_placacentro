-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 06-09-2023 a las 13:44:46
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `chat-3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sb_conversations`
--

CREATE TABLE `sb_conversations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creation_time` datetime NOT NULL,
  `status_code` tinyint(4) DEFAULT '0',
  `department` tinyint(4) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `source` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sb_messages`
--

CREATE TABLE `sb_messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_bin NOT NULL,
  `creation_time` datetime NOT NULL,
  `status_code` tinyint(4) DEFAULT '0',
  `attachments` text COLLATE utf8mb4_bin,
  `payload` text COLLATE utf8mb4_bin,
  `conversation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sb_reports`
--

CREATE TABLE `sb_reports` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_time` date NOT NULL,
  `external_id` int(11) DEFAULT NULL,
  `extra` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sb_settings`
--

CREATE TABLE `sb_settings` (
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sb_settings`
--

INSERT INTO `sb_settings` (`name`, `value`) VALUES
('cron', '\"13\"');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sb_users`
--

CREATE TABLE `sb_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_time` datetime NOT NULL,
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `typing` int(11) DEFAULT '-1',
  `department` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sb_users`
--

INSERT INTO `sb_users` (`id`, `first_name`, `last_name`, `password`, `email`, `profile_image`, `user_type`, `creation_time`, `token`, `last_activity`, `typing`, `department`) VALUES
(1, 'Juan', 'Franco', '$2y$10$ThQeO3wDsBt6yQKXNuZUKeafgh89s4K8DKyKvhJnkEZb1J5Es02fO', 'juanfranco561@gmail.com', 'http://ionauth_ci4.test/chat/media/user.svg', 'admin', '2023-09-06 18:39:19', '43115070d1035f3202592ec35b885aabaefd9fc7', '2023-09-06 18:44:29', -1, NULL),
(2, 'Bot', '', '', NULL, 'http://ionauth_ci4.test/chat/media/user.svg', 'bot', '2023-09-06 18:40:41', 'fb55132d144e65f033fd03229e20cd4fb1a978c0', '2023-09-06 18:40:41', -1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sb_users_data`
--

CREATE TABLE `sb_users_data` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `sb_conversations`
--
ALTER TABLE `sb_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `sb_messages`
--
ALTER TABLE `sb_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `conversation_id` (`conversation_id`);

--
-- Indices de la tabla `sb_reports`
--
ALTER TABLE `sb_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sb_settings`
--
ALTER TABLE `sb_settings`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `sb_users`
--
ALTER TABLE `sb_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `sb_users_data`
--
ALTER TABLE `sb_users_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sb_users_data_index` (`user_id`,`slug`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `sb_conversations`
--
ALTER TABLE `sb_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sb_messages`
--
ALTER TABLE `sb_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sb_reports`
--
ALTER TABLE `sb_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sb_users`
--
ALTER TABLE `sb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sb_users_data`
--
ALTER TABLE `sb_users_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sb_conversations`
--
ALTER TABLE `sb_conversations`
  ADD CONSTRAINT `sb_conversations_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `sb_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sb_conversations_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sb_users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `sb_messages`
--
ALTER TABLE `sb_messages`
  ADD CONSTRAINT `sb_messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sb_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sb_messages_ibfk_2` FOREIGN KEY (`conversation_id`) REFERENCES `sb_conversations` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `sb_users_data`
--
ALTER TABLE `sb_users_data`
  ADD CONSTRAINT `sb_users_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sb_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
