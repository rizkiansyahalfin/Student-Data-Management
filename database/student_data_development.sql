-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 07 Bulan Mei 2020 pada 13.53
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_data_development`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2020-03-11 04:50:18.861203', '2020-03-11 04:50:18.861203');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusans`
--

CREATE TABLE `jurusans` (
  `id` bigint(20) NOT NULL,
  `jurusan` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurusans`
--

INSERT INTO `jurusans` (`id`, `jurusan`, `created_at`, `updated_at`) VALUES
(2, 'RPL', '2020-03-13 02:53:07.956512', '2020-03-13 03:47:44.276751');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) NOT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_route` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `menu_name`, `menu_route`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Menu', 'menus', 1, 1, '2020-03-11 04:51:14.483229', '2020-03-11 04:51:14.483229'),
(2, 'Menu Permission', 'menu_permissions', 1, 1, '2020-03-11 04:51:55.987111', '2020-03-11 04:51:55.987111'),
(3, 'Siswa', 'siswas', 1, 1, '2020-03-11 04:52:26.619522', '2020-03-11 04:52:26.619522'),
(4, 'Jurusan', 'jurusans', 1, 1, '2020-03-11 04:52:55.152245', '2020-03-11 04:52:55.152245'),
(5, 'Rombel', 'rombels', 1, 1, '2020-03-11 04:53:20.187905', '2020-03-11 04:53:20.187905'),
(6, 'Rayon', 'rayons', 1, 1, '2020-03-11 04:53:43.217384', '2020-03-31 01:25:42.094735');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_permissions`
--

CREATE TABLE `menu_permissions` (
  `id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `create` tinyint(1) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `uptodate` tinyint(1) DEFAULT NULL,
  `remove` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu_permissions`
--

INSERT INTO `menu_permissions` (`id`, `menu_id`, `user_id`, `create`, `read`, `uptodate`, `remove`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 1, 0, 0, 1, '2020-03-11 04:51:29.839910', '2020-03-13 04:10:47.680998'),
(2, 2, 1, 0, 1, 0, 0, 1, '2020-03-11 04:52:06.148491', '2020-03-11 04:52:06.148491'),
(3, 3, 1, 0, 1, 0, 0, 1, '2020-03-11 04:52:34.488276', '2020-03-11 04:52:34.488276'),
(4, 4, 1, 0, 1, 0, 0, 1, '2020-03-11 04:53:05.099025', '2020-03-11 04:53:05.099025'),
(5, 5, 1, 0, 1, 0, 0, 1, '2020-03-11 04:53:30.043883', '2020-03-11 04:53:30.043883'),
(6, 6, 1, 0, 1, 0, 0, 1, '2020-03-11 04:53:53.833793', '2020-04-01 07:58:26.812034');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rayons`
--

CREATE TABLE `rayons` (
  `id` bigint(20) NOT NULL,
  `rayon` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rayons`
--

INSERT INTO `rayons` (`id`, `rayon`, `created_at`, `updated_at`) VALUES
(3, 'Cicurug 1', '2020-03-13 03:16:36.281278', '2020-03-13 03:16:36.281278');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rombels`
--

CREATE TABLE `rombels` (
  `id` bigint(20) NOT NULL,
  `jurusan_id` bigint(20) NOT NULL,
  `rombel` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rombels`
--

INSERT INTO `rombels` (`id`, `jurusan_id`, `rombel`, `created_at`, `updated_at`) VALUES
(2, 2, 'XI-4', '2020-03-13 02:53:24.201486', '2020-03-31 01:26:35.536361');

-- --------------------------------------------------------

--
-- Struktur dari tabel `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20200206004934'),
('20200206004950'),
('20200206005010'),
('20200206005024'),
('20200224041529'),
('20200227010624'),
('20200309033302');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswas`
--

CREATE TABLE `siswas` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jk` varchar(255) DEFAULT NULL,
  `rombel_id` bigint(20) NOT NULL,
  `rayon_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `siswas`
--

INSERT INTO `siswas` (`id`, `nama`, `jk`, `rombel_id`, `rayon_id`, `created_at`, `updated_at`) VALUES
(4, 'Rizkiansyah Alfin', 'Laki-laki', 2, 3, '2020-03-13 03:36:30.096306', '2020-03-31 01:30:04.060673'),
(5, 'Pipit Fitriani', 'Perempuan', 2, 3, '2020-03-13 03:36:40.764602', '2020-03-31 01:30:38.020604');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `created_at`, `updated_at`) VALUES
(1, 'rizkiansyahalfin030603@gmail.com', '$2a$11$KViU/1d794BLSs1HMIXP9egLENK7pCyvoYvwTI7G3JpMPTJtlAPHK', NULL, NULL, NULL, '2020-03-11 04:50:51.422737', '2020-03-11 04:50:51.422737'),
(2, 'alfin030603@gmail.com', '$2a$11$rBlfZjCGFlNUz5Fwz10ToOsipew9I6hNdZgICGXvmJcuPSytpEH9y', NULL, NULL, NULL, '2020-03-13 03:28:39.596504', '2020-03-13 03:28:39.596504');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `jurusans`
--
ALTER TABLE `jurusans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu_permissions`
--
ALTER TABLE `menu_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_menu_permissions_on_menu_id` (`menu_id`),
  ADD KEY `index_menu_permissions_on_user_id` (`user_id`);

--
-- Indeks untuk tabel `rayons`
--
ALTER TABLE `rayons`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rombels`
--
ALTER TABLE `rombels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_rombels_on_jurusan_id` (`jurusan_id`);

--
-- Indeks untuk tabel `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indeks untuk tabel `siswas`
--
ALTER TABLE `siswas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_siswas_on_rombel_id` (`rombel_id`),
  ADD KEY `index_siswas_on_rayon_id` (`rayon_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_users_on_email` (`email`),
  ADD UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jurusans`
--
ALTER TABLE `jurusans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `menu_permissions`
--
ALTER TABLE `menu_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `rayons`
--
ALTER TABLE `rayons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `rombels`
--
ALTER TABLE `rombels`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `siswas`
--
ALTER TABLE `siswas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `menu_permissions`
--
ALTER TABLE `menu_permissions`
  ADD CONSTRAINT `fk_rails_71c215e4a8` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_rails_986b6040fa` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Ketidakleluasaan untuk tabel `rombels`
--
ALTER TABLE `rombels`
  ADD CONSTRAINT `fk_rails_59685d69e3` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusans` (`id`);

--
-- Ketidakleluasaan untuk tabel `siswas`
--
ALTER TABLE `siswas`
  ADD CONSTRAINT `fk_rails_6166fdae7f` FOREIGN KEY (`rayon_id`) REFERENCES `rayons` (`id`),
  ADD CONSTRAINT `fk_rails_ffda07a1dc` FOREIGN KEY (`rombel_id`) REFERENCES `rombels` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
