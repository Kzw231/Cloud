-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2025 at 06:15 PM
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
-- Database: `clouddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartID` varchar(10) NOT NULL,
  `userID` varchar(10) DEFAULT NULL,
  `sessionID` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartID`, `userID`, `sessionID`, `created_at`) VALUES
('C10002', 'U10001', NULL, '2025-05-03 15:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `cartID` varchar(10) NOT NULL,
  `productID` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cartitem`
--

INSERT INTO `cartitem` (`cartID`, `productID`, `quantity`) VALUES
('C10002', 'P10011', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `orderItemID` varchar(10) NOT NULL,
  `orderID` varchar(10) NOT NULL,
  `productID` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` varchar(10) NOT NULL,
  `userID` varchar(10) DEFAULT NULL,
  `guestEmail` varchar(255) DEFAULT NULL,
  `shippingAddress` text NOT NULL,
  `paymentMethod` varchar(32) DEFAULT NULL,
  `totalPrice` decimal(10,2) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` varchar(10) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productCategory` varchar(50) NOT NULL,
  `productImageUrl` varchar(255) DEFAULT NULL,
  `stockQty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `productPrice`, `productCategory`, `productImageUrl`, `stockQty`) VALUES
('P10001', 'Elegant Rose Graduation Bouquet', 89.99, 'Bouquet', 'image/product/Flower/Flower1.png', 49),
('P10002', 'Sunflower Joy Graduation Bouquet', 79.99, 'Bouquet', 'image/product/Flower/Flower2.png', 45),
('P10003', 'Mixed Flower Celebration Bouquet', 99.99, 'Bouquet', 'image/product/Flower/Flower3.png', 39),
('P10004', 'Premium Rose Gold Bouquet', 129.99, 'Bouquet', 'image/product/Flower/Flower4.png', 29),
('P10005', 'Deluxe Rainbow Graduation Bouquet', 109.99, 'Bouquet', 'image/product/Flower/Flower5.png', 34),
('P10006', 'Classic White & Gold Bouquet', 94.99, 'Bouquet', 'image/product/Flower/Flower6.png', 32),
('P10007', 'Normal Graduation T-Shirt(white)', 39.99, 'T-shirt', 'image/product/T-shirt/t-shirt1.png', 100),
('P10008', 'Normal Graduation T-Shirt(pink)', 39.99, 'T-shirt', 'image/product/T-shirt/t-shirt2.png', 80),
('P10009', 'Achievement Unlocked T-Shirt', 42.99, 'T-shirt', 'image/product/T-shirt/t-shirt3.png', 88),
('P10010', 'Future Alumni T-Shirt', 41.99, 'T-shirt', 'image/product/T-shirt/t-shirt4.png', 83),
('P10011', 'Graduation Year Custom T-Shirt', 45.99, 'T-shirt', 'image/product/T-shirt/t-shirt5.png', 70),
('P10012', 'Proud Graduate T-Shirt', 43.99, 'T-shirt', 'image/product/T-shirt/t-shirt6.png', 93);

-- --------------------------------------------------------

--
-- Table structure for table `productimage`
--

CREATE TABLE `productimage` (
  `productImageID` varchar(10) NOT NULL,
  `productID` varchar(10) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `imageType` varchar(20) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productimage`
--

INSERT INTO `productimage` (`productImageID`, `productID`, `imageUrl`, `imageType`, `sortOrder`) VALUES
('PM10001', 'P10001', 'image/product/Flower/Flower1.png', 'main', 1),
('PM10002', 'P10002', 'image/product/Flower/Flower2.png', 'main', 1),
('PM10003', 'P10003', 'image/product/Flower/Flower3.png', 'main', 1),
('PM10004', 'P10004', 'image/product/Flower/Flower4.png', 'main', 1),
('PM10005', 'P10005', 'image/product/Flower/Flower5.png', 'main', 1),
('PM10006', 'P10006', 'image/product/Flower/Flower6.png', 'main', 1),
('PM10007', 'P10007', 'image/product/T-shirt/t-shirt1.png', 'front', 1),
('PM10008', 'P10007', 'image/product/T-shirt/t-shirt1b.png', 'back', 2),
('PM10009', 'P10008', 'image/product/T-shirt/t-shirt2.png', 'front', 1),
('PM10010', 'P10008', 'image/product/T-shirt/t-shirt2b.png', 'back', 2),
('PM10011', 'P10009', 'image/product/T-shirt/t-shirt3.png', 'front', 1),
('PM10012', 'P10009', 'image/product/T-shirt/t-shirt3b.png', 'back', 2),
('PM10013', 'P10010', 'image/product/T-shirt/t-shirt4.png', 'front', 1),
('PM10014', 'P10010', 'image/product/T-shirt/t-shirt4b.png', 'back', 2),
('PM10015', 'P10011', 'image/product/T-shirt/t-shirt5.png', 'front', 1),
('PM10016', 'P10011', 'image/product/T-shirt/t-shirt5b.png', 'back', 2),
('PM10017', 'P10012', 'image/product/T-shirt/t-shirt6.png', 'front', 1),
('PM10018', 'P10012', 'image/product/T-shirt/t-shirt6b.png', 'back', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` varchar(10) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userPass` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userAddress` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `userEmail`, `userPass`, `userName`, `userAddress`, `created_at`) VALUES
('U10001', 'angelowkz-pm23@student.tarc.edu.my', '$2y$10$xVN4d6UZeGkfpY0LYuOWz.1F69UY2spILGQEaewCxQp6.T0X2PsTK', 'Angelo Wan Kai Zhe', '1, lorong permai 4', '2025-05-02 04:52:10'),
('U10002', 'wzkaizhe@gmail.com', '$2y$10$SRWnbtoY55tjVLudei4D7eYOcLb9eAmgBhfdYQ70X4/dID1m2lPiG', 'Kai Zhe', '88, lorong permai 99', '2025-05-02 04:56:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`cartID`,`productID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`orderItemID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `productimage`
--
ALTER TABLE `productimage`
  ADD PRIMARY KEY (`productImageID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE;

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`cartID`) REFERENCES `cart` (`cartID`) ON DELETE CASCADE,
  ADD CONSTRAINT `cartitem_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE;

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `productimage`
--
ALTER TABLE `productimage`
  ADD CONSTRAINT `productimage_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
