-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 14, 2019 at 09:51 AM
-- Server version: 10.3.16-MariaDB
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
-- Database: `db_onlinebank`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `no_rekening` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `saldo` varchar(250) NOT NULL,
  `mutasi` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`no_rekening`, `nama`, `email`, `password`, `alamat`, `saldo`, `mutasi`) VALUES
('15107012', 'wildan ramadhan', 'wildan@gmail.com', '1234567', 'bogor', '8100000', ''),
('15107032', 'alfian syahputra', 'alfian@gmail.com', '123456', 'depok', '1800000', '');

-- --------------------------------------------------------

--
-- Table structure for table `data_transfer`
--

CREATE TABLE `data_transfer` (
  `id_customer` int(5) NOT NULL,
  `no_rekening` int(20) NOT NULL,
  `nominal` int(20) NOT NULL,
  `tanggal` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(5) NOT NULL,
  `kode_transfer` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomor_invoice` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `penerima` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_bayar` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nama` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tgl_transfer` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `kode_transfer`, `nomor_invoice`, `penerima`, `total_bayar`, `nama`, `email`, `tgl_transfer`) VALUES
(1, '110087448712555', '50012', 'F&R Store', '10509000', 'Muhammad', 'farrasmuttaqin@gmail.com', '11/05/2018'),
(2, '110087448712556', '50013', 'F&R Store', '389000', 'Muhammad', 'farrasmuttaqin@gmail.com', '11/05/2018'),
(3, '110087448712557', '50014', 'F&R Store', '1023000', 'Muhammad', 'farrasmuttaqin@gmail.com', '11/05/2018'),
(4, '110087448712558', '50015', 'F&R Store', '9609000', 'Rafiansyah', 'Rafiansyahmuhammad@gmail.com', '12/05/2018'),
(5, '110087448712559', '50016', 'F&R Store', '5549000', 'Muhammad', 'farrasmuttaqin@gmail.com', '15/05/2018'),
(6, '110087448712561', '50018', 'F&R Store', '489000', 'Insen', 'insen777@gmail.com', '15/05/2018'),
(7, '110087448712562', '50019', 'F&R Store', '15255000', 'jack', 'mfarrasmuttaqin@trilogi.ac.id', '15/05/2018'),
(8, '110087448712563', '50020', 'F&R Store', '259000', 'jack', 'mfarrasmuttaqin@trilogi.ac.id', '15/05/2018'),
(9, '110087448712564', '50021', 'F&R Store', '5655000', 'jack', 'mfarrasmuttaqin@trilogi.ac.id', '16/05/2018'),
(10, '110087448712566', '50023', 'F&R Store', '265000', 'rizal', 'abdulrizalhidayat@gmail.com', '28/05/2018'),
(11, '110087448712567', '50024', 'F&R Store', '215000', 'rizal', 'abdulrizalhidayat@gmail.com', '28/05/2018'),
(12, '110087448712565', '50022', 'F&R Store', '3765000', 'rizal', 'abdulrizalhidayat@gmail.com', '28/05/2018'),
(13, '110087448712569', '50026', 'F&R Store', '209000', 'rizal', 'abdulrizalhidayat@gmail.com', '28/05/2018'),
(14, '110087448712570', '50027', 'F&R Store', '359000', 'rizal', 'abdulrizalhidayat@gmail.com', '28/05/2018'),
(15, '110087448712572', '50029', 'F&R Store', '609000', 'rizal', 'abdulrizalhidayat@gmail.com', '28/05/2018'),
(16, '110087448712573', '50030', 'F&R Store', '609000', 'Muhammad', 'farrasmuttaqin@gmail.com', '30/05/2018'),
(17, '110087448712574', '50031', 'F&R Store', '109000', 'bagol', 'mancuniann@gmail.com', '30/05/2018'),
(18, '110087448712579', '50036', 'F&R Store', '1265000', 'Farras', 'FarrasmuTTaqin1@gmail.com', '23/06/2018'),
(19, '110087448712583', '50040', 'F&R Store', '1409000', 'farras', 'farrasmuttaqin@gmail.com', '26/06/2018'),
(20, '110087448712586', '50043', 'F&R Store', '259000', 'farras', 'farrasmuttaqin@gmail.com', '04/07/2018'),
(21, '110087448712587', '50044', 'F&R Store', '509000', 'farras', 'farrasmuttaqin@gmail.com', '11/07/2018'),
(22, '110087448712590', '50047', 'F&R Store', '509000', 'rizal', 'arizalh14@gmail.com', '17/07/2018'),
(23, '110087448712595', '50052', 'F&R Store', '409000', 'farras', 'farrasmuttaqin@gmail.com', '04/08/2018'),
(24, '110087448712560', '50017', 'F&R Store', '139000', 'Aov', 'Farraaaov@gmail.com', '04/08/2018'),
(25, '110087448712596', '50053', 'F&R Store', '209000', 'Aov', 'Farraaaov@gmail.com', '04/08/2018'),
(26, '110087448712599', '50056', 'F&R Store', '609000', 'Aov', 'Farraaaov@gmail.com', '06/08/2018'),
(27, '110087448712601', '50058', 'F&R Store', '709000', 'aldo', 'dosq.pratama@gmail.com', '06/08/2018'),
(28, '110087448712602', '50059', 'F&R Store', '509000', 'aldo', 'dosq.pratama@gmail.com', '06/08/2018'),
(29, '110087448712603', '50060', 'F&R Store', '2009000', 'aldo', 'dosq.pratama@gmail.com', '06/08/2018'),
(30, '110087448712611', '50068', 'F&R Store', '14409000', 'nao', 'naoilmiad@gmail.com', '14/10/2018'),
(31, '110087448712611', '50068', 'F&R Store', '14409000', 'nao', 'naoilmiad@gmail.com', '14/10/2018'),
(32, '8872636255', '8', 'F&R Store', '109000', 'farras', 'farrasmuttaqin@gmail.com', '16/02/2019'),
(33, '887263628', '11', 'F&R Store', '6015000', 'Muhammad', 'rafiansyahmuhammad@gmail.com', '22/02/2019'),
(34, '887263631', '14', 'F&R Store', '215000', 'farras', 'farrasmuttaqin@gmail.com', '27/05/2019'),
(35, '887263633', '16', 'F&R Store', '209000', 'nao', 'naoilmiad@gmail.com', '17/07/2019'),
(36, '812387263634', '716493', 'F&R Store', '109000', 'nao', 'naoilmiad@gmail.com', '17/07/2019'),
(37, '812387263635', '716494', 'F&R Store', '9609000', 'farras', 'farrasmuttaqin@gmail.com', '10/09/2019'),
(38, '812387263636', '716495', 'F&R Store', '309000', 'farras', 'naoilmiad1@gmail.com', '11/09/2019');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_topup_frstore`
--

CREATE TABLE `pembayaran_topup_frstore` (
  `id_topup` int(5) NOT NULL,
  `kode_transfer_saldo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jumlah_top_up` int(20) DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tanggal_transfer` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pembayaran_topup_frstore`
--

INSERT INTO `pembayaran_topup_frstore` (`id_topup`, `kode_transfer_saldo`, `jumlah_top_up`, `email`, `tanggal_transfer`) VALUES
(1, '9928374628111', 777, 'farrasmuttaqin@gmail.com', '15/07/2018'),
(2, '99283746281119', 2000, 'farrasmuttaqin@gmail.com', '15/07/2018'),
(3, '99283746281120', 1000, 'farrasmuttaqin@gmail.com', '15/07/2018'),
(4, '99283746281121', 1000, 'farrasmuttaqin@gmail.com', '15/07/2018'),
(5, '99283746281123', 10000, 'farrasmuttaqin@gmail.com', '16/07/2018'),
(6, '99283746281125', 5000, 'farrasmuttaqin@gmail.com', '17/07/2018'),
(7, '99283746281126', 1000, 'arizalh14@gmail.com', '17/07/2018'),
(8, '99283746281127', 10000000, 'farrasmuttaqin@gmail.com', '17/07/2018'),
(9, '99283746281131', 50000000, 'farrasmuttaqin@gmail.com', '18/07/2018'),
(10, '99283746281134', 500000, 'farrasmuttaqin@gmail.com', '24/07/2018'),
(11, '99283746281136', 1000, 'Farraaaov@gmail.com', '04/08/2018'),
(12, '99283746281137', 2000, 'Farraaaov@gmail.com', '04/08/2018'),
(13, '99283746281139', 5000, 'farrasmuttaqin@gmail.com', '04/08/2018'),
(14, '99283746281144', 5000, 'naoilmiad@gmail.com', '19/10/2018'),
(15, '99283746281145', 5000, 'farrasmuttaqin@gmail.com', '09/11/2018'),
(16, '99999592', 5000, 'farrasmuttaqin@gmail.com', '15/11/2018'),
(17, '99999594', 200000, 'farrasmuttaqin@gmail.com', '15/11/2018'),
(18, '99999598', 6000000, 'farrasmuttaqin@gmail.com', '31/12/2018'),
(19, '99999602', 1000000, 'rafiansyahmuhammad@gmail.com', '22/02/2019'),
(20, '99999604', 50000, 'farrasmuttaqin@gmail.com', '12/09/2019'),
(21, '99999606', 200000, 'farrasmuttaqin@gmail.com', '12/09/2019'),
(22, '99999607', 10000, 'farrasmuttaqin@gmail.com', '12/09/2019'),
(23, '99999608', 10000, 'farrasmuttaqin@gmail.com', '12/09/2019');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `no_rekening` varchar(100) NOT NULL,
  `no_rekening_tujuan` varchar(100) NOT NULL,
  `nama_pengirim` varchar(100) NOT NULL,
  `nama_penerima` varchar(100) NOT NULL,
  `nominal` int(11) NOT NULL,
  `tanggal_transaksi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `no_rekening`, `no_rekening_tujuan`, `nama_pengirim`, `nama_penerima`, `nominal`, `tanggal_transaksi`) VALUES
