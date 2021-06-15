-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2021 at 10:28 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
(1, 'Klarifikasi Kemenkes Terkait Aturan Pelaksanaan Vaksinasi COVID-19', '15 Juni 2021', 'Health', 'News', 1),
(2, 'Demi Herd Immunity, Sandiaga Uno Minta Masyarakat Tidak Pilih-pilih Vaksin Covid-19', '15 Juni 2021', 'News', 'News', 1),
(3, 'Diminta Jokowi Vaksinasi 7,5 Juta Warga Jakarta, Ini Tanggapan Anies', '14 Juni 2021', 'News', 'News', 1),
(4, 'Anies Siap Penuhi Perintah Jokowi Soal Vaksinasi 7,5 Juta Warga DKI Hingga Akhir Agustus', '14 Juni 2021', 'News', 'News', 1),
(5, 'Vaksin AstraZeneca Memiliki Lebih Banyak Manfaat daripada Bahaya Menurut Badan Obat Eropa', '14 Juni 2021', 'News', 'News', 1),
(6, 'Mengenal Penyakit Tay-Sachs, Penyakit Saraf yang Sering Menyerang Bayi', '05 Apr 2021', 'Medical', 'News', 2),
(7, 'Jadi Salah Satu Penyakit Mematikan, Ini 5 Cara Mencegah Penyakit TBC', '24 Mar 2021', 'Fitness', 'News', 2),
(8, 'Penyakit Celiac, Penyakit Autoimun yang Dipicu Konsumsi Gluten', '12 Jan 2021', 'Medical', 'News', 2),
(9, '5 Fakta Penyakit Emfisema, Penyakit yang Sering Menyerang Perokok', '01 Jan 2021', 'Medical', 'News', 2),
(10, '5 Aktor Korea yang Pernah Didiagnosis dengan Penyakit Mematikan', '11 Jun 2021', 'Entertainment', 'News', 2),
(11, 'Sebut 25% Pasien Covid-19 dari Luar Jakarta, Dinkes DKI: Virus Tak Kenal Batas Wilayah', '15 Juni 2021', 'News', 'News', 3),
(12, 'Warga India Bangun Kuil &#039;Dewi Corona&#039; Untuk Usir Virus Corona', '15 Juni 2021', 'Health', 'News', 3),
(13, 'Masjid Ini Catat 15 Kematian Covid-19 dalam 2 Minggu Setelah Virus Menyebar ke Jamaah', '14 Juni 2021', 'News', 'News', 3),
(14, 'Tengah Berlayar, MSC Seaside Lapor 2 Orang Terjangkit Virus COVID-19', '11 Juni 2021', 'Travel', 'News', 3),
(15, 'Penelitian: Hewan Liar yang Dijual di Pasar Wuhan Diyakini Tidak Membawa Virus Corona', '11 Juni 2021', 'News', 'News', 3);

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
(1, 'Klarifikasi Kemenkes Terkait Aturan Pelaksanaan Vaksinasi COVID-19', '15 Juni 2021', 'Health', 'Indozone'),
(2, 'Demi Herd Immunity, Sandiaga Uno Minta Masyarakat Tidak Pilih-pilih Vaksin Covid-19', '15 Juni 2021', 'News', 'Indozone'),
(3, 'Diminta Jokowi Vaksinasi 7,5 Juta Warga Jakarta, Ini Tanggapan Anies', '14 Juni 2021', 'News', 'Indozone'),
(4, 'Anies Siap Penuhi Perintah Jokowi Soal Vaksinasi 7,5 Juta Warga DKI Hingga Akhir Agustus', '14 Juni 2021', 'News', 'Indozone'),
(5, 'Vaksin AstraZeneca Memiliki Lebih Banyak Manfaat daripada Bahaya Menurut Badan Obat Eropa', '14 Juni 2021', 'News', 'Indozone'),
(6, 'Mal di Arab Saudi Hanya Dikhususkan Buat Pengunjung yang Sudah Divaksin', '14 Juni 2021', 'Travel', 'Indozone'),
(7, 'Vaksin COVID-19 AstraZeneca Untungkan Semua Kelompok, Terutama Usia 60 Tahun', '14 Juni 2021', 'Fakta Dan Mitos', 'Indozone'),
(8, 'Sebanyak 20,1 Juta Penduduk Indonesia Sudah Vaksinasi COVID-19', '14 Juni 2021', 'VideoGrafik', 'Indozone'),
(9, 'Vaksin Impor Terdaftar di WHO, Erick: Vaksin Kita Bukan Kaleng-Kaleng', '02 Jun 2021', 'Indonesia', 'IDN Times'),
(10, 'Ribut-Ribut Vaksin Nusantara, Jokowi: Masa Politikus Ngurusin Vaksin', '20 Apr 2021', 'Indonesia', 'IDN Times'),
(11, 'Kekurangan Vaksin Brazil Lobi AS untuk Impor Vaksin', '21 Mar 2021', 'World', 'IDN Times'),
(12, 'Hipmi: Vaksin COVID-19 dan &#039;Vaksin&#039; Ekonomi Harus Sejalan dan Selaras', '05 Mar 2021', 'Economy', 'IDN Times'),
(13, 'Kekurangan Vaksin, UE Desak AstraZeneca Distribusi Vaksin', '29 Jan 2021', 'World', 'IDN Times'),
(14, 'Indonesia Terima Tambahan 1 Juta Dosis Vaksin AstraZeneca ', '14 Jun 2021', 'Indonesia', 'IDN Times'),
(15, 'Freeport Indonesia Mulai Program Vaksin Gotong Royong', '14 Jun 2021', 'Economy', 'IDN Times'),
(16, 'Vaksin Novavax Diklaim 90 Persen Efektif Lawan COVID-19', '14 Jun 2021', 'World', 'IDN Times'),
(17, 'Warga India Bangun Kuil &#039;Dewi Corona&#039; Untuk Usir Virus Corona', '15 Juni 2021', 'Health', 'Indozone'),
(18, 'Penelitian: Hewan Liar yang Dijual di Pasar Wuhan Diyakini Tidak Membawa Virus Corona', '11 Juni 2021', 'News', 'Indozone'),
(19, 'Virus Corona Bikin Kacau Persiapan Timnas Spanyol Jelang Euro 2020', '10 Juni 2021', 'Soccer', 'Indozone'),
(20, 'China Diduga Menguji Virus Corona Pada Tikus yang Direkayasa Memiliki Paru-paru Manusia', '05 Juni 2021', 'News', 'Indozone'),
(21, 'Studi Mengatakan China Sangat Mungkin Memicu Pandemi Virus Corona', '03 Juni 2021', 'News', 'Indozone'),
(22, 'Varian Virus Corona Diberi Nama Baru Agar Mudah Diucapkan Orang-orang', '01 Juni 2021', 'News', 'Indozone'),
(23, 'Warga California Bersiap Liburan Panjang karena Aturan Virus Corona Akan Dibuka', '01 Juni 2021', 'News', 'Indozone'),
(24, 'AS dan Inggis Minta WHO untuk Menyelidiki Kembali Asal-usul Virus Corona di China', '29 Mei 2021', 'News', 'Indozone'),
(25, 'Virus Corona: Apa Itu Virus? Ini Asal Muasal dan Cara Terbentuknya', '19 Feb 2021', 'Experiment', 'IDN Times'),
(26, 'Varian Virus Corona India Merajalela, Inggris Perpanjang Lockdown', '15 Jun 2021', 'World', 'IDN Times'),
(27, 'CEO Inter Milan Bantah Christian Eriksen Terpapar Virus Corona ', '13 Jun 2021', 'Soccer', 'IDN Times'),
(28, 'Rawat ABK COVID-19 Varian India, 32 Nakes Cilacap Positif Virus Corona', '22 May 2021', 'Indonesia', 'IDN Times'),
(29, 'Waspada! Virus Corona Varian India Lebih Ganas dan Menyerang Anak-anak', '18 May 2021', 'World', 'IDN Times'),
(30, 'Waspada Ancaman Global, 5 Fakta seputar Varian Virus Corona B.1.617', '11 May 2021', 'Medical', 'IDN Times'),
(31, 'Kemenkes: Satu Pasien Terinfeksi Mutasi Virus Corona B1351 Meninggal ', '04 May 2021', 'Indonesia', 'IDN Times'),
(32, '[CEK FAKTA] Masker Tak Bisa Cegah Virus Corona Menyebar?', '04 May 2021', 'Indonesia', 'IDN Times'),
(33, 'Sebut 25% Pasien Covid-19 dari Luar Jakarta, Dinkes DKI: Virus Tak Kenal Batas Wilayah', '15 Juni 2021', 'News', 'Indozone'),
(34, 'Melonjak! Keterisian RS Rujukan Covid-19 di DKI Capai 78 Persen Hanya dalam 2 Minggu', '15 Juni 2021', 'News', 'Indozone'),
(35, 'Klarifikasi Kemenkes Terkait Aturan Pelaksanaan Vaksinasi COVID-19', '15 Juni 2021', 'Health', 'Indozone'),
(36, 'Demi Herd Immunity, Sandiaga Uno Minta Masyarakat Tidak Pilih-pilih Vaksin Covid-19', '15 Juni 2021', 'News', 'Indozone'),
(37, 'Ketahuan! Juliari Batubara Dekat dengan Anggota DPR Fraksi PDIP, Bahas Proyek Covid-19', '15 Juni 2021', 'News', 'Indozone'),
(38, 'Risiko Masuki Fase Genting Covid-19, Anies: Ini Peringatan!', '15 Juni 2021', 'News', 'Indozone'),
(39, 'Kasus Covid-19 di Indonesia Kembali Naik, Anggota DPR Ini Singgung Mudik dan Lebaran', '15 Juni 2021', 'News', 'Indozone'),
(40, 'Anies Pilih Perpanjang PPKM Mikro Ketimbang Tarik Rem Darurat saat Covid-19 Meroket', '15 Juni 2021', 'News', 'Indozone'),
(41, 'Sedang Isolasi, 10 Potret Bunga Citra Lestari Sebelum Positif COVID-19', '15 Jun 2021', 'Entertainment', 'IDN Times'),
(42, '[LINIMASA] Perkembangan Vaksinasi COVID-19 di Indonesia', '15 Jun 2021', 'Indonesia', 'IDN Times'),
(43, 'Varian COVID-19 Delta Ancam Jakarta, Pemprov DKI Perpanjang PPKM', '15 Jun 2021', 'Indonesia', 'IDN Times'),
(44, 'Satgas Banyuwangi Deteksi Klaster Hajatan, 25 Orang Positif COVID-19 ', '15 Jun 2021', 'Indonesia', 'IDN Times'),
(45, 'Sekjen PDIP: Kader Partai Fokus COVID-19, Pilpres Urusan Megawati', '15 Jun 2021', 'Indonesia', 'IDN Times'),
(46, 'Kasus COVID-19 Melonjak, Rupiah Melemah ke Level Rp14.207 Per Dolar AS', '15 Jun 2021', 'Economy', 'IDN Times'),
(47, 'Waspada! Dobel Puncak Kasus COVID-19 Ancam Indonesia pada Juli', '15 Jun 2021', 'Indonesia', 'IDN Times'),
(48, '[UPDATE] 177 Juta Warga Dunia Terpapar COVID-19, India Masih Parah ', '15 Jun 2021', 'Indonesia', 'IDN Times'),
(49, 'FOTO: Hiu Karang Malaysia Terserang Penyakit Kulit Misterius', '14 Juni 2021', 'News', 'Indozone'),
(50, 'Seorang Wanita Terinfeksi Penyakit Langka saat Membersihkan Rumah yang Dipenuhi Tikus', '11 Juni 2021', 'News', 'Indozone'),
(51, 'Ayah Sahrul Gunawan Jatuh Sakit hingga Dirawat di RS: Semoga Allah Angkat Penyakitnya', '11 Juni 2021', 'Seleb', 'Indozone'),
(52, 'Pacaran 11 Tahun Beda Agama dan Putus di Tengah Jalan, Cewek Ini Alami Penyakit Aneh', '09 Juni 2021', 'News', 'Indozone'),
(53, 'Walau Sudah Sembuh COVID-19, Kamu Bisa Terserang Penyakit Serius Ini', '09 Juni 2021', 'Health', 'Indozone'),
(54, 'Studi: Pengguna Metamfetamina Alami Kondisi Kesehatan Buruk Hingga Penyakit Mental', '08 Juni 2021', 'Fakta Dan Mitos', 'Indozone'),
(55, 'Daftar Makanan Penyebab Kolesterol Tinggi Pemicu Penyakit Berbahaya', '08 Juni 2021', 'InfoGrafik', 'Indozone'),
(56, 'Daftar Makanan Penyebab Kolesterol Tinggi Pemicu Penyakit Berbahaya', '07 Juni 2021', 'Food', 'Indozone'),
(57, 'Mengenal Penyakit Tay-Sachs, Penyakit Saraf yang Sering Menyerang Bayi', '05 Apr 2021', 'Medical', 'IDN Times'),
(58, 'Jadi Salah Satu Penyakit Mematikan, Ini 5 Cara Mencegah Penyakit TBC', '24 Mar 2021', 'Fitness', 'IDN Times'),
(59, 'Penyakit Celiac, Penyakit Autoimun yang Dipicu Konsumsi Gluten', '12 Jan 2021', 'Medical', 'IDN Times'),
(60, '5 Fakta Penyakit Emfisema, Penyakit yang Sering Menyerang Perokok', '01 Jan 2021', 'Medical', 'IDN Times'),
(61, '5 Aktor Korea yang Pernah Didiagnosis dengan Penyakit Mematikan', '11 Jun 2021', 'Entertainment', 'IDN Times'),
(62, 'Bisa Menyebabkan Penyakit Jantung Koroner, Ini 5 Fakta Hiperlipidemia', '10 Jun 2021', 'Medical', 'IDN Times'),
(63, 'Hati-hati! Ini 5 Anggapan Keliru Seputar Penyakit Kolesterol', '10 Jun 2021', 'Fitness', 'IDN Times'),
(64, '12 Faktor Risiko Penyakit Jantung yang Jarang Diketahui', '07 Jun 2021', 'Medical', 'IDN Times'),
(65, 'Sandiaga Uno Ajak Pekerja &#039;Work From Toba&#039;: Liburan Tanpa Ngurangi Jatah Cuti di Kantor', '11 Juni 2021', 'Travel', 'Indozone'),
(66, 'Lupa Padamkan Api Sebelum Tidur, 2 Sahabat Ini Tewas Terbakar saat Liburan di Desa', '09 Juni 2021', 'News', 'Indozone'),
(67, 'Sherina Unggah Momen Seru Liburan Sama Suami, Netizen Sebut Wajahnya Mirip: Definisi Jodoh', '09 Juni 2021', 'Seleb', 'Indozone'),
(68, 'Liburan di Jamaika, Bek Roma Chris Smalling dan Istri Ngaku Lihat UFO', '08 Juni 2021', 'Soccer', 'Indozone'),
(69, 'Ancelotti Bikin Kebijakan Baru di Madrid: Persingkat Waktu Liburan Pemain &amp; Pangkas Skuad ', '04 Juni 2021', 'Soccer', 'Indozone'),
(70, 'Warga California Bersiap Liburan Panjang karena Aturan Virus Corona Akan Dibuka', '01 Juni 2021', 'News', 'Indozone'),
(71, 'Alami Alergi Serius, Penyakit Wanita Ini Sembuh Setelah Liburan Keliling Dunia', '28 Mei 2021', 'News', 'Indozone'),
(72, 'Liburan ke Dubai, Rachel Vennya Bagikan Info dan Cara Pergi ke Dubai di tengah Pandemi! ', '26 Mei 2021', 'Seleb', 'Indozone'),
(73, '9 Potret Liburan Aaliyah Massaid Saat Liburan di Pantai, Seru Banget!', '22 Mar 2021', 'Entertainment', 'IDN Times'),
(74, 'Makin Glowing, 10 Potret Liburan Seru Pevita Pearce di Bali ', '14 Jun 2021', 'Entertainment', 'IDN Times'),
(75, 'Makin Lengket, 10 Potret Liburan Siti Badriah dan Suami ke Bali ', '14 Jun 2021', 'Entertainment', 'IDN Times'),
(76, '10 Potret Cassandra Lee Liburan ke Turki, Fotogenik Abis!', '14 Jun 2021', 'Entertainment', 'IDN Times'),
(77, '[QUIZ] Kami Tahu Lokasi Liburan Terbaikmu Berdasarkan Shio', '13 Jun 2021', 'Destination', 'IDN Times'),
(78, '[QUIZ] Kami Tahu Tipe Liburan yang Sesuai dengan Karaktermu!', '13 Jun 2021', 'Destination', 'IDN Times'),
(79, '10 Potret Romantis Atta dan Aurel Liburan Singkat di Bromo, Romantis!', '12 Jun 2021', 'Entertainment', 'IDN Times'),
(80, '10 Potret Liburan Andre Taulany Bersama Keluarga di Bali, Seru Abis!', '11 Jun 2021', 'Entertainment', 'IDN Times'),
(81, 'Wabah Tikus di Australia Harus Dianggap Bencana Alam karena Membuat Banyak Orang Rugi', '11 Juni 2021', 'News', 'Indozone'),
(82, 'FOTO: Temuan Kasus Wabah Antraks di Tulungagung', '09 Juni 2021', 'News', 'Indozone'),
(83, 'Wabah Ingus Laut Cemari Pantai Turki dan Bikin Kekacauan', '07 Juni 2021', 'News', 'Indozone'),
(84, 'Varian Baru Covid-19 yang Sangat Berbahaya Ditemukan di Vietnam, Bisa Memicu Wabah Buruk', '02 Juni 2021', 'News', 'Indozone'),
(85, 'Puluhan Tikus di Australia Dibakar saat Negara Itu Mengalami Wabah yang Mengerikan', '29 Mei 2021', 'News', 'Indozone'),
(86, 'Wabah Tikus di Australia Menggigit Orang di Tempat Tidur', '29 Mei 2021', 'News', 'Indozone'),
(87, 'Wabah Tikus di Australia Mencekam, Pria Ini Berjuang Setelah Tertular Penyakit Mematikan', '28 Mei 2021', 'News', 'Indozone'),
(88, 'Hii... Pemandangan Menjijikkan Saat Wabah Tikus Serang Australia di Tengah Pandemi', '28 Mei 2021', 'News', 'Indozone'),
(89, '7 Rekomendasi Film tentang Wabah Virus Mematikan, Seram!', '01 Jun 2021', 'Entertainment', 'IDN Times'),
(90, 'Kawasan Industri Vietnam Ditutup akibat Wabah COVID-19', '19 May 2021', 'Economy', 'IDN Times'),
(91, 'Kongo Umumkan Wabah Ebola Berakhir', '04 May 2021', 'World', 'IDN Times'),
(92, 'Sore-Sore Berkah: Cara Menghadapi Wabah di Zaman Umar bin Khattab', '21 Apr 2021', 'Indonesia', 'IDN Times'),
(93, 'Selawat Tibbil Qulub, Obat Hati dan untuk Menghindari Wabah COVID-19', '11 Apr 2021', 'Indonesia', 'IDN Times'),
(94, '5 Wabah Global yang Diprediksi Bisa Terjadi di Masa Depan, Apa Saja?', '23 Mar 2021', 'Discovery', 'IDN Times'),
(95, 'Ini 5 Cara Menghadapi Wabah Zombi Menurut Sains, Sudah Siap?', '18 Feb 2021', 'Experiment', 'IDN Times'),
(96, 'Sudah Reda sejak Ada Vaksin, Wabah Ebola Muncul Lagi di Guinea', '15 Feb 2021', 'World', 'IDN Times'),
(97, 'Masjid Ini Catat 15 Kematian Covid-19 dalam 2 Minggu Setelah Virus Menyebar ke Jamaah', '14 Juni 2021', 'News', 'Indozone'),
(98, 'Hasil Autopsi Keluar, Penyebab Kematian Wabup Sangihe di Pesawat Lantaran Sakit', '14 Juni 2021', 'News', 'Indozone'),
(99, 'Hasil Autopsi Wabup Sangihe Keluar, Misteri Kematiannya Terungkap', '14 Juni 2021', 'VideoGrafik', 'Indozone'),
(100, 'Hasil Autopsi Wabup Sangihe Keluar, Misteri Kematiannya Terungkap', '14 Juni 2021', 'News', 'Indozone'),
(101, 'Soal Kematian Wabup Sangihe, Anggota Komisi II DPR: Perlu Diselidiki Jika Dirasa Janggal', '14 Juni 2021', 'News', 'Indozone'),
(102, 'Jangan Sembarangan Meminum Antibiotik, Malah Bisa Tingkatkan Angka Kematian', '13 Juni 2021', 'Health', 'Indozone'),
(103, 'Usut Misteri Kematian Wabup Sangihe di Pesawat, Kapolda Sulut Bentuk Tim Khusus', '12 Juni 2021', 'News', 'Indozone'),
(104, 'Kematian Wabup Sangihe di Pesawat Mencurigakan, Warganet Kaitkan dengan Surat Ini', '11 Juni 2021', 'News', 'Indozone'),
(105, '10 Wilayah dengan Kematian Akibat COVID-19, Pulau Jawa Terbanyak!', '14 Jun 2021', 'Indonesia', 'IDN Times'),
(106, 'Kematian Akibat COVID-19 di Jombang Tinggi, Dirawat Tak Sampai 48 Jam ', '11 Jun 2021', 'Indonesia', 'IDN Times'),
(107, 'Buntut Kematian Seekor Singa, 28 Gajah di India Jalani Tes COVID-19  ', '10 Jun 2021', 'World', 'IDN Times'),
(108, 'Kematian Puluhan Ternak di Tulungagung karena Anthrax', '05 Jun 2021', 'Indonesia', 'IDN Times'),
(109, 'Studi: Lebih dari Sepertiga Angka Kematian Disebabkan Pemanasan Global', '02 Jun 2021', 'World', 'IDN Times'),
(110, 'Peru: Kematian Akibat COVID-19 kini Tertinggi per Kapita', '01 Jun 2021', 'World', 'IDN Times'),
(111, '[UPDATE] Tambah 11 Ribu, Kasus Kematian COVID-19 Dunia Capai 3,5 Juta', '28 May 2021', 'World', 'IDN Times'),
(112, 'Kasus Kematian Maradona, 7 Orang Jadi Tersangka  ', '21 May 2021', 'Soccer', 'IDN Times'),
(113, 'Angka Covid-19 di Jakarta Meningkat, Polda Metro Gelar Operasi Yustisi, Bubarkan Kerumunan', '12 Juni 2021', 'News', 'Indozone'),
(114, 'ARMY Indonesia Harap Tak Ada Ojol Terpapar Covid-19 karena Kerumunan BTS Meal', '12 Juni 2021', 'News', 'Indozone'),
(115, 'Pasca Insiden Kerumunan BTS Meal, Polda Sumut Ultimatum Manajemen McD Medan', '11 Juni 2021', 'News', 'Indozone'),
(116, 'Picu Kerumunan, Polisi Sarankan McD Hapus Promo &#039;BTS Meal&#039; Sementara', '11 Juni 2021', 'InfoGrafik', 'Indozone'),
(117, 'Picu Kerumunan, Polisi Sarankan McD Hapus Promo &#039;BTS Meal&#039; Sementara', '11 Juni 2021', 'News', 'Indozone'),
(118, 'Soal Kerumunan Beli BTS Meal di McDonald&#039;s, Dinkes DKI Angkat Bicara', '10 Juni 2021', 'News', 'Indozone'),
(119, 'Buntut Kerumunan McDonald&#039;s, Polisi Minta Promo &#039;BTS Meal&#039; Dihilangkan Sementara', '10 Juni 2021', 'News', 'Indozone'),
(120, 'Soal Kerumunan Akibat BTS Meal, Polda Metro Jaya Kedepankan Preventif', '10 Juni 2021', 'News', 'Indozone'),
(121, 'Imbas Kerumunan Promo BTS Meal, 32 Gerai McD Ditutup', '10 Jun 2021', 'Indonesia', 'IDN Times'),
(122, 'Polda Metro Panggil Manajemen McDonald&#039;s Buntut Kerumunan BTS Meal', '10 Jun 2021', 'Indonesia', 'IDN Times'),
(123, 'Heboh BTS Meal, McD Ciplaz Depok Ditutup karena Bikin Kerumunan', '09 Jun 2021', 'Indonesia', 'IDN Times'),
(124, 'Launching BTSxMcDonald&#039;s Picu Kerumunan, Wagub DKI: Bisa Disanksi', '09 Jun 2021', 'Indonesia', 'IDN Times'),
(125, 'Pembubaran Kerumunan di Dublin Rusuh, 19 Orang Ditangkap', '07 Jun 2021', 'World', 'IDN Times'),
(126, '[BREAKING] Rizieq Shihab Cs Divonis 8 Bulan Penjara di Kasus Kerumunan Petamburan', '27 May 2021', 'Indonesia', 'IDN Times'),
(127, 'Sidang Vonis Kasus Kerumunan Rizieq Shihab Bakal Disiarkan di YouTube', '27 May 2021', 'Indonesia', 'IDN Times'),
(128, '[BREAKING] Kasus Kerumunan, Rizieq Shihab Divonis Denda Rp20 Juta', '27 May 2021', 'Indonesia', 'IDN Times'),
(129, 'Menpora Pede Polri Keluarkan Izin Keramaian Liga 1 dan 2', '19 April 2021', 'Soccer', 'Indozone'),
(130, 'Terungkap! Tak Ada Izin Keramaian untuk KLB Partai Demokrat, Sikap Polisi Tak Disangka', '05 Maret 2021', 'News', 'Indozone'),
(131, 'Tak Ikut Beri Bantuan Langsung ke Kalsel, Raffi Ahmad: Takut Disebut Mengundang Keramaian', '23 Januari 2021', 'Seleb', 'Indozone'),
(132, 'Tak Kunjung Kantongi Izin Keramaian, PSMS Minta Kompetisi Liga Musim 2020-2021 Dibubarkan', '06 Januari 2021', 'News', 'Indozone'),
(133, 'Curhat Cewek yang Tinggi Badannya 179 Sentimeter, Sering Dilihatin saat Jalan di Keramaian', '24 Desember 2020', 'Life', 'Indozone'),
(134, 'Polres Belitung Siap Sanksi Hotel yang Buat Acara Keramaian Malam Pergantian Tahun', '20 Desember 2020', 'News', 'Indozone'),
(135, 'Cegah Penularan Covid-19, Satgas Sumsel Gencar Lakukan Razia di Pusat Keramaian', '18 Desember 2020', 'News', 'Indozone'),
(136, 'Warga Sumut Diminta Untuk Tak Gelar Keramaian di Malam Tahun Baru', '17 Desember 2020', 'News', 'Indozone'),
(137, 'Viral Video Ilustrasi Akhirat Manusia Berkumpul di Timbangan Amal, Masuk Surga atau Neraka', '12 Juni 2021', 'Life', 'Indozone'),
(138, 'Salut! Video Warga Berkumpul Bantu Korban Kecelakaan yang Nyungsep di Selokan Viral', '05 Juni 2021', 'News', 'Indozone'),
(139, 'Potret Ribuan Sampah Berkumpul Cukup Parah Setelah Mumbai Dilanda Topan Dahsyat', '18 Mei 2021', 'Life', 'Indozone'),
(140, 'FOTO: Pasukan Israel Berkumpul di Perbatasan Gaza', '15 Mei 2021', 'News', 'Indozone'),
(141, 'Masyarakat Kerap Berkumpul saat Takbiran, Polisi: Segala Bentuk Kerumunan Dilarang', '09 Mei 2021', 'News', 'Indozone'),
(142, 'Beredar Foto-foto Ribuan Orang Berkumpul di Tembok Besar China, Banyak Tak Pakai Masker', '04 Mei 2021', 'News', 'Indozone'),
(143, 'Cari Dalang yang Ajak Jakmania Berkumpul, Polda Metro Periksa 5 Admin Medsos', '29 April 2021', 'News', 'Indozone'),
(144, 'Pasca Kematian Anaknya Viral, Erlita Dewi Akhirnya Bisa Berkumpul dengan 3 Putrinya', '05 April 2021', 'News', 'Indozone'),
(145, 'Tokoh Agama di Banyuwangi Berkumpul, Doa untuk  Awak KRI Nanggala', '27 Apr 2021', 'Indonesia', 'IDN Times'),
(146, 'Setahun Kasus Breonna Taylor, Ratusan Orang Berkumpul', '14 Mar 2021', 'World', 'IDN Times'),
(147, 'AS Izinkan Warga Berkumpul Tanpa Masker Jika Sudah Divaksinasi Penuh', '09 Mar 2021', 'World', 'IDN Times'),
(148, 'Lanjut Protes, Demonstran Myanmar Langgar Larangan Berkumpul ', '11 Feb 2021', 'World', 'IDN Times'),
(149, 'Kreator Berkumpul! 10 Momen Keseruan TikTok Awards Indonesia 2020', '31 Jan 2021', 'Entertainment', 'IDN Times'),
(150, '10 Potret Hewan yang Sedang Berkumpul, Bisa Sampai Jutaan Ekor!', '22 Dec 2020', 'Discovery', 'IDN Times'),
(151, '6 Jenazah Laskar FPI Tiba, Massa Masih Berkumpul di Petamburan', '08 Dec 2020', 'Indonesia', 'IDN Times'),
(152, '5 Aneka Resep Kue untuk Sajian Berkumpul dengan Keluarga', '11 Jun 2020', 'Recipe', 'IDN Times');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `training_data`
--
ALTER TABLE `training_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
