-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2022 at 07:55 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `let's play football`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `email`) VALUES
('admin', 'admin', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `challenge`
--

CREATE TABLE `challenge` (
  `challenge_id` int(11) NOT NULL,
  `team1` varchar(25) NOT NULL,
  `team2` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `challenge`
--

INSERT INTO `challenge` (`challenge_id`, `team1`, `team2`) VALUES
(1, 'Keravnos FC', 'Athens FC'),
(2, 'Keravnos FC', 'Athens FC'),
(3, 'Keravnos FC', 'Athens FC');

-- --------------------------------------------------------

--
-- Table structure for table `confirmation_email`
--

CREATE TABLE `confirmation_email` (
  `user_userame` varchar(25) NOT NULL,
  `user_email` varchar(25) NOT NULL,
  `res_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `field` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `confirmation_email`
--

INSERT INTO `confirmation_email` (`user_userame`, `user_email`, `res_id`, `date`, `field`) VALUES
('a', 'a', 7, '2022-06-10 21:00:00', 'Athens 5x5');

-- --------------------------------------------------------

--
-- Table structure for table `explanation`
--

CREATE TABLE `explanation` (
  `submission_id` int(11) NOT NULL,
  `explanation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `explanation`
--

INSERT INTO `explanation` (`submission_id`, `explanation`) VALUES
(6, 'test'),
(11, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `field`
--

CREATE TABLE `field` (
  `name` varchar(25) NOT NULL,
  `area` varchar(25) NOT NULL,
  `size` varchar(25) NOT NULL,
  `price` varchar(25) NOT NULL,
  `rating` float NOT NULL,
  `equipment` set('Gloves','Shoes','Baths','Parking') NOT NULL,
  `schedule` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `field`
--

INSERT INTO `field` (`name`, `area`, `size`, `price`, `rating`, `equipment`, `schedule`) VALUES
('Athens 5x5', 'Athens', '5x5', '€5 per person', 4.4, 'Gloves,Shoes', NULL),
('EllinikoFields', 'Patras', '6x6', '€7 per person', 4.8, 'Gloves', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invitation`
--

CREATE TABLE `invitation` (
  `invitation_id` int(11) NOT NULL,
  `user1` varchar(25) NOT NULL,
  `user2` varchar(25) NOT NULL,
  `team` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `fieldname` varchar(25) NOT NULL,
  `fieldarea` varchar(25) NOT NULL,
  `fieldsize` varchar(25) NOT NULL,
  `fieldprice` varchar(25) NOT NULL,
  `fieldrating` float NOT NULL,
  `fieldequipment` set('Gloves','Shoes','Baths','Parking') NOT NULL,
  `fieldschedule` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`username`, `password`, `fieldname`, `fieldarea`, `fieldsize`, `fieldprice`, `fieldrating`, `fieldequipment`, `fieldschedule`) VALUES
('owner', 'owner', 'Athens 5x5', 'Athens', '5x5', '€5 per person', 4.4, 'Gloves,Shoes', NULL),
('owner', 'owner', 'EllinikoFields', 'Patras', '6x6', '€7 per person', 4.8, 'Gloves', NULL),
('owner', 'owner', 'MegaFootballAthens', 'Athens', '6x6', '€6 per person', 3.2, 'Baths', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `username` varchar(25) NOT NULL,
  `position` enum('GK','DC','MC','ST') DEFAULT NULL,
  `age` int(11) NOT NULL,
  `team` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`username`, `position`, `age`, `team`) VALUES
('a', 'GK', 20, 'Keravnos FC'),
('VasilisPapadopoulos8', NULL, 22, 'Keravnos FC');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `user` varchar(25) NOT NULL,
  `field` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `date`, `user`, `field`) VALUES
(7, '2022-06-10 21:00:00', 'a', 'Athens 5x5');

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE `submission` (
  `submission_id` int(11) NOT NULL,
  `owner` varchar(25) NOT NULL,
  `field` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `submission`
--

INSERT INTO `submission` (`submission_id`, `owner`, `field`) VALUES
(12, 'owner', 'MegaFootballAthens');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_name` varchar(25) NOT NULL,
  `number_of_players` int(11) NOT NULL,
  `avg_age` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_name`, `number_of_players`, `avg_age`) VALUES
('Athens FC', 6, 25.6),
('Keravnos FC', 10, 21.6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `username`, `password`, `age`) VALUES
(6, 'a', 'a', 'a', 20),
(11, 'VasilisPapadopoulos8@gmail.com', 'VasilisPapadopoulos8', 'Vasilis123', 22);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `challenge`
--
ALTER TABLE `challenge`
  ADD PRIMARY KEY (`challenge_id`),
  ADD KEY `team1` (`team1`,`team2`),
  ADD KEY `team2` (`team2`);

--
-- Indexes for table `confirmation_email`
--
ALTER TABLE `confirmation_email`
  ADD KEY `res_id` (`res_id`),
  ADD KEY `user_userame` (`user_userame`,`user_email`,`field`),
  ADD KEY `confirmation_email_ibfk_2` (`field`),
  ADD KEY `confirmation_email_ibfk_3` (`user_email`);

--
-- Indexes for table `explanation`
--
ALTER TABLE `explanation`
  ADD PRIMARY KEY (`submission_id`);

--
-- Indexes for table `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `invitation`
--
ALTER TABLE `invitation`
  ADD PRIMARY KEY (`invitation_id`),
  ADD KEY `user1` (`user1`),
  ADD KEY `user2` (`user2`),
  ADD KEY `team` (`team`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`fieldname`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD KEY `team` (`team`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `user` (`user`),
  ADD KEY `field` (`field`);

--
-- Indexes for table `submission`
--
ALTER TABLE `submission`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `field` (`field`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`,`username`,`password`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `challenge`
--
ALTER TABLE `challenge`
  MODIFY `challenge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invitation`
--
ALTER TABLE `invitation`
  MODIFY `invitation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `submission`
--
ALTER TABLE `submission`
  MODIFY `submission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `challenge`
--
ALTER TABLE `challenge`
  ADD CONSTRAINT `challenge_ibfk_1` FOREIGN KEY (`team1`) REFERENCES `team` (`team_name`),
  ADD CONSTRAINT `challenge_ibfk_2` FOREIGN KEY (`team2`) REFERENCES `team` (`team_name`);

--
-- Constraints for table `confirmation_email`
--
ALTER TABLE `confirmation_email`
  ADD CONSTRAINT `confirmation_email_ibfk_2` FOREIGN KEY (`field`) REFERENCES `field` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `confirmation_email_ibfk_3` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `confirmation_email_ibfk_4` FOREIGN KEY (`user_userame`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `confirmation_email_ibfk_5` FOREIGN KEY (`res_id`) REFERENCES `reservation` (`reservation_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `field`
--
ALTER TABLE `field`
  ADD CONSTRAINT `field_ibfk_1` FOREIGN KEY (`name`) REFERENCES `owner` (`fieldname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invitation`
--
ALTER TABLE `invitation`
  ADD CONSTRAINT `invitation_ibfk_1` FOREIGN KEY (`user1`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `invitation_ibfk_2` FOREIGN KEY (`user2`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `invitation_ibfk_3` FOREIGN KEY (`team`) REFERENCES `team` (`team_name`);

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team`) REFERENCES `team` (`team_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`field`) REFERENCES `field` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
