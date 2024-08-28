-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2024 at 03:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_yii_ums`
--

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'administration', 'create,update,view,delete', '2024-08-28 01:06:47', '2024-08-28 01:06:47'),
(2, 'user', 'selfupdate,selfview', '2024-08-28 01:07:46', '2024-08-28 01:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'this role is belong to admin and given to only one', '2024-08-27 20:35:29', '2024-08-27 20:35:29'),
(2, 'user', 'this role can be assign to any one and multiple accounts', '2024-08-27 20:36:18', '2024-08-27 20:36:18');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`role_id`, `permission_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 10,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `auth_key`, `access_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(7, 'umarazizkhan', '$2y$13$1Z5lhgDEkxsfKOmgISE87uPMxQ/i.TBNC3ZL.XkAQe.LcU1rzlAXa', 'fbdnHbcktgBFikScwtHm8JFvDFStQ_xa', NULL, 'umarazizkhan@gmail.com', 10, '2024-08-27 16:55:07', '2024-08-27 20:32:21'),
(8, 'umarazizkhan1', '$2y$13$eRzoL6TtQkFiCuvN3GW33OUTto.RJWFgjHK3rOEx1ddSpUDQMEOsu', 'oiPYhHub8h_3cUn3uw_-mEcagDLDCexf', NULL, 'umarazizkhan1@gmail.com', 10, '2024-08-27 16:59:56', '2024-08-28 01:08:48'),
(9, 'jhondoe', '$2y$13$VrbQFRxGzQa1eUscqhby7eAgv6pHDMpoaO5bQReQsffnxI0sLcrBC', 'mXI7PLNRCGj-seZqKdxqU1pv-jI83BIl', NULL, 'jhondoe@gmail.com', 10, '2024-08-27 17:18:41', '2024-08-28 02:03:28'),
(10, 'doejhon', '$2y$13$tac9bt1SyG2XgaOf6Fg.ae/mAkyfJ8LUMcUFM1M9LrvN38PkT7cuy', '6p9MWPEzdu7dRLNXeBEeI2crV6GxiyLT', NULL, 'doejhon@gmail.com', 10, '2024-08-27 17:19:17', '2024-08-27 17:19:17'),
(11, 'maryam', '$2y$13$Bh78TvWCHLTUiCT7YNHSSeTVUADvrjBKsuSYlhN275sh5rvCWJ6wW', 'Xv0JKZpFzuITW0c7sYpmIEd7UoWBqMIR', NULL, 'maryam@abc.com', 10, '2024-08-27 17:50:00', '2024-08-27 20:22:15'),
(12, 'superadmin', '$2y$13$Bh78TvWCHLTUiCT7YNHSSeTVUADvrjBKsuSYlhN275sh5rvCWJ6wW', 'snLk1QRKjO1Zcw6-hgD8oR9e3JKepE54', NULL, 'superadmin@abc.com', 10, '2024-08-27 19:47:49', '2024-08-27 20:22:21'),
(13, 'testuser', '$2y$13$NUASqUMm04ku9WNkvmHm6OIPmDlCUvnz1qC1sbxCr0jb0imUWTxmu', 'cFQ6SMlv0liq5BvXiNxMYmrZtngS9Xgo', NULL, 'testuser@xyz.com', 10, '2024-08-27 20:25:34', '2024-08-27 20:25:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(7, 1),
(8, 2),
(9, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
