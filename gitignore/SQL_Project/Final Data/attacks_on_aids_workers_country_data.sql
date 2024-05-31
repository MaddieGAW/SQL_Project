-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: attacks_on_aids_workers
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `country_data`
--

DROP TABLE IF EXISTS `country_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_data` (
  `year` int DEFAULT NULL,
  `country_iso` text,
  `country_fatalities` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_data`
--

LOCK TABLES `country_data` WRITE;
/*!40000 ALTER TABLE `country_data` DISABLE KEYS */;
INSERT INTO `country_data` VALUES (1997,'706',49),(1997,'180',2291),(1997,'694',40),(1997,'231',84),(1997,'024',5258),(1997,'178',41),(1998,'108',1238),(1998,'180',3376),(1998,'800',1161),(1998,'694',0),(1998,'729',4046),(1998,'706',4),(1998,'231',958),(1998,'024',50810),(1999,'706',110),(1999,'694',113),(1999,'024',73725),(1999,'729',2439),(1999,'231',18839),(1999,'108',1718),(1999,'430',529),(1999,'404',339),(2000,'706',33),(2000,'729',3116),(2000,'024',3957),(2000,'508',2),(2000,'231',1413),(2000,'404',449),(2000,'180',1680),(2000,'694',0),(2000,'324',1345),(2000,'108',3891),(2001,'706',72),(2001,'729',4277),(2001,'180',2379),(2001,'108',3917),(2001,'120',4),(2001,'450',2),(2001,'024',9113),(2001,'140',52),(2002,'108',2136),(2002,'180',6077),(2002,'706',83),(2002,'430',36),(2002,'729',9329),(2002,'710',28),(2002,'800',1861),(2002,'024',275),(2002,'178',1),(2003,'180',3405),(2003,'800',2839),(2003,'404',173),(2003,'706',764),(2003,'384',1201),(2003,'430',324),(2003,'729',8159),(2003,'710',16),(2003,'108',1630),(2003,'686',9),(2003,'232',24),(2003,'024',6),(2004,'180',400),(2004,'706',926),(2004,'404',184),(2004,'566',2398),(2004,'800',1415),(2004,'729',11451),(2004,'384',494),(2005,'706',563),(2005,'404',353),(2005,'729',1886),(2005,'716',8),(2005,'454',0),(2005,'148',515),(2005,'800',1092),(2005,'180',565),(2005,'450',3),(2006,'729',1662),(2006,'180',412),(2006,'706',1166),(2006,'140',291),(2006,'710',16),(2006,'148',1905),(2006,'686',206),(2006,'231',366),(2006,'454',0),(2006,'232',2),(2006,'426',2),(2007,'454',1),(2007,'729',2157),(2007,'404',963),(2007,'706',2052),(2007,'140',218),(2007,'148',842),(2007,'800',308),(2007,'466',18),(2007,'834',8),(2007,'012',689),(2007,'108',63),(2008,'148',272),(2008,'231',639),(2008,'729',2119),(2008,'706',2076),(2008,'508',2),(2008,'108',197),(2008,'454',3),(2008,'120',234),(2008,'404',1156),(2008,'834',7),(2008,'180',2269),(2008,'694',7),(2009,'706',1137),(2009,'180',5119),(2009,'729',2874),(2009,'231',1862),(2009,'508',4),(2009,'430',0),(2009,'894',16),(2009,'404',185),(2009,'140',260),(2009,'478',2),(2009,'148',261),(2009,'800',158),(2009,'466',74),(2010,'231',1588),(2010,'706',3655),(2010,'180',1458),(2010,'800',289),(2010,'404',219),(2010,'586',8126),(2010,'729',1756),(2010,'450',3),(2010,'562',21),(2010,'120',6),(2010,'148',109),(2010,'454',0),(2010,'050',612),(2010,'694',0),(2010,'434',0),(2011,'706',2009),(2011,'729',4041),(2011,'562',25),(2011,'586',4535),(2011,'140',204),(2011,'834',36),(2011,'180',625),(2011,'434',5532),(2011,'104',1440),(2011,'384',817),(2011,'800',29),(2011,'231',655),(2011,'404',207),(2011,'728',1865),(2011,'148',17),(2011,'566',2472),(2011,'108',112),(2012,'586',6131),(2012,'706',3364),(2012,'686',24),(2012,'728',4110),(2012,'404',514),(2012,'729',2276),(2012,'120',5),(2012,'562',15),(2012,'180',1442),(2012,'788',14),(2012,'148',3),(2012,'434',552),(2012,'144',39),(2012,'231',885),(2013,'586',4472),(2013,'180',1973),(2013,'706',3172),(2013,'404',771),(2013,'686',15),(2013,'728',4368),(2013,'729',6822),(2013,'566',4686),(2013,'478',0),(2013,'104',471),(2013,'800',34),(2013,'140',2559),(2013,'231',584),(2013,'434',443),(2013,'466',908),(2014,'728',6447),(2014,'120',1366),(2014,'706',4469),(2014,'140',3618),(2014,'729',4165),(2014,'524',6),(2014,'466',382),(2014,'586',5419),(2014,'404',611),(2014,'116',23),(2014,'180',1230),(2014,'148',50),(2014,'434',3350),(2014,'231',335),(2014,'834',29),(2014,'204',0),(2014,'324',13),(2014,'800',195),(2014,'104',501),(2015,'728',3567),(2015,'706',4137),(2015,'729',3496),(2015,'894',8),(2015,'140',525),(2015,'180',1762),(2015,'324',34),(2015,'231',811),(2015,'104',1287),(2015,'887',17496),(2015,'466',434),(2015,'120',1439),(2015,'434',3081),(2015,'586',4548),(2015,'800',29),(2015,'404',503),(2015,'050',502),(2015,'108',1111),(2015,'710',211),(2015,'694',2),(2016,'728',3686),(2016,'887',15661),(2016,'729',3904),(2016,'854',81),(2016,'706',5950),(2016,'180',1740),(2016,'024',115),(2016,'140',739),(2016,'050',420),(2016,'368',56331),(2016,'466',320),(2016,'566',4896),(2016,'275',177),(2016,'404',226),(2016,'562',367),(2016,'586',2216),(2017,'887',17650),(2017,'466',946),(2017,'760',54386),(2017,'706',6122),(2017,'728',4859),(2017,'566',4949),(2017,'004',36607),(2017,'729',1304),(2017,'434',1708),(2017,'140',1832),(2017,'104',1408),(2017,'586',1721),(2017,'180',3211),(2017,'800',66),(2017,'368',31950),(2017,'694',5),(2017,'404',740),(2017,'148',296),(2017,'450',210),(2018,'728',1716),(2018,'332',267),(2018,'004',43264),(2018,'275',413),(2018,'434',1226),(2018,'760',30035),(2018,'180',3192),(2018,'887',34275),(2018,'706',5703),(2018,'788',34),(2018,'140',1171),(2018,'466',1747),(2018,'404',458),(2018,'694',10),(2018,'566',6162),(2018,'682',1514),(2018,'608',2098),(2018,'031',47),(2018,'144',26),(2018,'104',261),(2018,'562',506),(2018,'729',1054),(2018,'012',66),(2018,'558',354),(2018,'231',1579),(2018,'050',272),(2018,'324',40),(2018,'800',146),(2018,'320',799),(2018,'120',1663),(2018,'368',5221),(2018,'834',37),(2018,'484',9593),(2018,'222',960),(2018,'586',1226),(2019,'760',15629),(2019,'140',596),(2019,'368',3451),(2019,'320',1113),(2019,'887',28011),(2019,'608',1706),(2019,'384',46),(2019,'834',37),(2019,'466',1875),(2019,'050',391),(2019,'004',41608),(2019,'180',3801),(2019,'800',163),(2019,'231',670),(2019,'144',304),(2019,'729',776),(2019,'854',2216),(2019,'728',1801),(2019,'706',4839),(2019,'400',25),(2019,'068',36),(2019,'275',184),(2019,'332',468),(2019,'108',305),(2019,'484',9223),(2019,'566',5952),(2019,'120',1302),(2019,'404',329),(2019,'586',1157),(2019,'562',729),(2019,'508',691),(2019,'788',30),(2019,'148',567),(2019,'804',412),(2019,'104',1512),(2019,'434',2294),(2019,'686',4),(2019,'454',27),(2019,'218',12),(2019,'116',5),(2020,'417',2),(2020,'050',278),(2020,'434',1563),(2020,'180',6061),(2020,'508',1781),(2020,'760',8214),(2020,'728',2382),(2020,'404',355),(2020,'140',449),(2020,'368',2363),(2020,'586',838),(2020,'120',1762),(2020,'466',2856),(2020,'706',3341),(2020,'332',652),(2020,'004',31359),(2020,'450',358),(2020,'484',8364),(2020,'604',45),(2020,'887',19801),(2020,'729',959),(2020,'104',684),(2020,'356',1346),(2020,'231',4373),(2020,'800',288),(2020,'792',359),(2020,'170',1773),(2020,'854',2304),(2020,'566',8459),(2020,'152',25),(2020,'178',1),(2020,'562',1126),(2020,'400',16),(2020,'384',151),(2020,'716',21),(2020,'894',40),(2020,'072',7),(2020,'858',2),(2020,'108',330),(2021,'566',10880),(2021,'466',1913),(2021,'706',3437),(2021,'120',1653),(2021,'516',2),(2021,'004',42654),(2021,'728',2162),(2021,'332',789),(2021,'729',1651),(2021,'231',9152),(2021,'694',2),(2021,'222',425),(2021,'624',0),(2021,'140',1714),(2021,'430',7),(2021,'404',501),(2021,'760',5872),(2021,'180',6212),(2021,'586',1411),(2021,'104',10989),(2021,'887',18407),(2021,'144',5),(2021,'170',2111),(2021,'434',115),(2021,'275',333),(2021,'854',2374),(2021,'148',831),(2021,'800',507),(2021,'748',46),(2021,'426',9),(2021,'050',359),(2021,'562',1498),(2021,'450',303),(2021,'068',8),(2022,'104',19463),(2022,'616',2),(2022,'804',33803),(2022,'422',53),(2022,'120',1735),(2022,'728',2446),(2022,'180',6303),(2022,'340',694),(2022,'760',5951),(2022,'466',4863),(2022,'706',6521),(2022,'004',4035),(2022,'566',10757),(2022,'854',4244),(2022,'332',1495),(2022,'050',309),(2022,'887',7163),(2022,'404',701),(2022,'364',737),(2022,'140',873),(2022,'729',2065),(2022,'508',922),(2022,'818',273),(2022,'562',990),(2022,'384',45),(2022,'231',6921),(2022,'214',22),(2022,'368',1949),(2022,'788',1),(2022,'586',1778),(2022,'800',363),(2022,'275',223),(2022,'170',2300),(2022,'598',227),(2022,'862',827),(2022,'834',39),(2023,'729',13284),(2023,'728',1287),(2023,'140',583),(2023,'466',4320),(2023,'562',1149),(2023,'804',31150),(2023,'566',8764),(2023,'508',304),(2023,'854',8499),(2023,'231',4013),(2023,'706',8366),(2023,'104',15707),(2023,'275',22627),(2023,'624',5),(2023,'180',4035),(2023,'332',2286),(2023,'320',850),(2023,'694',32),(2023,'887',3235),(2023,'426',12),(2023,'760',6276),(2023,'834',20),(2023,'050',338),(2023,'422',247),(2023,'170',1983),(2023,'586',2333),(2023,'376',1503),(2023,'144',7),(2023,'356',1212),(2023,'404',1015),(2024,'728',355),(2024,'466',1158),(2024,'729',2833),(2024,'887',699),(2024,'508',176),(2024,'275',11502),(2024,'231',2515),(2024,'120',424),(2024,'760',2061),(2024,'706',1659),(2024,'566',2719),(2024,'804',6420),(2024,'180',1079),(2024,'148',121),(2024,'368',285),(2024,'586',672),(2024,'140',191);
/*!40000 ALTER TABLE `country_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-22 15:49:01