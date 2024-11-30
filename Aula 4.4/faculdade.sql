-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: Faculdade
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `Alunos`
--

DROP TABLE IF EXISTS `Alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alunos` (
  `nome` varchar(255) NOT NULL,
  `matricula` varchar(7) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `curso` int DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `curso` (`curso`),
  CONSTRAINT `Alunos_ibfk_1` FOREIGN KEY (`curso`) REFERENCES `Departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alunos`
--

LOCK TABLES `Alunos` WRITE;
/*!40000 ALTER TABLE `Alunos` DISABLE KEYS */;
INSERT INTO `Alunos` VALUES ('Yara Souza','bfz6168','2001-03-21','Rua Independência,48,Pinheiros',4),('Yara Teixeira','bim5023','2006-11-06','Rua Acácias,5,Vila Madalena',3),('Fernanda Duarte','bqw1843','2006-02-05','Rua Moinho,48,Morumbi',1),('Nicolas Duarte','bvw2683','2004-03-05','Rua Flores,75,Alto da Boa Vista',4),('Mariana Monteiro','cte2816','2003-09-03','Rua Comércio,9,Santa Teresa',4),('Carlos Pereira','cvm8114','2004-02-06','Rua Imperador,80,Morumbi',2),('Igor Nascimento','djz5659','2004-09-20','Rua José de Alencar,75,Brooklin',1),('Pedro Mendes','dkn8378','2005-10-14','Rua Paz,57,Morumbi',4),('Sofia Rodrigues','eeu9842','2005-09-16','Rua Comércio,48,Cidade Jardim',5),('Sofia Souza','fdq2292','2001-10-06','Rua XV de Novembro,67,Itaim Bibi',3),('Gabriel Teixeira','fsk9640','2006-07-11','Rua Bosque,35,Bela Vista',3),('Olivia Santos','gxn4700','2000-07-04','Rua Liberdade,54,Morumbi',4),('Olivia Cardoso','hsw6682','2000-10-09','Rua Paulista,95,Pinheiros',1),('Zeca Monteiro','jdk3397','2001-08-15','Rua Lazer,50,Avenida Paulista',3),('Juliana Lima','kdi2836','2002-06-14','Rua Acácias,73,Vila Madalena',3),('Xavier Silva','kdw1855','2006-09-21','Rua Jasmins,87,Alto da Boa Vista',1),('Rafael Mendes','knf5377','2006-05-15','Rua Flores,23,Campo Belo',4),('William Rodrigues','mhx4934','2000-04-12','Rua Paulista,87,Itaim Bibi',2),('Valentina Ribeiro','mix7739','2005-07-11','Rua Acácias,94,Parque das Nações',3),('Fernanda Santos','mvx5785','2004-07-19','Rua Lazer,53,Morumbi',4),('Daniela Souza','mzb1046','2004-12-23','Rua Lazer,52,Vila Madalena',4),('Quésia Costa','pfu4946','2004-08-18','Rua Acácias,4,Pinheiros',2),('Rafael Monteiro','pur1857','2005-08-22','Rua Bandeirantes,92,Campo Belo',1),('Bruno Freitas','pxb2850','2006-12-24','Rua XV de Novembro,44,Tucuruvi',5),('Fernanda Monteiro','pzf9279','2002-03-14','Rua Sol,14,Vila Mariana',5),('Mariana Ribeiro','qgz2976','2000-06-03','Rua Bandeirantes,72,Avenida Paulista',1),('Olivia Costa','qyy9703','2004-05-11','Rua Brasil,71,Tatuapé',1),('Daniela Lima','rgh922','2000-03-19','Rua José de Alencar,23,Morumbi',4),('Thiago Barbosa','rqt7756','2004-12-06','Rua XV de Novembro,1,Tatuapé',1),('Carlos Rodrigues','sfi1257','2003-07-28','Rua Moinho,19,Cidade Jardim',5),('Helena Araújo','sfk9368','2008-02-12','Rua Independência,42,São João',2),('Juliana Santos','skd5735','2001-02-03','Rua Imperador,49,Vila Mariana',2),('Carlos Teixeira','sqj6766','2000-03-29','Rua Sol,48,Liberdade',3),('Ana Pereira','ssx3592','2001-02-10','Rua Santa Catarina,36,Tatuapé',3),('Bruno Correia','tbu1809','2002-07-31','Rua Independência,39,Santa Teresa',5),('Sofia Oliveira','tgk7080','2000-04-17','Rua Lazer,75,São João',3),('Lucas Almeida','tml7899','2003-10-22','Rua Lazer,6,Vila Madalena',2),('Xavier Oliveira','ujm2868','2004-06-24','Rua Lazer,67,Vila Progredior',1),('Juliana Cardoso','ulh3242','2007-05-22','Rua Santa Catarina,14,Tatuapé',3),('Nicolas Pereira','uto4902','2006-04-06','Rua Bosque,19,Centro',1),('Eduardo Correia','voa5651','2003-04-03','Rua Santa Catarina,87,Campo Belo',3),('Úrsula Araújo','vrn7674','2005-06-10','Rua Bosque,9,Vila Progredior',3),('Xavier Costa','vuv6384','2000-01-09','Rua Flores,23,Pinheiros',4),('Bruno Lima','wnk6816','2007-09-12','Rua Comércio,2,Liberdade',2),('Rafael Ferreira','wva444','2000-07-11','Rua Santa Catarina,16,São João',2),('Mariana Duarte','yay7355','2004-09-27','Rua Jasmins,36,Cidade Jardim',4),('Úrsula Martins','yiu1098','2006-01-09','Rua Brasil,47,Bela Vista',3),('Quésia Costa','yjk7280','2005-07-03','Rua Moinho,78,Alto da Boa Vista',3),('Quésia Carvalho','yxr9931','2005-05-14','Rua Jasmins,87,Itaim Bibi',1),('Rafael Cardoso','zdo9059','2001-09-19','Rua Comércio,7,Brooklin',5);
/*!40000 ALTER TABLE `Alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departamento`
--

DROP TABLE IF EXISTS `Departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departamento` (
  `nome` varchar(255) NOT NULL,
  `id` int NOT NULL,
  `local` varchar(100) DEFAULT NULL,
  `chefe` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chefe` (`chefe`),
  CONSTRAINT `Departamento_ibfk_1` FOREIGN KEY (`chefe`) REFERENCES `Professores` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamento`
--

LOCK TABLES `Departamento` WRITE;
/*!40000 ALTER TABLE `Departamento` DISABLE KEYS */;
INSERT INTO `Departamento` VALUES ('Departamento de Engenharia Civil',1,'Prédio Y','24783798056'),('Departamento de Medicina',2,'Prédio M','28309824291'),('Departamento de Direito',3,'Prédio S','29398651477'),('Departamento de Ciência da Computação',4,'Prédio T','83804819640'),('Departamento de Psicologia',5,'Prédio K','32256137754');
/*!40000 ALTER TABLE `Departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disciplinas`
--

DROP TABLE IF EXISTS `Disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Disciplinas` (
  `nome` varchar(255) NOT NULL,
  `carga_horaria` int DEFAULT NULL,
  `ementa` text,
  `pre_requisito` varchar(100) DEFAULT NULL,
  `curso` int DEFAULT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disciplinas`
--

LOCK TABLES `Disciplinas` WRITE;
/*!40000 ALTER TABLE `Disciplinas` DISABLE KEYS */;
INSERT INTO `Disciplinas` VALUES ('Algoritmos e Estruturas de Dados',60,'87l88x129ALuKlr3kQUkHkuOohTeyw','-',4),('Anatomia Humana',45,'EfPf1ZBkjgW4WU9FSLW4W3YHe1bWNM','-',2),('Cálculo Diferencial e Integral',45,'GlDUVKed0PpfjqDtQBeKetb1O6j2Xw','-',1),('Direito Civil',90,'z3pLOuYZCDkQb2JBmLZNFSUGoQR3NL','-',3),('Direito Constitucional',60,'OUqMAsYo0LD6QPnJL9rupCYHZkiUHV','-',3),('Direito Penal',90,'EVTl62Fc5z59mT6ibVMdMlcg9zjUmM','-',3),('Estruturas de Concreto',90,'UQ30mCiVXsYrCHLTIgM38s9DEUNPhl','-',1),('Farmacologia',90,'GzBFwGRltYAc8dU3TwzOyVch8Jer1F','-',2),('Fisiologia',30,'uWiS6P8JpbLHBvQVXtQNxZ0pHsKbTA','-',2),('Inteligência Artificial',30,'q1VTpnZ3c8Izo9WK6gvMBFiJh120fj','-',4),('Mecânica dos Solos',90,'SuDXrsyXpb5CdXORfgVduAij51hJVx','-',1),('Neuropsicologia',45,'GeWTp2ZhJsuiBHmQI3fAZpQQ0EpL7A','-',5),('Programação Orientada a Objetos',45,'RqJxlI3WCGBtiiGAvo2DiuOZHkPqxP','-',4),('Psicologia do Desenvolvimento',60,'a8sFCSfT3mvPSmlD6Mt37Ulg2k3ADd','-',5),('Teorias da Personalidade',45,'qRZXDyuHlIxKkBAVRs51SsDTU0kbI6','-',5);
/*!40000 ALTER TABLE `Disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professores`
--

DROP TABLE IF EXISTS `Professores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Professores` (
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `contato` varchar(255) DEFAULT NULL,
  `inicio_contrato` date DEFAULT NULL,
  `id_depto` int DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professores`
--

LOCK TABLES `Professores` WRITE;
/*!40000 ALTER TABLE `Professores` DISABLE KEYS */;
INSERT INTO `Professores` VALUES ('William Mendes','21522424575','(31)529032826','2004-06-30',3),('Pedro Pereira','24783798056','(31)673168471','2006-01-23',1),('Ana Mendes','25197866601','(31)538883955','2004-12-05',2),('Fernanda Ribeiro','28309824291','(31)212046015','2005-07-13',2),('Úrsula Vieira','29398651477','(31)447540181','2002-10-05',3),('Eduardo Lima','31547969221','(31)209300863','2005-02-02',1),('William Rodrigues','32256137754','(31)840243014','2007-08-27',5),('Nicolas Gomes','40954207541','(31)319436818','2001-03-31',2),('Daniela Almeida','42023746838','(31)825857721','2007-12-16',1),('Eduardo Duarte','43960600250','(31)149896597','2001-05-17',5),('Eduardo Souza','52237366307','(31)248044597','2006-09-09',4),('Olivia Monteiro','56788404703','(31)226956058','2000-05-16',3),('Carlos Gomes','60003840780','(31)513400865','2006-03-15',1),('Zeca Gomes','71925637735','(31)416809115','2004-08-04',2),('Úrsula Costa','76744292682','(31)385950303','2001-10-28',1),('Lucas Pereira','78354632444','(31)184064800','2003-11-10',3),('William Correia','83804819640','(31)687913186','2006-09-04',4),('Úrsula Correia','90053203981','(31)251910700','2003-06-28',1),('Yara Gomes','90517920569','(31)980264775','2002-07-27',1),('Ana Duarte','98654109965','(31)117718494','2004-09-08',3);
/*!40000 ALTER TABLE `Professores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disciplina`
--

DROP TABLE IF EXISTS `aluno_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_disciplina` (
  `aluno` varchar(255) NOT NULL,
  `disciplina` varchar(100) NOT NULL,
  PRIMARY KEY (`aluno`,`disciplina`),
  KEY `disciplina` (`disciplina`),
  CONSTRAINT `aluno_disciplina_ibfk_1` FOREIGN KEY (`aluno`) REFERENCES `Alunos` (`matricula`),
  CONSTRAINT `aluno_disciplina_ibfk_2` FOREIGN KEY (`disciplina`) REFERENCES `Disciplinas` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disciplina`
--

LOCK TABLES `aluno_disciplina` WRITE;
/*!40000 ALTER TABLE `aluno_disciplina` DISABLE KEYS */;
INSERT INTO `aluno_disciplina` VALUES ('bfz6168','Algoritmos e Estruturas de Dados'),('bvw2683','Algoritmos e Estruturas de Dados'),('cte2816','Algoritmos e Estruturas de Dados'),('mvx5785','Algoritmos e Estruturas de Dados'),('mzb1046','Algoritmos e Estruturas de Dados'),('cvm8114','Anatomia Humana'),('pfu4946','Anatomia Humana'),('qyy9703','Cálculo Diferencial e Integral'),('fdq2292','Direito Civil'),('fsk9640','Direito Civil'),('ssx3592','Direito Civil'),('kdi2836','Direito Constitucional'),('mix7739','Direito Constitucional'),('ssx3592','Direito Constitucional'),('bim5023','Direito Penal'),('ulh3242','Direito Penal'),('yiu1098','Direito Penal'),('bqw1843','Estruturas de Concreto'),('hsw6682','Estruturas de Concreto'),('pur1857','Estruturas de Concreto'),('qgz2976','Estruturas de Concreto'),('uto4902','Estruturas de Concreto'),('cvm8114','Farmacologia'),('pfu4946','Farmacologia'),('sfk9368','Farmacologia'),('skd5735','Fisiologia'),('tml7899','Fisiologia'),('mvx5785','Inteligência Artificial'),('yay7355','Inteligência Artificial'),('bqw1843','Mecânica dos Solos'),('djz5659','Mecânica dos Solos'),('rqt7756','Mecânica dos Solos'),('eeu9842','Neuropsicologia'),('tbu1809','Neuropsicologia'),('yay7355','Programação Orientada a Objetos'),('pzf9279','Psicologia do Desenvolvimento'),('sfi1257','Teorias da Personalidade');
/*!40000 ALTER TABLE `aluno_disciplina` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Diego`@`localhost`*/ /*!50003 TRIGGER `verifica_disciplina_aluno` BEFORE INSERT ON `aluno_disciplina` FOR EACH ROW BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Alunos a
        INNER JOIN Disciplinas d ON a.curso = d.curso
        WHERE a.matricula = NEW.aluno
          AND d.nome = NEW.disciplina
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Aluno não pode se inscrever nessa disciplina';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `professor_disciplina`
--

DROP TABLE IF EXISTS `professor_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_disciplina` (
  `professor` varchar(11) NOT NULL,
  `disciplina` varchar(100) NOT NULL,
  PRIMARY KEY (`professor`,`disciplina`),
  KEY `disciplina` (`disciplina`),
  CONSTRAINT `professor_disciplina_ibfk_1` FOREIGN KEY (`professor`) REFERENCES `Professores` (`cpf`),
  CONSTRAINT `professor_disciplina_ibfk_2` FOREIGN KEY (`disciplina`) REFERENCES `Disciplinas` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_disciplina`
--

LOCK TABLES `professor_disciplina` WRITE;
/*!40000 ALTER TABLE `professor_disciplina` DISABLE KEYS */;
INSERT INTO `professor_disciplina` VALUES ('40954207541','Anatomia humana'),('76744292682','Cálculo Diferencial e Integral'),('31547969221','Estruturas de Concreto');
/*!40000 ALTER TABLE `professor_disciplina` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Diego`@`localhost`*/ /*!50003 TRIGGER `verifica_disciplina` BEFORE INSERT ON `professor_disciplina` FOR EACH ROW BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Professores p
        INNER JOIN Disciplinas d ON p.id_depto = d.curso
        WHERE p.cpf = NEW.professor
          AND d.nome = NEW.disciplina
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Professor não pode lecionar essa disciplina';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `qte_alunos`
--

DROP TABLE IF EXISTS `qte_alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qte_alunos` (
  `qte_alunos` bigint NOT NULL DEFAULT '0',
  `disciplina` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qte_alunos`
--

LOCK TABLES `qte_alunos` WRITE;
/*!40000 ALTER TABLE `qte_alunos` DISABLE KEYS */;
INSERT INTO `qte_alunos` VALUES (1,'Direito Constitucional'),(1,'Programação Orientada a Objetos'),(1,'Teorias da Personalidade'),(2,'Anatomia Humana'),(2,'Direito Civil'),(2,'Fisiologia'),(2,'Inteligência Artificial'),(2,'Neuropsicologia'),(3,'Algoritmos e Estruturas de Dados'),(3,'Farmacologia'),(3,'Mecânica dos Solos'),(5,'Estruturas de Concreto');
/*!40000 ALTER TABLE `qte_alunos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30 16:57:29
