-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2018 at 03:54 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thesongdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

CREATE TABLE `friend` (
  `friendId` int(11) NOT NULL,
  `friend1` varchar(30) NOT NULL,
  `friend2` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friend`
--

INSERT INTO `friend` (`friendId`, `friend1`, `friend2`) VALUES
(1, 'Emmet_Mc', 'test'),
(3, 'johnnysmith', 'Emmet_Mc'),
(4, 'johnnysmith', 'colme63'),
(5, 'johnnysmith', 'DaveyS');

-- --------------------------------------------------------

--
-- Table structure for table `friendrequest`
--

CREATE TABLE `friendrequest` (
  `requestId` int(11) NOT NULL,
  `friend1` varchar(30) NOT NULL,
  `friend2` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `messageId` int(11) NOT NULL,
  `fromId` int(11) NOT NULL,
  `toId` int(11) NOT NULL,
  `sentOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subjectLine` varchar(50) NOT NULL,
  `messageContent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`messageId`, `fromId`, `toId`, `sentOn`, `subjectLine`, `messageContent`) VALUES
(3, 2, 1, '2018-03-02 13:46:51', 'test sub', 'test mesg'),
(4, 5, 7, '2018-04-18 13:22:27', 'College', 'CA'),
(5, 5, 9, '2018-04-18 14:10:14', 'free pills', 'get them now');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `statusId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `sentOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `statusContent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`statusId`, `userId`, `sentOn`, `statusContent`) VALUES
(1, 5, '2018-04-18 11:41:20', 'test to see if everyone can see this'),
(3, 8, '2018-04-18 13:44:35', 'I am using this site'),
(4, 9, '2018-04-18 14:06:38', 'Hello everyone'),
(5, 1, '2018-04-19 11:44:49', 'test to see if everyone can see this'),
(6, 1, '2018-04-19 11:54:45', 'another test');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` int(3) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `surName` varchar(30) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(300) NOT NULL,
  `isAdmin` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `firstName`, `surName`, `userName`, `email`, `password`, `isAdmin`) VALUES
(1, 'Emmet', 'Mc Eneaney', 'Emmet_Mc', 'emmetmceneaney@gmail.com', '62a6f90071b5314d0f0b3fe4c5974df357c37bcd166a81063901d5c0855065c3', 0),
(2, 'test', 'test', 'test', 'test@test.test', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', 0),
(5, 'John', 'Smith', 'johnnysmith', 'johnsmith@gmail.com', '19513fdc9da4fb72a4a05eb66917548d3c90ff94d5419e1f2363eea89dfee1dd', 0),
(6, 'Administrator', 'Administrator', 'Admin', 'admin@gmail.com', '15e20dd8458ddacbcd66dbe7437d1e221eb9e892be4110488f2191d53a5abc04', 1),
(7, 'Colm', 'Erdenetogs', 'colme63', 'colm@gmail.com', '6ca13d52ca70c883e0f0bb101e425a89e8624de51db2d2392593af6a84118090', 0),
(8, 'Adam', 'Mackle', 'AdamMackle', 'amackle@gmail.com', '948edbe7ede5aa7423476ae29dcd7d61e7711a071aea0d83698377effa896525', 0),
(9, 'Dave', 'Smith', 'DaveyS', 'DaveSmith@gmail.com', '948edbe7ede5aa7423476ae29dcd7d61e7711a071aea0d83698377effa896525', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`friendId`),
  ADD KEY `friend1` (`friend1`),
  ADD KEY `friend2` (`friend2`);

--
-- Indexes for table `friendrequest`
--
ALTER TABLE `friendrequest`
  ADD PRIMARY KEY (`requestId`),
  ADD KEY `friend1` (`friend1`),
  ADD KEY `friend2` (`friend2`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`messageId`),
  ADD KEY `fromId` (`fromId`),
  ADD KEY `toId` (`toId`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`statusId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `userName` (`userName`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `friend`
--
ALTER TABLE `friend`
  MODIFY `friendId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `friendrequest`
--
ALTER TABLE `friendrequest`
  MODIFY `requestId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `messageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `statusId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `friend`
--
ALTER TABLE `friend`
  ADD CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`friend1`) REFERENCES `users` (`userName`) ON DELETE CASCADE,
  ADD CONSTRAINT `friend_ibfk_2` FOREIGN KEY (`friend2`) REFERENCES `users` (`userName`) ON DELETE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`fromId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`toId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE;

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
