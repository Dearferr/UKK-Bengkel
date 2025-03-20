-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 20, 2025 at 02:31 PM
-- Server version: 8.0.30
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `16644_bengkel`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id_booking` int NOT NULL,
  `id_user` int NOT NULL,
  `id_barang` int NOT NULL,
  `id_service` int NOT NULL,
  `id_kendaraan` int NOT NULL,
  `tanggal_waktu` datetime NOT NULL,
  `status` enum('Pending','Diproses','Selesai','Dibatalkan') NOT NULL,
  `jumlah` int NOT NULL,
  `antrian` int NOT NULL,
  `harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id_booking`, `id_user`, `id_barang`, `id_service`, `id_kendaraan`, `tanggal_waktu`, `status`, `jumlah`, `antrian`, `harga`) VALUES
(26, 5, 7, 3, 3, '2025-03-20 17:03:00', 'Selesai', 2, 1, '235000.00'),
(27, 5, 7, 3, 1, '2025-03-20 17:06:00', 'Pending', 2, 1, '235000.00'),
(28, 5, 7, 3, 3, '2025-03-20 20:49:00', 'Pending', 1, 1, '135000.00');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_kendaraan` int NOT NULL,
  `no_pol` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_user` int NOT NULL,
  `merk` text NOT NULL,
  `tipe` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id_kendaraan`, `no_pol`, `nama`, `id_user`, `merk`, `tipe`) VALUES
(1, 'E 7886 SH', 'Brio', 5, 'Honda', 'Matic'),
(2, 'B 2732 NON', 'Ninja H2SX', 5, 'Yamaha Kawasaki', 'Manual Sport'),
(3, 'D 5435 AE', 'Vespa', 5, 'Piaggio', 'Matic'),
(4, 'A 7467 DA', 'HR-V', 5, 'Honda', 'Matic');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` int NOT NULL,
  `nama_laporan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `jumlah_layanan` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posisi`
--

CREATE TABLE `posisi` (
  `id_posisi` int NOT NULL,
  `posisi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posisi`
--

INSERT INTO `posisi` (`id_posisi`, `posisi`) VALUES
(3, 'Gudang'),
(1, 'Kasir '),
(2, 'Mechanic'),
(5, 'Tidak Ada');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat`
--

CREATE TABLE `riwayat` (
  `id_riwayat` int NOT NULL,
  `id_booking` int NOT NULL,
  `id_user` int NOT NULL,
  `id_kendaraan` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_sparepart` int NOT NULL,
  `id_service` int NOT NULL,
  `tanggal_service` date NOT NULL,
  `status` enum('pending','completed','cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `level`) VALUES
(1, 'admin'),
(2, 'pegawai'),
(3, 'Pelanggan');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id_service` int NOT NULL,
  `Nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id_service`, `Nama`, `harga`) VALUES
(1, 'Ganti oli ', '50000.00'),
(2, 'Ganti Air Radiator', '40000.00'),
(3, 'Ganti Ban', '35000.00'),
(4, 'Pasang Shock', '50000.00'),
(5, 'Ban Offroad', '250000.00');

-- --------------------------------------------------------

--
-- Table structure for table `sparepart`
--

