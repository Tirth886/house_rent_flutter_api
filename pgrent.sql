-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2022 at 12:03 PM
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
(12, 'Tirth', 'tirth@gmail.com', '7984814283', '123456', '2022-11-16 03:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `pg_rooms`
--

CREATE TABLE `pg_rooms` (
  `id` int(11) NOT NULL,
  `vPGname` varchar(255) NOT NULL,
  `tPGLocation` text NOT NULL,
  `vPGsqfeet` varchar(100) NOT NULL,
  `vPGRent` double(10,2) NOT NULL,
  `tBedRooms` text NOT NULL,
  `tBathrooms` text NOT NULL,
  `tKitchen` text NOT NULL,
  `tParking` text NOT NULL,
  `tAbout` text NOT NULL,
  `tImage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pg_rooms`
--

INSERT INTO `pg_rooms` (`id`, `vPGname`, `tPGLocation`, `vPGsqfeet`, `vPGRent`, `tBedRooms`, `tBathrooms`, `tKitchen`, `tParking`, `tAbout`, `tImage`) VALUES
(1, 'The Moon House', 'Lucknow, Uttar Pradesh', '500 sqft', 4455.25, '5 Bedroom - 3 Master Bedroom', '5 Bathroom - 3 Toilet', '2 Kitchen - 120 sqft', '5 Parking - 120 sqft', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s', 'https://kripalhomes.com/wp-content/uploads/2021/12/WhatsApp-Image-2020-07-31-at-12.02.34-PM-2.jpeg'),
(2, 'The Sky House', 'Lucknow, Uttar Pradesh', '500 sqft', 4455.25, '5 Bedroom - 3 Master Bedroom', '5 Bathroom - 3 Toilet', '2 Kitchen - 120 sqft', '5 Parking - 120 sqft', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s', 'https://kripalhomes.com/wp-content/uploads/2021/12/WhatsApp-Image-2020-07-31-at-12.02.34-PM-2.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mod_admin`
--
ALTER TABLE `mod_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pg_rooms`
--
ALTER TABLE `pg_rooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mod_admin`
--
ALTER TABLE `mod_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pg_rooms`
--
ALTER TABLE `pg_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
