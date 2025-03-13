-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 13, 2025 at 12:04 PM
-- Server version: 8.0.34
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mega_city_cab`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `BillID` int NOT NULL AUTO_INCREMENT,
  `BookingID` int NOT NULL,
  `BaseFare` decimal(10,2) NOT NULL,
  `Tax` decimal(5,2) DEFAULT '0.00',
  `Discount` decimal(5,2) DEFAULT '0.00',
  `FinalAmount` decimal(10,2) NOT NULL,
  `PaymentMethod` enum('Cash','Card','Online') NOT NULL,
  `PaymentStatus` enum('Paid','Unpaid') DEFAULT 'Unpaid',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BillID`),
  UNIQUE KEY `BookingID` (`BookingID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `CarID` int DEFAULT NULL,
  `PickupLocation` varchar(255) NOT NULL,
  `Destination` varchar(255) NOT NULL,
  `DistanceKM` decimal(8,2) NOT NULL DEFAULT '0.00',
  `Fare` decimal(10,2) DEFAULT '0.00',
  `BookingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Pending','Completed','Cancelled') DEFAULT 'Pending',
  PRIMARY KEY (`BookingID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CarID` (`CarID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars` (
  `CarID` int NOT NULL AUTO_INCREMENT,
  `CarModel` varchar(50) NOT NULL,
  `CarNumber` varchar(20) NOT NULL,
  `CarType` enum('Standard','Premium','SUV') NOT NULL,
  `DriverID` int DEFAULT NULL,
  `Status` enum('Available','Booked','Maintenance') DEFAULT 'Available',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CarID`),
  UNIQUE KEY `CarNumber` (`CarNumber`),
  UNIQUE KEY `DriverID` (`DriverID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`CarID`, `CarModel`, `CarNumber`, `CarType`, `DriverID`, `Status`, `CreatedAt`) VALUES
(76, 'Toyota Corolla', 'CAR-1234', 'Standard', 50, 'Available', '2025-03-09 16:58:43'),
(77, 'Honda Civic', 'CAR-2345', 'Standard', 51, 'Available', '2025-03-09 16:58:43'),
(78, 'Toyota Camry', 'CAR-3456', 'Premium', 52, 'Available', '2025-03-09 16:58:43'),
(79, 'Nissan Sunny', 'CAR-4567', 'Standard', 53, 'Booked', '2025-03-09 16:58:43'),
(80, 'Suzuki Swift', 'CAR-5678', 'Standard', 54, 'Available', '2025-03-09 16:58:43'),
(81, 'BMW 3 Series', 'CAR-6789', 'Premium', 55, 'Maintenance', '2025-03-09 16:58:43'),
(82, 'Toyota Land Cruiser', 'CAR-7890', 'SUV', 56, 'Available', '2025-03-09 16:58:43'),
(83, 'Mitsubishi Montero', 'CAR-8901', 'SUV', 57, 'Available', '2025-03-09 16:58:43'),
(84, 'Toyota Prius', 'CAR-9012', 'Standard', 58, 'Booked', '2025-03-09 16:58:43'),
(85, 'Honda Vezel', 'CAR-0123', 'SUV', 59, 'Available', '2025-03-09 16:58:43'),
(86, 'Nissan X-Trail', 'CAR-1122', 'SUV', 60, 'Maintenance', '2025-03-09 16:58:43'),
(87, 'Toyota Axio', 'CAR-2233', 'Standard', 61, 'Available', '2025-03-09 16:58:43'),
(88, 'Mercedes C-Class', 'CAR-3344', 'Premium', 62, 'Available', '2025-03-09 16:58:43'),
(89, 'Mazda CX-5', 'CAR-4455', 'SUV', 63, 'Booked', '2025-03-09 16:58:43'),
(90, 'Honda Fit', 'CAR-5566', 'Standard', 64, 'Available', '2025-03-09 16:58:43'),
(91, 'Audi A4', 'CAR-6677', 'Premium', 65, 'Available', '2025-03-09 16:58:43'),
(92, 'Suzuki Vitara', 'CAR-7788', 'SUV', 66, 'Maintenance', '2025-03-09 16:58:43'),
(93, 'Toyota Premio', 'CAR-8899', 'Premium', 67, 'Available', '2025-03-09 16:58:43'),
(94, 'Nissan Leaf', 'CAR-9900', 'Standard', 68, 'Available', '2025-03-09 16:58:43'),
(95, 'Kia Sorento', 'CAR-0011', 'SUV', 69, 'Booked', '2025-03-09 16:58:43'),
(96, 'Toyota Allion', 'CAR-1221', 'Standard', 70, 'Available', '2025-03-09 16:58:43'),
(97, 'Hyundai Tucson', 'CAR-2332', 'SUV', 71, 'Available', '2025-03-09 16:58:43'),
(98, 'Lexus ES', 'CAR-3443', 'Premium', 72, 'Maintenance', '2025-03-09 16:58:43'),
(99, 'Mitsubishi Lancer', 'CAR-4554', 'Standard', 73, 'Available', '2025-03-09 16:58:43'),
(100, 'Toyota RAV4', 'CAR-5665', 'SUV', 74, 'Available', '2025-03-09 16:58:43');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

DROP TABLE IF EXISTS `contactus`;
CREATE TABLE IF NOT EXISTS `contactus` (
  `ContactID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Message` text,
  `SubmittedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ContactID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`ContactID`, `Name`, `Email`, `Phone`, `Message`, `SubmittedAt`) VALUES
(4, 'John Doe', 'johndoe@example.com', '+94 71 234 5678', 'I have an issue with my recent booking. Can you help me?', '2025-03-13 07:17:58'),
(5, 'Jane Smith', 'janesmith@example.com', '+94 76 987 6543', 'I would like to know more about your premium services.', '2025-03-13 07:17:58'),
(6, 'Alice Johnson', 'alicej@example.com', '+94 77 555 1234', 'My driver was late. How can I report this?', '2025-03-13 07:17:58'),
(7, 'Bob Brown', 'bobbrown@example.com', '+94 75 444 5556', 'I lost an item in your cab. How can I retrieve it?', '2025-03-13 07:17:58'),
(8, 'Charlie Davis', 'charlied@example.com', '+94 71 777 8889', 'I want to provide feedback about my recent ride.', '2025-03-13 07:17:58'),
(9, 'Diana Evans', 'dianae@example.com', '+94 76 222 3334', 'Can you explain your pricing structure?', '2025-03-13 07:17:58'),
(10, 'Ethan Green', 'ethang@example.com', '+94 77 111 2223', 'I need to change my booking details. Is it possible?', '2025-03-13 07:17:58'),
(11, 'Fiona Harris', 'fionah@example.com', '+94 71 666 7778', 'I had a great experience with your service!', '2025-03-13 07:17:58'),
(12, 'George Wilson', 'georgew@example.com', '+94 76 999 0001', 'How do I apply for a driver position?', '2025-03-13 07:17:58'),
(13, 'Hannah Martinez', 'hannahm@example.com', '+94 77 333 4445', 'I have a complaint about a recent ride.', '2025-03-13 07:17:58'),
(14, 'Ian Clark', 'ianc@example.com', '+94 71 888 9990', 'Can I book a cab for someone else?', '2025-03-13 07:17:58'),
(15, 'Jessica Lewis', 'jessical@example.com', '+94 76 123 9876', 'I need a receipt for my last trip.', '2025-03-13 07:17:58'),
(16, 'Kevin Lee', 'kevinl@example.com', '+94 75 456 7890', 'How do I cancel a booking?', '2025-03-13 07:17:58'),
(17, 'Laura Walker', 'lauraw@example.com', '+94 76 789 0123', 'I want to know more about your loyalty program.', '2025-03-13 07:17:58'),
(18, 'Michael Hall', 'michaelh@example.com', '+94 71 321 6549', 'I have a suggestion for improving your app.', '2025-03-13 07:17:58'),
(19, 'Nina Young', 'ninay@example.com', '+94 77 654 3210', 'Can I pre-book a cab for an early morning trip?', '2025-03-13 07:17:58'),
(20, 'Oscar King', 'oscark@example.com', '+94 76 098 7654', 'I need assistance with my account.', '2025-03-13 07:17:58'),
(21, 'Paula Scott', 'paulascott@example.com', '+94 75 543 2109', 'I had a billing issue. Can you resolve it?', '2025-03-13 07:17:58'),
(22, 'Quincy Adams', 'quincya@example.com', '+94 71 876 5432', 'I want to provide feedback about your customer service.', '2025-03-13 07:17:58'),
(23, 'Rachel Baker', 'rachelb@example.com', '+94 76 210 9876', 'I need help with a refund request.', '2025-03-13 07:17:58');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `RegistrationNumber` varchar(20) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `NIC` varchar(15) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `RegistrationNumber` (`RegistrationNumber`),
  UNIQUE KEY `NIC` (`NIC`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `RegistrationNumber`, `FullName`, `Address`, `NIC`, `PhoneNumber`, `Email`, `Password`, `CreatedAt`) VALUES
(79, 'REG1', 'Amara Perera', '23 Temple Road, Colombo 3', '957654321V', '+94771234567', 'amara.perera@gmail.com', 'Password123', '2025-03-09 16:16:11'),
(80, 'REG2', 'Dinesh Fernando', '45 Lake Drive, Kandy', '901234567V', '+94772345678', 'dinesh.fernando@yahoo.com', 'Kandy2025', '2025-03-09 16:16:11'),
(81, 'REG3', 'Malini Silva', '78 Beach Road, Galle', '885412367V', '+94773456789', 'malini.silva@hotmail.com', 'BeachLife22', '2025-03-09 16:16:11'),
(82, 'REG4', 'Nimal Jayasuriya', '12 Hill Street, Nuwara Eliya', '923456789V', '+94774567890', 'nimal.jayasuriya@gmail.com', 'Hill1234', '2025-03-09 16:16:11'),
(83, 'REG5', 'Kumari Bandara', '56 Main Road, Matara', '897654321V', '+94775678901', 'kumari.bandara@outlook.com', 'Matara567', '2025-03-09 16:16:11'),
(84, 'REG6', 'Saman Wickrema', '34 Park Avenue, Negombo', '912345678V', '+94776789012', 'saman.wickrema@gmail.com', 'ParkAve789', '2025-03-09 16:16:11'),
(85, 'REG7', 'Lakshmi Weerasinghe', '89 Sea View, Trincomalee', '887890123V', '+94777890123', 'lakshmi.weerasinghe@yahoo.com', 'SeaView456', '2025-03-09 16:16:11'),
(86, 'REG8', 'Rohan Gunawardena', '67 River Lane, Batticaloa', '934567890V', '+94778901234', 'rohan.gunawardena@hotmail.com', 'River2025', '2025-03-09 16:16:11'),
(87, 'REG9', 'Priyanka Dissanayake', '23 Palm Street, Jaffna', '909876543V', '+94779012345', 'priyanka.dissanayake@gmail.com', 'Palm1234', '2025-03-09 16:16:11'),
(88, 'REG10', 'Chaminda Rajapaksa', '45 Ocean Drive, Hambantota', '877654321V', '+94770123456', 'chaminda.rajapaksa@outlook.com', 'Ocean789', '2025-03-09 16:16:11'),
(89, 'REG11', 'Anoma Gunasekara', '12 Green Lane, Kurunegala', '945678901V', '+94781234567', 'anoma.gunasekara@gmail.com', 'Green567', '2025-03-09 16:16:11'),
(90, 'REG12', 'Ravi Karunatilaka', '78 Mountain View, Badulla', '920123456V', '+94782345678', 'ravi.karunatilaka@yahoo.com', 'Mountain22', '2025-03-09 16:16:11'),
(91, 'REG13', 'Shirani Fonseka', '34 Forest Road, Ratnapura', '892345678V', '+94783456789', 'shirani.fonseka@hotmail.com', 'Forest123', '2025-03-09 16:16:11'),
(92, 'REG14', 'Thilak Seneviratne', '56 Valley Lane, Anuradhapura', '956789012V', '+94784567890', 'thilak.seneviratne@gmail.com', 'Valley456', '2025-03-09 16:16:11'),
(93, 'REG15', 'Nadeeka Peris', '89 Garden Road, Polonnaruwa', '915432109V', '+94785678901', 'nadeeka.peris@outlook.com', 'Garden789', '2025-03-09 16:16:11'),
(94, 'REG16', 'Sunil Ratnayake', '67 Lotus Street, Kegalle', '889012345V', '+94786789012', 'sunil.ratnayake@gmail.com', 'Lotus2025', '2025-03-09 16:16:11'),
(95, 'REG17', 'Dilrukshi Mendis', '23 Jasmine Lane, Kalutara', '967890123V', '+94787890123', 'dilrukshi.mendis@yahoo.com', 'Jasmine123', '2025-03-09 16:16:11'),
(96, 'REG18', 'Prasad Cooray', '45 Cinnamon Gardens, Gampaha', '930987654V', '+94788901234', 'prasad.cooray@hotmail.com', 'Cinnamon456', '2025-03-09 16:16:11'),
(97, 'REG19', 'Nalini Jayawardena', '78 Spice Road, Matale', '908765432V', '+94789012345', 'nalini.jayawardena@gmail.com', 'Spice789', '2025-03-09 16:16:11'),
(98, 'REG20', 'Upul Ranasinghe', '12 Tea Estate, Puttalam', '879012345V', '+94760123456', 'upul.ranasinghe@outlook.com', 'TeaEstate22', '2025-03-09 16:16:11'),
(99, 'REG21', 'Kamala Wijeyeratne', '34 Coconut Lane, Vavuniya', '978901234V', '+94761234567', 'kamala.wijeyeratne@gmail.com', 'Coconut123', '2025-03-09 16:16:11'),
(100, 'REG22', 'Harsha De Silva', '56 Rice Field, Monaragala', '940123456V', '+94762345678', 'harsha.desilva@yahoo.com', 'RiceField456', '2025-03-09 16:16:11'),
(101, 'REG23', 'Anusha Kumarasinghe', '89 Rubber Estate, Ampara', '902109876V', '+94763456789', 'anusha.kumarasinghe@hotmail.com', 'Rubber789', '2025-03-09 16:16:11'),
(102, 'REG24', 'Indika Samaraweera', '67 Gem Street, Mannar', '894567890V', '+94764567890', 'indika.samaraweera@gmail.com', 'Gem2025', '2025-03-09 16:16:11'),
(103, 'REG25', 'Deepika Nanayakkara', '23 Pearl Road, Kilinochchi', '989876543V', '+94765678901', 'deepika.nanayakkara@outlook.com', 'Pearl123', '2025-03-09 16:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
CREATE TABLE IF NOT EXISTS `drivers` (
  `DriverID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) NOT NULL,
  `LicenseNumber` varchar(20) NOT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Status` enum('Active','Inactive') DEFAULT 'Active',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DriverID`),
  UNIQUE KEY `LicenseNumber` (`LicenseNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`DriverID`, `FullName`, `LicenseNumber`, `PhoneNumber`, `Address`, `Status`, `CreatedAt`) VALUES
(50, 'Ranjith Kumarasinghe', 'B1234567', '+94701234567', '23 Main St, Colombo 5', 'Active', '2025-03-09 16:32:50'),
(51, 'Menaka De Silva', 'B7654321', '+94702345678', '45 Hill Road, Kandy', 'Active', '2025-03-09 16:32:50'),
(52, 'Asanka Perera', 'B2345678', '+94703456789', '78 Lake Drive, Galle', 'Active', '2025-03-09 16:32:50'),
(53, 'Chandima Fernando', 'B8765432', '+94704567890', '12 Temple Lane, Negombo', 'Active', '2025-03-09 16:32:50'),
(54, 'Tharanga Bandara', 'B3456789', '+94705678901', '34 Beach Road, Matara', 'Active', '2025-03-09 16:32:50'),
(55, 'Yasantha Wickremasinghe', 'B9876543', '+94706789012', '56 Palm Avenue, Batticaloa', 'Inactive', '2025-03-09 16:32:50'),
(56, 'Kosala Weerasinghe', 'B4567890', '+94707890123', '89 River Street, Trincomalee', 'Active', '2025-03-09 16:32:50'),
(57, 'Priyantha Jayawardena', 'B0987654', '+94708901234', '67 Mountain View, Nuwara Eliya', 'Active', '2025-03-09 16:32:50'),
(58, 'Nilmini Gunaratne', 'B5678901', '+94709012345', '23 Valley Road, Badulla', 'Active', '2025-03-09 16:32:50'),
(59, 'Jayantha Ratnayake', 'B1098765', '+94710123456', '45 Forest Lane, Ratnapura', 'Active', '2025-03-09 16:32:50'),
(60, 'Sumudu Gunasekara', 'B6789012', '+94711234567', '78 Ocean Drive, Hambantota', 'Inactive', '2025-03-09 16:32:50'),
(61, 'Sampath De Mel', 'B2109876', '+94712345678', '12 Garden Street, Kurunegala', 'Active', '2025-03-09 16:32:50'),
(62, 'Kumudini Dissanayake', 'B7890123', '+94713456789', '34 Spice Road, Anuradhapura', 'Active', '2025-03-09 16:32:50'),
(63, 'Nihal Seneviratne', 'B3210987', '+94714567890', '56 Tea Estate, Gampaha', 'Active', '2025-03-09 16:32:50'),
(64, 'Manju Samaraweera', 'B8901234', '+94715678901', '89 Rice Field, Kalutara', 'Active', '2025-03-09 16:32:50'),
(65, 'Darshana Fonseka', 'B4321098', '+94716789012', '67 Gem Lane, Kegalle', 'Inactive', '2025-03-09 16:32:50'),
(66, 'Lasantha Mendis', 'B9012345', '+94717890123', '23 Cinnamon Gardens, Jaffna', 'Active', '2025-03-09 16:32:50'),
(67, 'Nisansala Cooray', 'B5432109', '+94718901234', '45 Rubber Estate, Polonnaruwa', 'Active', '2025-03-09 16:32:50'),
(68, 'Chamara Ranasinghe', 'B0123456', '+94719012345', '78 Coconut Grove, Ampara', 'Active', '2025-03-09 16:32:50'),
(69, 'Dilani Wijeyesekera', 'B6543210', '+94720123456', '12 Pearl Street, Puttalam', 'Active', '2025-03-09 16:32:50'),
(70, 'Lakmal Nanayakkara', 'B1234509', '+94721234567', '34 Jasmine Road, Matale', 'Active', '2025-03-09 16:32:50'),
(71, 'Deepani De Alwis', 'B7654320', '+94722345678', '56 Lotus Lane, Monaragala', 'Inactive', '2025-03-09 16:32:50'),
(72, 'Roshan Karunatilaka', 'B2345670', '+94723456789', '89 Green View, Vavuniya', 'Active', '2025-03-09 16:32:50'),
(73, 'Ishara Peris', 'B8765430', '+94724567890', '67 Blue Street, Mannar', 'Active', '2025-03-09 16:32:50'),
(74, 'Mahesh Rajapaksa', 'B3456780', '+94725678901', '23 Red Road, Kilinochchi', 'Active', '2025-03-09 16:32:50');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `BillID` int NOT NULL,
  `AmountPaid` decimal(10,2) NOT NULL,
  `PaymentMethod` enum('Cash','Card','Online') NOT NULL,
  `TransactionDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Successful','Failed','Pending') DEFAULT 'Pending',
  PRIMARY KEY (`PaymentID`),
  KEY `BillID` (`BillID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` enum('Admin','Driver') NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Role`, `CreatedAt`) VALUES
(1, 'admin', 'admin123', 'Admin', '2025-03-09 12:43:26'),
(2, 'driver', 'driver123', 'Driver', '2025-03-09 12:43:26');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`CarID`) REFERENCES `cars` (`CarID`) ON DELETE SET NULL;

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`DriverID`) REFERENCES `drivers` (`DriverID`) ON DELETE SET NULL;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`BillID`) REFERENCES `bills` (`BillID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
