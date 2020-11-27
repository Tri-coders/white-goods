-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2020 at 05:23 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whitegood`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billing_id` int(10) NOT NULL,
  `request_id` int(10) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`) VALUES
(1, 'Samsung'),
(2, 'LG'),
(3, 'Godrej'),
(4, 'Whirlpool');

-- --------------------------------------------------------

--
-- Table structure for table `employee_role`
--

CREATE TABLE `employee_role` (
  `user_id` int(4) NOT NULL,
  `install` varchar(1) NOT NULL,
  `inventory` varchar(1) NOT NULL,
  `demo` varchar(1) NOT NULL,
  `upgrade` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_role`
--

INSERT INTO `employee_role` (`user_id`, `install`, `inventory`, `demo`, `upgrade`) VALUES
(9, '0', '0', '0', '0'),
(10, '1', '0', '1', '1'),
(11, '0', '0', '0', '1'),
(12, '0', '0', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `product_id` varchar(15) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text,
  `price` int(10) NOT NULL,
  `quantity` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `user_id` int(4) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`user_id`, `password`) VALUES
(8, '$2b$10$jwj/rz0sj7kw6LgFG7d6WeyWJiixq6qKcgQreznr1ShrlgtjcnQf.'),
(9, '$2b$10$HYZ6BlJ8v63gDQUthubUx.MAj.3gkDNSUHg.7Rcr5pSFMjq./EgaO'),
(10, '$2b$10$4v7up9pw.OAkoqfiSfZ6aOPbyIHhn3rIbf6tiviwT3E4CBSYgWJsW'),
(9, '$2b$10$0fkbXizzv7UTE4gSlkJpUOetJOED.e4ljPy3tFztzf5T0YF.ytY7a'),
(9, '$2b$10$Ab4OdmUcon5Lk6WQU6JxNuTNcwygBlqXTsditNqi7tmXTTemogX9O'),
(11, '$2b$10$zet8wo1hfBA863cIvuLXjud.q61l9tbfomkYBsPxtJ6pS7yRGHFgO'),
(9, '$2b$10$QlqzKYk2MoNuVEWWxktOWeNJyRJ9PR5fke92MLvDIPJastiyFgmU6'),
(9, '$2b$10$cN4wa9pNYGhZaRJ3Z2ClJeUW0XHtUpapiOpmPSY6WkMnw0yU3.rcO'),
(12, '$2b$10$A788pSDkTboNgKUW6whT0u8XRhUDxllIxvusbUvu5DiNffoUkhW8u');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `model_id` int(11) NOT NULL,
  `model_no` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL,
  `model_price` varchar(100) NOT NULL,
  `model_img` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `whitegoodcategory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(10) NOT NULL,
  `user_id` int(4) NOT NULL,
  `title` varchar(20) NOT NULL,
  `description` text,
  `name` varchar(35) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(15) NOT NULL,
  `pin` varchar(6) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` varchar(10) NOT NULL,
  `time` varchar(8) NOT NULL,
  `status` int(11) NOT NULL,
  `otp` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `request_id` int(10) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` int(4) NOT NULL,
  `name` varchar(35) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(15) NOT NULL,
  `pin` varchar(8) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` int(1) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `is_deleted` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `name`, `address`, `city`, `pin`, `contact`, `email`, `role`, `image`, `is_deleted`) VALUES
(8, 'Admin', 'Automobile Premier Road, Kurla (West)', 'Mumbai', '400070', '9702717188', 'sanketdeveloper00@gmail.com', 0, NULL, '0'),
(9, 'Sameer SIngh', 'Khindipada, Bhandup (West)', 'Mumbai', '400078', '9082171403', 'sanketdeshmukh880@gmail.com', 1, NULL, '0'),
(10, 'Sanket Deshmukh', '2, Jatadhari Chawl, New Sanjay Niwas, Bhandup (West)', 'Mumbai', '400078', '9702717188', 'meetsanket24@gmail.com', 2, 'http://128.199.30.114:9000/images/sanket.jpg', '0'),
(11, 'Prabodh', 'I.U.D.P. colony washim ', 'Washim', '444505', '8208023919', 'prabodh.shewalkar@gmail.com', 2, NULL, '0'),
(12, 'Afif Shaikh', 'MK Residency Kurla West', 'Mumbai', '400070', '9769320992', 'shaikhafif48@gmail.com', 2, 'http://128.199.30.114:9000/images/afif.png', '0');

-- --------------------------------------------------------

--
-- Table structure for table `whitegoodcategory`
--

CREATE TABLE `whitegoodcategory` (
  `good_id` int(11) NOT NULL,
  `good_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `whitegoodcategory`
--

INSERT INTO `whitegoodcategory` (`good_id`, `good_name`) VALUES
(1, 'AC'),
(2, 'Refrigerator'),
(3, 'Oven'),
(4, 'WashingMachine');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billing_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `employee_role`
--
ALTER TABLE `employee_role`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `whitegoodcategory_id` (`whitegoodcategory_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `whitegoodcategory`
--
ALTER TABLE `whitegoodcategory`
  ADD PRIMARY KEY (`good_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `billing_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `whitegoodcategory`
--
ALTER TABLE `whitegoodcategory`
  MODIFY `good_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`);

--
-- Constraints for table `employee_role`
--
ALTER TABLE `employee_role`
  ADD CONSTRAINT `employee_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`);

--
-- Constraints for table `login_details`
--
ALTER TABLE `login_details`
  ADD CONSTRAINT `login_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`);

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  ADD CONSTRAINT `model_ibfk_2` FOREIGN KEY (`whitegoodcategory_id`) REFERENCES `whitegoodcategory` (`good_id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`);

--
-- Constraints for table `sells`
--
ALTER TABLE `sells`
  ADD CONSTRAINT `sells_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
