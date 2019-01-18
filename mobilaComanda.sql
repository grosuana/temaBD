-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2019 at 09:29 AM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobilaComanda`
--

-- --------------------------------------------------------

--
-- Table structure for table `angajati`
--
-- Creation: Jan 07, 2019 at 12:10 PM
--

CREATE TABLE IF NOT EXISTS `angajati` (
  `codAngajat` int(11) NOT NULL,
  `codSalariu` int(11) NOT NULL,
  `codManager` int(11) DEFAULT NULL,
  `nume` varchar(20) NOT NULL,
  `prenume` varchar(20) NOT NULL,
  `sex` set('F','M') NOT NULL DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `angajatiComenzi`
--
-- Creation: Jan 07, 2019 at 12:10 PM
--

CREATE TABLE IF NOT EXISTS `angajatiComenzi` (
  `codAngajat` int(11) NOT NULL,
  `codComanda` int(11) NOT NULL,
  `timpAlocat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--
-- Creation: Jan 07, 2019 at 12:10 PM
--

CREATE TABLE IF NOT EXISTS `clienti` (
  `codClient` int(11) NOT NULL,
  `nume` varchar(20) NOT NULL,
  `prenume` varchar(20) NOT NULL,
  `strada` varchar(50) DEFAULT NULL,
  `apartament` int(11) DEFAULT NULL,
  `telefon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comenzi`
--
-- Creation: Jan 07, 2019 at 12:10 PM
--

CREATE TABLE IF NOT EXISTS `comenzi` (
  `codComanda` int(11) NOT NULL,
  `codClient` int(11) NOT NULL,
  `dataEfectuare` date DEFAULT NULL,
  `deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fabrici`
--
-- Creation: Jan 07, 2019 at 12:10 PM
--

CREATE TABLE IF NOT EXISTS `fabrici` (
  `codFabrica` int(11) NOT NULL,
  `strada` varchar(50) DEFAULT NULL,
  `oras` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `masini`
--
-- Creation: Jan 07, 2019 at 12:10 PM
--

CREATE TABLE IF NOT EXISTS `masini` (
  `codMasina` int(11) NOT NULL,
  `ocupata` set('NU','DA') NOT NULL DEFAULT 'NU'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obiecteMobilier`
--
-- Creation: Jan 07, 2019 at 12:10 PM
--

CREATE TABLE IF NOT EXISTS `obiecteMobilier` (
  `codMobila` int(11) NOT NULL,
  `codComanda` int(11) NOT NULL,
  `codFabrica` int(11) DEFAULT NULL,
  `codTransport` int(11) NOT NULL,
  `tip` varchar(30) DEFAULT NULL,
  `greutate` int(11) DEFAULT NULL,
  `terminat` set('DA','NU') NOT NULL DEFAULT 'NU'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salarii`
--
-- Creation: Jan 07, 2019 at 12:10 PM
--

CREATE TABLE IF NOT EXISTS `salarii` (
  `codSalariu` int(11) NOT NULL,
  `valoare` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transporturi`
--
-- Creation: Jan 07, 2019 at 12:10 PM
--

CREATE TABLE IF NOT EXISTS `transporturi` (
  `codTransport` int(11) NOT NULL,
  `codMasina` int(11) NOT NULL,
  `efectuat` set('DA','NU') NOT NULL DEFAULT 'NU'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- Creation: Jan 07, 2019 at 12:00 PM
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `UID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `UID`) VALUES
('administrator', 'administrator', 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `angajati`
--
ALTER TABLE `angajati`
  ADD PRIMARY KEY (`codAngajat`),
  ADD KEY `codAngajat` (`codAngajat`),
  ADD KEY `codSalariu` (`codSalariu`),
  ADD KEY `codAngajat_2` (`codAngajat`),
  ADD KEY `codSalariu_2` (`codSalariu`),
  ADD KEY `codManager` (`codManager`);

--
-- Indexes for table `angajatiComenzi`
--
ALTER TABLE `angajatiComenzi`
  ADD PRIMARY KEY (`codAngajat`,`codComanda`),
  ADD KEY `codComanda` (`codComanda`),
  ADD KEY `codAngajat` (`codAngajat`),
  ADD KEY `codComanda_2` (`codComanda`),
  ADD KEY `codAngajat_2` (`codAngajat`);

--
-- Indexes for table `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`codClient`),
  ADD KEY `codClient` (`codClient`);

--
-- Indexes for table `comenzi`
--
ALTER TABLE `comenzi`
  ADD PRIMARY KEY (`codComanda`),
  ADD KEY `codClient` (`codClient`),
  ADD KEY `codComanda` (`codComanda`),
  ADD KEY `codComanda_2` (`codComanda`),
  ADD KEY `codClient_2` (`codClient`);

--
-- Indexes for table `fabrici`
--
ALTER TABLE `fabrici`
  ADD PRIMARY KEY (`codFabrica`),
  ADD KEY `codFabrica` (`codFabrica`);

--
-- Indexes for table `masini`
--
ALTER TABLE `masini`
  ADD PRIMARY KEY (`codMasina`),
  ADD KEY `codMasina` (`codMasina`);

--
-- Indexes for table `obiecteMobilier`
--
ALTER TABLE `obiecteMobilier`
  ADD KEY `codMobila` (`codMobila`),
  ADD KEY `codComanda` (`codComanda`),
  ADD KEY `codFabrica` (`codFabrica`),
  ADD KEY `codTransport` (`codTransport`);

--
-- Indexes for table `salarii`
--
ALTER TABLE `salarii`
  ADD PRIMARY KEY (`codSalariu`),
  ADD KEY `codSalariu` (`codSalariu`),
  ADD KEY `codSalariu_2` (`codSalariu`);

--
-- Indexes for table `transporturi`
--
ALTER TABLE `transporturi`
  ADD PRIMARY KEY (`codTransport`),
  ADD KEY `codTransport` (`codTransport`),
  ADD KEY `codMasina` (`codMasina`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `angajati`
--
ALTER TABLE `angajati`
  ADD CONSTRAINT `angajati_ibfk_1` FOREIGN KEY (`codSalariu`) REFERENCES `salarii` (`codSalariu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `angajati_ibfk_2` FOREIGN KEY (`codManager`) REFERENCES `angajati` (`codAngajat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `angajatiComenzi`
--
ALTER TABLE `angajatiComenzi`
  ADD CONSTRAINT `angajatiComenzi_ibfk_1` FOREIGN KEY (`codAngajat`) REFERENCES `angajati` (`codAngajat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `angajatiComenzi_ibfk_2` FOREIGN KEY (`codComanda`) REFERENCES `comenzi` (`codComanda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comenzi`
--
ALTER TABLE `comenzi`
  ADD CONSTRAINT `comenzi_ibfk_1` FOREIGN KEY (`codClient`) REFERENCES `clienti` (`codClient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `obiecteMobilier`
--
ALTER TABLE `obiecteMobilier`
  ADD CONSTRAINT `obiecteMobilier_ibfk_1` FOREIGN KEY (`codFabrica`) REFERENCES `fabrici` (`codFabrica`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `obiecteMobilier_ibfk_2` FOREIGN KEY (`codTransport`) REFERENCES `transporturi` (`codTransport`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `obiecteMobilier_ibfk_3` FOREIGN KEY (`codComanda`) REFERENCES `comenzi` (`codComanda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transporturi`
--
ALTER TABLE `transporturi`
  ADD CONSTRAINT `transporturi_ibfk_1` FOREIGN KEY (`codMasina`) REFERENCES `masini` (`codMasina`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