(10, '15107045', '15107004', 'Kridho Cokro', 'ganda suteja', 100000, '14/05/2018'),
(11, '15107004', '15107045', 'ganda suteja', 'Kridho Cokro', 3000000, '14/05/2018'),
(12, '15107004', '15107045', 'ganda suteja', 'Kridho Cokro', 1000000, '16/05/2018'),
(13, '15107004', '', 'ganda suteja', '', 0, '16/05/2018'),
(14, '15107004', '15107045', 'ganda suteja', 'Kridho Cokro', 200000, '16/05/2018'),
(15, '15107045', '15107004', 'Kridho Cokro', 'ganda suteja', 9000000, '16/05/2018'),
(16, '15107004', '15107045', 'ganda suteja', 'Kridho Cokro', 8000000, '16/05/2018');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `no_rekening` int(50) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`no_rekening`, `username`, `password`, `email`, `alamat`) VALUES
(15107032, 'admin', '123456', 'alfiansaputra@gmail.com', 'universitas trilogi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`no_rekening`);

--
-- Indexes for table `data_transfer`
--
ALTER TABLE `data_transfer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran_topup_frstore`
--
ALTER TABLE `pembayaran_topup_frstore`
  ADD PRIMARY KEY (`id_topup`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `pembayaran_topup_frstore`
--
ALTER TABLE `pembayaran_topup_frstore`
  MODIFY `id_topup` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
