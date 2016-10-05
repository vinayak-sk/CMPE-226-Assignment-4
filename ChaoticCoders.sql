-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 05, 2016 at 04:16 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ChaoticCoders`
--

-- --------------------------------------------------------

--
-- Table structure for table `Battles`
--

CREATE TABLE `Battles` (
  `battle_id` int(11) NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL,
  `pokemon1_id` int(11) NOT NULL,
  `pokemon2_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Battles`
--

INSERT INTO `Battles` (`battle_id`, `time`, `user1_id`, `user2_id`, `pokemon1_id`, `pokemon2_id`) VALUES
(1, '0000-00-00 00:00:00.', 7, 8, 1, 2),
(2, '0000-00-00 00:00:00.', 7, 8, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Battle_Locations`
--

CREATE TABLE `Battle_Locations` (
  `battle_id` int(11) NOT NULL,
  `gym_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Battle_Locations`
--

INSERT INTO `Battle_Locations` (`battle_id`, `gym_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Faction`
--

CREATE TABLE `Faction` (
  `faction_id` int(11) NOT NULL,
  `faction_name` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Faction`
--

INSERT INTO `Faction` (`faction_id`, `faction_name`, `user_id`) VALUES
(1, 'Mystic', 7),
(2, 'Valor', 8);

-- --------------------------------------------------------

--
-- Table structure for table `Gym`
--

CREATE TABLE `Gym` (
  `gym_id` int(11) NOT NULL,
  `gym_name` varchar(20) NOT NULL,
  `gym_latitude` int(11) NOT NULL,
  `gym_longitude` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Gym`
--

INSERT INTO `Gym` (`gym_id`, `gym_name`, `gym_latitude`, `gym_longitude`) VALUES
(1, 'SJSU', 37, -122),
(2, 'SJSUStudentUnion', 37, -122);

-- --------------------------------------------------------

--
-- Table structure for table `Gym_Masters`
--

CREATE TABLE `Gym_Masters` (
  `gym_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Gym_Masters`
--

INSERT INTO `Gym_Masters` (`gym_id`, `user_id`) VALUES
(1, 7),
(2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Health_center`
--

CREATE TABLE `Health_center` (
  `health_center_id` int(11) NOT NULL,
  `health_center_name` varchar(20) NOT NULL,
  `health_center_latitude` int(11) NOT NULL,
  `health_center_longitude` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Health_center`
--

INSERT INTO `Health_center` (`health_center_id`, `health_center_name`, `health_center_latitude`, `health_center_longitude`) VALUES
(1, 'SJSU', 37, -122),
(2, 'SJSUStudentUnion', 37, -122);

-- --------------------------------------------------------

--
-- Table structure for table `Health_Center_Resources`
--

CREATE TABLE `Health_Center_Resources` (
  `potions` int(11) NOT NULL,
  `pokeballs` int(11) NOT NULL,
  `health_center_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Health_Center_Resources`
--

INSERT INTO `Health_Center_Resources` (`potions`, `pokeballs`, `health_center_id`) VALUES
(50, 100, 1),
(60, 100, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Login`
--

CREATE TABLE `Login` (
  `password` varchar(20) NOT NULL,
  `last_login_time` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Login`
--

INSERT INTO `Login` (`password`, `last_login_time`, `status`, `user_id`) VALUES
('zaq1', '0000-00-00 00:00:00.', 'active', 7),
('zaq1', '0000-00-00 00:00:00.', 'active', 8);

-- --------------------------------------------------------

--
-- Table structure for table `Marketplace`
--

CREATE TABLE `Marketplace` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Marketplace`
--

INSERT INTO `Marketplace` (`item_id`, `item_name`, `item_price`) VALUES
(1, 'coins', 1),
(2, 'potions', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Medal`
--

CREATE TABLE `Medal` (
  `medal_id` int(11) NOT NULL,
  `medal_name` varchar(11) NOT NULL,
  `medal_description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Medal`
--

INSERT INTO `Medal` (`medal_id`, `medal_name`, `medal_description`) VALUES
(1, 'first50', 'Congratulations you have unlocked 50 pokemons'),
(2, 'first100', 'Congratulations you have unlocked 100 pokemons');

-- --------------------------------------------------------

--
-- Table structure for table `Pokemons`
--

CREATE TABLE `Pokemons` (
  `pokemon_id` int(11) NOT NULL,
  `pokemon_name` varchar(20) NOT NULL,
  `pokemon_type` varchar(10) NOT NULL,
  `pokemon_strength` int(11) NOT NULL,
  `pokemon_level` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `height` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Pokemons`
--

INSERT INTO `Pokemons` (`pokemon_id`, `pokemon_name`, `pokemon_type`, `pokemon_strength`, `pokemon_level`, `weight`, `height`) VALUES
(1, 'pikachu', 'electric', 20, 1, 10, 12),
(2, 'charmander', 'fire', 20, 1, 10, 12),
(3, 'charlizard', 'fire', 100, 3, 40, 20),
(4, 'magmar', 'fire', 20, 1, 10, 12);

-- --------------------------------------------------------

--
-- Table structure for table `Pokestops`
--

CREATE TABLE `Pokestops` (
  `pokestop_id` int(11) NOT NULL,
  `pokestop_name` varchar(11) NOT NULL,
  `pokestop_longitude` int(11) NOT NULL,
  `pokestop_latitude` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Pokestops`
--

INSERT INTO `Pokestops` (`pokestop_id`, `pokestop_name`, `pokestop_longitude`, `pokestop_latitude`) VALUES
(1, 'SJSU', 37, -122),
(2, 'StudentUn', 37, -122);

-- --------------------------------------------------------

--
-- Table structure for table `Pokestop_Resources`
--

CREATE TABLE `Pokestop_Resources` (
  `eggs` int(11) DEFAULT NULL,
  `coins` int(11) NOT NULL,
  `potions` int(11) DEFAULT NULL,
  `incense_sticks` int(11) DEFAULT NULL,
  `pokeballs` int(11) NOT NULL,
  `pokestop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Pokestop_Resources`
--

INSERT INTO `Pokestop_Resources` (`eggs`, `coins`, `potions`, `incense_sticks`, `pokeballs`, `pokestop_id`) VALUES
(20, 60, 10, 10, 100, 1),
(10, 50, 20, 10, 100, 2);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `name` varchar(40) NOT NULL,
  `level` int(11) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `device_type` varchar(10) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`name`, `level`, `gender`, `device_type`, `payment_method`, `user_id`) VALUES
('vinayak', 10, 'male', 'android', 'creditCard', 7),
('Vedang', 0, 'male', 'ios', 'applePay', 8);

-- --------------------------------------------------------

--
-- Table structure for table `User_achievements`
--

CREATE TABLE `User_achievements` (
  `user_id` int(11) NOT NULL,
  `medal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User_achievements`
--

INSERT INTO `User_achievements` (`user_id`, `medal_id`) VALUES
(7, 1),
(8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `User_Pokedex`
--

CREATE TABLE `User_Pokedex` (
  `pokemon_strength` int(11) NOT NULL,
  `pokemon_level` int(11) NOT NULL,
  `pokemon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User_Pokedex`
--

INSERT INTO `User_Pokedex` (`pokemon_strength`, `pokemon_level`, `pokemon_id`, `user_id`) VALUES
(20, 1, 1, 7),
(20, 1, 1, 8),
(20, 1, 2, 8),
(20, 3, 3, 8),
(20, 1, 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `User_resources`
--

CREATE TABLE `User_resources` (
  `pokeballs` int(11) NOT NULL,
  `eggs` int(11) NOT NULL,
  `coins` int(11) NOT NULL,
  `incense_sticks` int(11) NOT NULL,
  `potions` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User_resources`
--

INSERT INTO `User_resources` (`pokeballs`, `eggs`, `coins`, `incense_sticks`, `potions`, `user_id`) VALUES
(10, 2, 40, 1, 4, 7),
(20, 4, 30, 2, 1, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Battles`
--
ALTER TABLE `Battles`
  ADD PRIMARY KEY (`battle_id`),
  ADD KEY `user1_id` (`user1_id`),
  ADD KEY `user2_id` (`user2_id`),
  ADD KEY `pokemon1_id` (`pokemon1_id`),
  ADD KEY `pokemon2_id` (`pokemon2_id`);

--
-- Indexes for table `Battle_Locations`
--
ALTER TABLE `Battle_Locations`
  ADD PRIMARY KEY (`battle_id`),
  ADD KEY `gym_id` (`gym_id`);

--
-- Indexes for table `Faction`
--
ALTER TABLE `Faction`
  ADD PRIMARY KEY (`faction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Gym`
--
ALTER TABLE `Gym`
  ADD PRIMARY KEY (`gym_id`);

--
-- Indexes for table `Gym_Masters`
--
ALTER TABLE `Gym_Masters`
  ADD PRIMARY KEY (`gym_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Health_center`
--
ALTER TABLE `Health_center`
  ADD PRIMARY KEY (`health_center_id`);

--
-- Indexes for table `Health_Center_Resources`
--
ALTER TABLE `Health_Center_Resources`
  ADD PRIMARY KEY (`health_center_id`);

--
-- Indexes for table `Login`
--
ALTER TABLE `Login`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `Marketplace`
--
ALTER TABLE `Marketplace`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `Medal`
--
ALTER TABLE `Medal`
  ADD PRIMARY KEY (`medal_id`);

--
-- Indexes for table `Pokemons`
--
ALTER TABLE `Pokemons`
  ADD PRIMARY KEY (`pokemon_id`);

--
-- Indexes for table `Pokestops`
--
ALTER TABLE `Pokestops`
  ADD PRIMARY KEY (`pokestop_id`);

--
-- Indexes for table `Pokestop_Resources`
--
ALTER TABLE `Pokestop_Resources`
  ADD PRIMARY KEY (`pokestop_id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `User_achievements`
--
ALTER TABLE `User_achievements`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `medal_id` (`medal_id`);

--
-- Indexes for table `User_Pokedex`
--
ALTER TABLE `User_Pokedex`
  ADD PRIMARY KEY (`pokemon_id`,`user_id`),
  ADD KEY `user_fk` (`user_id`);

--
-- Indexes for table `User_resources`
--
ALTER TABLE `User_resources`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Battles`
--
ALTER TABLE `Battles`
  ADD CONSTRAINT `battles_ibfk_1` FOREIGN KEY (`user1_id`) REFERENCES `User` (`user_id`),
  ADD CONSTRAINT `battles_ibfk_2` FOREIGN KEY (`user2_id`) REFERENCES `User` (`user_id`),
  ADD CONSTRAINT `battles_ibfk_3` FOREIGN KEY (`pokemon1_id`) REFERENCES `Pokemons` (`pokemon_id`),
  ADD CONSTRAINT `battles_ibfk_4` FOREIGN KEY (`pokemon2_id`) REFERENCES `Pokemons` (`pokemon_id`);

--
-- Constraints for table `Battle_Locations`
--
ALTER TABLE `Battle_Locations`
  ADD CONSTRAINT `battle_locations_ibfk_1` FOREIGN KEY (`battle_id`) REFERENCES `Battles` (`battle_id`),
  ADD CONSTRAINT `battle_locations_ibfk_2` FOREIGN KEY (`gym_id`) REFERENCES `Gym` (`gym_id`);

--
-- Constraints for table `Faction`
--
ALTER TABLE `Faction`
  ADD CONSTRAINT `faction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

--
-- Constraints for table `Gym_Masters`
--
ALTER TABLE `Gym_Masters`
  ADD CONSTRAINT `gym_masters_ibfk_1` FOREIGN KEY (`gym_id`) REFERENCES `Gym` (`gym_id`),
  ADD CONSTRAINT `gym_masters_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

--
-- Constraints for table `Health_Center_Resources`
--
ALTER TABLE `Health_Center_Resources`
  ADD CONSTRAINT `health_center_resources_ibfk_1` FOREIGN KEY (`health_center_id`) REFERENCES `Health_center` (`health_center_id`);

--
-- Constraints for table `Login`
--
ALTER TABLE `Login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

--
-- Constraints for table `Pokestop_Resources`
--
ALTER TABLE `Pokestop_Resources`
  ADD CONSTRAINT `pokestop_resources_ibfk_1` FOREIGN KEY (`pokestop_id`) REFERENCES `Pokestops` (`pokestop_id`);

--
-- Constraints for table `User_achievements`
--
ALTER TABLE `User_achievements`
  ADD CONSTRAINT `user_achievements_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  ADD CONSTRAINT `user_achievements_ibfk_2` FOREIGN KEY (`medal_id`) REFERENCES `Medal` (`medal_id`);

--
-- Constraints for table `User_Pokedex`
--
ALTER TABLE `User_Pokedex`
  ADD CONSTRAINT `pokemon_fk` FOREIGN KEY (`pokemon_id`) REFERENCES `Pokemons` (`pokemon_id`),
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

--
-- Constraints for table `User_resources`
--
ALTER TABLE `User_resources`
  ADD CONSTRAINT `user_resources_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
