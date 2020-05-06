-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 06, 2020 at 07:35 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Doctor`
--

-- --------------------------------------------------------

--
-- Table structure for table `regDoctors`
--

CREATE TABLE `regDoctors` (
  `doctor_id` int(11) NOT NULL,
  `firstName` varchar(40) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `joinedDate` varchar(30) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `specialization` varchar(40) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `NIC` varchar(10) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regDoctors`
--

INSERT INTO `regDoctors` (`doctor_id`, `firstName`, `lastName`, `gender`, `email`, `password`, `joinedDate`, `phone`, `specialization`, `address`, `NIC`, `hospital_id`) VALUES
(1, 'Savandi', 'Subhartha', 'Female', 'savandi@gmail.com', '123', '2020-05-3', 889876788, 'ENT', 'No 27/6,Madiwela,Kotte', '988236738V', 2),
(2, 'Anne', 'Sofie', 'Female', 'anne123@gmail.com', '111', '2020-05-04', 778998722, 'HEART', 'No 10, 1st lane, Colombo 3', '988767876V', 1),
(3, 'Tom', 'Marsh', 'Male', 'tom@outlook.com', '222', '2020-05-05', 77865670, 'Cardiologist', 'No 23, Mosque lane, Dehiwela', '987865676V', 9),
(4, 'Natasha ', 'Peterson', 'Female', 'natz@outlook.com', '2525', '2020-05-05', 767845922, 'Gastroenterologist', '22/1, Temple Road, Kiribathgoda', '908789435V', 5),
(5, 'Kim', 'Taehyung', 'Male', 'tae@outlook.com', '1010', '2020-05-05', 716789882, 'Dermatologist', '22/A, Flower road, Colombo 7', '956787675V', 3),
(6, 'Shawn', 'Holland', 'Male', 'emily@gmail.com', '55', '2020-05-05', 776578766, 'OTC', 'No 123, 2nd Lane, Kotte', '988987656V', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `regDoctors`
--
ALTER TABLE `regDoctors`
  ADD PRIMARY KEY (`doctor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
