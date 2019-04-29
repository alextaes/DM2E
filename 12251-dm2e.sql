-- MySqlBackup.NET 2.0.6
-- Dump Time: 2019-02-19 12:52:47
-- --------------------------------------
-- Server version 5.7.23 MySQL Community Server (GPL)


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 
-- Definition of caractercat
-- 

DROP TABLE IF EXISTS `caractercat`;
CREATE TABLE IF NOT EXISTS `caractercat` (
  `caracteristica` int(2) NOT NULL,
  `categoria` int(11) NOT NULL,
  PRIMARY KEY (`caracteristica`,`categoria`),
  KEY `categoria` (`categoria`),
  CONSTRAINT `caractercat_ibfk_1` FOREIGN KEY (`caracteristica`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `caractercat_ibfk_2` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='tabla intermedia caracteristica categoria';

-- 
-- Dumping data for table caractercat
-- 

/*!40000 ALTER TABLE `caractercat` DISABLE KEYS */;
INSERT INTO `caractercat`(`caracteristica`,`categoria`) VALUES
(3,7),
(4,7),
(5,8),
(6,8),
(7,9),
(8,9),
(9,10),
(10,10);
/*!40000 ALTER TABLE `caractercat` ENABLE KEYS */;

-- 
-- Definition of caracteristicas
-- 

DROP TABLE IF EXISTS `caracteristicas`;
CREATE TABLE IF NOT EXISTS `caracteristicas` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- 
-- Dumping data for table caracteristicas
-- 

/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
INSERT INTO `caracteristicas`(`id`,`nombre`) VALUES
(1,'6 nucleos'),
(2,'All in one'),
(3,'Workstation'),
(4,'Gaming'),
(5,'27 pulgadas'),
(6,'Edge display'),
(7,'34 pulgadas'),
(8,'soporte VESA'),
(9,'Pantalla retina'),
(10,'desbloqueo facial'),
(11,'15 megapixels'),
(12,'Carga inalambrica');
/*!40000 ALTER TABLE `caracteristicas` ENABLE KEYS */;

-- 
-- Definition of categorias
-- 

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `padre` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- 
-- Dumping data for table categorias
-- 

/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias`(`id`,`nombre`,`padre`) VALUES
(1,'Ordenadores',0),
(2,'Monitores',0),
(3,'Camaras',0),
(4,'Smartphones',0),
(5,'Consolas',0),
(6,'Sobremesas',1),
(7,'Portatiles',1),
(8,'IPS',2),
(9,'Ultrawide',2),
(10,'Apple',4),
(11,'Samsung',4);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- 
-- Definition of precios
-- 

DROP TABLE IF EXISTS `precios`;
CREATE TABLE IF NOT EXISTS `precios` (
  `id_producto` int(11) NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `precio` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id_producto`,`id_tienda`),
  KEY `id_tienda` (`id_tienda`),
  CONSTRAINT `precios_1` FOREIGN KEY (`id_tienda`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `precios_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- 
-- Dumping data for table precios
-- 

/*!40000 ALTER TABLE `precios` DISABLE KEYS */;
INSERT INTO `precios`(`id_producto`,`id_tienda`,`precio`) VALUES
(1,1,690.90),
(2,2,939.00),
(3,3,1499.99),
(4,4,569.75),
(5,5,869.50),
(6,1,1009.10),
(7,3,579.00),
(8,2,699.80),
(9,2,899.00),
(10,5,929.99),
(11,3,230.80),
(12,4,225.00),
(13,4,329.95),
(14,1,859.75),
(15,5,1380.95),
(16,3,1119.00),
(17,6,987.90),
(18,4,543.22),
(19,6,780.00);
/*!40000 ALTER TABLE `precios` ENABLE KEYS */;

-- 
-- Definition of productocat
-- 

DROP TABLE IF EXISTS `productocat`;
CREATE TABLE IF NOT EXISTS `productocat` (
  `producto` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  PRIMARY KEY (`producto`,`categoria`),
  KEY `categoria` (`categoria`),
  CONSTRAINT `productocat_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productocat_ibfk_2` FOREIGN KEY (`producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='tabla intermedia producto categoria';

-- 
-- Dumping data for table productocat
-- 

/*!40000 ALTER TABLE `productocat` DISABLE KEYS */;
INSERT INTO `productocat`(`producto`,`categoria`) VALUES
(2,3),
(7,3),
(17,3),
(11,5),
(12,5),
(13,5),
(8,6),
(10,6),
(1,7),
(3,7),
(16,7),
(14,8),
(19,8),
(15,9),
(6,10),
(9,10),
(4,11),
(5,11),
(18,11);
/*!40000 ALTER TABLE `productocat` ENABLE KEYS */;

-- 
-- Definition of productos
-- 

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `foto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- 
-- Dumping data for table productos
-- 

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos`(`id`,`nombre`,`marca`,`foto`) VALUES
(1,'Notebook 15','HP','img/hp15.jpg'),
(2,'Alpha ILCE7M3','Sony','img/sony.jpg'),
(3,'GT83 Titan','Msi','img/msi.jpg'),
(4,'Galaxy S9','Samsung','img/s9.png'),
(5,'Galaxy Note 9','Samsung','img/note9.jpg'),
(6,'iPhone X','Apple','img/iphone.jpg'),
(7,'XT-20','Fujifilm','img/fujifilm.jpg'),
(8,'Vivomini','Asus','img/asusVivo.jpg'),
(9,'iPad Pro 2017','Apple','img/ipad.jpg'),
(10,'Ideacentre','Lenovo','img/lenovo.jpg'),
(11,'Playstation 4','Sony','img/ps4.jpg'),
(12,'XBox One S','Microsoft','img/xbox.jpg'),
(13,'Switch','Nintendo','img/switch.jpg'),
(14,'Predator','Acer','img/ips.jpg'),
(15,'UltraWQHD','Samsung','img/ultrawide.jpg'),
(16,'Macbook Air 2018','Apple','img/mac.jpg'),
(17,'EOS 650D','Canon','img/canon.jpg'),
(18,'A7','Samsung','img/a7.jpg'),
(19,'UltraSharp U2518D','Dell','img/dell.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- 
-- Definition of tiendas
-- 

DROP TABLE IF EXISTS `tiendas`;
CREATE TABLE IF NOT EXISTS `tiendas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `url` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `latitud` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `longitud` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- 
-- Dumping data for table tiendas
-- 

/*!40000 ALTER TABLE `tiendas` DISABLE KEYS */;
INSERT INTO `tiendas`(`id`,`nombre`,`url`,`tipo`,`latitud`,`longitud`) VALUES
(1,'PcComponentes','https://www.pccomponentes.com/','online','41.39155','2.16564'),
(2,'MacNificos','none','fisica','40.4460076','-3.6646809'),
(3,'Games Deal','none','fisica','37.994104','-1.126831'),
(4,'Amazon','https://www.amazon.es/','online','39.480196','-0.375595'),
(5,'Fnac','none','fisica','43.509434','-5.673465'),
(6,'El Corte Ingles','www.elcorteingles.com','online','43.509434','-5.673465');
/*!40000 ALTER TABLE `tiendas` ENABLE KEYS */;

-- 
-- Definition of usuarios
-- 

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `mail` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `tel` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `mensaje` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- 
-- Dumping data for table usuarios
-- 

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios`(`nombre`,`mail`,`tel`,`mensaje`) VALUES
('Alejandro','alejandro.taesp@gmail.com','666999888','esto es una prueba'),
('Antonio','antonio@gmail.com','112233','Hola a todos.'),
('Maria','maria@hotmail.com','5564437','Adios a todos.'),
('David Castro','sadfud@yahoo.es','567543','Hola Mundo'),
('Amparo','amparo@gmail.com','123456','Otra prueba mÃ¡s.'),
('Alfonso','alfon@yahoo.es','435546345','adios muy buenas');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2019-02-19 12:52:47
-- Total time: 0:0:0:0:21 (d:h:m:s:ms)
