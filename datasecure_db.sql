-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2024 at 06:34 PM
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
-- Database: `datasecure_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `encryption_key` text DEFAULT NULL,
  `storage_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `encryption_key`, `storage_url`) VALUES
(2, 'string', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` text DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `message_type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `sender_id`, `receiver_id`, `timestamp`, `content`, `image_id`, `message_type`) VALUES
(4, 7, 8, '2024-10-09 04:58:12', 'string', 2, 1),
(9, 7, 8, '2024-10-09 15:50:53', 'dzfbfdbdfzdb', NULL, 0),
(10, 8, 7, '2024-10-09 15:51:16', 'ahgaggtgtg', NULL, 0),
(11, 7, 9, '2024-10-09 16:16:52', 'etahbthbstrngfvcvvcvb', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `public_key` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `password`, `public_key`) VALUES
(3, 'admin', 'ac9689e2272427085e35b9d3e3e8bed88cb3434828b43b86fc0596cad4c6e270', ''),
(5, 'user', '831c237928e6212bedaa4451a514ace3174562f6761f6a157a2fe5082b36e2fb', ''),
(6, 'test', '937e8d5fbb48bd4949536cd65b8d35c426b80d2f830c5c308e2cdec422ae2244', ''),
(7, 'paper', '4ef47dd8aaa341823ef1200072607f1e0a606d6ffcb1015ec076e6dd15d3776c', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA05pFYLYvTZ3TC9wGTnOT\nQ2KTCFaJEKMaXtO6yjuIIRv9okotQk8C7IyYw8ElPzhtNS3h3MzfhMEuAruSF3Hf\nY367WUlmPpijZ3OkX1ZOrhDCkCa1q37Le74pyxnoQia8a48NEIOGdGuxzAQTBlIf\nISpqCYF4FVzcEsEFZKkcYqlEP47JDI+xGiOfiIcHnUZQdsQmMjJ9Ba9ECTxTixf/\nRL5kt0HyZrDT/EXhNOQUFJquZZ+8Dik7oypqYavgNeb75TjcMLsDeaRBWuMCicqh\nMp0IyxFnC+IMAHl4JTsBNDZkhhzC+Vd5YwnY6Mv9ay88ecLTculme7QqAtbaTc5m\nbQIDAQAB\n-----END PUBLIC KEY-----\n'),
(8, 'did', '6b898dbae075a35790c6f6244164d065e1fbcad3ec48f7bdda70014c2e8acbd4', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiPreAM4HyMJ4EmdIEPAm\nLhHn67K2UebO18mDeNo6D/C8LbdV0qMOGyZ90RgXknbcDuoMpH1xEo1/kqfFOiGp\nSNzaPAtUoKjEJGNMu5DbxdfMujldaY8Jhf88886UeOWs/3DsEHOU1xKj6rinNUvI\nLc/giKYup6qLKmrelFFcZ6iTG4Tw9vMSZWL0RycfPcZYojbee3V+KqiWetu2n/sd\nVlVG1/SnK2C1NuSPRSxx3Xu+oO66xpT9SvJ0rj4a4vNHPVQ2BSg0fYKIYB+sBQqj\nMrng0vVNp8N5mYcahv5d8D3g3kcY4ASiMN0VmmorUsm8mz3y83kdLin8Vcx0ZqdW\nmQIDAQAB\n-----END PUBLIC KEY-----\n'),
(9, 'best', '20b3df11e7a4a4a6b4e51b874392413ac37411896c6b1957eac94546cf946b5a', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw2cNRGyA9XvxNUGDiXW5\nXOdhMRVtL3yhfz++L4Gy91hP7Ymd4rbmW6t9ia8+bPsIuMpCiNpqD1sFg6c+eXhG\nES9XEJmVTcvjug0mE12YM2cfdBnrasCybdNy7bYavpVP9iuiGOk9kcll44K/NNjc\nf1ftA8ToKiPs6qztHHgSX1bXEK+7Z0oZ4nL+gfZx3AOG6J/HQI0sroCmfwVuaiwC\ngnK68ATqhsMe+0cz3F2UmW2KGI/nxK6ZVbxY2xEAb7etYXjgCH/dJeluLM0ITNfp\nucUXf01sEgPtGQ+7k/fS6tPp3G4wkotSHKKh5Wk22TcZOgHVQuJUJ2BwTbfjZ9Kc\nXQIDAQAB\n-----END PUBLIC KEY-----\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
