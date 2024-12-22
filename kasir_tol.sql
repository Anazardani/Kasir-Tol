-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Des 2024 pada 10.47
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir_tol`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kendaraan`
--

CREATE TABLE `jenis_kendaraan` (
  `id_jenis_kendaraan` int(11) NOT NULL,
  `jenis_kendaraan` varchar(20) DEFAULT NULL,
  `tarif_dasar` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jenis_kendaraan`
--

INSERT INTO `jenis_kendaraan` (`id_jenis_kendaraan`, `jenis_kendaraan`, `tarif_dasar`) VALUES
(1, 'Mobil Sedan', 20000.00),
(2, 'Motor', 10000.00),
(3, 'Mobil SUV', 25000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE `kendaraan` (
  `nomor_kendaraan` varchar(20) NOT NULL,
  `jenis_kendaraan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kendaraan`
--

INSERT INTO `kendaraan` (`nomor_kendaraan`, `jenis_kendaraan`) VALUES
('B1234XYZ', 'Mobil Sedan'),
('B5678ABC', 'Motor'),
('B9101DEF', 'Mobil SUV');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `role`) VALUES
(1, 'admin', 'hashed_password_123', 'admin'),
(2, 'user1', 'hashed_password_456', 'user'),
(3, 'user2', 'hashed_password_789', 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tarif`
--

CREATE TABLE `tarif` (
  `id_tarif` int(11) NOT NULL,
  `jarak_tempuh` decimal(10,2) DEFAULT NULL,
  `tarif_tambahan` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tarif`
--

INSERT INTO `tarif` (`id_tarif`, `jarak_tempuh`, `tarif_tambahan`) VALUES
(1, 10.50, 6000.00),
(2, 20.00, 7000.00),
(3, 30.00, 10000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `nomor_kendaraan` varchar(20) DEFAULT NULL,
  `id_jenis_kendaraan` int(11) DEFAULT NULL,
  `id_tarif` int(11) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `waktu_masuk` timestamp NOT NULL DEFAULT current_timestamp(),
  `waktu_keluar` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jumlah_bayar` decimal(10,2) DEFAULT NULL,
  `metode_pembayaran` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `nomor_kendaraan`, `id_jenis_kendaraan`, `id_tarif`, `tanggal_transaksi`, `waktu_masuk`, `waktu_keluar`, `jumlah_bayar`, `metode_pembayaran`) VALUES
(2, 'B5678ABC', 2, 2, '2024-12-22', '2024-12-22 02:00:00', '2024-12-22 02:15:00', 17000.00, 'E-Money'),
(3, 'B9101DEF', 3, 3, '2024-12-22', '2024-12-22 03:00:00', '2024-12-22 03:45:00', 45000.00, 'Tunai');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis_kendaraan`
--
ALTER TABLE `jenis_kendaraan`
  ADD PRIMARY KEY (`id_jenis_kendaraan`);

--
-- Indeks untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`nomor_kendaraan`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`id_tarif`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `nomor_kendaraan` (`nomor_kendaraan`),
  ADD KEY `id_jenis_kendaraan` (`id_jenis_kendaraan`),
  ADD KEY `id_tarif` (`id_tarif`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_kendaraan`
--
ALTER TABLE `jenis_kendaraan`
  MODIFY `id_jenis_kendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tarif`
--
ALTER TABLE `tarif`
  MODIFY `id_tarif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`nomor_kendaraan`) REFERENCES `kendaraan` (`nomor_kendaraan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_jenis_kendaraan`) REFERENCES `jenis_kendaraan` (`id_jenis_kendaraan`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_tarif`) REFERENCES `tarif` (`id_tarif`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
