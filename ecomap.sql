-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2025 at 05:26 AM
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
-- Database: `ecomap`
--

-- --------------------------------------------------------

--
-- Table structure for table `educational_materials`
--

CREATE TABLE `educational_materials` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category` varchar(50) NOT NULL DEFAULT 'guide',
  `video_type` varchar(10) NOT NULL DEFAULT '',
  `thumbnail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` enum('schedule','pickup_point') NOT NULL,
  `message` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_points`
--

CREATE TABLE `pickup_points` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `address` text DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `status` enum('active','inactive','maintenance') DEFAULT 'active',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pickup_points`
--

INSERT INTO `pickup_points` (`id`, `name`, `latitude`, `longitude`, `schedule`, `created_at`, `address`, `contact_number`, `status`, `updated_at`) VALUES
(1, 'Kumintang Ibaba', 13.76270500, 121.05753200, '', '2025-05-10 15:26:44', '', NULL, 'active', '2025-05-10 15:26:44'),
(2, 'Alangilan', 13.78793300, 121.06956100, '', '2025-05-10 15:28:52', '', NULL, 'active', '2025-05-10 15:28:52'),
(4, 'Near Regional', 13.76185400, 121.06420800, '', '2025-05-10 16:06:26', '', NULL, 'inactive', '2025-05-10 16:06:26');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `area` varchar(100) NOT NULL,
  `pickup_date` date DEFAULT NULL,
  `pickup_time` time NOT NULL,
  `pickup_end_time` time DEFAULT NULL,
  `pickup_days` varchar(50) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','cancelled','completed') DEFAULT 'active',
  `notes` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'life360_code', 'GOZ-MFF'),
(2, 'life360_link', 'https://i.lf360.co/rljXum7egTb');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT 'other',
  `profile_pic` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('admin','driver','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `remember_token` varchar(64) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive','suspended') DEFAULT 'active',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `nickname`, `gender`, `profile_pic`, `password`, `email`, `role`, `created_at`, `remember_token`, `last_login`, `status`, `updated_at`) VALUES
(1, 'admin', 'ADMIN', 'other', 'uploads/profile_pics/user_1_1746876238.png', '$2y$12$MoMBKvQvPoi8pcVR3/JvE.rlc/YlGv8QLyNiMKem4HeAEy0fj8gRO', 'admin@localhost', 'admin', '2025-05-09 13:00:19', NULL, NULL, 'active', '2025-05-10 16:40:43'),
(4, 'songoku', NULL, 'other', NULL, '$2y$10$V/ktkjSmbrfpgU.rBXO9huokBYjyz.UBFhmWIZ52K8zsjWkFlRFY6', 'supersaiyan@gmail.com', 'driver', '2025-05-09 13:31:54', NULL, NULL, 'active', '2025-05-10 08:41:19'),
(5, 'cloyd', 'Myawk', 'other', 'uploads/profile_pics/user_5_1746870197.png', '$2y$10$3bUdpzgPQG2T1G2lLPpBTuIEuVUQJdqj9hKcL6QPmejlOTo7Ofk0u', 'cloyd@gmail.com', 'driver', '2025-05-09 14:05:28', NULL, NULL, 'active', '2025-05-10 12:17:58'),
(6, 'Ysa', 'Baby', 'other', 'uploads/profile_pics/user_6_1746872809.png', '$2y$10$0K.kD1tmWAe6m.XL1MtFkeDw04o1ULDVaAUqkMkpBu5.CJ4v59No2', 'ysajaja@gmail.com', 'user', '2025-05-10 08:44:03', NULL, NULL, 'active', '2025-05-10 10:26:49'),
(7, 'KIng', 'kong', 'male', NULL, '$2y$10$mSfYrqarh02hW0V73J8qzeFMl/UfSveqEB8WjPy9lOoRnSUdK5tSy', 'kingkong@gmail.com', 'user', '2025-05-10 09:07:01', NULL, NULL, 'active', '2025-05-10 09:07:01'),
(9, 'paul', 'tite', 'male', NULL, '$2y$10$H/aObYyRbg28NzK/DT5qqOf3hflJNdRIdSjc5ieedwXX7Wv.jJcKa', 'paul@gmail.com', 'user', '2025-05-13 08:10:34', NULL, NULL, 'active', '2025-05-13 08:10:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `educational_materials`
--
ALTER TABLE `educational_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pickup_points`
--
ALTER TABLE `pickup_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_location` (`latitude`,`longitude`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_driver` (`driver_id`),
  ADD KEY `idx_area` (`area`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `remember_token` (`remember_token`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_role` (`role`),
  ADD KEY `idx_status` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `educational_materials`
--
ALTER TABLE `educational_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup_points`
--
ALTER TABLE `pickup_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
