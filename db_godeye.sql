-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2021 at 12:09 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_godeye`
--

-- --------------------------------------------------------

--
-- Table structure for table `testing_data`
--

CREATE TABLE `testing_data` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `original_category` varchar(255) NOT NULL,
  `system_classification` varchar(255) NOT NULL,
  `queue` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testing_data`
--

INSERT INTO `testing_data` (`id`, `title`, `date`, `original_category`, `system_classification`, `queue`) VALUES
(1, 'Jubir Satgas Tegaskan Vaksin COVID-19 Tidak Mengandung Magnet', '29 Mei 2021', 'VideoGrafik', 'Indonesia', 1),
(2, 'Apakah Ibu Hamil Boleh Vaksinasi COVID-19? Berikut Ini Jawabannya!', '29 Mei 2021', 'Health', 'Indonesia', 1),
(3, 'Benarkah Vaksin COVID-19 Ada Kandungan Magnet?', '29 Mei 2021', 'Health', 'Indonesia', 1),
(4, 'Ribut-Ribut Vaksin Nusantara, Jokowi: Masa Politikus Ngurusin Vaksin', '20 Apr 2021', 'Indonesia', 'Indonesia', 2),
(5, 'Kekurangan Vaksin Brazil Lobi AS untuk Impor Vaksin', '21 Mar 2021', 'World', 'Indonesia', 2),
(6, 'Hipmi: Vaksin COVID-19 dan &#039;Vaksin&#039; Ekonomi Harus Sejalan dan Selaras', '05 Mar 2021', 'Economy', 'Indonesia', 2);

-- --------------------------------------------------------

--
-- Table structure for table `training_data`
--

CREATE TABLE `training_data` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `portal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `training_data`
--

INSERT INTO `training_data` (`id`, `title`, `date`, `category`, `portal`) VALUES
(1, 'FOTO: Simulasi Penyelamatan Saat Gempa Bumi', '28 Mei 2021', 'News', 'Indozone'),
(2, ' Tegaskan SMS Berantai Soal Gempa Besar &amp; Tsunami Tidak Benar, BMKG: Kesalahan Sistem ', '27 Mei 2021', 'News', 'Indozone'),
(3, 'BMKG: SMS Blast Soal Perkiraan Gempa Magnitudo 8,5 Tidak Benar', '27 Mei 2021', 'VideoGrafik', 'Indozone'),
(4, 'BMKG: SMS Berantai Soal Gempa Besar dan Tsunami Tidak Benar!', '27 Mei 2021', 'News', 'Indozone'),
(5, 'Peristiwa 27 Mei: Gempa Bumi Yogjakarta dan Bencana Lumpur Lapindo', '27 Mei 2021', 'Fakta Dan Mitos', 'Indozone'),
(6, 'Hari Ini, Kawasan Danau Toba Diguncang Gempa Sebanyak 4 Kali', '25 Mei 2021', 'News', 'Indozone'),
(7, 'Gubernur Jatim Tinjau Rumah Rusak Akibat Gempa Magnitudo 5,9 di Blitar', '23 Mei 2021', 'News', 'Indozone'),
(8, 'Dalam Waktu 2 Menit, Gempa Bumi Bermagnitudo 5,0 dan 5,4 Guncang Banten', '23 Mei 2021', 'News', 'Indozone'),
(9, 'Gempa Blitar Dimutakhirkan Jadi M 5,9, Terjadi 2 Kali Gempa Susulan', '21 May 2021', 'Indonesia', 'IDN Times'),
(10, 'Gempa Nias Dipicu Gempa di Luar Zona Subduksi, Tidak Merusak', '20 Apr 2021', 'Indonesia', 'IDN Times'),
(11, '100 Orang Terluka Akibat Gempa Jepang, Ahli Peringatkan Gempa Susulan', '14 Feb 2021', 'Indonesia', 'IDN Times'),
(12, 'Terdampak Gempa, BPBD Kabupaten Blitar Ajukan Bantuan Rp17,2 M', '28 May 2021', 'Indonesia', 'IDN Times'),
(13, 'Peringatan Dini Error, BMKG: Belum Ada Teknologi Bisa Prediksi Gempa', '27 May 2021', 'Indonesia', 'IDN Times'),
(14, 'Proyek Rumah Tahan Gempa di Banyuwangi Rampung, Begini Bentuknya', '26 May 2021', 'Indonesia', 'IDN Times'),
(15, 'BMKG Ingatkan Masyarakat, Ada Potensi Gempa Besar di Jawa  ', '25 May 2021', 'Indonesia', 'IDN Times'),
(16, 'Sejak Awal Tahun Ada 3.532 Gempa, BMKG: Tren Bisa di Atas Rata-rata', '25 May 2021', 'Indonesia', 'IDN Times');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `testing_data`
--
ALTER TABLE `testing_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `training_data`
--
ALTER TABLE `training_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `testing_data`
--
ALTER TABLE `testing_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `training_data`
--
ALTER TABLE `training_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
