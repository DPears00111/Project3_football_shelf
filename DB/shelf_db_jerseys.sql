-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shelf_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `jerseys`
--

DROP TABLE IF EXISTS `jerseys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jerseys` (
  `jersey_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int DEFAULT NULL,
  `jersey_name` varchar(255) DEFAULT NULL,
  `img_url_home` varchar(1265) DEFAULT NULL,
  `img_url_away` varchar(1265) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`jersey_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jerseys`
--

LOCK TABLES `jerseys` WRITE;
/*!40000 ALTER TABLE `jerseys` DISABLE KEYS */;
INSERT INTO `jerseys` VALUES (1,1,'Liverpool','https://i.pinimg.com/1200x/26/e8/4c/26e84cdd4827d573138f7dc6b812f957.jpg','https://i.pinimg.com/1200x/4e/37/47/4e37475403600cd9419c7cd1a4ff90cd.jpg',500.00,'Liverpool Home jersey 25/26 unisex'),(2,2,'Leeds United','https://images.footballfanatics.com/leeds-united/leeds-united-adidas-home-shirt-2025-26_ss5_p-202794464+pv-2+u-butdfyvyuzlmf4k7yffi+v-szkyt4iu3nbpq051bmo0.jpg?_hv=2&w=1018','https://i.pinimg.com/736x/87/25/26/872526917cfd1670620e2f7aa05d39f4.jpg',350.00,'Leeds United home jersey 25/26 unisex'),(3,3,'Manchester United','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuTBQp5B3GrUEkCWJ1YGMRJhIkeZartx0WXw&s','https://i.pinimg.com/1200x/53/99/87/53998764265bae883566db6f29ccca89.jpg',400.00,'Manchester United home jersey 25/26 unisex'),(4,4,'Newcastle United','https://i.pinimg.com/1200x/ff/d3/b1/ffd3b180f7c7a86f8a41d4b8768fd905.jpg','https://i.pinimg.com/1200x/87/43/ca/8743ca523a40f10914e74d3056002e88.jpg',500.00,NULL),(5,5,'Nottingham Forest','https://shop.nottinghamforest.co.uk/cdn/shop/files/Home-Shirt-Ballys-3_800x.jpg?v=1755021319','https://i.pinimg.com/1200x/94/aa/1b/94aa1b1c7eff2c649f3b8247580f8ff3.jpg',250.00,NULL),(6,6,'Arsenal','https://i.pinimg.com/1200x/0a/ef/2f/0aef2f058797ecf2d6ef6b676ea0266b.jpg','https://i.pinimg.com/736x/7d/2f/e1/7d2fe13da9752c9938033073a76c6b61.jpg',500.00,NULL),(7,7,'Aston Villa','https://i.pinimg.com/1200x/1c/94/ca/1c94ca3f1e0183a10e07ff7fb2b7e718.jpg','https://i.pinimg.com/1200x/ef/a5/25/efa5254a9c1a7da4e08332312e8ef056.jpg',400.00,NULL),(8,8,'FulHam','https://i.pinimg.com/736x/99/8d/cf/998dcfdcfb6b8613e789bdb90c8c930d.jpg','https://i.pinimg.com/1200x/c1/f8/d6/c1f8d61b18d8d3f8d508867ddc3aa5a7.jpg',350.00,NULL),(9,9,'Brighton & Hove Albion','https://shop.brightonandhovealbion.com/siteimg/prodhires/6699-505.jpg','https://shop.brightonandhovealbion.com/siteimg/prodhires/6708-671.jpg',500.00,NULL),(10,10,'Chelsea','https://i.pinimg.com/736x/f8/94/d8/f894d8097f80209b80e4cf85f143dd57.jpg','https://i.pinimg.com/736x/e1/6a/d8/e16ad8c53cd47901b01ef69c3f98dc92.jpg',450.00,NULL),(11,11,'Tootenham Hotspur','https://i.pinimg.com/1200x/08/99/77/089977dcc2fc077bb7213d848fe89e9e.jpg','https://i.pinimg.com/1200x/86/f0/8c/86f08c47da38d81ab829606eb7f2950d.jpg',250.00,NULL),(12,12,'Manchester City','https://i.pinimg.com/736x/8f/3e/f0/8f3ef00c70200973705b293470da521f.jpg','https://i.pinimg.com/1200x/82/0d/35/820d35a9be43715d6878d34244873e90.jpg',500.00,NULL),(13,13,'Real Madrid','https://i.pinimg.com/1200x/f2/cf/db/f2cfdbbf040d6bf78c3664d4ab6cdb60.jpg','https://i.pinimg.com/1200x/d1/fc/d6/d1fcd6bd2d3ca5a071df901618376a94.jpg',550.00,NULL),(14,14,'Sevilla','https://i.pinimg.com/1200x/0a/f0/f7/0af0f795d58598711c3a78b1ab42220d.jpg','https://i.pinimg.com/1200x/ef/bb/ad/efbbad6d85fe2095916357c4cc8e5d29.jpg',300.00,NULL),(15,15,'Girona','https://i.pinimg.com/1200x/3e/ba/e5/3ebae5a1d6f69e19fa358862a687a0e4.jpg','https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgyWOXe184iiHidi1podXJjb52lJOPB3NZzNPVF49w5-81c0jv6DN-yap3orhmeDaOjvnLHDKsizR-nWEwfwcV2AcpO67bxSHs6Ww5ZgGgwtU6IO-ycFru2ePY0ZTeRAVLDIfQ8l4Zn2i4wc5D0QDelw7-2DYzLH3Z5KljmqKSMcGo6Hdx228Cjsv3d4hbO/s1000/girona-25-26-kits%20%286%29.jpg',450.00,NULL),(16,16,'Atletico Madrid','https://i.pinimg.com/1200x/2c/55/60/2c55600133433080b3fe1860fd0a0305.jpg','https://i.pinimg.com/1200x/18/1d/7e/181d7ed0f7d519fc43134d11271f043e.jpg',200.00,NULL),(17,17,'Barcelona','https://i.pinimg.com/1200x/8f/32/5a/8f325a52478201b47be4a79bbf12db1d.jpg','https://i.pinimg.com/1200x/1f/c1/ca/1fc1cadbb48bc9f21076badcf9098a59.jpg',350.00,NULL),(18,18,'Bayern Munich','https://i.pinimg.com/1200x/ee/d8/59/eed859b8a86506415e6703e9b1ebbc63.jpg','https://i.pinimg.com/1200x/d6/ba/52/d6ba52bd1db6f75f62cf3aab8942826f.jpg',400.00,NULL),(19,19,'Borussia Dortmund','https://shop.bvb.de/_next/image?url=https%3A%2F%2Flegends.broadleafcloud.com%2Fapi%2Fasset%2Fcontent%2F25920202.jpg%3FcontextRequest%3D%257B%2522forceCatalogForFetch%2522%3Afalse%2C%2522forceFilterByCatalogIncludeInheritance%2522%3Afalse%2C%2522forceFilterByCatalogExcludeInheritance%2522%3Afalse%2C%2522applicationId%2522%3A%252201HPFEAPMKNTF3D6JQ51DPH11R%2522%2C%2522tenantId%2522%3A%2522BVB%2522%257D&w=3840&q=85','https://i.pinimg.com/736x/fb/c8/d7/fbc8d77c5c1f737512caa4846cea0050.jpg',500.00,NULL),(20,20,'RB Leipzig','https://i.pinimg.com/1200x/33/53/b2/3353b2ee0b185d51a6d75c14c992badd.jpg','https://i.pinimg.com/1200x/3a/c1/6b/3ac16bbbdf31d9d3cb0be5c536dc166d.jpg',240.00,NULL),(21,21,'Juventus','https://i.pinimg.com/1200x/b0/8e/e3/b08ee399dac08801bf00b98922f0f7ad.jpg','https://i.pinimg.com/736x/30/ad/53/30ad53901fffc18efdbb9f02f6fcaf84.jpg',200.00,NULL),(22,22,'Roma','https://i.pinimg.com/736x/30/7f/da/307fdada6475e4b9545bf38e2ae74710.jpg','https://i.pinimg.com/736x/ba/28/f7/ba28f79b1b05bd146ab78f0691dbbe16.jpg',350.00,NULL),(23,23,'Inter Milan','https://i.pinimg.com/1200x/5b/c3/2c/5bc32c1a806acaed8e112e36737c9deb.jpg','https://i.pinimg.com/1200x/3d/d8/23/3dd823ef3e274f0cb5d0b3c71e643947.jpg',460.00,NULL),(24,24,'AC Milan','https://i.pinimg.com/1200x/f7/bb/2e/f7bb2ef373ebe32a78eb5b53bdeb451e.jpg','https://i.pinimg.com/1200x/cf/38/59/cf3859d004fd7a1261f87c0335f03452.jpg',500.00,NULL),(25,25,'PSG','https://i.pinimg.com/736x/3b/d0/03/3bd003a9e9e5a597afba5885d5a12d61.jpg','https://i.pinimg.com/1200x/77/f1/2b/77f12b1f9b61a66b8e0bda9ef0cb7fca.jpg',600.00,NULL),(26,26,'Olympique Marseille','https://i.pinimg.com/1200x/3c/63/f2/3c63f2d82f29d92a740a88aa70cfc5bb.jpg','https://i.pinimg.com/1200x/5e/79/57/5e79571d8c76133b0f9460bf97e25569.jpg',150.00,NULL);
/*!40000 ALTER TABLE `jerseys` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-21  9:08:59
