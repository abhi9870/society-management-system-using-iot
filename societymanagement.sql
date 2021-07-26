-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2021 at 07:41 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `societymanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `bill_type` varchar(255) NOT NULL,
  `bill_amount` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `bill_type`, `bill_amount`, `created_at`, `updated_at`) VALUES
(1, 'Maintainence', 4000, '2021-05-23 05:53:20am', '2021-05-23 07:21:36am');

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `id` int(11) NOT NULL,
  `floor_no` int(11) NOT NULL,
  `flat_no` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`id`, `floor_no`, `flat_no`, `created_at`, `updated_at`) VALUES
(1, 1, 101, '2021-05-23 05:47:57', '2021-05-23 05:47:57'),
(2, 1, 102, '2021-05-23 05:48:21', '2021-05-23 05:48:21'),
(3, 2, 201, '2021-05-23 05:48:32', '2021-05-23 05:48:32'),
(4, 2, 202, '2021-05-23 05:48:40', '2021-05-23 05:48:40'),
(5, 3, 301, '2021-05-23 05:48:49', '2021-05-23 05:48:49'),
(6, 3, 302, '2021-05-23 05:48:58', '2021-05-23 05:48:58'),
(7, 4, 401, '2021-05-23 05:49:09', '2021-05-23 05:49:09'),
(8, 4, 402, '2021-05-23 05:49:15', '2021-05-23 05:49:15');

-- --------------------------------------------------------

--
-- Table structure for table `flat`
--

CREATE TABLE `flat` (
  `id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `member_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flat`
--

INSERT INTO `flat` (`id`, `flat_id`, `member_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Neeraj Patel', '2021-05-23 05:49:40', '2021-05-23 05:49:40'),
(2, 2, 'Yash Patel', '2021-05-23 05:49:54', '2021-05-23 05:49:54'),
(3, 3, 'Abhishek Sawalkar', '2021-05-23 05:50:10', '2021-05-23 05:50:10'),
(4, 4, 'Haresh Patel', '2021-05-23 05:50:26', '2021-05-23 05:50:26'),
(5, 5, 'Datta Sawalkar', '2021-05-23 05:50:45', '2021-05-23 05:51:01'),
(6, 6, 'Amir Khan', '2021-05-23 05:51:21', '2021-05-23 05:51:21'),
(7, 7, 'Akshay Kumar', '2021-05-23 05:51:55', '2021-05-23 05:51:55'),
(8, 8, 'Hiren M Patel', '2021-05-23 05:52:27', '2021-05-23 07:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `id` int(11) NOT NULL,
  `floor_id` int(11) NOT NULL,
  `flat_no` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `member_name` varchar(255) NOT NULL,
  `member_email` varchar(255) NOT NULL,
  `member_password` varchar(255) NOT NULL,
  `member_role` varchar(255) NOT NULL DEFAULT 'Visitor',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `member_name`, `member_email`, `member_password`, `member_role`, `created_at`, `updated_at`) VALUES
(35, 'admin', 'admin', 'admin', 'admin', '2020-12-06 09:36:34', '2020-12-07 07:20:08');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `notice_title` varchar(255) NOT NULL,
  `notice_description` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `notice_title`, `notice_description`, `created_at`, `updated_at`) VALUES
(2, 'Water Shortage Problem', 'Water scarcity in Mumbai from today onwards', '2021-05-23 07:20:50', '2021-05-23 07:21:11');

-- --------------------------------------------------------

--
-- Table structure for table `sensordata`
--

CREATE TABLE `sensordata` (
  `id` int(6) UNSIGNED NOT NULL,
  `sensor` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `distance` varchar(10) DEFAULT NULL,
  `reading_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flat`
--
ALTER TABLE `flat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensordata`
--
ALTER TABLE `sensordata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `flat`
--
ALTER TABLE `flat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sensordata`
--
ALTER TABLE `sensordata`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
