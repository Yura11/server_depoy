-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Час створення: Трв 05 2024 р., 17:34
-- Версія сервера: 10.5.20-MariaDB
-- Версія PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `id21956927_dangerpath`
--

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `verification_token` varchar(255) DEFAULT NULL,
  `pcident` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `email`, `verification_token`, `pcident`) VALUES
(34, 'asfad', '$2y$10$TnnNdOHqKdOtjQkcS4FRju5AuVlz.sxertRaSPvJ2omu/fc8hn0w.', 'nazarkoval09@gmail.com', 'verified', '123asfsfsdssfssfsdfasdfsdf'),
(33, 'assasaasas', '$2y$10$TnnNdOHqKdOtjQkcS4FRju5AuVlz.sxertRaSPvJ2omu/fc8hn0w.', 'nazarkoval097@gmail.com', 'verified', NULL),
(32, 'dypa', 'asfasf', 'nazarkoval09@gmail.com', '7f11c79e887562335da5538a731d3b6a', NULL),
(38, 'wangler', '$2y$10$8d./meXqRAePIS7RmPxrQ.rU/Qm2/1u8LniKyw716eBUks3CTmLTq', 'tsybulskyy.sasha@gmail.com', 'verified', NULL),
(39, 'existing_user', '$2y$10$LT5a/BAWCrn9ZVpRbVe3O.G42pLtsT.VDK7LL8HUMcYnWQtvukMLS', 'existing@example.com', 'verified', NULL),
(40, 'asdfasfd', '$2y$10$FZ5Py46kEhCKQo4JesuanuqJiiOOrwXqfFDWXTuT5TJV67arT.dA2', 'asasfsdf@gmail.com', '1d68117b00cb7ee5086d5903418bc667', NULL),
(41, 'asdfasfd', '$2y$10$YRolRSrlJXiT1rWOegAoDOWZeYQotZKspRMz6sOR95qtlYLfcxnme', 'asasfsdf@gmail.com', '1807812157c7ea172b39b7101457b567', NULL),
(42, 'ostap', '$2y$10$XkYGgF6cshAdRSVddVnALOSvrltfKMh56kN/oNjqNdQfTvo3bzp8m', 'kovalostap07@gmail.com', 'verified', 'ab1a1e8147f3fc9881d194275ab15437f36974ae');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
