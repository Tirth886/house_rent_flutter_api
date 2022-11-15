-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2022 at 11:03 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pgrent`
--

-- --------------------------------------------------------

--
-- Table structure for table `mod_admin`
--

CREATE TABLE `mod_admin` (
  `id` int(11) NOT NULL,
  `vName` varchar(100) NOT NULL,
  `vEmail` varchar(255) NOT NULL,
  `vPhone` varchar(13) NOT NULL,
  `vPassword` varchar(255) NOT NULL,
  `dAddedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mod_admin`
--

INSERT INTO `mod_admin` (`id`, `vName`, `vEmail`, `vPhone`, `vPassword`, `dAddedDate`) VALUES
(1, 'Tirth', 'tieth@gmail.com', '7984814283', 'hsjss', '2022-11-16 03:17:58'),
(2, 'Tirth', 'tieth@gmail.com', '7984814283', 'hsjss', '2022-11-16 03:18:22'),
(3, 'Tirth', 'tieth@gmail.com', '7984814283', 'hsjss', '2022-11-16 03:19:12'),
(4, 'Tirth', 'tieth@gmail.com', '7984814283', 'hsjss', '2022-11-16 03:19:44'),
(5, 'Tirth', 'tieth@gmail.com', '7984814283', 'hsjss', '2022-11-16 03:20:03'),
(6, 'Tirth', 'tieth@gmail.com', '7984814283', 'hsjss', '2022-11-16 03:21:48'),
(7, 'Tirth', 'tieth@gmail.com', '7984814283', 'hsjss', '2022-11-16 03:22:06'),
(8, 'Tirth', 'tieth@gmail.com', '7984814283', 'hsjss', '2022-11-16 03:22:25'),
(9, 'Tirth', 'tieth@gmail.com', '7984814283', 'hsjss', '2022-11-16 03:23:41'),
(10, 'Tirth', 'tieth@gmail.com', '7984814283', 'hsjss', '2022-11-16 03:23:56'),
(11, 'Tirth', 'tieth@gmail.com', '7984814283', 'hsjss', '2022-11-16 03:24:06'),
(12, 'yy', 'tirth@gmail.ox', '7984814283', 'ysha', '2022-11-16 03:25:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mod_admin`
--
ALTER TABLE `mod_admin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mod_admin`
--
ALTER TABLE `mod_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
