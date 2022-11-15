-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2022 at 05:57 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wismillak`
--

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `kode_checkout` int(11) NOT NULL,
  `kode_customer` int(11) NOT NULL,
  `no_nota` varchar(250) NOT NULL,
  `salesman` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `void_by` varchar(50) DEFAULT NULL,
  `void_status` int(11) DEFAULT NULL,
  `void_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`kode_checkout`, `kode_customer`, `no_nota`, `salesman`, `create_date`, `void_by`, `void_status`, `void_date`) VALUES
(1, 2, '210799002', 'Luqman', '2022-11-15 09:36:58', NULL, 0, NULL),
(2, 6, '090721002', 'Luqman 2', '2022-11-15 10:04:35', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `kode_customer` int(11) NOT NULL,
  `nama_customer` varchar(50) DEFAULT NULL,
  `alamat_customer` text DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`kode_customer`, `nama_customer`, `alamat_customer`, `email`) VALUES
(1, 'TOKO ABC', 'Jl. ABC Surabaya', 'abc@example.com'),
(2, 'TOKO DEF', 'Jl. DEF Surabaya', 'def@example.com'),
(3, 'TOKO GHI', 'Jl. GHI Surabaya', 'ghi@example.com'),
(4, 'TOKO JKL', 'Jl. JKL Surabaya', 'jkl@example.com'),
(5, 'TOKO MNO', 'Jl. MNO Surabaya', 'mno@example.com'),
(6, 'John Doe', 'Jl. Doe Surabaya', 'contact@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `detail_checkout`
--

CREATE TABLE `detail_checkout` (
  `kode_det_checkout` int(11) NOT NULL,
  `kode_checkout` int(11) NOT NULL,
  `kode_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_checkout`
--

INSERT INTO `detail_checkout` (`kode_det_checkout`, `kode_checkout`, `kode_product`, `qty`, `price`, `subtotal`, `create_date`) VALUES
(1, 1, 3, 1, 3000, 3000, '2022-11-15 09:37:56'),
(5, 2, 1, 1, 1000, 1000, '2022-11-15 10:04:35'),
(6, 2, 2, 1, 2000, 2000, '2022-11-15 10:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `kode_product` int(11) NOT NULL,
  `nama_product` varchar(250) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`kode_product`, `nama_product`, `stock`, `price`) VALUES
(1, 'PRODUCT A', 10, 1000),
(2, 'PRODUCT B', 20, 2000),
(3, 'PRODUCT C', 30, 3000),
(4, 'PRODUCT D', 40, 4000),
(5, 'PRODUCT E', 50, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `tempproduct`
--

CREATE TABLE `tempproduct` (
  `idTemp` int(11) NOT NULL,
  `kode_customer` int(11) NOT NULL,
  `kode_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tempproduct`
--

INSERT INTO `tempproduct` (`idTemp`, `kode_customer`, `kode_product`, `qty`, `price`, `subtotal`) VALUES
(1, 6, 1, 1, 1000, 1000),
(2, 6, 2, 1, 2000, 2000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`kode_checkout`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`kode_customer`);

--
-- Indexes for table `detail_checkout`
--
ALTER TABLE `detail_checkout`
  ADD PRIMARY KEY (`kode_det_checkout`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`kode_product`);

--
-- Indexes for table `tempproduct`
--
ALTER TABLE `tempproduct`
  ADD PRIMARY KEY (`idTemp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `kode_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `detail_checkout`
--
ALTER TABLE `detail_checkout`
  MODIFY `kode_det_checkout` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `kode_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tempproduct`
--
ALTER TABLE `tempproduct`
  MODIFY `idTemp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
