-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 27, 2019 at 10:10 AM
-- Server version: 10.0.38-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_onlinebank`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `apiKey` varchar(100) NOT NULL,
  `noRekening` varchar(100) NOT NULL,
  `namaLengkap` varchar(100) NOT NULL,
  `pin` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `saldo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`apiKey`, `noRekening`, `namaLengkap`, `pin`, `email`, `password`, `saldo`) VALUES
('052770bb81ea', '987654321234', 'depo titipsaja', 654321, 'titipsaja@gmail.com', '123456789', '750000'),
('9340734638b7', '932464582364', 'depo trilogi', 112233, 'trilogi@gmail.com', '123456789', '1000000'),
('b30404aa4bf618a', '98734525839', 'universitas trilogi', 98765, 'trilogiuniversity@gmail.com', '123456789', '500000'),
('dc3235e4e8247eb', '98765467890', 'titipsaja', 123456, 'titipsaja@gmail.com', '123456789', '1745000'),
('f58db013c1bd', '987654345214', 'platformcryptocurrency', 567890, 'paltformctyptocurrency@gmail.com', '123456789', '10000000'),
('jdb932y67dsvss', '993464823723', 'Dashboard Parkir', 71197, 'dashboardparkir@gmail.com', '123456789', '100000000');

-- --------------------------------------------------------

--
-- Table structure for table `mutasi`
--

CREATE TABLE `mutasi` (
  `idMutasi` int(100) NOT NULL,
  `noRekening` varchar(100) NOT NULL,
  `noRekTujuan` varchar(100) NOT NULL,
  `namaPenerima` varchar(100) NOT NULL,
  `waktu` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `cabang` varchar(100) NOT NULL,
  `mutasi` varchar(100) NOT NULL,
  `saldo` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `apiKey` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mutasi`
--

INSERT INTO `mutasi` (`idMutasi`, `noRekening`, `noRekTujuan`, `namaPenerima`, `waktu`, `keterangan`, `cabang`, `mutasi`, `saldo`, `status`, `apiKey`) VALUES
(4, '98765467890', '98734525839', 'universitas trilogi', '2019-11-19 18:36', 'Transfer', '0000', '100000', '900000', 'Berhasil', 'dc3235e4e8247eb'),
(5, '98734525839', '-', '', '2019-11-19 18:36', 'Deposit', '0000', '100000', '100000', 'Berhasil', 'b30404aa4bf618a'),
(6, '98765467890', '98734525839', 'universitas trilogi', '2019-11-19 18:53', 'Transfer', '0000', '200000', '700000', 'Berhasil', 'dc3235e4e8247eb'),
(7, '98734525839', '-', '-', '2019-11-19 18:53', 'Deposit', '0000', '200000', '300000', 'Berhasil', 'b30404aa4bf618a'),
(8, '98765467890', '98734525839', 'universitas trilogi', '2019-11-23 15:19', 'Transfer', '0000', '100000', '600000', 'Berhasil', 'dc3235e4e8247eb'),
(9, '98734525839', '-', '-', '2019-11-23 15:19', 'Deposit', '0000', '100000', '400000', 'Berhasil', 'b30404aa4bf618a'),
(10, '98765467890', '98734525839', 'universitas trilogi', '2019-11-23 17:29', 'Transfer', '0000', '50000', '550000', 'Berhasil', 'dc3235e4e8247eb'),
(11, '98734525839', '-', '-', '2019-11-23 17:29', 'Deposit', '0000', '50000', '450000', 'Berhasil', 'b30404aa4bf618a'),
(12, '987654321234', '98765467890', 'titipsaja', '2019-12-12 21:52', 'Transfer', '0000', '120000', '880000', 'Berhasil', '052770bb81ea'),
(13, '98765467890', '-', '-', '2019-12-12 21:52', 'Deposit', '0000', '120000', '670000', 'Berhasil', 'dc3235e4e8247eb'),
(14, '987654321234', '98765467890', 'titipsaja', '2019-12-12 22:14', 'Transfer', '0000', '175000', '705000', 'Berhasil', '052770bb81ea'),
(15, '98765467890', '-', '-', '2019-12-12 22:14', 'Deposit', '0000', '175000', '845000', 'Berhasil', 'dc3235e4e8247eb'),
(16, '987654321234', '98765467890', 'titipsaja', '2019-12-12 22:16', 'Transfer', '0000', '175000', '530000', 'Berhasil', '052770bb81ea'),
(17, '98765467890', '-', '-', '2019-12-12 22:16', 'Deposit', '0000', '175000', '1020000', 'Berhasil', 'dc3235e4e8247eb'),
(18, '987654321234', '98765467890', 'titipsaja', '2019-12-12 22:16', 'Transfer', '0000', '175000', '355000', 'Berhasil', '052770bb81ea'),
(19, '98765467890', '-', '-', '2019-12-12 22:16', 'Deposit', '0000', '175000', '1195000', 'Berhasil', 'dc3235e4e8247eb'),
(20, '987654321234', '98765467890', 'titipsaja', '2019-12-12 22:16', 'Transfer', '0000', '175000', '180000', 'Berhasil', '052770bb81ea'),
(21, '98765467890', '-', '-', '2019-12-12 22:16', 'Deposit', '0000', '175000', '1370000', 'Berhasil', 'dc3235e4e8247eb'),
(22, '987654321234', '98765467890', 'titipsaja', '2019-12-12 22:16', 'Transfer', '0000', '175000', '5000', 'Berhasil', '052770bb81ea'),
(23, '98765467890', '-', '-', '2019-12-12 22:16', 'Deposit', '0000', '175000', '1545000', 'Berhasil', 'dc3235e4e8247eb'),
(24, '98765467890', '98734525839', 'universitas trilogi', '2019-12-13 14:45', 'Transfer', '0000', '50000', '1495000', 'Berhasil', 'dc3235e4e8247eb'),
(25, '98734525839', '-', '-', '2019-12-13 14:45', 'Deposit', '0000', '50000', '500000', 'Berhasil', 'b30404aa4bf618a'),
(26, '987654321234', '98765467890', 'titipsaja', '2019-12-13 16:19', 'Transfer', '0000', '175000', '825000', 'Berhasil', '052770bb81ea'),
(27, '98765467890', '-', '-', '2019-12-13 16:19', 'Deposit', '0000', '175000', '1670000', 'Berhasil', 'dc3235e4e8247eb'),
(28, '987654321234', '98765467890', 'titipsaja', '2019-12-13 16:29', 'Transfer', '0000', '175000', '650000', 'Berhasil', '052770bb81ea'),
(29, '98765467890', '-', '-', '2019-12-13 16:29', 'Deposit', '0000', '175000', '1845000', 'Berhasil', 'dc3235e4e8247eb'),
(30, '98765467890', '987654321234', 'depo titipsaja', '2019-12-14 09:54', 'Transfer', '0000', '100000', '1745000', 'Berhasil', 'dc3235e4e8247eb'),
(31, '987654321234', '-', '-', '2019-12-14 09:54', 'Deposit', '0000', '100000', '750000', 'Berhasil', '052770bb81ea');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`apiKey`);

--
-- Indexes for table `mutasi`
--
ALTER TABLE `mutasi`
  ADD PRIMARY KEY (`idMutasi`),
  ADD KEY `apiKey` (`apiKey`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mutasi`
--
ALTER TABLE `mutasi`
  MODIFY `idMutasi` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `mutasi`
--
ALTER TABLE `mutasi`
  ADD CONSTRAINT `mutasi_ibfk_1` FOREIGN KEY (`apiKey`) REFERENCES `account` (`apiKey`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
