-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: banco_aula_gama_workbench
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `cidadeestado`
--

DROP TABLE IF EXISTS `cidadeestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidadeestado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cidade` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidadeestado`
--

LOCK TABLES `cidadeestado` WRITE;
/*!40000 ALTER TABLE `cidadeestado` DISABLE KEYS */;
INSERT INTO `cidadeestado` VALUES (1,'Belo Horizonte','MG'),(2,'Maceio','AL'),(3,'Sao Paulo','SP'),(4,'Fortaleza','CE'),(5,'Salvador','BA');
/*!40000 ALTER TABLE `cidadeestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `whatsapp` bigint DEFAULT NULL,
  `senha` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'camila.araujo@gmail.com','Camila Araujo',11988554851,'camilaaraujo'),(2,'filipe.araujo@gmail.com','Filipe Araujo',11922154721,'filipearaujo'),(3,'izabella.araujo@gmail.com','Izabella Araujo',11512151151,'izabellaaraujo'),(4,'guilherme.araujo@gmail.com','Guilherme Araujo',11985485481,'guilhermearaujo'),(5,'barbara.araujo@gmail.com','Barbara Araujo',11985484218,'barbaraaraujo'),(6,'rosana.araujo@gmail.com','Rosana Araujo',11955481523,'rosanaaraujo');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Adaptadores'),(2,'Ferramentas'),(3,'Eletronicos'),(4,'Casa');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `tipologradouro` varchar(45) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `cidadeestado` int NOT NULL,
  `cliente` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcidadeestado_idx` (`cidadeestado`),
  KEY `fkcliente_idx` (`cliente`),
  CONSTRAINT `fkcidadeestado` FOREIGN KEY (`cidadeestado`) REFERENCES `cidadeestado` (`id`),
  CONSTRAINT `fkclientes` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
INSERT INTO `enderecos` VALUES (1,'Residencial','Rua','Anori','25','Santos','1270','30133140',2,2),(2,'Comercial','Avenida','Anapurus','1216','Sao Gabriel','348','30130180',2,3),(3,'Residencial','Rodovia','Sao Jose','89','Savassi','585','30130160',3,4),(4,'Comercial','Rua','Terra','25','Centro','151','30154815',4,5),(7,'Residencial','Praca','Thais Silva','58','Fortaleza','515','30151515',5,6),(8,'Comerial','Rua','Lua dos Milagres','55','Alagoas','5152','30140151',5,6);
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoques`
--

DROP TABLE IF EXISTS `estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoques` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produtoid` int NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkprodutoid_idx` (`produtoid`),
  CONSTRAINT `fkprodutoid` FOREIGN KEY (`produtoid`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoques`
--

LOCK TABLES `estoques` WRITE;
/*!40000 ALTER TABLE `estoques` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `data` datetime NOT NULL,
  `pedidosstatus` int NOT NULL,
  `cliente` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcliente_idx` (`cliente`),
  KEY `fkpedidosstatus_idx` (`pedidosstatus`),
  CONSTRAINT `fkcliente` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fkpedidosstatus` FOREIGN KEY (`pedidosstatus`) REFERENCES `pedidosstatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'040401','2021-05-06 00:00:00',1,2),(2,'040406','2021-05-04 00:00:00',5,5),(3,'040402','2021-05-07 00:00:00',4,3),(4,'040403','2021-05-07 00:00:00',3,4),(5,'040404','2021-05-05 00:00:00',2,2),(6,'040408','2021-05-05 00:00:00',8,4);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidosstatus`
--

DROP TABLE IF EXISTS `pedidosstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidosstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosstatus`
--

LOCK TABLES `pedidosstatus` WRITE;
/*!40000 ALTER TABLE `pedidosstatus` DISABLE KEYS */;
INSERT INTO `pedidosstatus` VALUES (1,'novo pedido'),(2,'cancelado'),(3,'aguardando pagamento'),(4,'pagamento autorizado'),(5,'pagamento negado'),(6,'em separação'),(7,'em transporte'),(8,'entregue');
/*!40000 ALTER TABLE `pedidosstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` int NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `preco` int NOT NULL,
  `disponivel` int NOT NULL,
  `destaque` int NOT NULL,
  `departamento` int DEFAULT NULL,
  `estoque` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkdepartamento_idx` (`departamento`),
  KEY `fkestoque_idx` (`estoque`),
  CONSTRAINT `fkdepartamento` FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (3,25754,'ADAPTADOR BLUETOOH USB RECEPTOR',5,1,1,1,10),(4,15883,'CADEADO SEGURANCA PARA NOTEBOOK',7,1,0,2,2),(5,23213,'ANTENA TV DIGITAL KOLKE',9,1,1,3,6),(6,12263,'CAMERA WEBCAM LOGITECH',41,1,1,3,27),(7,26414,'ASPIRADOR NAPPO NLAR',87,1,0,4,2);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtospedido`
--

DROP TABLE IF EXISTS `produtospedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtospedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `precounitario` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `quantidade` int NOT NULL,
  `precototal` int NOT NULL,
  `pedidoid` int NOT NULL,
  `produtooid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidoid_idx` (`pedidoid`),
  KEY `produtoid_idx` (`produtooid`),
  CONSTRAINT `pedidoid` FOREIGN KEY (`pedidoid`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `produtoid` FOREIGN KEY (`produtooid`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtospedido`
--

LOCK TABLES `produtospedido` WRITE;
/*!40000 ALTER TABLE `produtospedido` DISABLE KEYS */;
INSERT INTO `produtospedido` VALUES (1,'5','ADAPTADOR BLUETOOH USB RECEPTOR',2,10,6,3),(2,'9','ANTENA TV DIGITAL KOLKE',4,36,4,5),(4,'41','ANTENA TV DIGITAL KOLKE',1,41,4,6),(5,'7','CADEADO SEGURANCA PARA NOTEBOOK',10,70,2,4);
/*!40000 ALTER TABLE `produtospedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 20:15:02