CREATE TABLE `sparepart` (
  `id_barang` int NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stok` int NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sparepart`
--

INSERT INTO `sparepart` (`id_barang`, `harga`, `nama`, `stok`, `gambar`) VALUES
(1, '100000.00', 'Oli Mesin Montor ', 7, '1741589239_oli_shell.jpg'),
(2, '234.00', 'tes', 16, '1741589059_Awkward_We_Bare_Bears_Screencaps_(2).jpeg'),
(3, '20000.00', 'Air Radiator', 6, '1742306424_radiator.jpg'),
(4, '150000.00', 'Shock Breaker ', 1, '1742306790_shokbreaker.jpg'),
(6, '150000.00', 'Ban Standar', 5, '1742307098_ban.jpg'),
(7, '100000.00', 'ban montor', 9, '1742434763_ban.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `no_ktp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int NOT NULL DEFAULT '3',
  `id_posisi` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `no_ktp`, `nama`, `alamat`, `no_hp`, `email`, `password`, `role_id`, `id_posisi`) VALUES
(1, '1234878098767', 'Superadmin ', 'jalan mawar no.093 ', '0987657890', 'superadmin@gmail.com', '$2y$10$h7btyGq9Bzxzo0bMcxLpwelxAAHwmic3UzZtMzkCO11AwUqS/xHS6', 1, 0),
(2, '9876546809876', 'Pegawai ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin, dolor a tempus posuere, turpis metus aliquam orci, vitae porta urna neque sed ex. Nulla id libero quis risus mattis aliquam quis non turpis. Vestibulum sed iaculis nunc.', '028398910', 'pegawai@gmail.com', '$2y$10$rZJpRa/5tZesb0rnInTi3uxIfSZfx55S5VDeYwMCnsFG1bJVBNaf.', 2, 1),
(5, '92302138021983', 'Shanon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin, dolor a tempus posuere, turpis metus aliquam orci, vitae porta urna neque sed ex. Nulla id libero quis risus mattis aliquam quis non turpis. Vestibulum sed iaculis nunc. Praesent in diam arcu. Aliquam et justo felis. Donec ultrices velit pretium est venenatis, ut luctus diam iaculis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec consequat sem magna, non rhoncus elit suscipit vitae. Maecenas fermentum nisl a diam aliquam venenatis. Praesent iaculis magna eu sodales ultrices.', '02875467918938', 'enon@email.com', '$2y$10$NlXDXUfoKDIWTaqt4G.l1.3ZOKGO0Q23fERfjCZ3.Dnldt03Dskmi', 3, 5),
(6, '45678992938765', 'echey', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin, dolor a tempus posuere, turpis metus aliquam orci, vitae porta urna neque sed ex. Nulla id libero quis risus mattis aliquam quis non turpis. Vestibulum sed iaculis nunc. Praesent in diam arcu. Aliquam et justo felis. Donec ultrices velit pretium est venenatis, ut luctus diam iaculis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec consequat sem magna, non rhoncus elit suscipit vitae. Maecenas fermentum nisl a diam aliquam venenatis. Praesent iaculis magna eu sodales ultrices.', '0912738757289', 'echey@gmail.com', '$2y$10$re/SFQVdxorU/8TQbhfSrOOdxDdQiS0SVWR7NYD6uUTUHLYakjDxu', 3, 5),
(8, '98765434567', 'chana', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin, dolor a tempus posuere, turpis metus aliquam orci, vitae porta urna neque sed ex. Nulla id libero quis risus mattis aliquam quis non turpis. Vestibulum sed iaculis nunc.', '098767892', 'chana@gmail', '$2y$10$F47rNtV3eRxAoQbqyf1sYuCOXTDe5sdGxW5oF5YK9ygmdh61.Y4bG', 2, 3),
(9, '62718281283', 'gin', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin, dolor a tempus posuere, turpis metus aliquam orci, vitae porta urna neque sed ex. Nulla id libero quis risus mattis aliquam quis non turpis. Vestibulum sed iaculis nunc.', '098767898765', 'gin@gmail.com', '$2y$10$ZUmEHAIO8fckzYjyAZPsdOV.qpMKerFUFECUJvr/jOPbXUCpVl0bW', 2, 2),
(10, '12345678', 'Kenzo', 'rawr', '0987654567', 'kenzo@gmail.com', '$2y$10$PFHqsVlQNi0vX73cL90VGukVRE6xftfG/83QXgQYqa2pYZUuVSfR2', 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_barang` (`id_barang`,`id_service`,`id_kendaraan`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`),
  ADD UNIQUE KEY `no_pol` (`no_pol`,`id_user`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `posisi`
--
ALTER TABLE `posisi`
  ADD PRIMARY KEY (`id_posisi`),
  ADD UNIQUE KEY `nama_posisi` (`posisi`);

--
-- Indexes for table `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `id_booking` (`id_booking`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `no_pol` (`id_kendaraan`),
  ADD KEY `id_sparepart` (`id_sparepart`),
  ADD KEY `id_service` (`id_service`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`);

--
-- Indexes for table `sparepart`
--
ALTER TABLE `sparepart`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`,`id_posisi`),
  ADD KEY `role_id_2` (`role_id`,`id_posisi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id_booking` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id_kendaraan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id_laporan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posisi`
--
ALTER TABLE `posisi`
  MODIFY `id_posisi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id_riwayat` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sparepart`
--
ALTER TABLE `sparepart`
  MODIFY `id_barang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
