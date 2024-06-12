-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jun 2024 pada 17.47
-- Versi server: 10.4.32-MariaDB-log
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bulan`
--

CREATE TABLE `tb_bulan` (
  `id_bulan` char(3) NOT NULL,
  `nama_bulan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_bulan`
--

INSERT INTO `tb_bulan` (`id_bulan`, `nama_bulan`) VALUES
('A', 'Januari'),
('B', 'Februari'),
('C', 'Maret'),
('D', 'April'),
('E', 'Mei'),
('F', 'Juni'),
('G', 'Juli'),
('H', 'Agustus'),
('I', 'September'),
('J', 'Oktober'),
('K', 'November'),
('L', 'Desember');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_info`
--

CREATE TABLE `tb_info` (
  `id_info` int(11) NOT NULL,
  `isi_info` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_info`
--

INSERT INTO `tb_info` (`id_info`, `isi_info`) VALUES
(1, 'Untuk para pelanggan segera membayar tagihan bulan ini. Terimakasih.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_layanan`
--

CREATE TABLE `tb_layanan` (
  `id_layanan` int(11) NOT NULL,
  `layanan` varchar(20) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_layanan`
--

INSERT INTO `tb_layanan` (`id_layanan`, `layanan`, `tarif`) VALUES
(1, 'Layanan Air 1', 1500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pakai`
--

CREATE TABLE `tb_pakai` (
  `id_pakai` char(11) NOT NULL,
  `id_pelanggan` char(15) NOT NULL,
  `bulan` char(3) NOT NULL,
  `tahun` char(4) NOT NULL,
  `awal` int(11) NOT NULL,
  `akhir` int(11) NOT NULL,
  `pakai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_pakai`
--

INSERT INTO `tb_pakai` (`id_pakai`, `id_pelanggan`, `bulan`, `tahun`, `awal`, `akhir`, `pakai`) VALUES
('K000000001', 'P001', 'A', '2024', 0, 12, 0),
('K000000002', 'P001', 'B', '2024', 12, 24, 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` char(15) NOT NULL,
  `nama_pelanggan` varchar(20) NOT NULL,
  `alamat` varchar(40) NOT NULL,
  `no_hp` char(15) NOT NULL,
  `status` char(10) NOT NULL DEFAULT 'Aktif',
  `id_layanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `no_hp`, `status`, `id_layanan`) VALUES
('P001', 'Yunia', 'Metro', '083170465327', 'Aktif', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id_tagihan` int(11) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `uang_bayar` int(11) NOT NULL,
  `kembali` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_pembayaran`
--

INSERT INTO `tb_pembayaran` (`id_tagihan`, `tgl_bayar`, `uang_bayar`, `kembali`) VALUES
(78, '2024-06-11', 20000, 2000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tagihan`
--

CREATE TABLE `tb_tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `id_pakai` char(11) NOT NULL,
  `tagihan` int(11) NOT NULL,
  `status` char(12) NOT NULL DEFAULT 'Belum Bayar'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_tagihan`
--

INSERT INTO `tb_tagihan` (`id_tagihan`, `id_pakai`, `tagihan`, `status`) VALUES
(77, 'K000000001', 0, 'Belum Bayar'),
(78, 'K000000002', 18000, 'Lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(20) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `level` varchar(15) NOT NULL,
  `no_hp` char(13) NOT NULL,
  `no_rek` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `username`, `password`, `level`, `no_hp`, `no_rek`) VALUES
(1, 'Joe Febrian Sinuraya', 'admin', '1', 'Administrator', '085878526022', ''),
(2, 'Arifin', 'opt', '1', 'Operator', '087789987654', ''),
(24, 'Joe', 'joe', '1', 'Pelanggan', '085270592535', 'P001'),
(26, 'Yunia', 'yunia', '1', 'Pelanggan', '083170465327', 'P001');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_bulan`
--
ALTER TABLE `tb_bulan`
  ADD PRIMARY KEY (`id_bulan`);

--
-- Indeks untuk tabel `tb_info`
--
ALTER TABLE `tb_info`
  ADD PRIMARY KEY (`id_info`);

--
-- Indeks untuk tabel `tb_layanan`
--
ALTER TABLE `tb_layanan`
  ADD PRIMARY KEY (`id_layanan`);

--
-- Indeks untuk tabel `tb_pakai`
--
ALTER TABLE `tb_pakai`
  ADD PRIMARY KEY (`id_pakai`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `bulan` (`bulan`);

--
-- Indeks untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `tb_pelanggan_ibfk_1` (`id_layanan`);

--
-- Indeks untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD KEY `tb_pembayaran_ibfk_1` (`id_tagihan`);

--
-- Indeks untuk tabel `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  ADD PRIMARY KEY (`id_tagihan`),
  ADD KEY `id_pelanggan` (`id_pakai`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_info`
--
ALTER TABLE `tb_info`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_layanan`
--
ALTER TABLE `tb_layanan`
  MODIFY `id_layanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_pakai`
--
ALTER TABLE `tb_pakai`
  ADD CONSTRAINT `tb_pakai_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pakai_ibfk_2` FOREIGN KEY (`bulan`) REFERENCES `tb_bulan` (`id_bulan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`id_layanan`) REFERENCES `tb_layanan` (`id_layanan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD CONSTRAINT `tb_pembayaran_ibfk_1` FOREIGN KEY (`id_tagihan`) REFERENCES `tb_tagihan` (`id_tagihan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  ADD CONSTRAINT `tb_tagihan_ibfk_1` FOREIGN KEY (`id_pakai`) REFERENCES `tb_pakai` (`id_pakai`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
