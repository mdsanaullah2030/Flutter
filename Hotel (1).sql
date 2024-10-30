-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `checkindate` date DEFAULT NULL,
  `checkoutdate` date DEFAULT NULL,
  `totalprice` float NOT NULL,
  `hotel_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhacdq9bfa3r9xdimovsnonbyi` (`hotel_id`),
  KEY `FKq83pan5xy2a6rn0qsl9bckqai` (`room_id`),
  KEY `FKkgseyy7t56x7lkjgu3wah5s3t` (`user_id`),
  CONSTRAINT `FKhacdq9bfa3r9xdimovsnonbyi` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  CONSTRAINT `FKkgseyy7t56x7lkjgu3wah5s3t` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKq83pan5xy2a6rn0qsl9bckqai` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2024-10-01','2024-10-03',5000,1,1,1),(2,'2024-10-01','2024-10-03',7000,8,23,1);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `max_price` float NOT NULL,
  `min_price` float NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `laoction_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqgqqgwl2smsncthvp6ejvksk0` (`laoction_id`),
  CONSTRAINT `FKqgqqgwl2smsncthvp6ejvksk0` FOREIGN KEY (`laoction_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,' Gulshan Avenue Gulshan ,Dhaka','Renaissance Dhaka Gulshan Hotel_52cec6d5-33c2-42b4-86f2-444daa0672d0',5000,3000,'Renaissance Dhaka Gulshan Hotel','*****',1),(2,' Road Banani C/A, Dhaka City','Hotel Sarina Dhaka_7bcf8c73-6309-478d-8395-3f0e91b10ec8',6000,3500,'Hotel Sarina Dhaka','*****',1),(3,'Road 54/B, Gulshan, Dhaka City ','THE WAY Dhaka_79b421af-fcfa-499e-af5e-1d918a853d6f',8000,3500,'THE WAY Dhaka','****',1),(4,'Main Gulshan Avenue Plot-01,','The Westin Dhaka_d3d79978-75b3-4416-9e04-db960fee6dd0',5000,3500,'The Westin Dhaka','*****',1),(5,'Best Value of 191 places to stay',' Long Beach Hotel_1e746003-75f6-4238-84ed-720e8db3dce5',5000,3000,' Long Beach Hotel','***',2),(6,' Best Value of 191 places to stay ','Sea Pearl Beach Resort & Spa Cox\'s Bazar_ae9fb67f-039f-4bb2-a1dd-93b7f962a66e',5000,2000,'Sea Pearl Beach Resort & Spa Cox\'s Bazar','*****',2),(7,' Best Value of 191 places ','Ocean Paradise Hotel & Resort_fb26d9c7-e207-4da7-b85a-ea77714c9a37',6000,4000,'Ocean Paradise Hotel & Resort','***',2),(8,'kolatola, coxs bazar','Hotel Sea Cox_1a38e372-82a3-4e24-b854-e9cc366bd0f3',6000,4000,'Hotel Sea Cox','*****',2);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsahixf1v7f7xns19cbg12d946` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Dhaka_d8d73213-088c-4b65-a788-62ff416a28a6','Dhaka'),(2,'cox\'s bazar_c21c24a9-6624-4e5d-8638-84dd8a624954','cox\'s bazar'),(3,'Sylhet _1ab81eee-ddf5-4ba1-9f26-aed4948b113c','Sylhet '),(5,'kuakata _69738847-2c9b-4fc3-a97b-c180ae146706','kuakata '),(6,'Rajshahi _e23515fa-7f6c-4988-91ae-a618347a0b9f','Rajshahi '),(7,'chittagong _68d6a41e-6451-4587-92a1-82618325e79b','chittagong ');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adult_no` int NOT NULL,
  `area` int NOT NULL,
  `avilability` bit(1) NOT NULL,
  `child_no` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `room_type` varchar(255) DEFAULT NULL,
  `hotel_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdosq3ww4h9m2osim6o0lugng8` (`hotel_id`),
  CONSTRAINT `FKdosq3ww4h9m2osim6o0lugng8` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,2,2400,_binary '\0',1,'Single Room_136ae7bb-f04a-46ac-95c9-a1ee809a8171',2500,'Single Room',1),(2,2,2500,_binary '\0',1,'Double Room_c6f0804b-aa06-4044-bc57-f69ee4e25bed',4000,'Double Room',1),(3,2,2500,_binary '\0',1,'Single Room_328ad7dd-ac05-4b06-80b6-d1511c3a3b9f',3600,'Single Room',1),(4,2,2500,_binary '\0',1,'Double Room_e0dbeed6-33c5-4eb6-a883-6303f336300d',2500,'Double Room',2),(5,3,3000,_binary '\0',1,'Family Room_c5f79cf6-f43f-4a35-8e25-5dd9134a1a10',8000,'Family Room',2),(6,2,2000,_binary '\0',1,'Family Room_26a84182-0588-419b-9f97-9d580eb75791',2000,'Family Room',2),(7,3,3000,_binary '\0',1,'Superior Room_dc6a121e-0139-4594-b0aa-7d8f1a75f16e',7000,'Superior Room',2),(8,2,2000,_binary '\0',1,'Single Room_6f7e72d9-64d1-4204-b5db-dada716af6eb',2500,'Single Room',3),(9,2,3500,_binary '\0',1,'Double Room_12bc8f20-73a5-40ce-935e-4a85bdde8590',2500,'Double Room',3),(10,2,2500,_binary '\0',1,'Double Room_e59e12f1-04aa-4760-907e-cace343b3f73',3000,'Double Room',3),(11,3,2500,_binary '\0',2,'Single Room_443a8bd1-497e-42f4-a510-f71a26653e1c',6000,'Single Room',3),(12,2,2000,_binary '\0',2,'Family Room_28b7c4c4-66b0-4b90-b1c0-2ef51e50b906',4000,'Family Room',4),(13,4,500,_binary '\0',2,'Presidential Suite_2567b768-18d5-4dfd-bfc3-1007c9de6844',7000,'Presidential Suite',4),(14,2,2000,_binary '\0',1,'Double Room_dc3cc439-da93-496f-866f-1dfe4537e188',2500,'Double Room',5),(15,2,300,_binary '\0',1,'Triple Room_4a6825d5-fe1b-4345-84af-fdd593e28583',5000,'Triple Room',5),(16,2,250,_binary '\0',1,'Double Room_3765c10e-2208-474d-bd60-584b9b2bd3a5',2500,'Double Room',6),(17,2,200,_binary '\0',1,'Single Room_f5d59839-2aa1-47ad-ac97-0abeea7b9192',4000,'Single Room',6),(18,2,250,_binary '\0',2,'Triple Room_6ba5a73c-4cd1-44b7-897f-bd0cc6538bda',4500,'Triple Room',6),(19,2,250,_binary '\0',1,'Triple Room_3ea1e43c-0eda-42cc-9819-a081983fad0d',2500,'Triple Room',6),(20,2,250,_binary '\0',1,'Single Room_2c14872d-2fbf-4e3c-8c6a-9cc094a9ae40',2500,'Single Room',7),(21,2,240,_binary '\0',2,'Superior Room_dc932c20-2c5d-4e73-9fcc-04034e12fe64',4000,'Superior Room',7),(22,2,250,_binary '\0',1,'Family Room_7f121001-af1d-45f1-bac3-6ab860f95e35',4000,'Family Room',7),(23,2,250,_binary '\0',1,'Single Room_0d6ef1e5-37df-4515-8cc9-275d3e451813',3500,'Single Room',8),(24,2,250,_binary '\0',1,'Double Room_bf9b148f-94e0-4d42-8c16-5d3d18801bc9',4000,'Double Room',8);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_logged_out` bit(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe32ek7ixanakfqsdaokm4q9y2` (`user_id`),
  CONSTRAINT `FKe32ek7ixanakfqsdaokm4q9y2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFiYWJAZ21haWwuY29tIiwicm9sZSI6IlVTRVIiLCJpYXQiOjE3MzAyNjM0ODIsImV4cCI6MTczMDM0OTg4Mn0.vg19bS98BK5gYLyXI0qtG1p_nGFuKh3QW-ZT7BOTWCv5DoOEF8Qr3FgQTZz9Sip_',1),(2,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFiYWJAZ21haWwuY29tIiwicm9sZSI6IlVTRVIiLCJpYXQiOjE3MzAyNjM0OTAsImV4cCI6MTczMDM0OTg5MH0.Kcg5BWkiwZLUocth48T0nHAHWg3taNJ7zt9cJ6uFZZ4EdDzdgIg7YDeVk6eetSxh',1),(3,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFiYWJAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMwMjYzNjMyLCJleHAiOjE3MzAzNTAwMzJ9.8zfo3qk0cYQ2_TG571kn2L7Q2EKG7loC__YCFHsPkMNfmcxStjJKc_YrjnU2QuKN',1),(4,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFiYWJAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMwMjY5MjM1LCJleHAiOjE3MzAzNTU2MzV9.mPgxG2lIyI1Rti3es4Pt_S24XlU5aFPINcDwCEwgcatcx2kZ2-srEBhpiIKE1yMH',1),(5,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFiYWJAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMwMjY5MjU1LCJleHAiOjE3MzAzNTU2NTV9.RlXn4CrgZNnB8Eu-E6GIuzz8yqONnIpaZ-cNlk44IZVhk7-2n8jSiCVXpLwDFrCS',1),(6,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJtYWhpQGdtYWlsLmNvbSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTczMDI2OTMwMiwiZXhwIjoxNzMwMzU1NzAyfQ._Sr1MTEYmdwn5J4vd4-kcnLLMrLQ24sF5_G1q0G3npJP1rXMxNmBxkoFcMzfJFdf',5),(7,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJLdXR1YkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDI2OTQ1MCwiZXhwIjoxNzMwMzU1ODUwfQ.bdOCKu7kZEsEZzkPFL9_H7h5LqX82gByazhQJoYUscpt4euyceuBSWqu-VaTTfF-',7),(8,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYWZpc0BnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDI2OTYzNCwiZXhwIjoxNzMwMzU2MDM0fQ.yYp9pYjjr8CbpKMh7kvpywkj-XHPu20S7YQkRva_NfpxF8ms6nIjMV2XGDrJIYm3',10),(9,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJLdXR1YkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDI2OTY1MSwiZXhwIjoxNzMwMzU2MDUxfQ.zprO7hpw5Mom-rNWdksix4QYuG6IRGsOFGDszrsCSUf8U4XY4AunDS39-eJzwndD',7),(10,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJLdXR1YkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDI2OTg2NCwiZXhwIjoxNzMwMzU2MjY0fQ.gg_0cUFupA3vPU9RTMReMvUA6sBcf70oo8STtFQsfF7hn2W47-7JcfCIPY1KoXuW',7);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cell` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_lock` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','HOTEL','USER') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UK19ln9le9v947dp777koraktgy` (`cell`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,_binary '','Dhaka','01741779995','2024-10-09','shabab@gmail.com','male','',_binary '','sanaullah','$2a$10$4C.bo0cZWuJ.C9NslombLeI..UOE0Q4r34tSHLRzXJCdq0fYZL2tu','ADMIN'),(5,_binary '\0','','1234243546','2024-10-18','mahi@gmail.com','male','https://avatars.githubusercontent.com/u/158471899?v=4',_binary '','mahi','$2a$10$g4uDuyds2FmYvDC.EJbpN.Qt6Ylx4JAjWq87O1hnOXQqGrYjxlfZi','ADMIN'),(7,_binary '','Dhaka','01723243545','2024-10-16','Kutub@gmail.com','male','https://avatars.githubusercontent.com/u/158472932?v=4',_binary '','Kutub','$2a$10$DtvZOhoQWVNtB5JnCwj5uuxjzMNzvvkKNQBpgOCbFuD7C.v2VSEre','USER'),(10,_binary '','Rajshahi','01323456771','2024-10-18','nafis@gmail.com','male','https://avatars.githubusercontent.com/u/158472502?v=4',_binary '','Nafis','$2a$10$xvR6wtg0mB50aBiM93fDnu27aME7W9YmPTIYyh/iMBPGpcwIOJilK','USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30 12:38:00
