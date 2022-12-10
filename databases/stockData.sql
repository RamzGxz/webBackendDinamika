-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dinamikadatabase
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kodeBrg` varchar(50) NOT NULL,
  `namaBrg` varchar(50) NOT NULL,
  `hargaBrg` int NOT NULL,
  `jumlahBrg` int NOT NULL,
  `tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kodeBrg` (`kodeBrg`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'AP001','Amplop Coklat Biasa ',2000,145,'2022-12-10 05:13:27'),(2,'AP002','Amplop Coklat Tanggung ',3000,98,'2022-12-10 05:14:36'),(3,'AP003','Amplop Coklat Tali',5000,98,'2022-12-10 05:15:25'),(4,'AP004','Amplop Putih Kecil ',20000,2,'2022-12-10 05:31:06'),(5,'AP005','Amplop Putih Tanggung ',25000,4,'2022-12-10 05:32:39'),(6,'AP006','Amplop Kertas Besar ',35000,6,'2022-12-10 05:33:57'),(7,'BC001','Binder Clip Kecil ',500,4,'2022-12-10 05:49:25'),(8,'BC002','Binder Clip',1000,4,'2022-12-10 05:50:29'),(9,'BC003','Binder Clips Tanggung ',2000,36,'2022-12-10 05:53:06'),(10,'BC004','Binder Clips Besar ',2500,16,'2022-12-10 05:53:57'),(11,'BK001','Buku Tabungan ',1000,49,'2022-12-10 02:04:33'),(12,'BK002','Buku Absen ',6000,14,'2022-12-10 02:05:51'),(13,'BK003','Buku Tulis 38',4000,4,'2022-12-10 02:07:22'),(14,'BK004','Buku Tulis 58',5000,6,'2022-12-10 02:08:06'),(15,'BK005','Buku Streamin ',5000,40,'2022-12-10 02:08:58'),(16,'BK006','Buku Halus ',5000,12,'2022-12-10 02:09:50'),(17,'BK007','Buku Mewarnai ',5000,7,'2022-12-10 02:26:31'),(18,'BK008','Buku gambar A4',4000,8,'2022-12-10 02:27:44'),(19,'BK009','Buku Gambar A3',10000,18,'2022-12-10 02:28:30'),(20,'BK010','Buku Kwarto KAS ',13000,6,'2022-12-10 02:29:44'),(21,'BK012','Buku Okatavo',7000,0,'2022-12-10 02:31:43'),(22,'BK013','Buku Folio ',22000,8,'2022-12-10 02:32:42'),(23,'BK014','Buku Saku',4000,7,'2022-12-10 02:34:49'),(24,'BK015','Buku SKU Siaga ',2500,13,'2022-12-10 02:36:39'),(25,'BK017','Buku SKU Penegak',2500,5,'2022-12-10 02:39:48'),(26,'BK018','Buku Agenda Pramuka ',4000,16,'2022-12-10 02:40:42'),(27,'BK019','Buku Agenda Pramuka Sampul ',7000,4,'2022-12-10 02:41:46'),(28,'BK020','Buku UUD ',4000,11,'2022-12-10 02:42:36'),(29,'BK021','Buku Pelajaran Tajwid Karya ilmu ',4000,2,'2022-12-10 02:43:37'),(30,'BK022','Buku Tajwid Karya Apollo',6000,3,'2022-12-10 02:49:10'),(31,'BN001','Block Notes ',5000,21,'2022-12-10 03:07:04'),(32,'BS001','Bantalan Stampel ',9000,9,'2022-12-10 04:31:45'),(33,'BX','Box File ',18000,6,'2022-12-10 04:29:43'),(34,'BX001','Box File ',18000,6,'2022-12-10 02:30:40'),(35,'CP001','Clip Trogonal Kecil Biasa ',4000,10,'2022-12-10 05:47:22'),(36,'CP002','Clip Trigonal Bersar ',5000,18,'2022-12-10 05:48:28'),(37,'CU001','Cutter',3000,8,'2022-12-10 04:40:13'),(38,'DB001','Doble Tape Kertas',7000,0,'2022-12-10 05:56:55'),(39,'DB002','Doble Tape Spon',8000,7,'2022-12-10 05:57:57'),(40,'FG001','Figura ',0,6,'2022-12-10 05:45:18'),(41,'IB001','Isi Binder Kertas ',7000,1,'2022-12-10 03:04:47'),(42,'ID001','Id Card ',2500,53,'2022-12-10 05:09:29'),(43,'ID002','Tali Id Card',2500,19,'2022-12-10 05:11:46'),(44,'IS001','Isolasi Kertas Kecil ',2000,20,'2022-12-10 05:59:11'),(45,'IS002','Isolasi Bening Kecil ',2000,21,'2022-12-10 05:59:57'),(46,'IS003','Isolasi Bening Tanggung ',7000,1,'2022-12-10 06:01:22'),(47,'IS004','Isolasi Bening  Besar ',15000,1,'2022-12-10 06:02:40'),(48,'JP001','Jarum Pentul Biasa ',2000,0,'2022-12-10 03:08:25'),(49,'JP002','Jarum Pentul Stanless',6000,0,'2022-12-10 04:10:06'),(50,'KA001','Kran ',0,9,'2022-12-10 05:41:34'),(51,'KM001','Kamus Using Indonesia ',45000,1,'2022-12-10 02:52:18'),(52,'KM002','Kamus Bahasa Jawa ',40000,1,'2022-12-10 02:53:33'),(53,'KR001','Krayon ',10000,3,'2022-12-10 03:05:27'),(54,'KT001','Kertas Kado',2000,26,'2022-12-10 04:56:35'),(55,'KT002','Kertas Manilla ',4000,30,'2022-12-10 04:57:19'),(56,'KT003','Kertas Bufallo ',500,980,'2022-12-10 05:02:06'),(57,'KT004','Kertas Folio ',500,380,'2022-12-10 05:04:56'),(58,'KTS001','Kertas Origami Kecil ',3000,20,'2022-12-10 04:28:05'),(59,'KTS002','Kertas Origami Besar ',5000,9,'2022-12-10 04:28:49'),(60,'KW001','Kwitansi Kecil ',4000,10,'2022-12-10 02:59:21'),(61,'KW002','Kwitansi Tanggung ',7000,9,'2022-12-10 02:59:54'),(62,'LM001','Lem Bakar ',2000,73,'2022-12-10 04:41:14'),(63,'LM002','LEM STIK ',3000,5,'2022-12-10 04:41:49'),(64,'LM003','Lem Glukol ',2000,10,'2022-12-10 04:42:59'),(65,'LM004','Lem Povinal ',2500,44,'2022-12-10 04:44:11'),(66,'LT001','Latban Coklat ',15000,3,'2022-12-10 04:39:15'),(67,'MP001','Map Kertas ',2000,58,'2022-12-10 04:48:20'),(68,'MP002','Map Snailhacter ',5000,41,'2022-12-10 04:49:08'),(69,'MP003','Map Kancing ',5000,10,'2022-12-10 04:49:58'),(70,'MP004','Map L ',3000,6,'2022-12-10 04:51:13'),(71,'MT001','Mik Plastik ',500,380,'2022-12-10 05:08:21'),(72,'NT001','Nota 2 Ply',5000,3,'2022-12-10 03:03:55'),(73,'PCL001','Pencil Biasa',1000,2,'2022-12-08 09:16:23'),(74,'PCL002','Pencil ',5000,8,'2022-12-08 09:18:00'),(75,'PEN001','Polpen Standart',3000,26,'2022-12-09 05:45:49'),(76,'PEN002','Polpen Blive ',3000,0,'2022-12-09 05:47:05'),(77,'PEN003','Polpen G soft',3000,0,'2022-12-09 05:51:16'),(78,'PEN004','Polpen Merah ',3000,11,'2022-12-09 05:52:46'),(79,'PEN005','Polpen Biru ',3000,20,'2022-12-09 05:53:36'),(80,'PEN006','Polpen Pilot ',3000,18,'2022-12-09 05:58:20'),(81,'PEN007','Polpen Gel ',3000,29,'2022-12-09 06:00:18'),(82,'PEN008','Polpen Faster ',6000,12,'2022-12-09 06:03:13'),(83,'PEN009','Polpen Gel7000',7000,4,'2022-12-09 06:04:22'),(84,'PEN10','Polpen Ulir',2000,13,'2022-12-10 01:59:50'),(85,'PG001','Penggaris Besi',17000,2,'2022-12-08 09:00:51'),(86,'PG002','Penggaris Busur ',1000,36,'2022-12-08 09:03:04'),(87,'PG003','Penggaris Mika 30 cm',3000,3,'2022-12-08 09:04:46'),(88,'PK001','Pembersih Kerak ',60000,6,'2022-12-10 05:42:22'),(89,'PR001','Parfum Londry ',50000,10,'2022-12-10 05:43:22'),(90,'PS001','Plastisin Besar ',6000,0,'2022-12-10 03:01:56'),(91,'PS002','Plastisin Kecil ',3000,12,'2022-12-10 03:02:36'),(92,'PU001','Papan Ujian ',20000,9,'2022-12-10 05:55:43'),(93,'RE001','Refill Cutter ',9000,11,'2022-12-10 05:36:22'),(94,'RT001','Rautan ',5000,58,'2022-12-09 04:20:59'),(95,'SL001','Sampul Plastik LKS ',2000,48,'2022-12-10 04:24:09'),(96,'SN001','Stiking Notes',8000,8,'2022-12-10 04:53:55'),(97,'SP001','Spidol kecil ',2000,49,'2022-12-10 02:56:02'),(98,'SP002','Spidol Boardmaker ',9000,11,'2022-12-10 02:57:11'),(99,'SP003','Spidol Permanent ',9000,10,'2022-12-10 02:58:01'),(100,'SR001','Stapless',12000,4,'2022-12-10 04:46:54'),(101,'TC001','Tas Cantik ',0,4,'2022-12-10 05:37:55'),(102,'TS001','Tinta Stampel Yamura ',9000,5,'2022-12-10 04:33:24'),(103,'TS002','Tinta Stampel INK',13000,6,'2022-12-10 04:34:09'),(104,'TX001','Tipe X kertas',6000,6,'2022-12-08 09:10:02'),(105,'TX002','Tipe X Cair',5000,10,'2022-12-08 09:10:51'),(106,'TYPO001','Penghapus Biasa ',1000,80,'2022-12-08 09:12:37'),(107,'TYPO002','Penghapus Satdler ',4000,9,'2022-12-08 09:13:47'),(108,'VN001','Valent Lukis',3000,2,'2022-12-10 04:38:02');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-10 19:20:46
