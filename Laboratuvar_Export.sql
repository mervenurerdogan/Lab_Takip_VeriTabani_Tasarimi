-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 06 Ara 2018, 22:27:11
-- Sunucu sürümü: 10.1.37-MariaDB
-- PHP Sürümü: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `laboratuvar_iş_takip_sistemi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `deney`
--

CREATE TABLE `deney` (
  `Deney_id` int(11) NOT NULL,
  `deney_adı` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `deney_süresi` time NOT NULL,
  `başlangıç_tarihi` datetime NOT NULL,
  `bitiş_tarihi` datetime NOT NULL,
  `lab_no` int(11) NOT NULL,
  `numune_id` int(11) NOT NULL,
  `durum_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `deney`
--

INSERT INTO `deney` (`Deney_id`, `deney_adı`, `deney_süresi`, `başlangıç_tarihi`, `bitiş_tarihi`, `lab_no`, `numune_id`, `durum_no`) VALUES
(1, 'Biyokimya ve Elektrolik Deneyi', '02:10:00', '2018-12-18 13:00:00', '2018-12-12 15:10:00', 1, 1, 3),
(2, 'Hormon deneyi', '42:10:00', '2018-12-04 12:00:00', '2018-12-12 15:10:00', 2, 8, 2),
(3, 'Tümör Belirteç analizi', '06:00:00', '2018-03-17 07:00:00', '2018-03-17 14:00:00', 1, 11, 1),
(4, 'İdrar ve Gaita Analizi', '02:00:00', '2018-07-11 08:00:00', '2018-07-11 10:00:00', 2, 3, 1),
(5, 'Hematoloji deneyi', '07:18:19', '2018-07-23 05:00:00', '2018-07-23 13:00:00', 2, 1, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `durum`
--

CREATE TABLE `durum` (
  `durum_no` int(11) NOT NULL,
  `durum_adı` varchar(20) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `durum`
--

INSERT INTO `durum` (`durum_no`, `durum_adı`) VALUES
(1, 'Başarılı'),
(2, 'Başarısız'),
(3, 'Beklemede');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fatura`
--

CREATE TABLE `fatura` (
  `Fatura_id` int(11) NOT NULL,
  `fatura_no` int(11) NOT NULL,
  `deney_id` int(11) NOT NULL,
  `personel_id` int(11) NOT NULL,
  `fatura_adı` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `kesim_tarihi` date NOT NULL,
  `Ödeme_tip_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `fatura`
--

INSERT INTO `fatura` (`Fatura_id`, `fatura_no`, `deney_id`, `personel_id`, `fatura_adı`, `kesim_tarihi`, `Ödeme_tip_no`) VALUES
(1, 112568, 1, 5, 'Biyokimya ve Elektrolik Deneyi Faturası', '2018-11-12', 1),
(2, 135612, 2, 6, 'Hormon Deneyi Faturası', '2018-09-10', 1),
(3, 147895, 3, 6, 'Tümör Belirteç Analizi Faturası', '2017-09-12', 1),
(4, 196532, 4, 5, 'İdrar ve Gaita Analizi Faturası', '2017-12-17', 2),
(5, 185624, 5, 5, 'Hematoloji Deneyi Faturası', '2016-02-03', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `firma`
--

CREATE TABLE `firma` (
  `firma_kodu` int(11) NOT NULL,
  `firma_adı` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `yetkili_adı` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `yetkili_soyadı` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `Telefon` int(11) NOT NULL,
  `Faks` int(11) NOT NULL,
  `Email` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `web_adresi` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `adres` varchar(100) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `firma`
--

INSERT INTO `firma` (`firma_kodu`, `firma_adı`, `yetkili_adı`, `yetkili_soyadı`, `Telefon`, `Faks`, `Email`, `web_adresi`, `adres`) VALUES
(1, 'İnterlab Laboratuvar malzmeleri aş', 'Melih', 'İnter', 231579425, 138788899, 'interlab@hotmail.com', 'www.interlab.com.tr', 'İstanbul'),
(2, 'OmniLab laboratuvar malzemeleri ltd.aş', 'Büşra', 'Uçar', 598879454, 224897464, 'omnilab@hotmail.com', 'www.omnilab.com.tr', 'Elazığ'),
(3, 'OzBiosciences Laboratuvar malzmeleri ltd.aş', 'Mithat', 'Kaçar', 56247855, 21354987, 'Ozbiosciences@hotmail.com', 'www.Ozbioscience.com.tr', 'İstanbul');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `laboratuvar`
--

CREATE TABLE `laboratuvar` (
  `Lab_no` int(11) NOT NULL,
  `lab_kodu` char(20) COLLATE utf8_turkish_ci NOT NULL,
  `Lab_adı` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `laboratuvar`
--

INSERT INTO `laboratuvar` (`Lab_no`, `lab_kodu`, `Lab_adı`) VALUES
(1, 'L518', 'Biyokimya Laboratuvarı1'),
(2, 'L447', 'Biyokimya Laboratuvarı2'),
(3, 'B203', 'Muhasebe Bürosu'),
(4, 'B103', 'Muhasebe Bürosu');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `malzeme`
--

CREATE TABLE `malzeme` (
  `Malzeme_Id` int(11) NOT NULL,
  `Malzeme_adı` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `marka` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `teslim_tarihi` date NOT NULL,
  `personel_id` int(11) NOT NULL,
  `deney_id` int(11) NOT NULL,
  `firma_kodu` int(11) NOT NULL,
  `teslim_eden` varchar(75) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `malzeme`
--

INSERT INTO `malzeme` (`Malzeme_Id`, `Malzeme_adı`, `marka`, `teslim_tarihi`, `personel_id`, `deney_id`, `firma_kodu`, `teslim_eden`) VALUES
(1, 'Mezur', 'marka1', '2016-01-26', 1, 1, 1, 'İnterlab yetkili'),
(2, 'Deney tüpü', 'maraka_tüp', '2018-02-01', 2, 2, 2, 'Omni yetkili'),
(3, 'santrifüj', 'marakaSant', '2018-07-30', 3, 2, 3, 'Ozbio Yetkili'),
(4, 'mikroskop', 'markaMikroskop', '2010-03-17', 4, 5, 2, 'Omni yetkili'),
(5, 'Otoanalizör cihazı', 'Marka Otoanalizör', '2015-09-21', 2, 4, 1, 'İnterlab yetkili'),
(6, 'Kan sayım cihazı', 'MarkaKAn', '2017-08-20', 1, 5, 2, 'Omni Yetkili'),
(7, 'Elektronik Terazi', 'MarkaElektronik', '2017-06-08', 4, 3, 1, 'İnterlab yetkili');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `numune`
--

CREATE TABLE `numune` (
  `Numune_Id` int(11) NOT NULL,
  `numune_numarası` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `numune_tür_id` int(11) NOT NULL,
  `Alınış_tarihi` datetime NOT NULL,
  `numune_miktarı` double NOT NULL,
  `numune_sayısı` int(11) NOT NULL,
  `numune_adı` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `numune_soyadı` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `telefon` int(11) NOT NULL,
  `adres` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `personel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `numune`
--

INSERT INTO `numune` (`Numune_Id`, `numune_numarası`, `numune_tür_id`, `Alınış_tarihi`, `numune_miktarı`, `numune_sayısı`, `numune_adı`, `numune_soyadı`, `telefon`, `adres`, `personel_id`) VALUES
(1, 'num100', 1, '2017-11-17 11:11:27', 13.4, 1, 'Derya', 'Açıkgöz', 555555555, 'Merkez/ELAZIĞ', 1),
(2, 'num101', 2, '2018-03-14 10:03:22', 3.5, 2, 'Elanur', 'Beyaz', 231987562, 'milas/MUĞLA', 2),
(3, 'num103', 6, '2016-01-03 14:20:32', 6.32, 1, 'Ebru', 'Dağ', 537215989, 'Darende/MALATYA', 4),
(4, 'num108', 9, '2011-11-12 13:41:20', 13.4, 3, 'Serdar', 'Şahinoğlu', 501669879, 'merkez/AKSARAY', 3),
(5, 'num90', 3, '2018-09-17 09:18:12', 12.9, 2, 'Fahrettin', 'Dede', 555635575, 'merkez/KONYA', 1),
(6, 'num99', 4, '2017-06-15 07:46:14', 3.9, 1, 'Nazlı', 'Tepeci', 568978056, 'merkez/KAYSERİ', 2),
(7, 'num111', 5, '2016-07-30 12:19:27', 25.6, 1, 'İlyas', 'Gümüş', 523698741, 'merkez/ELAZIĞ', 4),
(8, 'num113', 7, '2015-09-22 10:23:17', 36.4, 1, 'Turgut', 'Öz', 578345698, 'merkez/ELAZIĞ', 2),
(9, 'num201', 8, '2017-05-02 14:33:21', 0.036, 1, 'Mehmet', 'Canlı', 236987451, 'merkez/NİĞDE', 1),
(10, 'num206', 10, '2018-11-12 16:20:11', 13.05, 1, 'Selim', 'Çalışkan', 568974111, 'merkez/ELAZIĞ', 2),
(11, 'num218', 11, '2018-08-03 11:52:34', 90.54, 1, 'Ekin', 'Meriç', 568978456, 'Merkez/ELAZIĞ', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `numune_tür`
--

CREATE TABLE `numune_tür` (
  `numune_tür_id` int(11) NOT NULL,
  `numune_türü` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `numune_tür`
--

INSERT INTO `numune_tür` (`numune_tür_id`, `numune_türü`) VALUES
(1, 'Kan'),
(2, 'İdrar'),
(3, 'Gaita'),
(4, 'Ponksiyon sıvısı'),
(5, 'Plevral sıvı'),
(6, 'Perikardiyal sıvı'),
(7, 'Sinavyal sıvı'),
(8, 'Amniyon sıvısı'),
(9, 'BOS(Beyin omurilik sıvısı)'),
(10, 'Mide öz suyu'),
(11, 'Ejakülat');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel`
--

CREATE TABLE `personel` (
  `Personel_Id` int(11) NOT NULL,
  `Kullanıcı_adı` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `Adı` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `Soyadı` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `şifre` char(20) COLLATE utf8_turkish_ci NOT NULL,
  `personel_türü_id` int(11) NOT NULL,
  `lab_no` int(11) NOT NULL,
  `başlangıç_tarih` date NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `personel`
--

INSERT INTO `personel` (`Personel_Id`, `Kullanıcı_adı`, `Adı`, `Soyadı`, `şifre`, `personel_türü_id`, `lab_no`, `başlangıç_tarih`, `telefon`, `email`) VALUES
(1, 'personel_1', 'Hayri', 'Yılmaz', 'sifre123', 1, 1, '2003-03-13', 555555555, 'yilmaz.lab@hotmail.com'),
(2, 'personel_2', 'Melisa', 'Güneş', 'günes123', 2, 2, '2018-08-15', 568978456, 'mgünes.22@hotmail.com'),
(3, 'personel_3', 'Mehmet', 'Er', 'er123', 2, 1, '2018-07-27', 554126393, 'mehmet_er@hotmail.com'),
(4, 'personel_4', 'Erva ', 'Güzel', 'egüzel123', 1, 2, '2010-05-17', 559863214, 'ervava22@hotmail.com'),
(5, 'personel_5', 'Ahmet ', 'Bakır', 'bakır321', 3, 3, '2013-02-02', 555555555, 'AbakirLab2@hotmail.com'),
(6, 'personel_6', 'Lale', 'Kara', 'karaLale123', 3, 4, '2011-06-22', 598779985, 'karalale@hotmail.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel_türü`
--

CREATE TABLE `personel_türü` (
  `pesonel_türü_id` int(11) NOT NULL,
  `personel_tür` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `personel_türü`
--

INSERT INTO `personel_türü` (`pesonel_türü_id`, `personel_tür`) VALUES
(1, 'Laboratuvar Teknisyeni'),
(2, 'Stajyer'),
(3, 'Muhasebeci');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel_yapar_deney`
--

CREATE TABLE `personel_yapar_deney` (
  `yapar_id` int(11) NOT NULL,
  `personel_id` int(11) NOT NULL,
  `deney_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `personel_yapar_deney`
--

INSERT INTO `personel_yapar_deney` (`yapar_id`, `personel_id`, `deney_id`) VALUES
(1, 2, 5),
(2, 1, 1),
(3, 4, 2),
(4, 3, 4),
(5, 4, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `rapor`
--

CREATE TABLE `rapor` (
  `rapor_id` int(11) NOT NULL,
  `rapor_numarası` int(11) NOT NULL,
  `rapor_adı` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `rapor_tarihi` date NOT NULL,
  `deney_id` int(11) NOT NULL,
  `personel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `rapor`
--

INSERT INTO `rapor` (`rapor_id`, `rapor_numarası`, `rapor_adı`, `rapor_tarihi`, `deney_id`, `personel_id`) VALUES
(1, 98745, 'Biyokimya ve Elektrolit Deneyi Raporu', '2017-06-20', 1, 1),
(2, 97654, 'Hormon Deneyi Raporu', '2018-05-21', 2, 2),
(3, 96547, 'Tümör Belirteç Analizi Raporu', '2016-08-02', 3, 1),
(4, 95478, 'İdrar ve Gaita Analizi', '2017-01-07', 4, 1),
(5, 94712, 'Hematoloji Deneyi Raporu', '2015-02-28', 5, 1),
(6, 93012, 'Tümör Belirteç analizi Raporu', '2018-10-28', 3, 2),
(7, 92710, 'Hematoloji Deneyi Raporu', '2001-01-25', 5, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ödeme_tipi`
--

CREATE TABLE `ödeme_tipi` (
  `ödeme_tip_no` int(11) NOT NULL,
  `ödeme_türü` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ödeme_tipi`
--

INSERT INTO `ödeme_tipi` (`ödeme_tip_no`, `ödeme_türü`) VALUES
(1, 'Nakit ödeme'),
(2, 'Taksitli ödeme');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `deney`
--
ALTER TABLE `deney`
  ADD PRIMARY KEY (`Deney_id`),
  ADD KEY `fk_deney_yapılan_lab_bilgi` (`lab_no`),
  ADD KEY `fk_deney_alınan_numune` (`numune_id`),
  ADD KEY `fk_deney_durumu` (`durum_no`);

--
-- Tablo için indeksler `durum`
--
ALTER TABLE `durum`
  ADD PRIMARY KEY (`durum_no`);

--
-- Tablo için indeksler `fatura`
--
ALTER TABLE `fatura`
  ADD PRIMARY KEY (`Fatura_id`),
  ADD KEY `fk_deney_fatura_bilgi` (`deney_id`),
  ADD KEY `fk_fatura_veren_personel` (`personel_id`),
  ADD KEY `fk_fatura_ödeme_tipi` (`Ödeme_tip_no`);

--
-- Tablo için indeksler `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`firma_kodu`);

--
-- Tablo için indeksler `laboratuvar`
--
ALTER TABLE `laboratuvar`
  ADD PRIMARY KEY (`Lab_no`);

--
-- Tablo için indeksler `malzeme`
--
ALTER TABLE `malzeme`
  ADD PRIMARY KEY (`Malzeme_Id`),
  ADD KEY `fk_malzeme_alan_personel` (`personel_id`),
  ADD KEY `fk_deney_malzmesi` (`deney_id`),
  ADD KEY `fk_malzeme_alınan_firma` (`firma_kodu`);

--
-- Tablo için indeksler `numune`
--
ALTER TABLE `numune`
  ADD PRIMARY KEY (`Numune_Id`),
  ADD KEY `fk_numune_alan_personel` (`personel_id`),
  ADD KEY `fk_numune_tür_bilgisi` (`numune_tür_id`);

--
-- Tablo için indeksler `numune_tür`
--
ALTER TABLE `numune_tür`
  ADD PRIMARY KEY (`numune_tür_id`);

--
-- Tablo için indeksler `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`Personel_Id`),
  ADD KEY `fk_lab_kullanan_personel` (`lab_no`),
  ADD KEY `fk_çalışan_personel_türü` (`personel_türü_id`);

--
-- Tablo için indeksler `personel_türü`
--
ALTER TABLE `personel_türü`
  ADD PRIMARY KEY (`pesonel_türü_id`);

--
-- Tablo için indeksler `personel_yapar_deney`
--
ALTER TABLE `personel_yapar_deney`
  ADD PRIMARY KEY (`yapar_id`),
  ADD KEY `fk_ortak_deney_personeli` (`personel_id`),
  ADD KEY `fk_personelin_deneyleri` (`deney_id`);

--
-- Tablo için indeksler `rapor`
--
ALTER TABLE `rapor`
  ADD PRIMARY KEY (`rapor_id`),
  ADD KEY `fk_rapor_veren_personel` (`personel_id`),
  ADD KEY `fk_raporu_verilen_deney` (`deney_id`);

--
-- Tablo için indeksler `ödeme_tipi`
--
ALTER TABLE `ödeme_tipi`
  ADD PRIMARY KEY (`ödeme_tip_no`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `deney`
--
ALTER TABLE `deney`
  MODIFY `Deney_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `durum`
--
ALTER TABLE `durum`
  MODIFY `durum_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `fatura`
--
ALTER TABLE `fatura`
  MODIFY `Fatura_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `firma`
--
ALTER TABLE `firma`
  MODIFY `firma_kodu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `laboratuvar`
--
ALTER TABLE `laboratuvar`
  MODIFY `Lab_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `malzeme`
--
ALTER TABLE `malzeme`
  MODIFY `Malzeme_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `numune`
--
ALTER TABLE `numune`
  MODIFY `Numune_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `numune_tür`
--
ALTER TABLE `numune_tür`
  MODIFY `numune_tür_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `personel`
--
ALTER TABLE `personel`
  MODIFY `Personel_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `personel_türü`
--
ALTER TABLE `personel_türü`
  MODIFY `pesonel_türü_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `personel_yapar_deney`
--
ALTER TABLE `personel_yapar_deney`
  MODIFY `yapar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `rapor`
--
ALTER TABLE `rapor`
  MODIFY `rapor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `ödeme_tipi`
--
ALTER TABLE `ödeme_tipi`
  MODIFY `ödeme_tip_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `deney`
--
ALTER TABLE `deney`
  ADD CONSTRAINT `fk_deney_alınan_numune` FOREIGN KEY (`numune_id`) REFERENCES `numune` (`Numune_Id`),
  ADD CONSTRAINT `fk_deney_durumu` FOREIGN KEY (`durum_no`) REFERENCES `durum` (`durum_no`),
  ADD CONSTRAINT `fk_deney_yapılan_lab_bilgi` FOREIGN KEY (`lab_no`) REFERENCES `laboratuvar` (`Lab_no`);

--
-- Tablo kısıtlamaları `fatura`
--
ALTER TABLE `fatura`
  ADD CONSTRAINT `fk_deney_fatura_bilgi` FOREIGN KEY (`deney_id`) REFERENCES `deney` (`Deney_id`),
  ADD CONSTRAINT `fk_fatura_veren_personel` FOREIGN KEY (`personel_id`) REFERENCES `personel` (`Personel_Id`),
  ADD CONSTRAINT `fk_fatura_ödeme_tipi` FOREIGN KEY (`Ödeme_tip_no`) REFERENCES `ödeme_tipi` (`ödeme_tip_no`);

--
-- Tablo kısıtlamaları `malzeme`
--
ALTER TABLE `malzeme`
  ADD CONSTRAINT `fk_deney_malzmesi` FOREIGN KEY (`deney_id`) REFERENCES `deney` (`Deney_id`),
  ADD CONSTRAINT `fk_malzeme_alan_personel` FOREIGN KEY (`personel_id`) REFERENCES `personel` (`Personel_Id`),
  ADD CONSTRAINT `fk_malzeme_alınan_firma` FOREIGN KEY (`firma_kodu`) REFERENCES `firma` (`firma_kodu`);

--
-- Tablo kısıtlamaları `numune`
--
ALTER TABLE `numune`
  ADD CONSTRAINT `fk_numune_alan_personel` FOREIGN KEY (`personel_id`) REFERENCES `personel` (`Personel_Id`),
  ADD CONSTRAINT `fk_numune_tür_bilgisi` FOREIGN KEY (`numune_tür_id`) REFERENCES `numune_tür` (`numune_tür_id`);

--
-- Tablo kısıtlamaları `personel`
--
ALTER TABLE `personel`
  ADD CONSTRAINT `fk_lab_kullanan_personel` FOREIGN KEY (`lab_no`) REFERENCES `laboratuvar` (`Lab_no`),
  ADD CONSTRAINT `fk_çalışan_personel_türü` FOREIGN KEY (`personel_türü_id`) REFERENCES `personel_türü` (`pesonel_türü_id`);

--
-- Tablo kısıtlamaları `personel_yapar_deney`
--
ALTER TABLE `personel_yapar_deney`
  ADD CONSTRAINT `fk_ortak_deney_personeli` FOREIGN KEY (`personel_id`) REFERENCES `personel` (`Personel_Id`),
  ADD CONSTRAINT `fk_personelin_deneyleri` FOREIGN KEY (`deney_id`) REFERENCES `deney` (`Deney_id`);

--
-- Tablo kısıtlamaları `rapor`
--
ALTER TABLE `rapor`
  ADD CONSTRAINT `fk_rapor_veren_personel` FOREIGN KEY (`personel_id`) REFERENCES `personel` (`Personel_Id`),
  ADD CONSTRAINT `fk_raporu_verilen_deney` FOREIGN KEY (`deney_id`) REFERENCES `deney` (`Deney_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
