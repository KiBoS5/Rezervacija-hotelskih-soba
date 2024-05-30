-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2022 at 11:15 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rezervacijahotelskihsoba`
--

-- --------------------------------------------------------

--
-- Table structure for table `gost`
--

CREATE TABLE `gost` (
  `GostID` int(11) NOT NULL,
  `Ime` varchar(200) NOT NULL,
  `Prezime` varchar(200) NOT NULL,
  `Adresa` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Telefon` int(200) NOT NULL,
  `DatumRodjenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategorija_cene`
--

CREATE TABLE `kategorija_cene` (
  `KategorijaCeneID` int(11) NOT NULL,
  `KategorijaCene` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `musterija`
--

CREATE TABLE `musterija` (
  `MusterijaID` int(11) NOT NULL,
  `Ime` varchar(200) NOT NULL,
  `Prezime` varchar(200) NOT NULL,
  `Adresa` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Telefon` int(11) NOT NULL,
  `DatumRodjenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nacin_placanja`
--

CREATE TABLE `nacin_placanja` (
  `NacinPlacanjaID` int(11) NOT NULL,
  `NacinPlacanja` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rezervacija`
--

CREATE TABLE `rezervacija` (
  `RezervacijaID` int(11) NOT NULL,
  `MusterijaID` int(11) NOT NULL,
  `DatumRezervisanja` date NOT NULL,
  `VremeRezervisanja` time NOT NULL,
  `PocetakRezervacije` date NOT NULL,
  `KrajRezervacije` date NOT NULL,
  `RokZaUplatu` datetime NOT NULL,
  `SumaZaUplatu` int(11) NOT NULL,
  `Komentar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rezervacija_sobe`
--

CREATE TABLE `rezervacija_sobe` (
  `RezervacijaID` int(11) NOT NULL,
  `SobaID` int(11) NOT NULL,
  `GostID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `soba`
--

CREATE TABLE `soba` (
  `SobaID` int(11) NOT NULL,
  `TipSobeID` int(11) DEFAULT NULL,
  `KategorijaCeneID` int(11) DEFAULT NULL,
  `Sprat` int(11) NOT NULL,
  `Napomena` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tip_sobe`
--

CREATE TABLE `tip_sobe` (
  `TipSobeID` int(11) NOT NULL,
  `TipSobe` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uplata`
--

CREATE TABLE `uplata` (
  `UplataID` int(11) NOT NULL,
  `RezervacijaID` int(11) DEFAULT NULL,
  `MusterijaID` int(11) DEFAULT NULL,
  `NacinPlacanjaID` int(11) DEFAULT NULL,
  `Iznos` int(11) NOT NULL,
  `Komentar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gost`
--
ALTER TABLE `gost`
  ADD PRIMARY KEY (`GostID`);

--
-- Indexes for table `kategorija_cene`
--
ALTER TABLE `kategorija_cene`
  ADD PRIMARY KEY (`KategorijaCeneID`);

--
-- Indexes for table `musterija`
--
ALTER TABLE `musterija`
  ADD PRIMARY KEY (`MusterijaID`);

--
-- Indexes for table `nacin_placanja`
--
ALTER TABLE `nacin_placanja`
  ADD PRIMARY KEY (`NacinPlacanjaID`);

--
-- Indexes for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD PRIMARY KEY (`RezervacijaID`),
  ADD KEY `MusterijaID` (`MusterijaID`);

--
-- Indexes for table `rezervacija_sobe`
--
ALTER TABLE `rezervacija_sobe`
  ADD PRIMARY KEY (`RezervacijaID`,`SobaID`,`GostID`),
  ADD KEY `SobaID` (`SobaID`),
  ADD KEY `GostID` (`GostID`);

--
-- Indexes for table `soba`
--
ALTER TABLE `soba`
  ADD PRIMARY KEY (`SobaID`),
  ADD KEY `TipSobeID` (`TipSobeID`,`KategorijaCeneID`),
  ADD KEY `KategorijaCeneID` (`KategorijaCeneID`);

--
-- Indexes for table `tip_sobe`
--
ALTER TABLE `tip_sobe`
  ADD PRIMARY KEY (`TipSobeID`);

--
-- Indexes for table `uplata`
--
ALTER TABLE `uplata`
  ADD PRIMARY KEY (`UplataID`),
  ADD KEY `RezervacijaID` (`RezervacijaID`,`MusterijaID`,`NacinPlacanjaID`),
  ADD KEY `MusterijaID` (`MusterijaID`),
  ADD KEY `NacinPlacanjaID` (`NacinPlacanjaID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD CONSTRAINT `rezervacija_ibfk_1` FOREIGN KEY (`MusterijaID`) REFERENCES `musterija` (`MusterijaID`);

--
-- Constraints for table `rezervacija_sobe`
--
ALTER TABLE `rezervacija_sobe`
  ADD CONSTRAINT `rezervacija_sobe_ibfk_1` FOREIGN KEY (`SobaID`) REFERENCES `soba` (`SobaID`),
  ADD CONSTRAINT `rezervacija_sobe_ibfk_2` FOREIGN KEY (`GostID`) REFERENCES `gost` (`GostID`),
  ADD CONSTRAINT `rezervacija_sobe_ibfk_3` FOREIGN KEY (`RezervacijaID`) REFERENCES `rezervacija` (`RezervacijaID`);

--
-- Constraints for table `soba`
--
ALTER TABLE `soba`
  ADD CONSTRAINT `soba_ibfk_1` FOREIGN KEY (`TipSobeID`) REFERENCES `tip_sobe` (`TipSobeID`),
  ADD CONSTRAINT `soba_ibfk_2` FOREIGN KEY (`KategorijaCeneID`) REFERENCES `kategorija_cene` (`KategorijaCeneID`);

--
-- Constraints for table `uplata`
--
ALTER TABLE `uplata`
  ADD CONSTRAINT `uplata_ibfk_1` FOREIGN KEY (`MusterijaID`) REFERENCES `musterija` (`MusterijaID`),
  ADD CONSTRAINT `uplata_ibfk_2` FOREIGN KEY (`NacinPlacanjaID`) REFERENCES `nacin_placanja` (`NacinPlacanjaID`),
  ADD CONSTRAINT `uplata_ibfk_3` FOREIGN KEY (`RezervacijaID`) REFERENCES `rezervacija` (`RezervacijaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
