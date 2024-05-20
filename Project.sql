-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Server version: 5.7.43
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Project`
--

-- --------------------------------------------------------

--
-- Table structure for table `Airplane`
--

DROP TABLE IF EXISTS `Airplane`;
CREATE TABLE IF NOT EXISTS `Airplane` (
  `registration_number` varchar(20) NOT NULL,
  `model` varchar(50) NOT NULL,
  PRIMARY KEY (`registration_number`),
  KEY `model` (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Airplane`
--

INSERT INTO `Airplane` (`registration_number`, `model`) VALUES
('0847986', 'Airbus A320'),
('7259868', 'Airbus A720'),
('0587628', 'Beechcraft Baron 58'),
('7765442', 'Boeing Business Jet 787-8'),
('9217182', 'Bombardier CRJ200'),
('7099398', 'Cessna 172'),
('2768559', 'Dassault Falcon 7X'),
('2926061', 'Eclipse 500'),
('9951911', 'Gulfstream G650'),
('7399759', 'Icon A5'),
('2873286', 'Pilatus PC-12'),
('7983740', 'Piper J-3 Cub');

-- --------------------------------------------------------

--
-- Table structure for table `CanBePilotedBy`
--

DROP TABLE IF EXISTS `CanBePilotedBy`;
CREATE TABLE IF NOT EXISTS `CanBePilotedBy` (
  `national_insurance_number` varchar(20) NOT NULL,
  `model` varchar(50) NOT NULL,
  PRIMARY KEY (`national_insurance_number`,`model`),
  KEY `model` (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CanBePilotedBy`
--

INSERT INTO `CanBePilotedBy` (`national_insurance_number`, `model`) VALUES
('22318731', 'Airbus A320'),
('76583409', 'Airbus A720'),
('00368722', 'Beechcraft Baron 58'),
('29258582', 'Boeing Business Jet 787-8'),
('19433878', 'Bombardier CRJ200'),
('06691641', 'Cessna 172'),
('54927621', 'Dassault Falcon 7X'),
('07278536', 'Eclipse 500'),
('93653519', 'Gulfstream G650'),
('73292693', 'Icon A5'),
('99801705', 'Pilatus PC-12'),
('37377422', 'Piper J-3 Cub');

-- --------------------------------------------------------

--
-- Table structure for table `CanBeWorkedOnBy`
--

DROP TABLE IF EXISTS `CanBeWorkedOnBy`;
CREATE TABLE IF NOT EXISTS `CanBeWorkedOnBy` (
  `national_insurance_number` varchar(20) NOT NULL,
  `registration_number` varchar(20) NOT NULL,
  PRIMARY KEY (`national_insurance_number`),
  KEY `registration_number` (`registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CanBeWorkedOnBy`
--

INSERT INTO `CanBeWorkedOnBy` (`national_insurance_number`, `registration_number`) VALUES
('00368722', '0587628'),
('22318731', '0847986'),
('54927621', '2768559'),
('99801705', '2873286'),
('07278536', '2926061'),
('06691641', '7099398'),
('76583409', '7259868'),
('73292693', '7399759'),
('29258582', '7765442'),
('37377422', '7983740'),
('19433878', '9217182'),
('93653519', '9951911');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
CREATE TABLE IF NOT EXISTS `Employee` (
  `national_insurance_number` varchar(20) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`national_insurance_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`national_insurance_number`, `salary`) VALUES
('00368722', '67980.00'),
('06691641', '48807.00'),
('07278536', '53058.50'),
('19433878', '113877.50'),
('22318731', '56248.50'),
('29258582', '95368.90'),
('37377422', '53535.90'),
('54927621', '72215.00'),
('73292693', '70664.00'),
('76583409', '151240.93'),
('93653519', '73876.00'),
('99801705', '126500.00');

-- --------------------------------------------------------

--
-- Table structure for table `Flight`
--

DROP TABLE IF EXISTS `Flight`;
CREATE TABLE IF NOT EXISTS `Flight` (
  `registration_number` varchar(20) NOT NULL,
  `start_time` time NOT NULL,
  `time_length` time NOT NULL,
  `start_date` date NOT NULL,
  `pilot_national_insurance_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`registration_number`,`start_date`,`start_time`),
  KEY `pilot_national_insurance_number` (`pilot_national_insurance_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Flight`
--

INSERT INTO `Flight` (`registration_number`, `start_time`, `time_length`, `start_date`, `pilot_national_insurance_number`) VALUES
('0847986', '13:40:00', '02:10:00', '2024-01-10', '22318731'),
('2873286', '07:20:00', '01:25:00', '2022-05-01', '99801705'),
('2926061', '21:00:00', '04:00:00', '2022-06-15', '07278536'),
('7099398', '12:00:00', '03:50:00', '2023-11-20', '06691641'),
('7099398', '13:30:00', '03:00:00', '2023-12-15', '06691641'),
('7259868', '14:30:00', '01:15:00', '2022-01-22', '76583409'),
('7399759', '08:05:00', '00:40:00', '2024-03-15', '73292693'),
('7399759', '09:30:00', '00:45:00', '2024-04-12', '73292693'),
('7765442', '16:45:00', '02:45:00', '2023-03-15', '29258582'),
('7983740', '18:30:00', '05:15:00', '2024-01-15', '37377422'),
('7983740', '17:00:00', '04:45:00', '2024-02-12', '37377422'),
('9217182', '19:55:00', '04:30:00', '2024-10-10', '19433878'),
('9217182', '18:25:00', '04:00:00', '2024-11-07', '19433878'),
('9951911', '14:15:00', '03:35:00', '2023-07-20', '93653519'),
('9951911', '16:00:00', '04:00:00', '2023-08-10', '93653519');

-- --------------------------------------------------------

--
-- Table structure for table `Hangar`
--

DROP TABLE IF EXISTS `Hangar`;
CREATE TABLE IF NOT EXISTS `Hangar` (
  `h_number` varchar(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  PRIMARY KEY (`h_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Hangar`
--

INSERT INTO `Hangar` (`h_number`, `capacity`) VALUES
('AH10', 11),
('AH11', 2),
('AH12', 15),
('AH13', 14),
('AH14', 1),
('AH15', 13),
('AH2', 8),
('AH3', 10),
('AH6', 12),
('AH7', 4),
('AH8', 6),
('AH9', 9);

-- --------------------------------------------------------

--
-- Table structure for table `OwnedByDuringPeriod`
--

DROP TABLE IF EXISTS `OwnedByDuringPeriod`;
CREATE TABLE IF NOT EXISTS `OwnedByDuringPeriod` (
  `registration_number` varchar(20) NOT NULL,
  `buyer_national_insurance_number` varchar(20) DEFAULT NULL,
  `purchase_date` date NOT NULL,
  PRIMARY KEY (`registration_number`,`purchase_date`),
  KEY `buyer_national_insurance_number` (`buyer_national_insurance_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OwnedByDuringPeriod`
--

INSERT INTO `OwnedByDuringPeriod` (`registration_number`, `buyer_national_insurance_number`, `purchase_date`) VALUES
('0587628', '00368722', '2022-07-23'),
('7099398', '06691641', '2023-11-05'),
('2926061', '07278536', '2022-05-30'),
('9217182', '19433878', '2024-09-24'),
('0847986', '22318731', '2023-12-12'),
('7765442', '29258582', '2023-03-01'),
('7983740', '37377422', '2024-01-01'),
('2768559', '54927621', '2022-02-15'),
('7399759', '73292693', '2024-02-26'),
('7259868', '76583409', '2022-01-02'),
('9951911', '93653519', '2023-07-07'),
('2873286', '99801705', '2022-04-11');

-- --------------------------------------------------------

--
-- Table structure for table `PerformedBy`
--

DROP TABLE IF EXISTS `PerformedBy`;
CREATE TABLE IF NOT EXISTS `PerformedBy` (
  `s_date` date NOT NULL,
  `registration_number` varchar(20) NOT NULL,
  `national_insurance_number` varchar(20) NOT NULL,
  PRIMARY KEY (`s_date`,`registration_number`),
  KEY `registration_number` (`registration_number`),
  KEY `national_insurance_number` (`national_insurance_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PerformedBy`
--

INSERT INTO `PerformedBy` (`s_date`, `registration_number`, `national_insurance_number`) VALUES
('2023-08-16', '0587628', '00368722'),
('2024-11-21', '7099398', '06691641'),
('2023-06-16', '2926061', '07278536'),
('2025-10-11', '9217182', '19433878'),
('2025-01-11', '0847986', '22318731'),
('2023-03-23', '2768559', '54927621'),
('2025-03-16', '7399759', '73292693'),
('2023-01-16', '7259868', '76583409'),
('2024-07-21', '9951911', '93653519'),
('2023-05-02', '2873286', '99801705');

-- --------------------------------------------------------

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
CREATE TABLE IF NOT EXISTS `Person` (
  `national_insurance_number` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`national_insurance_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Person`
--

INSERT INTO `Person` (`national_insurance_number`, `name`, `phone_number`, `address`) VALUES
('00368722', 'Trevor Xavier Suarez', '077 5906 4649', '532 Richmond Road, Peterborough, PE5 0QE'),
('06691641', 'Lorenzo Rodríguez', '077 7934 5246', 'Flat 145 Queensway Road, Watford, WD20 5UL'),
('07278536', 'Rene Eliane Blair', '079 3312 1345', '43 Park Lane, Sunderland, SW8 5GV'),
('19433878', 'Anastasia Jane Lind', '071 0071 8188', '77 Green Park Lane, Southend-on-Sea, SS62 9RH'),
('22318731', 'Berta Ponce Lopez', '072 1516 6584', 'The Grand Heights, 52 North Street, Cleveland, TS7 7IR'),
('29258582', 'Zachery Munoz', '072 7629 8255', '3 Station Road, Brighton, BN3 7XW'),
('37377422', 'Richard George Blanco', '073 6099 1001', '1 St. John’s Road, Dundee, DD25 1ON'),
('54927621', 'Alexis Schwartz', '075 5097 4577', '452 Appletree Avenue, Maidenstone, Kent, MA6 3TY'),
('73292693', 'Abrahán Calvo Martínez', '074 2337 7667', 'The Crescent, 9 New Street, Romford, RM6 5IE'),
('76583409', 'Cristiano Ronaldo', '079 0087 0926', '12 Gower Street, London, WC1E 6BT'),
('93653519', 'Paisley Bass', '073 3405 3933', 'Flat 2a Manchester Road, Wakefield, WF7 4DO'),
('99801705', 'Raquel Callahan', '078 1013 1347', '176 George Street, Enfield, London, EN6 1CD');

-- --------------------------------------------------------

--
-- Table structure for table `Pilot`
--

DROP TABLE IF EXISTS `Pilot`;
CREATE TABLE IF NOT EXISTS `Pilot` (
  `national_insurance_number` varchar(20) NOT NULL,
  `licence_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`national_insurance_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pilot`
--

INSERT INTO `Pilot` (`national_insurance_number`, `licence_number`) VALUES
('00368722', '4231842097'),
('06691641', '2404302212'),
('07278536', '3197083190'),
('19433878', '7104837405'),
('22318731', '5119327479'),
('29258582', '2426621131'),
('37377422', '4492814069'),
('54927621', '5348472800'),
('73292693', '5641238905'),
('76583409', '7074669738'),
('93653519', '2733666441'),
('99801705', '7443674348');

-- --------------------------------------------------------

--
-- Table structure for table `PlaneType`
--

DROP TABLE IF EXISTS `PlaneType`;
CREATE TABLE IF NOT EXISTS `PlaneType` (
  `model` varchar(50) NOT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PlaneType`
--

INSERT INTO `PlaneType` (`model`, `weight`, `capacity`) VALUES
('Airbus A320', '73500.00', 180),
('Airbus A720', '70000.00', 150),
('Beechcraft Baron 58', '2447.00', 6),
('Boeing Business Jet 787-8', '4000.00', 17),
('Bombardier CRJ200', '24395.00', 50),
('Cessna 172', '767.00', 4),
('Dassault Falcon 7X', '31751.00', 16),
('Eclipse 500', '3549.00', 6),
('Gulfstream G650', '43000.00', 18),
('Icon A5', '1519.00', 2),
('Pilatus PC-12', '4500.00', 9),
('Piper J-3 Cub', '432.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
CREATE TABLE IF NOT EXISTS `Service` (
  `registration_number` varchar(20) NOT NULL,
  `s_date` date NOT NULL,
  `hours` decimal(5,2) NOT NULL,
  PRIMARY KEY (`s_date`),
  KEY `registration_number` (`registration_number`),
  KEY `registration_number_2` (`registration_number`),
  KEY `registration_number_3` (`registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Service`
--

INSERT INTO `Service` (`registration_number`, `s_date`, `hours`) VALUES
('7259868', '2023-01-16', '3.50'),
('2768559', '2023-03-23', '2.00'),
('2873286', '2023-05-02', '3.00'),
('2926061', '2023-06-16', '5.00'),
('0587628', '2023-08-16', '1.50'),
('9951911', '2024-07-21', '4.50'),
('7099398', '2024-11-21', '2.50'),
('0847986', '2025-01-11', '1.00'),
('7399759', '2025-03-16', '2.00'),
('9217182', '2025-10-11', '4.00');

-- --------------------------------------------------------

--
-- Table structure for table `StoredIn`
--

DROP TABLE IF EXISTS `StoredIn`;
CREATE TABLE IF NOT EXISTS `StoredIn` (
  `h_number` varchar(20) NOT NULL,
  `registration_number` varchar(20) NOT NULL,
  PRIMARY KEY (`h_number`,`registration_number`),
  KEY `registration_number` (`registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `StoredIn`
--

INSERT INTO `StoredIn` (`h_number`, `registration_number`) VALUES
('AH13', '0587628'),
('AH7', '0847986'),
('AH10', '2768559'),
('AH6', '2873286'),
('AH12', '2926061'),
('AH3', '7099398'),
('AH2', '7259868'),
('AH9', '7399759'),
('AH8', '9217182'),
('AH11', '9951911');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CanBePilotedBy`
--
ALTER TABLE `CanBePilotedBy`
  ADD CONSTRAINT `CanBePilotedBy_ibfk_2` FOREIGN KEY (`model`) REFERENCES `PlaneType` (`model`),
  ADD CONSTRAINT `FK_CanBePilotedBy_Pilot` FOREIGN KEY (`national_insurance_number`) REFERENCES `Pilot` (`national_insurance_number`);

--
-- Constraints for table `CanBeWorkedOnBy`
--
ALTER TABLE `CanBeWorkedOnBy`
  ADD CONSTRAINT `CanBeWorkedOnBy_ibfk_1` FOREIGN KEY (`registration_number`) REFERENCES `Airplane` (`registration_number`),
  ADD CONSTRAINT `FK_CanBeWorkedOnBy_Employee` FOREIGN KEY (`national_insurance_number`) REFERENCES `Employee` (`national_insurance_number`);

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`national_insurance_number`) REFERENCES `Person` (`national_insurance_number`);

--
-- Constraints for table `Flight`
--
ALTER TABLE `Flight`
  ADD CONSTRAINT `Flight_ibfk_1` FOREIGN KEY (`registration_number`) REFERENCES `Airplane` (`registration_number`),
  ADD CONSTRAINT `Flight_ibfk_2` FOREIGN KEY (`pilot_national_insurance_number`) REFERENCES `Pilot` (`national_insurance_number`);

--
-- Constraints for table `OwnedByDuringPeriod`
--
ALTER TABLE `OwnedByDuringPeriod`
  ADD CONSTRAINT `OwnedByDuringPeriod_ibfk_1` FOREIGN KEY (`registration_number`) REFERENCES `Airplane` (`registration_number`),
  ADD CONSTRAINT `OwnedByDuringPeriod_ibfk_2` FOREIGN KEY (`buyer_national_insurance_number`) REFERENCES `Person` (`national_insurance_number`);

--
-- Constraints for table `PerformedBy`
--
ALTER TABLE `PerformedBy`
  ADD CONSTRAINT `PerformedBy_ibfk_1` FOREIGN KEY (`registration_number`) REFERENCES `Airplane` (`registration_number`),
  ADD CONSTRAINT `PerformedBy_ibfk_2` FOREIGN KEY (`national_insurance_number`) REFERENCES `Employee` (`national_insurance_number`);

--
-- Constraints for table `Pilot`
--
ALTER TABLE `Pilot`
  ADD CONSTRAINT `FK_Pilot_Employee` FOREIGN KEY (`national_insurance_number`) REFERENCES `Employee` (`national_insurance_number`);

--
-- Constraints for table `Service`
--
ALTER TABLE `Service`
  ADD CONSTRAINT `Service_ibfk_1` FOREIGN KEY (`registration_number`) REFERENCES `Airplane` (`registration_number`),
  ADD CONSTRAINT `Service_ibfk_2` FOREIGN KEY (`registration_number`) REFERENCES `Airplane` (`registration_number`),
  ADD CONSTRAINT `Service_ibfk_3` FOREIGN KEY (`registration_number`) REFERENCES `Airplane` (`registration_number`),
  ADD CONSTRAINT `Service_ibfk_4` FOREIGN KEY (`registration_number`) REFERENCES `Airplane` (`registration_number`);

--
-- Constraints for table `StoredIn`
--
ALTER TABLE `StoredIn`
  ADD CONSTRAINT `StoredIn_ibfk_1` FOREIGN KEY (`h_number`) REFERENCES `Hangar` (`h_number`),
  ADD CONSTRAINT `StoredIn_ibfk_2` FOREIGN KEY (`registration_number`) REFERENCES `Airplane` (`registration_number`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
