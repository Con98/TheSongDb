-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2018 at 08:58 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

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
(2, 'test', 'Emmet_Mc'),
(3, 'TFriend', 'ThomasCon44'),
(4, 'Emmet_Mc', 'TFriend'),
(5, 'ThomasCon44', 'test'),
(6, 'test', 'TFriend'),
(7, 'Emmet_Mc', 'ThomasCon44'),
(8, 'ThomasCon44', 'Hendrick12');

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
(6, 1, 2, '2018-03-15 02:11:49', 'testingPass', 'JustTestingThePass'),
(7, 1, 2, '2018-03-15 02:14:09', 'testingPass', 'JustTestingThePass'),
(8, 1, 2, '2018-03-15 02:20:35', 'testingPass', 'JustTestingThePass'),
(9, 1, 2, '2018-03-15 02:22:28', 'testingPass', 'JustTestingThePass'),
(10, 1, 2, '2018-03-15 02:24:29', 'testingPass', 'JustTestingThePass'),
(11, 3, 3, '2018-03-15 03:28:40', 'Hi Tom', 'Its me Thomas'),
(12, 3, 1, '2018-04-16 22:23:23', 'Hello', 'UserId Test'),
(13, 1, 3, '2018-04-16 22:34:14', 'Test Message', 'UserId Test'),
(14, 1, 2, '2018-05-02 16:58:12', 'Hi Tom', 'How are you?'),
(15, 1, 2, '2018-05-02 17:01:33', 'test', 'test'),
(16, 3, 4, '2018-05-02 17:03:18', 'test', 't'),
(17, 3, 4, '2018-05-02 17:05:06', 'Test Message', 'john\r\n'),
(18, 3, 4, '2018-05-02 17:08:09', 'john', 'john'),
(19, 3, 6, '2018-05-02 17:19:33', 'john', 'john test onclick'),
(20, 3, 6, '2018-05-02 17:24:15', 'r', 'rr');

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
(2, 2, '2018-03-15 02:11:53', 'testingDeleteStatus'),
(3, 2, '2018-03-15 02:14:12', 'testing Status'),
(4, 2, '2018-03-15 02:14:12', 'testingDeleteStatus'),
(5, 2, '2018-03-15 02:20:38', 'testing Status'),
(6, 2, '2018-03-15 02:20:38', 'testingDeleteStatus'),
(7, 2, '2018-03-15 02:22:32', 'testing Status'),
(8, 2, '2018-03-15 02:22:32', 'testingDeleteStatus'),
(9, 2, '2018-03-15 02:24:32', 'testing Status'),
(10, 2, '2018-03-15 02:24:32', 'testingDeleteStatus'),
(11, 2, '2018-03-15 02:26:13', 'testing Status'),
(12, 2, '2018-03-15 02:26:13', 'testingDeleteStatus'),
(14, 3, '2018-04-17 21:38:20', 'Hello'),
(15, 3, '2018-04-17 22:49:00', 'Helloo');

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
(3, 'Thomas', 'Conroy', 'ThomasCon44', 'thomascon44@gmail.com', 'd38681074467c0bc147b17a9a12b9efa8cc10bcf545f5b0bccccf5a93c4a2b79', 1),
(4, 'Friend', 'Test', 'TFriend', 'tf@gmail.com', '8541c2d149faea7b7e534fcd56f5d352c7ed5a620d81394c002a17f07e18a567', 0),
(5, 'Test', 'Test', 'Test2', 'test@test.tests', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', 0),
(6, 'John', 'Hendrickson', 'Hendrick12', 'jh@gmail.com', '96d9632f363564cc3032521409cf22a852f2032eec099ed5967c0d000cec607a', 0),
(7, 'Thomas', 'Cullen', 'TCull92', 'thomascull@gmail.com', 'd38681074467c0bc147b17a9a12b9efa8cc10bcf545f5b0bccccf5a93c4a2b79', 0);

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
  MODIFY `friendId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `friendrequest`
--
ALTER TABLE `friendrequest`
  MODIFY `requestId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `messageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `statusId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
-- Constraints for table `friendrequest`
--
ALTER TABLE `friendrequest`
  ADD CONSTRAINT `friendrequest_ibfk_1` FOREIGN KEY (`friend1`) REFERENCES `users` (`userName`) ON DELETE CASCADE,
  ADD CONSTRAINT `friendrequest_ibfk_2` FOREIGN KEY (`friend2`) REFERENCES `users` (`userName`) ON DELETE CASCADE;

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
