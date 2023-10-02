-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 13, 2021 at 12:28 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cbt_cbtcandy29`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(10) NOT NULL,
  `id_mapel` int(10) NOT NULL,
  `sesi` varchar(10) NOT NULL,
  `ruang` varchar(20) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `ikut` varchar(10) DEFAULT NULL,
  `susulan` varchar(10) DEFAULT NULL,
  `no_susulan` text DEFAULT NULL,
  `mulai` varchar(10) DEFAULT NULL,
  `selesai` varchar(10) DEFAULT NULL,
  `nama_proktor` varchar(50) DEFAULT NULL,
  `nip_proktor` varchar(50) DEFAULT NULL,
  `nama_pengawas` varchar(50) DEFAULT NULL,
  `nip_pengawas` varchar(50) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `tgl_ujian` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita`
--

-- --------------------------------------------------------

--
-- Table structure for table `file_pendukung`
--

CREATE TABLE `file_pendukung` (
  `id_file` int(11) NOT NULL,
  `id_mapel` int(11) DEFAULT 0,
  `nama_file` varchar(50) DEFAULT NULL,
  `status_file` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban`
--

CREATE TABLE `jawaban` (
  `id_jawaban` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `jawaban` char(1) DEFAULT NULL,
  `jawabx` char(1) DEFAULT NULL,
  `jenis` int(1) NOT NULL,
  `esai` text DEFAULT NULL,
  `nilai_esai` int(5) NOT NULL DEFAULT 0,
  `ragu` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_tugas`
--

CREATE TABLE `jawaban_tugas` (
  `id_jawaban` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_tugas` int(11) DEFAULT NULL,
  `jawaban` longtext DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_dikerjakan` datetime DEFAULT NULL,
  `tgl_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nilai` varchar(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama`, `status`) VALUES
('PTS', 'Penilaian Tengah Semester', 'tidak'),
('UH', 'Ulangan Harian', 'tidak'),
('USBK', 'Ujian Sekolah', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `jurusan_id` varchar(25) NOT NULL,
  `nama_jurusan_sp` varchar(100) DEFAULT NULL,
  `kurikulum` varchar(120) DEFAULT NULL,
  `jurusan_sp_id` varchar(50) DEFAULT NULL,
  `kurikulum_id` varchar(20) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` varchar(11) NOT NULL,
  `level` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `level`, `nama`, `rombongan_belajar_id`, `semester_id`) VALUES
('7A', '7', 'Kelas 7A', NULL, NULL),
('7B', '7', 'Kelas 7B', NULL, NULL),
('7C', '7', 'Kelas 7C', NULL, NULL),
('8A', '8', 'Kelas 8A', NULL, NULL),
('8B', '8', 'Kelas 8B', NULL, NULL),
('8C', '8', 'Kelas 8C', NULL, NULL),
('8D', '8', 'Kelas 8D', NULL, NULL),
('9A', '9', 'Kelas 9A', NULL, NULL),
('9B', '9', 'Kelas 9B', NULL, NULL),
('9C', '9', 'Kelas 9C', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `kode_level` varchar(5) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`kode_level`, `keterangan`, `rombongan_belajar_id`) VALUES
('7', 'Tingkat 7', NULL),
('8', 'Tingkat 8', NULL),
('9', 'Tingkat 9', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `text` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `kode` varchar(255) NOT NULL DEFAULT '0',
  `idpk` varchar(255) NOT NULL,
  `idguru` varchar(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jml_soal` int(5) NOT NULL,
  `jml_esai` int(5) NOT NULL DEFAULT 0,
  `tampil_pg` int(5) NOT NULL,
  `tampil_esai` int(5) NOT NULL DEFAULT 0,
  `bobot_pg` int(5) NOT NULL,
  `bobot_esai` int(5) NOT NULL DEFAULT 0,
  `level` varchar(5) NOT NULL,
  `opsi` int(1) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(2) NOT NULL,
  `kkm` int(3) DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel`
--


-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `kode_mapel` varchar(20) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `mata_pelajaran_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`kode_mapel`, `nama_mapel`, `mata_pelajaran_id`) VALUES
('INF', 'Informatika', NULL),
('PRA', 'Prakarya', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id_materi` int(255) NOT NULL,
  `id_guru` int(255) NOT NULL DEFAULT 0,
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `materi` longtext DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materi`
--

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kode_ujian` varchar(30) NOT NULL,
  `ujian_mulai` varchar(20) NOT NULL,
  `ujian_berlangsung` varchar(20) DEFAULT NULL,
  `ujian_selesai` varchar(20) DEFAULT NULL,
  `jml_benar` int(10) DEFAULT NULL,
  `jml_salah` int(10) DEFAULT NULL,
  `nilai_esai` varchar(10) DEFAULT NULL,
  `skor` varchar(10) DEFAULT NULL,
  `total` varchar(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `hasil` int(2) NOT NULL,
  `jawaban` text DEFAULT NULL,
  `jawaban_esai` longtext DEFAULT NULL,
  `nilai_esai2` text DEFAULT NULL,
  `online` int(1) NOT NULL DEFAULT 0,
  `id_soal` longtext DEFAULT NULL,
  `id_opsi` longtext DEFAULT NULL,
  `id_esai` text DEFAULT NULL,
  `blok` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

-- --------------------------------------------------------

--
-- Table structure for table `pengawas`
--

CREATE TABLE `pengawas` (
  `id_pengawas` int(11) NOT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `no_ktp` varchar(16) DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat_jalan` varchar(255) DEFAULT NULL,
  `rt_rw` varchar(8) DEFAULT NULL,
  `dusun` varchar(50) DEFAULT NULL,
  `kelurahan` varchar(50) DEFAULT NULL,
  `kecamatan` varchar(30) DEFAULT NULL,
  `kode_pos` int(6) DEFAULT NULL,
  `nuptk` varchar(20) DEFAULT NULL,
  `bidang_studi` varchar(50) DEFAULT NULL,
  `jenis_ptk` varchar(50) DEFAULT NULL,
  `tgs_tambahan` varchar(50) DEFAULT NULL,
  `status_pegawai` varchar(50) DEFAULT NULL,
  `status_aktif` varchar(20) DEFAULT NULL,
  `status_nikah` varchar(20) DEFAULT NULL,
  `sumber_gaji` varchar(30) DEFAULT NULL,
  `ahli_lab` varchar(10) DEFAULT NULL,
  `nama_ibu` varchar(40) DEFAULT NULL,
  `nama_suami` varchar(50) DEFAULT NULL,
  `nik_suami` varchar(20) DEFAULT NULL,
  `pekerjaan` varchar(20) DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `keahlian_isyarat` varchar(10) DEFAULT NULL,
  `kewarganegaraan` varchar(10) DEFAULT NULL,
  `npwp` varchar(16) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `ptk_id` varchar(50) DEFAULT NULL,
  `password2` text DEFAULT NULL,
  `ruang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pengawas`
--

INSERT INTO `pengawas` (`id_pengawas`, `nip`, `nama`, `jabatan`, `username`, `password`, `level`, `no_ktp`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `no_hp`, `email`, `alamat_jalan`, `rt_rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `nuptk`, `bidang_studi`, `jenis_ptk`, `tgs_tambahan`, `status_pegawai`, `status_aktif`, `status_nikah`, `sumber_gaji`, `ahli_lab`, `nama_ibu`, `nama_suami`, `nik_suami`, `pekerjaan`, `tmt`, `keahlian_isyarat`, `kewarganegaraan`, `npwp`, `foto`, `ptk_id`, `password2`, `ruang`) VALUES
(1, '-', 'administrator', '', 'admin', '$2y$10$/3Wuis445EYO.URdDbU22ejpPgwe/hIwPiEv9pK0O3bcnPB6iZ9mC', 'admin', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', NULL, NULL, NULL),
(228, '198112312014061004', 'Nur Sahid, S.P, S.Kom.', '', 'nursahid', '$2y$10$0dtBNOsN5Sr2BDwLfPT7H.EvXzsMeHDsmsnrWHwBh5mpuLtwGGno2', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, '-', 'Salimudin, S.Pd.', NULL, 'salimudin', '$2y$10$8tHZwawzhoUOliOMskbxe.b96DUVirNVVxjHCh1QjAKlfHMRMwdG.', 'pengawas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PERPUS'),
(286, '-', 'Guru 2', 'XITKJA', 'guru2', '$2y$10$0BtQqWtvXEKAY2UijsYUB.LUJ4kz9Zn8T3E.VK6xY9WLV6yPs98em', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(287, '-', 'Guru 3', '', 'guru3', '$2y$10$f58rpPrb06LZdr7NiMnAtO0U3GvdU15J2dg0tCHKdDlIVXLDXL/ge', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(288, '-', 'Guru 4', '', 'guru4', '$2y$10$Rmo9jP.7e0i9eSLt53GK4ezYQhCuUheAufbk8mjZLefWDIk8V3Wwm', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(289, '-', 'Guru 5', '', 'guru5', '$2y$10$PwKmHsEu77/eODIy4Ta.3.23k8vZU4DVcdfldXAdWxJD2j7Rlx0dq', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(290, '-', 'Guru 6', '', 'guru6', '$2y$10$HPCoPBP5NxU2xqsLNuLaZeBbA.Q9HGz3AJvuF.kqV3PM5/NhXZ2/G', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(291, '-', 'Guru 7', '', 'guru7', '$2y$10$ECrPTYWnrTEB5kK4pH754eXdo1YdJgiviiQPlzCWlAltXopVHYKQe', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(292, '-', 'Guru 8', '', 'guru8', '$2y$10$owmt55rXG2SzLs/qpRpC6u3TlvOgYmT/Mk5ZrYWKnm1qzMCzG7eIG', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(293, '-', 'Salimudin, S.Pd.', '7D1', 'salim', '$2y$10$b1sesd/VabF/YD52TbZjWO.b9BPa3U3oJ92JnV0XWRHF.IJ3ZzHHy', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(294, '-', 'Guru 10', '', 'guru10', '$2y$10$i8dAzg2GUqtnNr3QFa/G7.mOcGFeLBBMtVffVseDPjPh5P48Zu3K6', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id_pengumuman` int(5) NOT NULL,
  `type` varchar(30) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `user` int(3) NOT NULL,
  `text` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id_pengumuman`, `type`, `judul`, `user`, `text`, `date`) VALUES
(8, 'eksternal', 'INFO JADWAL UJIAN', 1, '<p>Untuk ujian sekolah dilakukan secara daring atau online menggunakan Hp Android, PC, Laptop. Aplikasi ujian diakses dengan browser Google Chrome.</p>', '2020-04-04 07:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `pk`
--

CREATE TABLE `pk` (
  `id_pk` varchar(10) NOT NULL,
  `program_keahlian` varchar(50) NOT NULL,
  `jurusan_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `referensi_jurusan`
--

CREATE TABLE `referensi_jurusan` (
  `jurusan_id` varchar(10) NOT NULL,
  `nama_jurusan` varchar(100) DEFAULT NULL,
  `untuk_sma` int(1) NOT NULL,
  `untuk_smk` int(1) NOT NULL,
  `jenjang_pendidikan_id` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `kode_ruang` varchar(10) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`kode_ruang`, `keterangan`) VALUES
('RKLS1', 'Ruang Kelas 1'),
('RPUS', 'Ruang Perpustakaan');

-- --------------------------------------------------------

--
-- Table structure for table `savsoft_options`
--

CREATE TABLE `savsoft_options` (
  `oid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `q_option` text NOT NULL,
  `q_option_match` varchar(1000) DEFAULT NULL,
  `score` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `savsoft_qbank`
--

CREATE TABLE `savsoft_qbank` (
  `qid` int(11) NOT NULL,
  `question_type` varchar(100) NOT NULL DEFAULT 'Multiple Choice Single Answer',
  `question` text NOT NULL,
  `description` text NOT NULL,
  `cid` int(11) NOT NULL,
  `lid` int(11) NOT NULL,
  `no_time_served` int(11) NOT NULL DEFAULT 0,
  `no_time_corrected` int(11) NOT NULL DEFAULT 0,
  `no_time_incorrected` int(11) NOT NULL DEFAULT 0,
  `no_time_unattempted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `semester_id` varchar(5) NOT NULL,
  `tahun_ajaran_id` varchar(4) NOT NULL,
  `nama_semester` varchar(50) NOT NULL,
  `semester` int(1) NOT NULL,
  `periode_aktif` enum('1','0') NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `kode_server` varchar(20) NOT NULL,
  `nama_server` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`kode_server`, `nama_server`, `status`) VALUES
('ONLINE', 'ONLINE', 'aktif'),
('SERV01', 'Server Sekolah', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `sesi`
--

CREATE TABLE `sesi` (
  `kode_sesi` varchar(10) NOT NULL,
  `nama_sesi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sesi`
--

INSERT INTO `sesi` (`kode_sesi`, `nama_sesi`) VALUES
('1', 'Sesi 1'),
('2', 'Sesi 2'),
('3', 'Sesi 3'),
('4', 'Sesi 4');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `session_time` varchar(10) NOT NULL,
  `session_hash` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(11) NOT NULL,
  `aplikasi` varchar(100) DEFAULT NULL,
  `kode_sekolah` varchar(10) DEFAULT NULL,
  `sekolah` varchar(50) DEFAULT NULL,
  `jenjang` varchar(5) DEFAULT NULL,
  `kepsek` varchar(50) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kecamatan` varchar(50) DEFAULT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `header` text DEFAULT NULL,
  `header_kartu` text DEFAULT NULL,
  `nama_ujian` text DEFAULT NULL,
  `versi` varchar(10) DEFAULT NULL,
  `ip_server` varchar(100) DEFAULT NULL,
  `waktu` varchar(50) DEFAULT NULL,
  `server` varchar(50) DEFAULT NULL,
  `id_server` varchar(50) DEFAULT NULL,
  `url_host` varchar(50) DEFAULT NULL,
  `token_api` varchar(50) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL,
  `npsn` varchar(10) DEFAULT NULL,
  `db_versi` varchar(10) DEFAULT NULL,
  `bc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id_setting`, `aplikasi`, `kode_sekolah`, `sekolah`, `jenjang`, `kepsek`, `nip`, `alamat`, `kecamatan`, `kota`, `telp`, `fax`, `web`, `email`, `logo`, `header`, `header_kartu`, `nama_ujian`, `versi`, `ip_server`, `waktu`, `server`, `id_server`, `url_host`, `token_api`, `sekolah_id`, `npsn`, `db_versi`, `bc`) VALUES
(1, 'SMPN3 CBT', 'K0248', 'SMP Negeri 3 Mepanga', 'SMP', 'Rini Suwandari, S.Pd.', '196610261988032006', 'Jl. Nusantara No. 117 Desa Kayuagung<br />\r\n', 'Mepanga ', 'Parigi Moutong', '-', '-', 'smpn3mepanga.sch.id', 'smpnegeri3mepanga@gmail.com', 'dist/img/logo56.png', 'PEMERINTAH KABUPATEN PARIGI MOUTONG<br />\r\nDINAS PENDIDIKAN DAN KEBUDAYAAN', 'KARTU PESERTA CBT\naaaaaa', 'Penilaian Tengah Semester', '2.9', 'http://192.168.0.199/candycbt', 'Asia/Makassar', 'pusat', 'SR01', 'http://pts.smkhsagung.sch.id/', 'HO3FIrBYcFUMp0', '8cce47df-aae7-4274-83cb-5af3093eab56', '69787351', '2.9.2', 'dist/img/bc.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sinkron`
--

CREATE TABLE `sinkron` (
  `nama_data` varchar(50) NOT NULL,
  `data` varchar(50) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  `tanggal` varchar(50) DEFAULT NULL,
  `status_sinkron` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sinkron`
--

INSERT INTO `sinkron` (`nama_data`, `data`, `jumlah`, `tanggal`, `status_sinkron`) VALUES
('DATA1', 'siswa', '821', '2020-09-13 21:23:08', 1),
('DATA2', 'bank soal', '45', '2020-09-13 21:23:08', 1),
('DATA3', 'soal', '1183', '2020-09-13 21:23:08', 1),
('DATA4', 'jadwal', '7', '2020-09-13 21:23:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `id_kelas` varchar(11) DEFAULT NULL,
  `idpk` varchar(10) DEFAULT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `no_peserta` varchar(30) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `level` varchar(5) DEFAULT NULL,
  `ruang` varchar(10) DEFAULT NULL,
  `sesi` int(2) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(30) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `kebutuhan_khusus` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `dusun` varchar(100) DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kode_pos` int(10) DEFAULT NULL,
  `jenis_tinggal` varchar(100) DEFAULT NULL,
  `alat_transportasi` varchar(100) DEFAULT NULL,
  `hp` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `skhun` int(11) DEFAULT NULL,
  `no_kps` varchar(50) DEFAULT NULL,
  `nama_ayah` varchar(150) DEFAULT NULL,
  `tahun_lahir_ayah` int(4) DEFAULT NULL,
  `pendidikan_ayah` varchar(50) DEFAULT NULL,
  `pekerjaan_ayah` varchar(100) DEFAULT NULL,
  `penghasilan_ayah` varchar(100) DEFAULT NULL,
  `nohp_ayah` varchar(15) DEFAULT NULL,
  `nama_ibu` varchar(150) DEFAULT NULL,
  `tahun_lahir_ibu` int(4) DEFAULT NULL,
  `pendidikan_ibu` varchar(50) DEFAULT NULL,
  `pekerjaan_ibu` varchar(100) DEFAULT NULL,
  `penghasilan_ibu` varchar(100) DEFAULT NULL,
  `nohp_ibu` int(15) DEFAULT NULL,
  `nama_wali` varchar(150) DEFAULT NULL,
  `tahun_lahir_wali` int(4) DEFAULT NULL,
  `pendidikan_wali` varchar(50) DEFAULT NULL,
  `pekerjaan_wali` varchar(100) DEFAULT NULL,
  `penghasilan_wali` varchar(50) DEFAULT NULL,
  `angkatan` int(5) DEFAULT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `peserta_didik_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'aktif',
  `online` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `nomor` int(5) DEFAULT NULL,
  `soal` longtext DEFAULT NULL,
  `jenis` int(1) DEFAULT NULL,
  `pilA` longtext DEFAULT NULL,
  `pilB` longtext DEFAULT NULL,
  `pilC` longtext DEFAULT NULL,
  `pilD` longtext DEFAULT NULL,
  `pilE` longtext DEFAULT NULL,
  `jawaban` varchar(1) DEFAULT NULL,
  `file` mediumtext DEFAULT NULL,
  `file1` mediumtext DEFAULT NULL,
  `fileA` mediumtext DEFAULT NULL,
  `fileB` mediumtext DEFAULT NULL,
  `fileC` mediumtext DEFAULT NULL,
  `fileD` mediumtext DEFAULT NULL,
  `fileE` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `id_mapel`, `nomor`, `soal`, `jenis`, `pilA`, `pilB`, `pilC`, `pilD`, `pilE`, `jawaban`, `file`, `file1`, `fileA`, `fileB`, `fileC`, `fileD`, `fileE`) VALUES
(1, 1, 1, 'Peralatan yang menggunakan komponen-komponen elektronika dikenal dengan nama …', 1, 'piranti teknologi', 'piranti elektronik', 'piranti kerja', 'piranti digital', '', 'B', '', '', '', '', '', '', ''),
(2, 1, 2, 'Komponen-komponen elektronika diantaranya adalah ….', 1, 'diode, radio, transistor', 'transistor, resistor, tablet', 'resistor, transistor, diode, IC', 'hp, tablet, resistor, transistor', '', 'C', '', '', '', '', '', '', ''),
(3, 1, 3, '………. merupakan salah satu komponen elektronik yang memadukan ratusan bahkan ribuan transistor yang berukuran kecil', 1, 'resistor', 'transistor', 'dioda', 'Integrated Circuit', '', 'D', '', '', '', '', '', '', ''),
(4, 1, 4, 'Handphone, Tablet, Laptop dan Komputer merupakan ….. karena bahan-bahan yang digunakan untuk membuatnya berfungsi berasal dari komponen-komponen elektronika', 1, 'piranti elektronik', 'piranti canggih', 'piranti bergerak', 'piranti digital', '', 'A', '', '', '', '', '', '', ''),
(5, 1, 5, 'Handphone dan tablet memiliki banyak kesamaan dari sisi fungsi dan pemakaian, akan tetapi ada beberapa perbedaan yang mencolok yaitu …', 1, 'handphone berukuran lebih besar dari tablet', 'tablet berukuran minimal 6 inchi', 'tablet berukuran lebih besar dari handphone yaitu sebesar 13 inchi', 'tablet dilengkapi dengan stylus (pena digital) dan memiliki ukuran lebih besar', '', 'D', '', '', '', '', '', '', ''),
(6, 1, 6, 'Martin Cooper, seorang karyawan Motorola. Pada tanggal 03 April 1973 ia tercatat dalam sejarah sebagai seorang yang berjasa dalam penemuan ….', 1, 'telepon genggam', 'Tablet PC', 'telepon rumah', 'iPhone', '', 'A', '', '', '', '', '', '', ''),
(7, 1, 7, 'Fungsi utama dari sebuah telepon genggam (handphone) adalah ….', 1, 'mencari informasi yang bisa dimanfaatkan penggunanya', 'menerima panggilan telepon dan pengiriman dan penerimaan pesan singkat', 'menerima dokumen text dan video', 'digunakan untuk steaming video seperti Youtube', '', 'B', '', '', '', '', '', '', ''),
(8, 1, 8, 'Apple baru meluncurkan versi komputer tabletnya pada tahun 2010 dengan nama ….', 1, 'iPhone', 'Galaxy 7', 'iPad', 'Android', '', 'C', '', '', '', '', '', '', ''),
(9, 1, 9, 'Pada tahun 2011 Samsung meluncurkan versi komputer tablet yaitu ….', 1, 'Galaxy Tab 7 Plus', 'Galaxy Tab 6', 'Galaxy Tab 6 Plus', 'Galaxy Tab 7', '', 'D', '', '', '', '', '', '', ''),
(10, 1, 10, 'Komputer pribadi yang berukuran relatif kecil dan ringan. Beratnya berkisar dari 1–6 kg dan menggunakan layer LCD dengan kisaran ukuran antara 10 inchi sampai 17 inchi dikenal dengan nama ….', 1, 'PC (Personal Computer)	', 'Laptop (komputer jinjing)', 'Tablet PC', 'Mainstream', '', 'A', '', '', '', '', '', '', ''),
(11, 1, 11, 'Salah satu perangkat komputer yang memiliki fungsi untuk menyimpan data-data di laptop secara permanen adalah ….', 1, 'memory', 'sdcard', 'harddisk', 'flash disk', '', 'C', '', '', '', '', '', '', ''),
(12, 1, 12, 'Dengan adanya ….. laptop bisa digunakan tanpa harus terhubung langsung ke arus listrik. Biasanya laptop bisa bekerja sampai 8 jam', 1, 'charger', 'baterai', 'layar', 'memory', '', 'B', '', '', '', '', '', '', ''),
(13, 1, 13, 'Untuk menyalakan Laptop, kita harus mencari terlebih dahulu dimana letak tombol powernya. Tombol tersebut memiliki ciri-ciri ….', 1, 'berbentuk bulat, dengan bentuk lingkaran dengan garis ditengah atas', 'berbentuk bulat, biasanya terletak di bagian bawah laptop', 'berbentuk setengah lingkaran yang terletak tepat di atas LCD', 'berbentuk panjang dengan garis putih ditengahnya', '', 'A', '', '', '', '', '', '', ''),
(14, 1, 14, 'Pengganti fungsi mouse pada laptop dikenal dengan nama ….', 1, 'trackpad', 'mouse', 'touchpad', 'mousepad', '', 'C', '', '', '', '', '', '', ''),
(15, 1, 15, 'Urutan yang benar dalam mematikan laptop adalah ….', 1, 'tekan tombol power pada bagian body laptop', 'menekan tombol power berkali-kali sampai laptop mati', 'mencari tombol start (bergambar kotak 4), kemudian pilih power, lalu di klik shutdown', 'klik tombol power lalu pilih tombol shutdown', '', 'C', '', '', '', '', '', '', ''),
(16, 1, 16, 'Definisi Sistem operasi adalah ....', 1, 'suatu program yang digunakan untuk mengolah data', 'suatu program yang digunakan untuk mengolah gambar', 'suatu program yang digunakan untuk menjalankan komputer', 'suatu program yang digunakan untuk mengolah angka', '', 'C', '', '', '', '', '', '', ''),
(17, 1, 17, 'Menghidupkan dan mematikan komputer sesuai dengan prosedur akan membuat komputer ....', 1, 'menjadi lebih canggih ', 'tidak akan cepat rusak ', 'cepat rusak', 'menjadi lebih bersih', '', 'B', '', '', '', '', '', '', ''),
(18, 1, 18, 'Contoh dari perangkat masukan yang benar adalah ....', 1, 'keyboard', 'monitor', 'harddisk', 'LCD', '', 'A', '', '', '', '', '', '', ''),
(19, 1, 19, 'Prosedur yang dilakukan komputer ketika dinyalakan disebut ....', 1, 'bootstrap', 'booting', 'shutdown', 'turnoff', '', 'B', '', '', '', '', '', '', ''),
(20, 1, 20, 'Proses menghidupkan kembali komputer yang sedang bekerja dikenal dengan nama ....', 1, 'shutdown', 'warm booting', 'restrat', 'cold booting', '', 'C', '', '', '', '', '', '', ''),
(21, 1, 1, 'Komponen-komponen elektronika diantaranya adalah ….', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(22, 1, 2, 'Sebutkan dua perbedaan antara handphone dengan tablet!', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(23, 1, 3, 'Apakah yang dimaksud dengan cold booting?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(24, 1, 4, 'Mengapa komputer harus dihidupkan dan dimatikan dengan prosedur tertentu?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(25, 1, 5, 'Apa yang dimaksud dengana hardware ?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(26, 1, 6, 'Apa yang akan terjadi jika software pada sebuah sistem komputer tidak ada?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(27, 1, 7, 'Sebutkan dua kelebihan laptop dibanding dengan komputer pribadi !', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(28, 1, 8, 'Komponen elektronika yang terdiri dari ratusan bahkan sampai jutaan transistor yang diperkecil dikenal dengan nama ….', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(29, 2, 1, 'Peralatan yang menggunakan komponen-komponen elektronika dikenal dengan nama …', 1, 'piranti teknologi', 'piranti elektronik', 'piranti kerja', 'piranti digital', '', 'B', '', '', '', '', '', '', ''),
(30, 2, 2, 'Komponen-komponen elektronika diantaranya adalah ….', 1, 'diode, radio, transistor', 'transistor, resistor, tablet', 'resistor, transistor, diode, IC', 'hp, tablet, resistor, transistor', '', 'C', '', '', '', '', '', '', ''),
(31, 2, 3, '………. merupakan salah satu komponen elektronik yang memadukan ratusan bahkan ribuan transistor yang berukuran kecil', 1, 'resistor', 'transistor', 'dioda', 'Integrated Circuit', '', 'D', '', '', '', '', '', '', ''),
(32, 2, 4, 'Handphone, Tablet, Laptop dan Komputer merupakan ….. karena bahan-bahan yang digunakan untuk membuatnya berfungsi berasal dari komponen-komponen elektronika', 1, 'piranti elektronik', 'piranti canggih', 'piranti bergerak', 'piranti digital', '', 'A', '', '', '', '', '', '', ''),
(33, 2, 5, 'Handphone dan tablet memiliki banyak kesamaan dari sisi fungsi dan pemakaian, akan tetapi ada beberapa perbedaan yang mencolok yaitu …', 1, 'handphone berukuran lebih besar dari tablet', 'tablet berukuran minimal 6 inchi', 'tablet berukuran lebih besar dari handphone yaitu sebesar 13 inchi', 'tablet dilengkapi dengan stylus (pena digital) dan memiliki ukuran lebih besar', '', 'D', '', '', '', '', '', '', ''),
(34, 2, 6, 'Martin Cooper, seorang karyawan Motorola. Pada tanggal 03 April 1973 ia tercatat dalam sejarah sebagai seorang yang berjasa dalam penemuan ….', 1, 'telepon genggam', 'Tablet PC', 'telepon rumah', 'iPhone', '', 'A', '', '', '', '', '', '', ''),
(35, 2, 7, 'Fungsi utama dari sebuah telepon genggam (handphone) adalah ….', 1, 'mencari informasi yang bisa dimanfaatkan penggunanya', 'menerima panggilan telepon dan pengiriman dan penerimaan pesan singkat', 'menerima dokumen text dan video', 'digunakan untuk steaming video seperti Youtube', '', 'B', '', '', '', '', '', '', ''),
(36, 2, 8, 'Apple baru meluncurkan versi komputer tabletnya pada tahun 2010 dengan nama ….', 1, 'iPhone', 'Galaxy 7', 'iPad', 'Android', '', 'C', '', '', '', '', '', '', ''),
(37, 2, 9, 'Pada tahun 2011 Samsung meluncurkan versi komputer tablet yaitu ….', 1, 'Galaxy Tab 7 Plus', 'Galaxy Tab 6', 'Galaxy Tab 6 Plus', 'Galaxy Tab 7', '', 'D', '', '', '', '', '', '', ''),
(38, 2, 10, 'Komputer pribadi yang berukuran relatif kecil dan ringan. Beratnya berkisar dari 1–6 kg dan menggunakan layer LCD dengan kisaran ukuran antara 10 inchi sampai 17 inchi dikenal dengan nama ….', 1, 'PC (Personal Computer)	', 'Laptop (komputer jinjing)', 'Tablet PC', 'Mainstream', '', 'A', '', '', '', '', '', '', ''),
(39, 2, 11, 'Salah satu perangkat komputer yang memiliki fungsi untuk menyimpan data-data di laptop secara permanen adalah ….', 1, 'memory', 'sdcard', 'harddisk', 'flash disk', '', 'C', '', '', '', '', '', '', ''),
(40, 2, 12, 'Dengan adanya ….. laptop bisa digunakan tanpa harus terhubung langsung ke arus listrik. Biasanya laptop bisa bekerja sampai 8 jam', 1, 'charger', 'baterai', 'layar', 'memory', '', 'B', '', '', '', '', '', '', ''),
(41, 2, 13, 'Untuk menyalakan Laptop, kita harus mencari terlebih dahulu dimana letak tombol powernya. Tombol tersebut memiliki ciri-ciri ….', 1, 'berbentuk bulat, dengan bentuk lingkaran dengan garis ditengah atas', 'berbentuk bulat, biasanya terletak di bagian bawah laptop', 'berbentuk setengah lingkaran yang terletak tepat di atas LCD', 'berbentuk panjang dengan garis putih ditengahnya', '', 'A', '', '', '', '', '', '', ''),
(42, 2, 14, 'Pengganti fungsi mouse pada laptop dikenal dengan nama ….', 1, 'trackpad', 'mouse', 'touchpad', 'mousepad', '', 'C', '', '', '', '', '', '', ''),
(43, 2, 15, 'Urutan yang benar dalam mematikan laptop adalah ….', 1, 'tekan tombol power pada bagian body laptop', 'menekan tombol power berkali-kali sampai laptop mati', 'mencari tombol start (bergambar kotak 4), kemudian pilih power, lalu di klik shutdown', 'klik tombol power lalu pilih tombol shutdown', '', 'C', '', '', '', '', '', '', ''),
(44, 2, 16, 'Definisi Sistem operasi adalah ....', 1, 'suatu program yang digunakan untuk mengolah data', 'suatu program yang digunakan untuk mengolah gambar', 'suatu program yang digunakan untuk menjalankan komputer', 'suatu program yang digunakan untuk mengolah angka', '', 'C', '', '', '', '', '', '', ''),
(45, 2, 17, 'Menghidupkan dan mematikan komputer sesuai dengan prosedur akan membuat komputer ....', 1, 'menjadi lebih canggih ', 'tidak akan cepat rusak ', 'cepat rusak', 'menjadi lebih bersih', '', 'B', '', '', '', '', '', '', ''),
(46, 2, 18, 'Contoh dari perangkat masukan yang benar adalah ....', 1, 'keyboard', 'monitor', 'harddisk', 'LCD', '', 'A', '', '', '', '', '', '', ''),
(47, 2, 19, 'Prosedur yang dilakukan komputer ketika dinyalakan disebut ....', 1, 'bootstrap', 'booting', 'shutdown', 'turnoff', '', 'B', '', '', '', '', '', '', ''),
(48, 2, 20, 'Proses menghidupkan kembali komputer yang sedang bekerja dikenal dengan nama ....', 1, 'shutdown', 'warm booting', 'restrat', 'cold booting', '', 'C', '', '', '', '', '', '', ''),
(49, 2, 1, 'Komponen-komponen elektronika diantaranya adalah ….', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(50, 2, 2, 'Sebutkan dua perbedaan antara handphone dengan tablet!', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(51, 2, 3, 'Apakah yang dimaksud dengan cold booting?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(52, 2, 4, 'Mengapa komputer harus dihidupkan dan dimatikan dengan prosedur tertentu?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(53, 2, 5, 'Apa yang dimaksud dengana hardware ?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(54, 2, 6, 'Apa yang akan terjadi jika software pada sebuah sistem komputer tidak ada?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(55, 2, 7, 'Sebutkan dua kelebihan laptop dibanding dengan komputer pribadi !', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(56, 2, 8, 'Komponen elektronika yang terdiri dari ratusan bahkan sampai jutaan transistor yang diperkecil dikenal dengan nama ….', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(57, 3, 1, 'Untuk menyimpan data, yang digunakan adalah perangkat ....', 1, 'output device', 'input device', 'storage device', 'hardware device', '', 'C', '', '', '', '', '', '', ''),
(58, 3, 2, 'RAM dikenal juga dengan sebutan ', 1, 'memory', 'kartu grafis', 'CPU', 'Processor', '', 'A', '', '', '', '', '', '', ''),
(59, 3, 3, 'Tampilan komputer yang muncul di monitor merupakan hasil dari kerja perangkat yang bernama ...', 1, 'Processor', 'Motherboard', 'Sound Card', 'VGA Card', '', 'D', '', '', '', '', '', '', ''),
(60, 3, 4, 'Komponen komputer yang dapat dilihat secara fisik, dapat dipegang atau di pindahkan disebut ....', 1, 'brainware', 'software', 'hardware', 'harddisk', '', 'C', '', '', '', '', '', '', ''),
(61, 3, 5, 'Berikut ini komponen pokok yang harus ada di sebuah komputer, kecuali ....', 1, 'sound card', 'CPU', 'motherboard', 'memory', '', 'A', '', '', '', '', '', '', ''),
(62, 3, 6, 'Perangkat-perangkat keras yang dapat ditempatkan ke PC untuk meningkatkan kemampuan sistem komputer disebut ....', 1, 'memory', 'hardware', 'software', 'periferal', '', 'D', '', '', '', '', '', '', ''),
(63, 3, 7, 'Hasil output proses yang hanya akan terpampang pada layar monitor disebut ', 1, 'softcopy', 'hardcopy', 'print screen', 'processing device', '', 'C', '', '', '', '', '', '', ''),
(64, 3, 8, 'Jaringan komputer berskala dunia dikenal juga dengan nama ....', 1, 'MAN', 'LAN', 'intranet', 'internet', '', 'D', '', '', '', '', '', '', ''),
(65, 3, 9, 'Internet merupakan singkatan dari', 1, 'International Network ', 'Integration Network', 'kumpulan jaringan komputer dari seluruh dunia yang bekerja sebagai suatu sistem dalam jaringan', 'suatu jaringan komputer terbesar di dunia karena menghubungkan seluruh jaringan komputer yang ada di dunia ini', '', 'C', '', '', '', '', '', '', ''),
(66, 3, 10, 'Pengertian internet secara umum (menurut bahasa) adalah ....', 1, 'kumpulan jaringan komputer yang terhubung dan bekerja sebagai suatu sistem', 'kumpulan jaringan komputer yang tidak saling terhubung, tetapi dapat bekerja sebagai suatu sistem', 'Tablet PC', 'Mainstream', '', 'A', '', '', '', '', '', '', ''),
(67, 3, 11, 'Yang dimaksud dengan Download adalah', 1, 'pengiriman data dan informasi dari komputer pengguna ke suatu website', 'pengambilan data atau informasi dari sebuah website untuk ditampilkan atau disimpan di komputer pengguna', 'aplikasi di internet yang dipakai untuk menjelajah dunia internet', 'surat elektronik yang dapat dikirim dan diterima melalui internet', '', 'B', '', '', '', '', '', '', ''),
(68, 3, 12, 'Berikut ini merupakan keuntungan jaringan LAN, kecuali ....', 1, 'pemakaian printer dapat dilakukan oleh semua client (printer sharing)', 'server kantor pusat dapat berfungsi sebagai bank data dari kantor cabang', 'proses back up data menjadi lebih mudah dan cepat', 'risiko kehilangan data oleh virus komputer menjadi sangat kecil sekali', '', 'D', '', '', '', '', '', '', ''),
(69, 3, 13, 'Di antara jenis jaringan komputer berikut yang area jangkauannya paling luas adalah ....', 1, 'WAN', 'MAN', 'LAN', 'internet', '', 'D', '', '', '', '', '', '', ''),
(70, 3, 14, 'Wired network disebut juga sebagai ....', 1, 'menggunakan kabel', 'tanpa kabel', 'menggunakan jaringan', 'tanpa jaringan', '', 'A', '', '', '', '', '', '', ''),
(71, 3, 15, 'Perangkat keras yang berfungsi memasukkan data atau perintah ke dalam komputer disebut .... ', 1, 'output device', 'input device', 'storage device', 'processing device', '', 'B', '', '', '', '', '', '', ''),
(72, 3, 16, 'Sekumpulan aturan yang digunakan pada komunikasi data disebut ....', 1, 'program', 'protokol', 'prosedur', 'proses', '', 'B', '', '', '', '', '', '', ''),
(73, 3, 17, 'Sebuah jaringan komputer yang menghubungkan komputer dalam area yang luas, misalnya antara gedung yang satu dengan gedung lainnya atau daerah yang lebih luas lagi disebut ....', 1, 'WAN', 'MAN', 'internet', 'intranet', '', 'D', '', '', '', '', '', '', ''),
(74, 3, 18, 'Sekumpulan jaringan yang berlokasi tersebar di seluruh dunia yang saling terhubung membentuk satu jaringan besar komputer disebut ....', 1, 'intranet', 'WAN', 'internet', 'LAN', '', 'C', '', '', '', '', '', '', ''),
(75, 3, 19, 'Berikut adalah fungsi bluetooth, kecuali ....', 1, 'sharing file', 'sharing video', 'sharing audio', 'sharing paket data', '', 'D', '', '', '', '', '', '', ''),
(76, 3, 20, 'Salah satu layanan internet fixed wireless adalah ....', 1, 'bluetooth', 'wifi', 'broadband', 'infrared', '', 'C', '', '', '', '', '', '', ''),
(77, 3, 1, 'Sebutkan tiga unsur yang membuat komputer dapat bekerja!', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(78, 3, 2, 'Sebutkan fungsi dari perangkat masukan!', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(79, 3, 3, 'Bagaimanakah cara mendapatkan akses internet?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(80, 3, 4, 'Apa sajakah yang dapat digunakan secara bersama dalam jaringan komputer?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(81, 3, 5, 'Apakah tujuan dibangunnya jaringan komputer?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(82, 4, 1, 'Untuk menyimpan data, yang digunakan adalah perangkat ....', 1, 'output device', 'input device', 'storage device', 'hardware device', '', 'C', '', '', '', '', '', '', ''),
(83, 4, 2, 'RAM dikenal juga dengan sebutan ', 1, 'memory', 'kartu grafis', 'CPU', 'Processor', '', 'A', '', '', '', '', '', '', ''),
(84, 4, 3, 'Tampilan komputer yang muncul di monitor merupakan hasil dari kerja perangkat yang bernama ...', 1, 'Processor', 'Motherboard', 'Sound Card', 'VGA Card', '', 'D', '', '', '', '', '', '', ''),
(85, 4, 4, 'Komponen komputer yang dapat dilihat secara fisik, dapat dipegang atau di pindahkan disebut ....', 1, 'brainware', 'software', 'hardware', 'harddisk', '', 'C', '', '', '', '', '', '', ''),
(86, 4, 5, 'Berikut ini komponen pokok yang harus ada di sebuah komputer, kecuali ....', 1, 'sound card', 'CPU', 'motherboard', 'memory', '', 'A', '', '', '', '', '', '', ''),
(87, 4, 6, 'Perangkat-perangkat keras yang dapat ditempatkan ke PC untuk meningkatkan kemampuan sistem komputer disebut ....', 1, 'memory', 'hardware', 'software', 'periferal', '', 'D', '', '', '', '', '', '', ''),
(88, 4, 7, 'Hasil output proses yang hanya akan terpampang pada layar monitor disebut ', 1, 'softcopy', 'hardcopy', 'print screen', 'processing device', '', 'C', '', '', '', '', '', '', ''),
(89, 4, 8, 'Jaringan komputer berskala dunia dikenal juga dengan nama ....', 1, 'MAN', 'LAN', 'intranet', 'internet', '', 'D', '', '', '', '', '', '', ''),
(90, 4, 9, 'Internet merupakan singkatan dari', 1, 'International Network ', 'Integration Network', 'kumpulan jaringan komputer dari seluruh dunia yang bekerja sebagai suatu sistem dalam jaringan', 'suatu jaringan komputer terbesar di dunia karena menghubungkan seluruh jaringan komputer yang ada di dunia ini', '', 'C', '', '', '', '', '', '', ''),
(91, 4, 10, 'Pengertian internet secara umum (menurut bahasa) adalah ....', 1, 'kumpulan jaringan komputer yang terhubung dan bekerja sebagai suatu sistem', 'kumpulan jaringan komputer yang tidak saling terhubung, tetapi dapat bekerja sebagai suatu sistem', 'Tablet PC', 'Mainstream', '', 'A', '', '', '', '', '', '', ''),
(92, 4, 11, 'Yang dimaksud dengan Download adalah', 1, 'pengiriman data dan informasi dari komputer pengguna ke suatu website', 'pengambilan data atau informasi dari sebuah website untuk ditampilkan atau disimpan di komputer pengguna', 'aplikasi di internet yang dipakai untuk menjelajah dunia internet', 'surat elektronik yang dapat dikirim dan diterima melalui internet', '', 'B', '', '', '', '', '', '', ''),
(93, 4, 12, 'Berikut ini merupakan keuntungan jaringan LAN, kecuali ....', 1, 'pemakaian printer dapat dilakukan oleh semua client (printer sharing)', 'server kantor pusat dapat berfungsi sebagai bank data dari kantor cabang', 'proses back up data menjadi lebih mudah dan cepat', 'risiko kehilangan data oleh virus komputer menjadi sangat kecil sekali', '', 'D', '', '', '', '', '', '', ''),
(94, 4, 13, 'Di antara jenis jaringan komputer berikut yang area jangkauannya paling luas adalah ....', 1, 'WAN', 'MAN', 'LAN', 'internet', '', 'D', '', '', '', '', '', '', ''),
(95, 4, 14, 'Wired network disebut juga sebagai ....', 1, 'menggunakan kabel', 'tanpa kabel', 'menggunakan jaringan', 'tanpa jaringan', '', 'A', '', '', '', '', '', '', ''),
(96, 4, 15, 'Perangkat keras yang berfungsi memasukkan data atau perintah ke dalam komputer disebut .... ', 1, 'output device', 'input device', 'storage device', 'processing device', '', 'B', '', '', '', '', '', '', ''),
(97, 4, 16, 'Sekumpulan aturan yang digunakan pada komunikasi data disebut ....', 1, 'program', 'protokol', 'prosedur', 'proses', '', 'B', '', '', '', '', '', '', ''),
(98, 4, 17, 'Sebuah jaringan komputer yang menghubungkan komputer dalam area yang luas, misalnya antara gedung yang satu dengan gedung lainnya atau daerah yang lebih luas lagi disebut ....', 1, 'WAN', 'MAN', 'internet', 'intranet', '', 'D', '', '', '', '', '', '', ''),
(99, 4, 18, 'Sekumpulan jaringan yang berlokasi tersebar di seluruh dunia yang saling terhubung membentuk satu jaringan besar komputer disebut ....', 1, 'intranet', 'WAN', 'internet', 'LAN', '', 'C', '', '', '', '', '', '', ''),
(100, 4, 19, 'Berikut adalah fungsi bluetooth, kecuali ....', 1, 'sharing file', 'sharing video', 'sharing audio', 'sharing paket data', '', 'D', '', '', '', '', '', '', ''),
(101, 4, 20, 'Salah satu layanan internet fixed wireless adalah ....', 1, 'bluetooth', 'wifi', 'broadband', 'infrared', '', 'C', '', '', '', '', '', '', ''),
(102, 4, 1, 'Sebutkan tiga unsur yang membuat komputer dapat bekerja!', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(103, 4, 2, 'Sebutkan fungsi dari perangkat masukan!', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(104, 4, 3, 'Bagaimanakah cara mendapatkan akses internet?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(105, 4, 4, 'Apa sajakah yang dapat digunakan secara bersama dalam jaringan komputer?', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(106, 4, 5, 'Apakah tujuan dibangunnya jaringan komputer?', 2, '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id_token` int(11) NOT NULL,
  `token` varchar(6) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `masa_berlaku` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id_token`, `token`, `time`, `masa_berlaku`) VALUES
(1, 'VUGSCI', '2021-12-13 11:48:03', '00:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` int(255) NOT NULL,
  `id_guru` int(255) NOT NULL DEFAULT 0,
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tugas` longtext NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(5) NOT NULL,
  `kode_nama` varchar(255) DEFAULT '0',
  `id_pk` varchar(255) NOT NULL,
  `id_guru` int(5) NOT NULL,
  `id_mapel` int(5) NOT NULL,
  `kode_ujian` varchar(30) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jml_soal` int(5) NOT NULL,
  `jml_esai` int(5) NOT NULL,
  `bobot_pg` int(5) NOT NULL,
  `opsi` int(1) NOT NULL,
  `bobot_esai` int(5) NOT NULL,
  `tampil_pg` int(5) NOT NULL,
  `tampil_esai` int(5) NOT NULL,
  `lama_ujian` int(5) NOT NULL,
  `tgl_ujian` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `waktu_ujian` time DEFAULT NULL,
  `selesai_ujian` time DEFAULT NULL,
  `level` varchar(5) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `sesi` varchar(1) DEFAULT NULL,
  `acak` int(1) NOT NULL,
  `token` int(1) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `hasil` int(1) DEFAULT NULL,
  `kkm` varchar(128) DEFAULT NULL,
  `ulang` int(2) DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL,
  `reset` int(1) DEFAULT NULL,
  `ulang_kkm` int(1) NOT NULL,
  `btn_selesai` int(11) NOT NULL,
  `pelanggaran` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ujian`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `file_pendukung`
--
ALTER TABLE `file_pendukung`
  ADD PRIMARY KEY (`id_file`);

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id_jawaban`);

--
-- Indexes for table `jawaban_tugas`
--
ALTER TABLE `jawaban_tugas`
  ADD PRIMARY KEY (`id_jawaban`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`jurusan_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`kode_level`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`kode_mapel`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `pengawas`
--
ALTER TABLE `pengawas`
  ADD PRIMARY KEY (`id_pengawas`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id_pengumuman`);

--
-- Indexes for table `pk`
--
ALTER TABLE `pk`
  ADD PRIMARY KEY (`id_pk`);

--
-- Indexes for table `referensi_jurusan`
--
ALTER TABLE `referensi_jurusan`
  ADD PRIMARY KEY (`jurusan_id`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kode_ruang`);

--
-- Indexes for table `savsoft_options`
--
ALTER TABLE `savsoft_options`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `savsoft_qbank`
--
ALTER TABLE `savsoft_qbank`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `sesi`
--
ALTER TABLE `sesi`
  ADD PRIMARY KEY (`kode_sesi`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `sinkron`
--
ALTER TABLE `sinkron`
  ADD PRIMARY KEY (`nama_data`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id_token`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_pendukung`
--
ALTER TABLE `file_pendukung`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jawaban_tugas`
--
ALTER TABLE `jawaban_tugas`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id_materi` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengawas`
--
ALTER TABLE `pengawas`
  MODIFY `id_pengawas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id_pengumuman` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `savsoft_options`
--
ALTER TABLE `savsoft_options`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `savsoft_qbank`
--
ALTER TABLE `savsoft_qbank`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_tugas` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(5) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
