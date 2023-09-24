-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2023 at 07:26 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `choices`
--

CREATE TABLE `choices` (
  `id` int(11) NOT NULL,
  `choice_code` varchar(20) DEFAULT NULL,
  `question_code` varchar(20) DEFAULT NULL,
  `choice_value` varchar(50) DEFAULT NULL,
  `choice_group_code` varchar(200) NOT NULL DEFAULT 'gender'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `choices`
--

INSERT INTO `choices` (`id`, `choice_code`, `question_code`, `choice_value`, `choice_group_code`) VALUES
(3, 'CH001', 'Q002', 'Male', 'gender'),
(4, 'CH002', 'Q002', 'Female', 'gender');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question_code` varchar(20) DEFAULT NULL,
  `question` varchar(200) DEFAULT NULL,
  `question_type` varchar(200) DEFAULT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question_code`, `question`, `question_type`, `user_id`) VALUES
(1, 'Q001', 'What is your name?', 'text', '1'),
(2, 'Q002', 'Select Gender', 'radio', '1');

-- --------------------------------------------------------

--
-- Table structure for table `response`
--

CREATE TABLE `response` (
  `id` int(11) NOT NULL,
  `question_code` varchar(20) DEFAULT NULL,
  `response` varchar(200) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `group_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `response`
--

INSERT INTO `response` (`id`, `question_code`, `response`, `user_id`, `group_code`) VALUES
(1, 'Q001', 'xx', '1', 'gqdqN8jJ'),
(2, 'Q002', 'Male', '1', 'gqdqN8jJ'),
(3, 'Q001', 'x', '1', '8SXoRyaH'),
(4, 'Q002', 'Male', '1', '8SXoRyaH'),
(5, 'Q001', 'x', '1', 'SvpriGyR'),
(6, 'Q002', 'Male', '1', 'SvpriGyR'),
(7, 'Q001', 'x', '1', 'AuWsPzYS'),
(8, 'Q002', 'Male', '1', 'AuWsPzYS'),
(9, 'Q001', 'x', '1', 'JbhRsPrJ'),
(10, 'Q002', 'Male', '1', 'JbhRsPrJ'),
(11, 'Q001', 'x', '1', 'wwgbnOj0'),
(12, 'Q002', 'Male', '1', 'wwgbnOj0'),
(13, 'Q001', 'x', '1', 'Uc3smoos'),
(14, 'Q002', 'Male', '1', 'Uc3smoos'),
(15, 'Q001', 'shrikrishna', '1', 'h4rQKApc'),
(16, 'Q002', 'Female', '1', 'h4rQKApc'),
(17, 'Q001', 'shrikrishna', '1', 'U5E663bk'),
(18, 'Q002', 'Female', '1', 'U5E663bk'),
(19, 'Q001', 'shrikrishna', '1', 'mLHn9AwT'),
(20, 'Q002', 'Female', '1', 'mLHn9AwT'),
(21, 'Q001', 'shrikrishna', '1', 'zuv2TN0F'),
(22, 'Q002', 'Female', '1', 'zuv2TN0F'),
(23, 'Q001', 'shrikrishna', '1', 'PrwkYrO2'),
(24, 'Q002', 'Female', '1', 'PrwkYrO2'),
(25, 'Q001', 'shrikrishna', '1', '3IDeMXTH'),
(26, 'Q002', 'Female', '1', '3IDeMXTH'),
(27, 'Q001', 'Raj', '1', 'Jj3EyO11'),
(28, 'Q002', 'Male', '1', 'Jj3EyO11'),
(29, 'Q001', 'Raj', '1', 'wiuyDQC0'),
(30, 'Q002', 'Male', '1', 'wiuyDQC0'),
(31, 'Q001', 'x', '1', 'wJbtYpmu'),
(32, 'Q002', 'Male', '1', 'wJbtYpmu'),
(33, 'Q001', 'x', '1', 'jrAIsvHI'),
(34, 'Q002', 'Male', '1', 'jrAIsvHI'),
(35, 'Q001', 'okay', '1', '3fY38hwA'),
(36, 'Q002', 'Male', '1', '3fY38hwA'),
(37, 'Q001', 'okay', '1', 'UjaDJ7ZT'),
(38, 'Q002', 'Male', '1', 'UjaDJ7ZT'),
(39, 'Q001', 'One', '1', 'deRo7N0u'),
(40, 'Q002', 'Male', '1', 'deRo7N0u'),
(41, 'Q001', 'raj', '1', 'Owj1qaLC'),
(42, 'Q002', 'Male', '1', 'Owj1qaLC'),
(43, 'Q001', 'xx', '1', 'n4exCM24'),
(44, 'Q002', 'Male', '1', 'n4exCM24'),
(45, 'Q001', 'John', '1', '3jNiXC7W'),
(46, 'Q002', 'Male', '1', '3jNiXC7W');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `choices`
--
ALTER TABLE `choices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `choice_code` (`choice_code`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question_code` (`question_code`);

--
-- Indexes for table `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `choices`
--
ALTER TABLE `choices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `response`
--
ALTER TABLE `response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
