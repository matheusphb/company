-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: company_db
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `Dnumber` int NOT NULL,
  `Dname` varchar(255) DEFAULT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependente` (
  `Essn` char(9) NOT NULL,
  `DependentName` varchar(255) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`DependentName`),
  CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `funcionario` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `Ssn` char(9) NOT NULL,
  `Fname` varchar(255) DEFAULT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(255) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int DEFAULT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `idx_funcionario_departamento` (`Dno`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `departamento` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `localizacoesdepartamento`
--

DROP TABLE IF EXISTS `localizacoesdepartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizacoesdepartamento` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(255) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  KEY `idx_localizacoesdepartamento_cidade` (`Dlocation`),
  CONSTRAINT `localizacoesdepartamento_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `departamento` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projeto` (
  `Pnumber` int NOT NULL,
  `Pname` varchar(255) DEFAULT NULL,
  `Plocation` varchar(255) DEFAULT NULL,
  `Dnum` int DEFAULT NULL,
  PRIMARY KEY (`Pnumber`),
  KEY `Dnum` (`Dnum`),
  CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`Dnum`) REFERENCES `departamento` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trabalhaem`
--

DROP TABLE IF EXISTS `trabalhaem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabalhaem` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `Pno` (`Pno`),
  CONSTRAINT `trabalhaem_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `funcionario` (`Ssn`),
  CONSTRAINT `trabalhaem_ibfk_2` FOREIGN KEY (`Pno`) REFERENCES `projeto` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `view_departamentos_gerentes`
--

DROP TABLE IF EXISTS `view_departamentos_gerentes`;
/*!50001 DROP VIEW IF EXISTS `view_departamentos_gerentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_departamentos_gerentes` AS SELECT 
 1 AS `Dname`,
 1 AS `Mgr_firstname`,
 1 AS `Mgr_lastname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_empregados_dependentes_gerentes`
--

DROP TABLE IF EXISTS `view_empregados_dependentes_gerentes`;
/*!50001 DROP VIEW IF EXISTS `view_empregados_dependentes_gerentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_empregados_dependentes_gerentes` AS SELECT 
 1 AS `Fname`,
 1 AS `Lname`,
 1 AS `Is_Manager`,
 1 AS `total_dependentes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_empregados_por_departamento_localidade`
--

DROP TABLE IF EXISTS `view_empregados_por_departamento_localidade`;
/*!50001 DROP VIEW IF EXISTS `view_empregados_por_departamento_localidade`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_empregados_por_departamento_localidade` AS SELECT 
 1 AS `Dname`,
 1 AS `Dlocation`,
 1 AS `total_empregados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_projetos_departamentos_gerentes`
--

DROP TABLE IF EXISTS `view_projetos_departamentos_gerentes`;
/*!50001 DROP VIEW IF EXISTS `view_projetos_departamentos_gerentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_projetos_departamentos_gerentes` AS SELECT 
 1 AS `Pname`,
 1 AS `Dname`,
 1 AS `Mgr_firstname`,
 1 AS `Mgr_lastname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_projetos_maior_numero_empregados`
--

DROP TABLE IF EXISTS `view_projetos_maior_numero_empregados`;
/*!50001 DROP VIEW IF EXISTS `view_projetos_maior_numero_empregados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_projetos_maior_numero_empregados` AS SELECT 
 1 AS `Pname`,
 1 AS `total_empregados`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_departamentos_gerentes`
--

/*!50001 DROP VIEW IF EXISTS `view_departamentos_gerentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_departamentos_gerentes` AS select `d`.`Dname` AS `Dname`,`f`.`Fname` AS `Mgr_firstname`,`f`.`Lname` AS `Mgr_lastname` from (`departamento` `d` join `funcionario` `f` on((`d`.`Mgr_ssn` = `f`.`Ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_empregados_dependentes_gerentes`
--

/*!50001 DROP VIEW IF EXISTS `view_empregados_dependentes_gerentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_empregados_dependentes_gerentes` AS select `f`.`Fname` AS `Fname`,`f`.`Lname` AS `Lname`,(case when (`d`.`Mgr_ssn` = `f`.`Ssn`) then 'Yes' else 'No' end) AS `Is_Manager`,count(`dep`.`DependentName`) AS `total_dependentes` from ((`funcionario` `f` left join `dependente` `dep` on((`f`.`Ssn` = `dep`.`Essn`))) left join `departamento` `d` on((`f`.`Ssn` = `d`.`Mgr_ssn`))) group by `f`.`Fname`,`f`.`Lname`,`Is_Manager` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_empregados_por_departamento_localidade`
--

/*!50001 DROP VIEW IF EXISTS `view_empregados_por_departamento_localidade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_empregados_por_departamento_localidade` AS select `d`.`Dname` AS `Dname`,`ld`.`Dlocation` AS `Dlocation`,count(`f`.`Ssn`) AS `total_empregados` from ((`departamento` `d` join `funcionario` `f` on((`d`.`Dnumber` = `f`.`Dno`))) join `localizacoesdepartamento` `ld` on((`d`.`Dnumber` = `ld`.`Dnumber`))) group by `d`.`Dname`,`ld`.`Dlocation` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_projetos_departamentos_gerentes`
--

/*!50001 DROP VIEW IF EXISTS `view_projetos_departamentos_gerentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_projetos_departamentos_gerentes` AS select `p`.`Pname` AS `Pname`,`d`.`Dname` AS `Dname`,`f`.`Fname` AS `Mgr_firstname`,`f`.`Lname` AS `Mgr_lastname` from ((`projeto` `p` join `departamento` `d` on((`p`.`Dnum` = `d`.`Dnumber`))) join `funcionario` `f` on((`d`.`Mgr_ssn` = `f`.`Ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_projetos_maior_numero_empregados`
--

/*!50001 DROP VIEW IF EXISTS `view_projetos_maior_numero_empregados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_projetos_maior_numero_empregados` AS select `p`.`Pname` AS `Pname`,count(`te`.`Essn`) AS `total_empregados` from (`projeto` `p` join `trabalhaem` `te` on((`p`.`Pnumber` = `te`.`Pno`))) group by `p`.`Pname` order by `total_empregados` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-11 17:45:17
