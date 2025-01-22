-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 22, 2025 at 01:26 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moja_strona`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `email`, `password`) VALUES
(1, 'admin', 'bartek.gorzynski1209@gmail.com', 'haslo');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categoriess`
--

CREATE TABLE `categoriess` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categoriess`
--

INSERT INTO `categoriess` (`id`, `parent_id`, `name`) VALUES
(1, 0, 'Electronics'),
(2, 0, 'Books'),
(3, 0, 'Clothing'),
(4, 0, 'Home & Kitchen'),
(5, 0, 'Sports & Outdoors'),
(11, 0, 'warzywa'),
(12, 0, 'warzywa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'bartek', 'kys@gmail.com', 'jebac\r\n', '2025-01-08 20:21:54');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `productss`
--

CREATE TABLE `productss` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expiration_date` datetime DEFAULT NULL,
  `price_net` decimal(10,2) NOT NULL,
  `vat` decimal(5,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `availability_status` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productss`
--

INSERT INTO `productss` (`id`, `title`, `description`, `created_at`, `updated_at`, `expiration_date`, `price_net`, `vat`, `stock`, `availability_status`, `size`, `image`, `category_id`) VALUES
(32, 'Smartphone', 'Latest model with 128GB storage', '2025-01-15 00:07:31', '2025-01-21 23:53:23', '2025-12-31 00:00:00', 799.99, 23.00, 50, '0', 'N/A', 'http://localhost/moj_projekt/img/smartphone.png', 1),
(33, 'Laptop', '15-inch display with 16GB RAM', '2025-01-15 00:07:31', '2025-01-21 23:53:41', '2025-12-31 00:00:00', 1299.99, 23.00, 20, '0', 'N/A', 'http://localhost/moj_projekt/img/laptop.png', 1),
(34, 'Fiction Book', 'Bestselling novel', '2025-01-15 00:07:31', '2025-01-21 23:53:57', '2024-12-31 00:00:00', 19.99, 5.00, 100, '0', 'N/A', 'http://localhost/moj_projekt/img/ksiazka.png', 2),
(35, 'T-shirt', 'Comfortable cotton T-shirt', '2025-01-15 00:07:31', '2025-01-21 23:55:02', '2023-12-31 00:00:00', 14.99, 23.00, 200, '0', 'M', 'http://localhost/moj_projekt/img/t-shirt.png', 3),
(36, 'Cooking Pan', 'Non-stick pan with 2-year warranty', '2025-01-15 00:07:31', '2025-01-21 23:55:18', '2024-12-31 00:00:00', 29.99, 23.00, 75, '0', 'N/A', 'http://localhost/moj_projekt/img/patelnia.png', 4),
(37, 'Tent', '4-person camping tent', '2025-01-15 00:07:31', '2025-01-21 23:55:28', '2025-06-30 00:00:00', 99.99, 23.00, 30, '0', 'N/A', 'http://localhost/moj_projekt/img/namiot.png', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `subpages`
--

CREATE TABLE `subpages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subpages`
--

INSERT INTO `subpages` (`id`, `title`, `filename`) VALUES
(1, 'Home', 'index.php'),
(2, 'Contact', 'contact.php'),
(3, 'Shop', 'sklep.php');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeksy dla tabeli `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksy dla tabeli `categoriess`
--
ALTER TABLE `categoriess`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `productss`
--
ALTER TABLE `productss`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productss_ibfk_1` (`category_id`);

--
-- Indeksy dla tabeli `subpages`
--
ALTER TABLE `subpages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categoriess`
--
ALTER TABLE `categoriess`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productss`
--
ALTER TABLE `productss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `subpages`
--
ALTER TABLE `subpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `productss`
--
ALTER TABLE `productss`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categoriess` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productss_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categoriess` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
