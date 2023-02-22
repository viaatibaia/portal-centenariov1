-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.73-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema pjc_db
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ pjc_db;
USE pjc_db;

--
-- Table structure for table `pjc_db`.`banner`
--

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id unico do registro',
  `img` varchar(250) NOT NULL COMMENT 'Url da imagem do banner',
  `link` varchar(250) NOT NULL COMMENT 'Link ao clicar no banner',
  `status` tinyint(1) NOT NULL COMMENT 'Status do banner',
  `sort_order` int(3) unsigned NOT NULL COMMENT 'Sequencia da ordenaçao',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data da inclusao',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Cadastro de banners';

--
-- Dumping data for table `pjc_db`.`banner`
--

/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;


--
-- Table structure for table `pjc_db`.`categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id da categoria',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Id da categoria Pai',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Nome da categoria',
  `page` varchar(100) NOT NULL DEFAULT '' COMMENT 'Pagina de direcionamento',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Status 1=Ativo 0 = Inativo',
  `sort_order` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`id`),
  KEY `fk_parent_category` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='Cadastro de categorias';

--
-- Dumping data for table `pjc_db`.`categoria`
--

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`,`parent_id`,`name`,`page`,`status`,`sort_order`) VALUES 
 (1,0,'Notícias','noticias',1,0),
 (2,0,'Serviços e Materiais','servicos-materiais',1,1),
 (3,0,'Álbum do bairro','fotos',1,2),
 (4,0,'Transparência','dashboard-transparencia',1,3);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


--
-- Table structure for table `pjc_db`.`fi_despesa`
--

DROP TABLE IF EXISTS `fi_despesa`;
CREATE TABLE `fi_despesa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mes_ano_referencia` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `descricao` varchar(150) NOT NULL DEFAULT '',
  `data_despesa` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `valor_despesa` float(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `indx_competencia` (`mes_ano_referencia`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COMMENT='financeiro - despesas';

--
-- Dumping data for table `pjc_db`.`fi_despesa`
--

/*!40000 ALTER TABLE `fi_despesa` DISABLE KEYS */;
INSERT INTO `fi_despesa` (`id`,`mes_ano_referencia`,`descricao`,`data_despesa`,`valor_despesa`) VALUES 
 (1,'2022-12-01 00:00:00','Pagamento Ronda','2022-12-10 00:00:00',4700.00),
 (9,'2023-01-01 00:00:00','teste remocao php lixo','2023-01-11 00:00:00',1000.00),
 (10,'2022-12-01 00:00:00','doce de leite','2022-12-28 00:00:00',100.00),
 (11,'2023-01-01 00:00:00','Ronda do bagulho','2023-01-10 00:00:00',4000.00),
 (13,'2023-01-01 00:00:00','teste 1','2023-01-12 00:00:00',235.00);
/*!40000 ALTER TABLE `fi_despesa` ENABLE KEYS */;


--
-- Table structure for table `pjc_db`.`fi_main`
--

DROP TABLE IF EXISTS `fi_main`;
CREATE TABLE `fi_main` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id ',
  `valor_caixa` float(10,2) NOT NULL DEFAULT '0.00' COMMENT 'valor em caixa',
  `mes_ano_referencia` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'mes e ano de referencia',
  PRIMARY KEY (`id`),
  UNIQUE KEY `indx_unq_ref` (`mes_ano_referencia`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='Financeiro - Dados mestre';

--
-- Dumping data for table `pjc_db`.`fi_main`
--

/*!40000 ALTER TABLE `fi_main` DISABLE KEYS */;
INSERT INTO `fi_main` (`id`,`valor_caixa`,`mes_ano_referencia`) VALUES 
 (1,577.00,'2022-12-01 00:00:00'),
 (7,1200.00,'2023-02-01 00:00:00'),
 (6,900.00,'2023-01-01 00:00:00');
/*!40000 ALTER TABLE `fi_main` ENABLE KEYS */;


--
-- Table structure for table `pjc_db`.`fi_receita`
--

DROP TABLE IF EXISTS `fi_receita`;
CREATE TABLE `fi_receita` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id da receita',
  `id_lote` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'numero do lote',
  `mes_ano_referencia` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'mes de referencia',
  `data_receita` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'data da receita',
  `valor_receita` float(10,2) NOT NULL DEFAULT '0.00' COMMENT 'valor da receita',
  PRIMARY KEY (`id`),
  KEY `indx_comp` (`mes_ano_referencia`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=latin1 COMMENT='financeiro - receita';

--
-- Dumping data for table `pjc_db`.`fi_receita`
--

/*!40000 ALTER TABLE `fi_receita` DISABLE KEYS */;
INSERT INTO `fi_receita` (`id`,`id_lote`,`mes_ano_referencia`,`data_receita`,`valor_receita`) VALUES 
 (1,269,'2022-12-01 00:00:00','2022-12-01 00:00:00',150.00),
 (2,289,'2022-12-01 00:00:00','2022-12-01 00:00:00',150.00),
 (3,245,'2022-12-01 00:00:00','2022-12-01 00:00:00',150.00),
 (4,263,'2022-12-01 00:00:00','2022-12-01 00:00:00',150.00),
 (5,296,'2022-12-01 00:00:00','2022-12-06 00:00:00',150.00),
 (43,209,'2022-12-01 00:00:00','2022-12-14 00:00:00',150.00),
 (7,278,'2022-12-01 00:00:00','2022-12-05 00:00:00',150.00),
 (8,274,'2022-12-01 00:00:00','2022-12-07 00:00:00',250.00),
 (9,302,'2022-12-01 00:00:00','2022-11-30 00:00:00',150.00),
 (10,247,'2022-12-01 00:00:00','2022-12-01 00:00:00',150.00),
 (11,234,'2022-12-01 00:00:00','2022-12-11 00:00:00',150.00),
 (12,270,'2022-12-01 00:00:00','2022-12-06 00:00:00',150.00),
 (13,258,'2022-12-01 00:00:00','2022-12-06 00:00:00',250.00),
 (14,312,'2022-12-01 00:00:00','2022-12-10 00:00:00',150.00),
 (15,241,'2022-12-01 00:00:00','2022-12-01 00:00:00',150.00),
 (16,280,'2022-12-01 00:00:00','2022-12-06 00:00:00',150.00);
INSERT INTO `fi_receita` (`id`,`id_lote`,`mes_ano_referencia`,`data_receita`,`valor_receita`) VALUES 
 (17,310,'2022-12-01 00:00:00','2022-12-07 00:00:00',150.00),
 (18,244,'2022-12-01 00:00:00','2022-12-09 00:00:00',150.00),
 (19,246,'2022-12-01 00:00:00','2022-12-01 00:00:00',150.00),
 (20,240,'2022-12-01 00:00:00','2022-12-07 00:00:00',150.00),
 (21,281,'2022-12-01 00:00:00','2022-12-09 00:00:00',150.00),
 (22,232,'2022-12-01 00:00:00','2022-12-10 00:00:00',150.00),
 (23,255,'2022-12-01 00:00:00','2022-12-13 00:00:00',150.00),
 (24,243,'2022-12-01 00:00:00','2022-12-09 00:00:00',150.00),
 (25,294,'2022-12-01 00:00:00','2022-11-30 00:00:00',150.00),
 (26,277,'2022-12-01 00:00:00','2022-12-02 00:00:00',150.00),
 (27,260,'2022-12-01 00:00:00','2022-12-06 00:00:00',150.00),
 (28,284,'2022-12-01 00:00:00','2022-12-07 00:00:00',150.00),
 (29,276,'2022-12-01 00:00:00','2022-12-07 00:00:00',150.00),
 (30,242,'2022-12-01 00:00:00','2022-12-01 00:00:00',150.00),
 (78,263,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (77,260,'2023-01-01 00:00:00','2023-01-05 00:00:00',800.00);
INSERT INTO `fi_receita` (`id`,`id_lote`,`mes_ano_referencia`,`data_receita`,`valor_receita`) VALUES 
 (76,258,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (75,255,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (74,247,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (73,246,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (72,245,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (71,244,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (70,243,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (69,242,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (54,307,'2022-12-01 00:00:00','2022-12-17 00:00:00',150.00),
 (55,308,'2022-12-01 00:00:00','2022-12-17 00:00:00',150.00),
 (56,288,'2022-12-01 00:00:00','2022-12-19 00:00:00',150.00),
 (66,240,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (104,232,'2023-01-01 00:00:00','2023-01-06 00:00:00',150.00),
 (97,241,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (65,234,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (106,209,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00);
INSERT INTO `fi_receita` (`id`,`id_lote`,`mes_ano_referencia`,`data_receita`,`valor_receita`) VALUES 
 (105,288,'2023-01-01 00:00:00','2023-01-06 00:00:00',150.00),
 (79,269,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (80,270,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (81,274,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (82,276,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (83,277,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (84,278,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (85,280,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (86,281,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (87,284,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (103,231,'2023-01-01 00:00:00','2023-01-06 00:00:00',150.00),
 (89,289,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (90,296,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (91,294,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (92,302,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (93,307,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00);
INSERT INTO `fi_receita` (`id`,`id_lote`,`mes_ano_referencia`,`data_receita`,`valor_receita`) VALUES 
 (94,308,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (95,310,'2023-01-01 00:00:00','2023-01-05 00:00:00',150.00),
 (96,312,'2023-01-01 00:00:00','2023-01-05 00:00:00',1500.00);
/*!40000 ALTER TABLE `fi_receita` ENABLE KEYS */;


--
-- Table structure for table `pjc_db`.`lote`
--

DROP TABLE IF EXISTS `lote`;
CREATE TABLE `lote` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'numero do lote',
  `nome_proprietario` varchar(100) NOT NULL DEFAULT '' COMMENT 'nome do proprietario',
  `telefone` varchar(20) DEFAULT NULL COMMENT 'telefone do proprietario',
  `flag_contribui` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'flag se contribui na ronda',
  `flag_construido` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'flag se ja esta construido',
  `flag_construindo` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'flag se esta construindo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Dados dos lotes';

--
-- Dumping data for table `pjc_db`.`lote`
--

/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` (`id`,`nome_proprietario`,`telefone`,`flag_contribui`,`flag_construido`,`flag_construindo`) VALUES 
 (277,'André Dornelas','(11) 96554-3053',1,0,1),
 (298,'Cristian Baptistela','',0,0,0),
 (278,'Alexandre Roberto Gabriel',NULL,1,1,0),
 (108,'-','(21) 21211-2121',0,0,0),
 (109,'-','(55) 8555-5444',0,0,0),
 (110,'-','(32) 3232-3',0,0,0),
 (111,'-','(23) 2323-23',0,0,0),
 (112,'-','(88) 56565-6565',0,0,0),
 (113,'-','(88) 59899-8989',0,0,0),
 (114,'-','(77) 88555-2232',0,0,0),
 (115,'-','',0,0,0),
 (116,'-','',0,0,0),
 (118,'-','',0,0,0),
 (119,'-','',0,0,0),
 (120,'-','',0,0,0),
 (335,'-','',0,0,0),
 (334,'-',NULL,0,0,0),
 (333,'-',NULL,0,0,0),
 (332,'-',NULL,0,0,0),
 (331,'-',NULL,0,0,0),
 (330,'-',NULL,0,0,0),
 (329,'-',NULL,0,0,0),
 (327,'-',NULL,0,0,0),
 (326,'-',NULL,0,0,0),
 (325,'-',NULL,0,0,0),
 (323,'-',NULL,0,0,0),
 (321,'-',NULL,0,0,0),
 (319,'-',NULL,0,0,0),
 (317,'-',NULL,0,0,0),
 (315,'-',NULL,0,0,0),
 (313,'-',NULL,0,0,0),
 (311,'-',NULL,0,0,0),
 (310,'Mayara Branco Viudes',NULL,1,0,0),
 (117,'-','',0,0,0);
INSERT INTO `lote` (`id`,`nome_proprietario`,`telefone`,`flag_contribui`,`flag_construido`,`flag_construindo`) VALUES 
 (328,'-',NULL,0,0,0),
 (324,'-',NULL,0,0,0),
 (322,'-',NULL,0,0,0),
 (320,'-',NULL,0,0,0),
 (318,'-',NULL,0,0,0),
 (314,'-',NULL,0,0,0),
 (312,'Aline Domicini','(11) 55855-8855',1,0,0),
 (309,'-',NULL,0,0,0),
 (308,'Daniel Correia Alves',NULL,1,0,0),
 (307,'Daniel Correia Alves',NULL,1,0,0),
 (316,'-',NULL,0,0,0),
 (303,'-',NULL,0,0,0),
 (304,'-',NULL,0,0,0),
 (305,'-',NULL,0,0,0),
 (306,'-',NULL,0,0,0),
 (302,'Joel Gomes',NULL,1,0,0),
 (301,'-',NULL,0,0,0),
 (300,'-',NULL,0,0,0),
 (299,'-',NULL,0,0,0),
 (297,'-',NULL,0,0,0),
 (296,'Edson Vieira da Silva',NULL,1,0,0),
 (295,'-',NULL,0,0,0),
 (294,'Henrique Vieira Nunes',NULL,1,0,0),
 (293,'-',NULL,0,0,0),
 (197,'-','',0,0,0),
 (198,'-',NULL,0,0,0),
 (199,'-',NULL,0,0,0),
 (200,'-',NULL,0,0,0),
 (201,'-','232323',0,0,0),
 (202,'-',NULL,0,0,0),
 (203,'-',NULL,0,0,0),
 (204,'-',NULL,0,0,0),
 (205,'-',NULL,0,0,0),
 (206,'-',NULL,0,0,0),
 (207,'-',NULL,0,0,0);
INSERT INTO `lote` (`id`,`nome_proprietario`,`telefone`,`flag_contribui`,`flag_construido`,`flag_construindo`) VALUES 
 (208,'-',NULL,0,0,0),
 (209,'Marcelo Coelho de Deus',NULL,1,0,0),
 (210,'-',NULL,0,0,0),
 (211,'-',NULL,0,0,0),
 (212,'-',NULL,0,0,0),
 (213,'-','23232323',0,0,0),
 (214,'-',NULL,0,0,0),
 (215,'-','2323232',0,0,0),
 (216,'-',NULL,0,0,0),
 (217,'-',NULL,0,0,0),
 (218,'-',NULL,0,0,0),
 (219,'-','6565656665',0,0,0),
 (220,'-',NULL,0,0,0),
 (221,'-',NULL,0,0,0),
 (222,'-',NULL,0,0,0),
 (223,'-',NULL,0,0,0),
 (224,'-',NULL,0,0,0),
 (225,'-',NULL,0,0,0),
 (226,'-',NULL,0,0,0),
 (227,'-','(21) 33343-4345',0,0,0),
 (228,'-',NULL,0,0,0),
 (229,'-',NULL,0,0,0),
 (230,'-',NULL,0,0,0),
 (231,'fulano de tal da silva','(99) 99999-9999',1,0,0),
 (232,'Lauro H de Oliveira','(45) 45454-5454',1,0,0),
 (233,'-',NULL,0,0,0),
 (234,'Zezé',NULL,1,0,0),
 (235,'-',NULL,0,0,0),
 (236,'-',NULL,0,0,0),
 (237,'-',NULL,0,0,0),
 (238,'-',NULL,0,0,0),
 (239,'-',NULL,0,0,0),
 (240,'Maria Filomena de Oliveira Fernandes',NULL,1,0,0),
 (241,'Sandra Valéria F Santos',NULL,1,0,0);
INSERT INTO `lote` (`id`,`nome_proprietario`,`telefone`,`flag_contribui`,`flag_construido`,`flag_construindo`) VALUES 
 (242,'José Roberto Blanco',NULL,1,0,0),
 (243,'Marcelo Sauer Evangelista',NULL,1,0,0),
 (244,'Tatiana Del Rocio',NULL,1,0,0),
 (245,'Silvana Pauletto',NULL,1,0,0),
 (246,'Lurai Tofolli Silvestre','',1,0,0),
 (247,'Caroline Silva Teixeira Lopes',NULL,1,0,0),
 (248,'-','',0,0,0),
 (249,'-',NULL,0,0,0),
 (250,'-',NULL,0,0,0),
 (251,'-',NULL,0,0,0),
 (252,'-',NULL,0,0,0),
 (253,'-',NULL,0,0,0),
 (254,'-',NULL,0,0,0),
 (255,'Jefferson Adalberto',NULL,1,0,0),
 (256,'-',NULL,0,0,0),
 (257,'-',NULL,0,0,0),
 (258,'Edson Batista de Oliveira',NULL,1,0,0),
 (259,'-',NULL,0,0,0),
 (260,'Victor André Salles',NULL,1,0,0),
 (261,'-','',0,0,0),
 (262,'-',NULL,0,0,0),
 (263,'Marilde de Cássia Barbosa',NULL,1,0,0),
 (264,'-',NULL,0,0,0),
 (265,'-',NULL,0,0,0),
 (266,'-',NULL,0,0,0),
 (267,'-',NULL,0,0,0),
 (268,'-',NULL,0,0,0),
 (269,'Cristiane de Carvalho Santos','11558855552',1,0,0),
 (270,'Thiago Sarraf','11554455555',1,0,0);
INSERT INTO `lote` (`id`,`nome_proprietario`,`telefone`,`flag_contribui`,`flag_construido`,`flag_construindo`) VALUES 
 (271,'-',NULL,0,0,0),
 (272,'-',NULL,0,0,0),
 (273,'-',NULL,0,0,0),
 (274,'Marcos Valério',NULL,1,0,0),
 (275,'-','',0,0,0),
 (276,'Valmir Batista Prata',NULL,1,0,0),
 (279,'-',NULL,0,0,0),
 (280,'Robson Ferreira Barbosa',NULL,1,0,0),
 (281,'Christian Stefan Staroste',NULL,1,0,0),
 (282,'-',NULL,0,0,0),
 (283,'-',NULL,0,0,0),
 (284,'Valdirene Maria de Oliveira',NULL,1,0,0),
 (285,'-',NULL,0,0,0),
 (286,'-',NULL,0,0,0),
 (287,'-',NULL,0,0,0),
 (288,'Cléber Tadeu Alves',NULL,1,0,0),
 (289,'Willian Perez Justo',NULL,1,0,0),
 (290,'-',NULL,0,0,0),
 (291,'-',NULL,0,0,0),
 (292,'-',NULL,0,0,0);
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;


--
-- Table structure for table `pjc_db`.`noticia`
--

DROP TABLE IF EXISTS `noticia`;
CREATE TABLE `noticia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id da noticia',
  `titulo` varchar(150) NOT NULL DEFAULT '' COMMENT 'titulo da noticia',
  `conteudo` text NOT NULL COMMENT 'conteudo da noticia',
  `data_noticia` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'data da noticia',
  `url_foto_noticia` varchar(250) NOT NULL DEFAULT '' COMMENT 'url da foto da noticia',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='tabela de noticias';

--
-- Dumping data for table `pjc_db`.`noticia`
--

/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
INSERT INTO `noticia` (`id`,`titulo`,`conteudo`,`data_noticia`,`url_foto_noticia`) VALUES 
 (2,'Chuvas castigam as ruas','\r\n<h4 style=\"text-align: center;\">Previsão é de chuvas intensas e contínuas desta terça-feira (3) até sexta-feira (6), com acumulado de chuvas que pode chegar a 120 mm</h4>\r\n<p>Conforme o Centro de Gerenciamento de Emergências (CGE) da Defesa Civil do Estado, entre terça-feira (3) e sexta-feira (6) há previsão para chuvas intensas com elevados acumulados, acompanhadas por descargas elétricas, fortes rajadas de vento e granizo em todo o território paulista. Os Avisos de Risco Meteorológicos estipulam a intensidade das chuvas e os acumulados previstos para cada região e, no caso de Atibaia (região de Campinas), entre 3 e 6 de janeiro há previsão de acumulados de até 120 mm.</p>\r\n<p>A Defesa Civil também informa que, atualmente, Atibaia encontra-se em estado de atenção, conforme o Plano Preventivo de Defesa Civil (PPDC), em virtude do acumulado de chuvas registradas nas últimas semanas. Diante da previsão de mais chuvas nos próximos dias, recomenda-se atenção especial às áreas mais vulneráveis, pois há risco de deslizamentos, desabamentos, alagamentos, enchentes e ocorrências relacionadas a raios e ventos.</p>\r\n<p>Marcadas por fortes ventos e intensa precipitação, as tempestades são características do Verão e podem vir acompanhadas de raios e trovoadas. Na iminência de uma tempestade, a orientação da Defesa Civil é buscar abrigo em locais fechados, como casas e edifícios. Quem estiver em áreas abertas, como piscinas, estacionamentos ou campos de futebol, deve sair imediatamente, mantendo distância de objetos altos e isolados como árvores, postes e outros artefatos metálicos grandes e expostos.</p>\r\n<p>Em caso de emergência, a Defesa Civil de Atibaia conta com equipes treinadas para ações de prevenção, preparação e resposta a desastres naturais, oferecendo atendimento 24 horas pelos telefones: 199, 4402-7414 e 4411-5108.</p><p></p>\r\n<h4 style=\"text-align: center;\">Imagens das ruas após as chuvas</h4>\r\n<img width=\"1000\" height=\"525\" src=\"img/noticias/n1-2.jpeg\" class=\"img-responsive\"/><br/>\r\n<img width=\"1000\" height=\"525\" src=\"img/noticias/n1-3.jpeg\" class=\"img-responsive\"/><br/>\r\n<img width=\"1000\" height=\"525\" src=\"img/noticias/n1-4.jpeg\" class=\"img-responsive\"/><br/>','2023-01-05 21:34:00','img/noticias/n1.jpeg'),
 (1,'Mapa dos Lotes','	<p>Esse é o mapa de todos os lotes do bairro.</p>	\r\n	<p></p>\r\n','2023-01-05 14:27:35','img/noticias/mapa-lotes.jpg');
INSERT INTO `noticia` (`id`,`titulo`,`conteudo`,`data_noticia`,`url_foto_noticia`) VALUES 
 (3,'Verador Zé Machado visita o bairro','<h4 style=\"text-align: center;\">Vereador vista o bairro e agenda reunião com o Prefeito</h4>\r\n<p>O vereador <a href=\'https://instagram.com/vereadorzemachado\'>Zé Machado</a> visitou o bairro hoje dia 10/01/2023 e conversou com os moradores presentes.</p>\r\n<p>Ficou acordado que será efetuado o cascalhamento das ruas para melhorar a condição de circulação entre essa e a próxima semana e foi conversado sobre pavimentar as ruas do bairro, onde a prefeitura arcará com 100% das despesas e será parcelado entre todos os proprietários.</p>\r\n<p>O mesmo já marcou uma reunião com o Prefeito no dia 08/02/2023 às 15:00 hrs.</p>\r\n<p>Caso tenha disponibilidade, por favor, compareça na reunião para dar mais força ao nosso pedido!</p><p></p>\r\n\r\n<img width=\"1000\" height=\"525\" src=\"img/noticias/n3-2.jfif\" class=\"img-responsive\"/><br/>','2023-01-10 19:55:00','img/noticias/n3.jfif');
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;


--
-- Table structure for table `pjc_db`.`param`
--

DROP TABLE IF EXISTS `param`;
CREATE TABLE `param` (
  `chave` varchar(20) NOT NULL DEFAULT '' COMMENT 'chave',
  `valor` varchar(50) NOT NULL DEFAULT '' COMMENT 'valor',
  `descricao` varchar(150) NOT NULL DEFAULT '' COMMENT 'descricao',
  PRIMARY KEY (`chave`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='tabela de parametros';

--
-- Dumping data for table `pjc_db`.`param`
--

/*!40000 ALTER TABLE `param` DISABLE KEYS */;
INSERT INTO `param` (`chave`,`valor`,`descricao`) VALUES 
 ('VALOR_CONTRIBUICAO','150','Valor default de contribuição mensal '),
 ('DIA_FECHAMENTO','10','Dia do fechamento do caixa do mês para pagar despesas'),
 ('QTD_DIAS_ALERTA','3','Quantidade de dias para alertar o nao pagamento');
/*!40000 ALTER TABLE `param` ENABLE KEYS */;


--
-- Table structure for table `pjc_db`.`requisicao`
--

DROP TABLE IF EXISTS `requisicao`;
CREATE TABLE `requisicao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id do registro',
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'data da requisicao',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT 'url requisitada',
  `user` varchar(150) NOT NULL DEFAULT '' COMMENT 'usuario requisitante',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=421 DEFAULT CHARSET=latin1 COMMENT='tabela de registro de requisicoes';

--
-- Dumping data for table `pjc_db`.`requisicao`
--

/*!40000 ALTER TABLE `requisicao` DISABLE KEYS */;
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (1,'2023-01-05 17:24:46','/portal-centenario/','André Dornelas'),
 (2,'2023-01-05 17:28:08','/portal-centenario/','André Dornelas'),
 (3,'2023-01-05 17:28:10','/portal-centenario/noticias.php','André Dornelas'),
 (4,'2023-01-05 17:28:11','/portal-centenario/noticia-page.php?id=2','André Dornelas'),
 (5,'2023-01-05 17:28:12','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (6,'2023-01-05 17:28:15','/portal-centenario/servicos-materiais.php?q=areia','André Dornelas'),
 (7,'2023-01-05 17:28:17','/portal-centenario/servicos-materiais-detalhe.php?id=3','André Dornelas'),
 (8,'2023-01-05 17:28:31','/portal-centenario/servicos-materiais.php?q=buceta','André Dornelas'),
 (9,'2023-01-05 17:28:40','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (10,'2023-01-05 17:28:42','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (11,'2023-01-05 17:28:42','/portal-centenario/dashboard-transparencia.php','André Dornelas'),
 (12,'2023-01-05 17:28:52','/portal-centenario/','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (13,'2023-01-05 17:28:53','/portal-centenario/servicos-materiais.php','Não Logado'),
 (14,'2023-01-05 17:28:55','/portal-centenario/servicos-materiais.php?q=buceta','Não Logado'),
 (15,'2023-01-05 17:29:29','/portal-centenario/','Não Logado'),
 (16,'2023-01-05 17:29:35','/portal-centenario/customer-login.php','Não Logado'),
 (17,'2023-01-05 17:29:40','/portal-centenario/','André Dornelas'),
 (18,'2023-01-05 17:29:45','/portal-centenario/dashboard-transparencia.php','André Dornelas'),
 (19,'2023-01-05 17:29:46','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (20,'2023-01-05 17:29:48','/portal-centenario/servicos-materiais.php?q=','André Dornelas'),
 (21,'2023-01-05 17:29:50','/portal-centenario/servicos-materiais-detalhe.php?id=4','André Dornelas'),
 (22,'2023-01-05 17:30:03','/portal-centenario/servicos-materiais-detalhe.php?id=4','André Dornelas'),
 (23,'2023-01-05 17:30:08','/portal-centenario/servicos-materiais.php?q=','André Dornelas'),
 (24,'2023-01-05 17:30:50','/portal-centenario/servicos-materiais.php?q=','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (25,'2023-01-05 17:30:54','/portal-centenario/servicos-materiais-detalhe.php?id=5','André Dornelas'),
 (26,'2023-01-05 17:31:08','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (27,'2023-01-05 17:31:09','/portal-centenario/','André Dornelas'),
 (28,'2023-01-05 17:32:42','/portal-centenario/noticia-page.php?id=1','André Dornelas'),
 (29,'2023-01-05 17:32:51','/portal-centenario/','André Dornelas'),
 (30,'2023-01-05 17:32:52','/portal-centenario/','André Dornelas'),
 (31,'2023-01-05 17:32:52','/portal-centenario/noticias.php','André Dornelas'),
 (32,'2023-01-05 17:32:57','/portal-centenario/noticia-page.php?id=2','André Dornelas'),
 (33,'2023-01-05 17:40:05','/portal-centenario/noticia-page.php?id=2','André Dornelas'),
 (34,'2023-01-05 17:40:05','/portal-centenario/noticia-page.php?id=2','André Dornelas'),
 (35,'2023-01-05 17:40:05','/portal-centenario/noticia-page.php?id=2','André Dornelas'),
 (36,'2023-01-05 17:40:07','/portal-centenario/account.php','André Dornelas'),
 (37,'2023-01-05 17:40:09','/portal-centenario/admin-controle-receita.php','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (38,'2023-01-05 17:40:11','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (39,'2023-01-05 17:40:15','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (40,'2023-01-05 17:40:18','/portal-centenario/dashboard-transparencia.php','André Dornelas'),
 (41,'2023-01-05 17:40:28','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (42,'2023-01-05 17:40:40','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (43,'2023-01-05 17:40:47','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (44,'2023-01-05 17:40:58','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (45,'2023-01-05 17:41:06','/portal-centenario/dashboard-transparencia.php','André Dornelas'),
 (46,'2023-01-05 17:41:11','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (47,'2023-01-05 17:41:17','/portal-centenario/servicos-materiais.php?q=','André Dornelas'),
 (48,'2023-01-05 17:41:21','/portal-centenario/servicos-materiais-detalhe.php?id=1','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (49,'2023-01-05 17:41:37','/portal-centenario/','André Dornelas'),
 (50,'2023-01-05 17:41:39','/portal-centenario/','Não Logado'),
 (51,'2023-01-05 18:18:36','/portal-centenario/','Não Logado'),
 (52,'2023-01-05 18:21:50','/portal-centenario/noticia-page.php?id=1','Não Logado'),
 (53,'2023-01-05 18:21:54','/portal-centenario/servicos-materiais.php','Não Logado'),
 (54,'2023-01-05 18:21:55','/portal-centenario/noticias.php','Não Logado'),
 (55,'2023-01-05 18:21:56','/portal-centenario/servicos-materiais.php','Não Logado'),
 (56,'2023-01-05 18:21:58','/portal-centenario/servicos-materiais.php?q=','Não Logado'),
 (57,'2023-01-05 18:22:00','/portal-centenario/servicos-materiais-detalhe.php?id=4','Não Logado'),
 (58,'2023-01-05 18:29:04','/portal-centenario/','Não Logado'),
 (59,'2023-01-05 18:30:00','/portal-centenario/admin-controle-receita.php?comp=01/2023','Não Logado'),
 (60,'2023-01-05 18:30:00','/portal-centenario/','Não Logado'),
 (61,'2023-01-05 18:30:26','/portal-centenario/noticia-page.php?id=1','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (62,'2023-01-05 18:30:33','/portal-centenario/noticia-page.php?id=2','Não Logado'),
 (63,'2023-01-05 18:30:45','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (64,'2023-01-05 18:30:56','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (65,'2023-01-05 18:30:58','/portal-centenario/servicos-materiais.php','Não Logado'),
 (66,'2023-01-05 18:30:59','/portal-centenario/servicos-materiais.php?q=','Não Logado'),
 (67,'2023-01-05 18:31:07','/portal-centenario/servicos-materiais-detalhe.php?id=3','Não Logado'),
 (68,'2023-01-05 18:31:14','/portal-centenario/servicos-materiais-detalhe.php?id=5','Não Logado'),
 (69,'2023-01-05 18:33:04','/portal-centenario/servicos-materiais.php','Não Logado'),
 (70,'2023-01-05 18:33:07','/portal-centenario/customer-login.php','Não Logado'),
 (71,'2023-01-05 18:33:11','/portal-centenario/','André Dornelas'),
 (72,'2023-01-05 18:33:12','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (73,'2023-01-05 18:33:50','/portal-centenario/servicos-materiais.php','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (74,'2023-01-05 18:33:54','/portal-centenario/servicos-materiais.php?q=','André Dornelas'),
 (75,'2023-01-05 18:34:00','/portal-centenario/servicos-materiais-detalhe.php?id=6','André Dornelas'),
 (76,'2023-01-06 14:41:56','/portal-centenario/','André Dornelas'),
 (77,'2023-01-06 14:42:00','/portal-centenario/account.php','André Dornelas'),
 (78,'2023-01-06 14:42:01','/portal-centenario/account-info.php','André Dornelas'),
 (79,'2023-01-06 14:42:04','/portal-centenario/account.php','André Dornelas'),
 (80,'2023-01-06 14:42:06','/portal-centenario/password-reset.php','André Dornelas'),
 (81,'2023-01-06 14:42:07','/portal-centenario/account.php','André Dornelas'),
 (82,'2023-01-06 14:42:08','/portal-centenario/admin-cadastro-lote.php','André Dornelas'),
 (83,'2023-01-06 14:42:16','/portal-centenario/admin-controle-caixa.php','André Dornelas'),
 (84,'2023-01-06 14:42:18','/portal-centenario/admin-controle-caixa.php?comp=01/2023','André Dornelas'),
 (85,'2023-01-06 14:42:21','/portal-centenario/admin-controle-caixa.php?comp=02/2023','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (86,'2023-01-06 14:42:23','/portal-centenario/admin-controle-caixa.php?comp=01/2023','André Dornelas'),
 (87,'2023-01-06 14:42:27','/portal-centenario/account.php','André Dornelas'),
 (88,'2023-01-06 14:42:29','/portal-centenario/admin-controle-receita.php','André Dornelas'),
 (89,'2023-01-06 14:42:32','/portal-centenario/admin-controle-receita.php?comp=02/2023','André Dornelas'),
 (90,'2023-01-06 14:42:35','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (91,'2023-01-06 14:42:45','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (92,'2023-01-06 14:42:57','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (93,'2023-01-06 14:43:03','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (94,'2023-01-06 14:43:32','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (95,'2023-01-06 14:45:09','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (96,'2023-01-06 14:45:09','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (97,'2023-01-06 14:45:15','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (98,'2023-01-06 14:45:21','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (99,'2023-01-06 14:45:40','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (100,'2023-01-06 14:45:42','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (101,'2023-01-06 14:45:43','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (102,'2023-01-06 14:45:45','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (103,'2023-01-06 14:45:47','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (104,'2023-01-06 14:45:49','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (105,'2023-01-06 14:45:50','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (106,'2023-01-06 14:45:54','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (107,'2023-01-06 14:45:55','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (108,'2023-01-06 14:45:56','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (109,'2023-01-06 14:45:59','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (110,'2023-01-06 14:46:02','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (111,'2023-01-06 14:46:06','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (112,'2023-01-06 14:46:11','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (113,'2023-01-06 14:46:19','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (114,'2023-01-06 14:46:32','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (115,'2023-01-06 14:46:34','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (116,'2023-01-06 14:46:35','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (117,'2023-01-06 14:46:36','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (118,'2023-01-06 14:46:45','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (119,'2023-01-06 14:46:49','/portal-centenario/admin-controle-receita.php','André Dornelas'),
 (120,'2023-01-06 14:46:52','/portal-centenario/admin-controle-receita.php?comp=02/2023','André Dornelas'),
 (121,'2023-01-06 14:46:54','/portal-centenario/admin-controle-receita.php?comp=02/2023','André Dornelas'),
 (122,'2023-01-06 14:46:56','/portal-centenario/admin-controle-receita.php?comp=02/2023','André Dornelas'),
 (123,'2023-01-06 14:46:59','/portal-centenario/account.php','André Dornelas'),
 (124,'2023-01-06 14:47:00','/portal-centenario/admin-controle-receita.php','André Dornelas'),
 (125,'2023-01-06 14:47:02','/portal-centenario/admin-controle-receita.php?comp=01/2023','André Dornelas'),
 (126,'2023-01-06 14:47:04','/portal-centenario/account.php','André Dornelas'),
 (127,'2023-01-06 14:47:05','/portal-centenario/admin-controle-despesa.php','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (128,'2023-01-06 14:47:06','/portal-centenario/admin-controle-despesa.php?comp=01/2023','André Dornelas'),
 (129,'2023-01-06 14:47:12','/portal-centenario/account.php','André Dornelas'),
 (130,'2023-01-06 14:47:14','/portal-centenario/admin-controle-caixa.php','André Dornelas'),
 (131,'2023-01-06 14:47:15','/portal-centenario/admin-controle-caixa.php?comp=01/2023','André Dornelas'),
 (132,'2023-01-06 14:47:17','/portal-centenario/admin-controle-caixa.php?comp=02/2023','André Dornelas'),
 (133,'2023-01-06 14:47:20','/portal-centenario/admin-controle-caixa.php?comp=0','André Dornelas'),
 (134,'2023-01-06 14:47:22','/portal-centenario/account.php','André Dornelas'),
 (135,'2023-01-06 14:48:06','/portal-centenario/account.php','André Dornelas'),
 (136,'2023-01-06 14:48:11','/portal-centenario/account-info.php','André Dornelas'),
 (137,'2023-01-06 14:48:14','/portal-centenario/account.php','André Dornelas'),
 (138,'2023-01-06 14:48:16','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (139,'2023-01-06 14:48:18','/portal-centenario/servicos-materiais.php?q=','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (140,'2023-01-06 14:48:23','/portal-centenario/servicos-materiais-detalhe.php?id=4','André Dornelas'),
 (141,'2023-01-06 14:48:34','/portal-centenario/servicos-materiais-detalhe.php?id=5','André Dornelas'),
 (142,'2023-01-06 14:51:11','/portal-centenario/servicos-materiais-detalhe.php?id=3','André Dornelas'),
 (143,'2023-01-06 14:51:25','/portal-centenario/servicos-materiais-detalhe.php?id=3','André Dornelas'),
 (144,'2023-01-06 14:51:31','/portal-centenario/servicos-materiais.php?q=','André Dornelas'),
 (145,'2023-01-06 14:51:32','/portal-centenario/servicos-materiais.php?q=','André Dornelas'),
 (146,'2023-01-06 14:51:33','/portal-centenario/servicos-materiais-detalhe.php?id=3','André Dornelas'),
 (147,'2023-01-06 14:53:06','/portal-centenario/servicos-materiais.php?q=','André Dornelas'),
 (148,'2023-01-06 14:55:32','/portal-centenario/','Não Logado'),
 (149,'2023-01-07 18:03:41','/portal-centenario/','Não Logado'),
 (150,'2023-01-07 18:04:02','/portal-centenario/noticia-page.php?id=2','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (151,'2023-01-07 18:15:12','/portal-centenario/noticia-page.php?id=2','Não Logado'),
 (152,'2023-01-07 18:15:52','/portal-centenario/noticias.php','Não Logado'),
 (153,'2023-01-07 18:15:54','/portal-centenario/noticia-page.php?id=1','Não Logado'),
 (154,'2023-01-07 18:15:59','/portal-centenario/servicos-materiais.php','Não Logado'),
 (155,'2023-01-07 18:16:00','/portal-centenario/servicos-materiais.php?q=','Não Logado'),
 (156,'2023-01-07 18:16:03','/portal-centenario/servicos-materiais.php?q=blovo','Não Logado'),
 (157,'2023-01-07 18:16:07','/portal-centenario/servicos-materiais.php?q=bloco','Não Logado'),
 (158,'2023-01-07 18:17:12','/portal-centenario/servicos-materiais.php?q=bloco','Não Logado'),
 (159,'2023-01-07 18:17:19','/portal-centenario/servicos-materiais.php','Não Logado'),
 (160,'2023-01-07 18:17:24','/portal-centenario/servicos-materiais.php?q=cimento','Não Logado'),
 (161,'2023-01-07 18:17:27','/portal-centenario/servicos-materiais-detalhe.php?id=2','Não Logado'),
 (162,'2023-01-07 18:20:06','/portal-centenario/noticias.php','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (163,'2023-01-07 18:20:08','/portal-centenario/','Não Logado'),
 (164,'2023-01-07 18:20:10','/portal-centenario/servicos-materiais.php','Não Logado'),
 (165,'2023-01-07 18:20:12','/portal-centenario/servicos-materiais.php?q=','Não Logado'),
 (166,'2023-01-07 18:20:18','/portal-centenario/servicos-materiais-detalhe.php?id=4','Não Logado'),
 (167,'2023-01-07 18:20:24','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (168,'2023-01-07 18:20:39','/portal-centenario/','Não Logado'),
 (169,'2023-01-07 18:20:40','/portal-centenario/','Não Logado'),
 (170,'2023-01-07 18:20:41','/portal-centenario/','Não Logado'),
 (171,'2023-01-07 18:20:47','/portal-centenario/noticias.php','Não Logado'),
 (172,'2023-01-07 18:20:48','/portal-centenario/servicos-materiais.php','Não Logado'),
 (173,'2023-01-07 18:20:49','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (174,'2023-01-07 18:21:23','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (175,'2023-01-07 18:21:24','/portal-centenario/servicos-materiais.php','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (176,'2023-01-07 18:21:24','/portal-centenario/noticias.php','Não Logado'),
 (177,'2023-01-07 18:21:25','/portal-centenario/','Não Logado'),
 (178,'2023-01-07 18:37:54','/portal-centenario/','Não Logado'),
 (179,'2023-01-07 18:38:28','/portal-centenario/','Não Logado'),
 (180,'2023-01-07 18:39:17','/portal-centenario/','Não Logado'),
 (181,'2023-01-07 18:40:48','/portal-centenario/','Não Logado'),
 (182,'2023-01-07 20:45:44','/portal-centenario/','Não Logado'),
 (183,'2023-01-07 21:59:15','/portal-centenario/','Não Logado'),
 (184,'2023-01-07 22:00:52','/portal-centenario/','Não Logado'),
 (185,'2023-01-07 22:33:49','/portal-centenario/','Não Logado'),
 (186,'2023-01-07 22:56:14','/portal-centenario/','Não Logado'),
 (187,'2023-01-07 22:58:02','/portal-centenario/','Não Logado'),
 (188,'2023-01-07 22:58:38','/portal-centenario/','Não Logado'),
 (189,'2023-01-07 22:58:43','/portal-centenario/noticias.php','Não Logado'),
 (190,'2023-01-07 22:58:48','/portal-centenario/noticia-page.php?id=2','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (191,'2023-01-07 22:58:57','/portal-centenario/servicos-materiais.php','Não Logado'),
 (192,'2023-01-07 22:58:59','/portal-centenario/servicos-materiais.php?q=','Não Logado'),
 (193,'2023-01-07 22:59:01','/portal-centenario/servicos-materiais-detalhe.php?id=2','Não Logado'),
 (194,'2023-01-07 23:28:21','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (195,'2023-01-07 23:28:25','/portal-centenario/','Não Logado'),
 (196,'2023-01-07 23:29:23','/portal-centenario/servicos-materiais.php','Não Logado'),
 (197,'2023-01-07 23:29:26','/portal-centenario/servicos-materiais.php?q=','Não Logado'),
 (198,'2023-01-07 23:29:30','/portal-centenario/servicos-materiais-detalhe.php?id=5','Não Logado'),
 (199,'2023-01-07 23:29:34','/portal-centenario/','Não Logado'),
 (200,'2023-01-07 23:29:45','/portal-centenario/noticia-page.php?id=2','Não Logado'),
 (201,'2023-01-07 23:30:05','/portal-centenario/noticia-page.php?id=1','Não Logado'),
 (202,'2023-01-07 23:30:50','/portal-centenario/servicos-materiais.php','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (203,'2023-01-07 23:30:51','/portal-centenario/servicos-materiais.php','Não Logado'),
 (204,'2023-01-07 23:31:06','/portal-centenario/servicos-materiais.php','Não Logado'),
 (205,'2023-01-08 19:23:01','/portal-centenario/','Não Logado'),
 (206,'2023-01-08 19:58:56','/portal-centenario/noticias.php','Não Logado'),
 (207,'2023-01-08 19:58:59','/portal-centenario/servicos-materiais.php','Não Logado'),
 (208,'2023-01-08 19:59:01','/portal-centenario/servicos-materiais.php?q=','Não Logado'),
 (209,'2023-01-08 19:59:06','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (210,'2023-01-08 19:59:11','/portal-centenario/','Não Logado'),
 (211,'2023-01-08 19:59:14','/portal-centenario/noticia-page.php?id=1','Não Logado'),
 (212,'2023-01-08 19:59:15','/portal-centenario/','Não Logado'),
 (213,'2023-01-08 19:59:16','/portal-centenario/noticias.php','Não Logado'),
 (214,'2023-01-08 19:59:18','/portal-centenario/servicos-materiais.php','Não Logado'),
 (215,'2023-01-08 20:01:39','/portal-centenario/customer-login.php','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (216,'2023-01-08 20:08:28','/portal-centenario/','Não Logado'),
 (217,'2023-01-08 20:08:31','/portal-centenario/','Não Logado'),
 (218,'2023-01-08 20:32:26','/portal-centenario/customer-login.php','Não Logado'),
 (219,'2023-01-08 20:32:32','/portal-centenario/','André Dornelas'),
 (220,'2023-01-08 20:33:50','/portal-centenario/','Não Logado'),
 (221,'2023-01-08 20:33:52','/portal-centenario/servicos-materiais.php','Não Logado'),
 (222,'2023-01-08 20:41:56','/portal-centenario/','Não Logado'),
 (223,'2023-01-08 20:42:01','/portal-centenario/customer-login.php','Não Logado'),
 (224,'2023-01-08 20:42:08','/portal-centenario/','André Dornelas'),
 (225,'2023-01-08 20:45:05','/portal-centenario/','André Dornelas'),
 (226,'2023-01-08 20:45:08','/portal-centenario/noticia-page.php?id=2','André Dornelas'),
 (227,'2023-01-08 20:45:19','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (228,'2023-01-08 20:45:22','/portal-centenario/servicos-materiais.php?q=','André Dornelas'),
 (229,'2023-01-08 20:45:26','/portal-centenario/servicos-materiais-detalhe.php?id=5','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (230,'2023-01-08 20:45:46','/portal-centenario/servicos-materiais-detalhe.php?id=5','André Dornelas'),
 (231,'2023-01-08 20:45:52','/portal-centenario/servicos-materiais.php?q=','André Dornelas'),
 (232,'2023-01-08 20:46:07','/portal-centenario/servicos-materiais-detalhe.php?id=4','André Dornelas'),
 (233,'2023-01-08 20:46:15','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (234,'2023-01-08 20:46:23','/portal-centenario/noticias.php','André Dornelas'),
 (235,'2023-01-08 20:46:24','/portal-centenario/','André Dornelas'),
 (236,'2023-01-08 20:46:25','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (237,'2023-01-08 20:46:26','/portal-centenario/dashboard-transparencia.php','André Dornelas'),
 (238,'2023-01-08 20:46:31','/portal-centenario/','André Dornelas'),
 (239,'2023-01-08 20:47:11','/portal-centenario/','Não Logado'),
 (240,'2023-01-09 13:37:25','/portal-centenario/','Não Logado'),
 (241,'2023-01-09 13:38:24','/portal-centenario/noticias.php','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (242,'2023-01-09 13:38:27','/portal-centenario/noticia-page.php?id=2','Não Logado'),
 (243,'2023-01-09 13:38:40','/portal-centenario/servicos-materiais.php','Não Logado'),
 (244,'2023-01-09 13:41:16','/portal-centenario/servicos-materiais.php','Não Logado'),
 (245,'2023-01-09 13:41:30','/portal-centenario/servicos-materiais.php?q=gesso','Não Logado'),
 (246,'2023-01-09 13:41:35','/portal-centenario/servicos-materiais.php?q=cimento','Não Logado'),
 (247,'2023-01-09 13:41:40','/portal-centenario/servicos-materiais.php?q=pedreiro','Não Logado'),
 (248,'2023-01-09 13:41:42','/portal-centenario/servicos-materiais-detalhe.php?id=5','Não Logado'),
 (249,'2023-01-09 13:43:35','/portal-centenario/servicos-materiais.php?q=pedreiro','Não Logado'),
 (250,'2023-01-09 13:44:37','/portal-centenario/','Não Logado'),
 (251,'2023-01-09 13:44:50','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (252,'2023-01-09 13:53:24','/portal-centenario/','Não Logado'),
 (253,'2023-01-09 13:53:43','/portal-centenario/noticia-page.php?id=2','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (254,'2023-01-09 13:54:05','/portal-centenario/noticia-page.php?id=1','Não Logado'),
 (255,'2023-01-09 13:54:44','/portal-centenario/','Não Logado'),
 (256,'2023-01-09 13:54:46','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (257,'2023-01-09 14:27:28','/portal-centenario/customer-login.php','Não Logado'),
 (258,'2023-01-09 14:27:32','/portal-centenario/','André Dornelas'),
 (259,'2023-01-09 14:28:12','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (260,'2023-01-09 14:46:03','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (261,'2023-01-09 14:46:09','/portal-centenario/servicos-materiais.php','André Dornelas'),
 (262,'2023-01-09 14:46:12','/portal-centenario/noticias.php','André Dornelas'),
 (263,'2023-01-09 14:46:15','/portal-centenario/dashboard-transparencia.php','André Dornelas'),
 (264,'2023-01-09 15:17:03','/portal-centenario/','Não Logado'),
 (265,'2023-01-10 19:42:33','/portal-centenario/','Não Logado'),
 (266,'2023-01-10 19:43:32','/portal-centenario/','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (267,'2023-01-10 20:09:59','/portal-centenario/','Não Logado'),
 (268,'2023-01-10 20:11:36','/portal-centenario/','Não Logado'),
 (269,'2023-01-10 20:11:38','/portal-centenario/','Não Logado'),
 (270,'2023-01-10 20:11:39','/portal-centenario/','Não Logado'),
 (271,'2023-01-10 20:12:15','/portal-centenario/','Não Logado'),
 (272,'2023-01-10 20:12:20','/portal-centenario/noticia-page.php?id=3','Não Logado'),
 (273,'2023-01-10 20:13:03','/portal-centenario/noticia-page.php?id=3','Não Logado'),
 (274,'2023-01-10 20:13:08','/portal-centenario/noticias.php','Não Logado'),
 (275,'2023-01-10 20:13:10','/portal-centenario/noticia-page.php?id=3','Não Logado'),
 (276,'2023-01-10 20:16:18','/portal-centenario/noticia-page.php?id=3','Não Logado'),
 (277,'2023-01-10 20:16:51','/portal-centenario/','Não Logado'),
 (278,'2023-01-10 20:16:53','/portal-centenario/noticias.php','Não Logado'),
 (279,'2023-01-10 20:17:18','/portal-centenario/noticias.php','Não Logado'),
 (280,'2023-01-10 20:17:27','/portal-centenario/noticia-page.php?id=1','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (281,'2023-01-10 20:17:50','/portal-centenario/','Não Logado'),
 (282,'2023-01-10 20:17:55','/portal-centenario/noticias.php','Não Logado'),
 (283,'2023-01-10 20:17:55','/portal-centenario/','Não Logado'),
 (284,'2023-01-10 20:18:08','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (285,'2023-01-10 20:28:28','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (286,'2023-01-10 20:29:20','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (287,'2023-01-10 20:31:21','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (288,'2023-01-10 20:31:21','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (289,'2023-01-10 20:33:38','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (290,'2023-01-10 20:40:31','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (291,'2023-01-10 20:40:56','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (292,'2023-01-10 20:46:54','/portal-centenario/dashboard-transparencia.php','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (293,'2023-01-10 20:48:49','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (294,'2023-01-10 20:51:30','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (295,'2023-01-10 20:51:37','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (296,'2023-01-10 20:54:19','/portal-centenario/customer-login.php','Não Logado'),
 (297,'2023-01-10 20:54:44','/portal-centenario/customer-login.php','Não Logado'),
 (298,'2023-01-10 20:54:53','/portal-centenario/customer-login.php','Não Logado'),
 (299,'2023-01-10 20:54:54','/portal-centenario/','Não Logado'),
 (300,'2023-01-10 20:58:30','/portal-centenario/','Não Logado'),
 (301,'2023-01-10 20:58:31','/portal-centenario/noticias.php','Não Logado'),
 (302,'2023-01-10 20:58:33','/portal-centenario/servicos-materiais.php','Não Logado'),
 (303,'2023-01-10 20:58:34','/portal-centenario/noticias.php','Não Logado'),
 (304,'2023-01-10 20:58:36','/portal-centenario/servicos-materiais.php','Não Logado'),
 (305,'2023-01-10 20:58:38','/portal-centenario/servicos-materiais.php','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (306,'2023-01-10 20:58:40','/portal-centenario/servicos-materiais.php?q=','Não Logado'),
 (307,'2023-01-10 20:58:45','/portal-centenario/servicos-materiais-detalhe.php?id=6','Não Logado'),
 (308,'2023-01-10 20:58:55','/portal-centenario/servicos-materiais-detalhe.php?id=2','Não Logado'),
 (309,'2023-01-10 20:59:11','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (310,'2023-01-10 21:07:44','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (311,'2023-01-10 21:12:58','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (312,'2023-01-10 21:25:41','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (313,'2023-01-10 21:25:53','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (314,'2023-01-10 21:25:54','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (315,'2023-01-10 21:26:06','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (316,'2023-01-10 21:27:03','/portal-centenario/dashboard-transparencia.php','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (317,'2023-01-10 21:42:02','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (318,'2023-01-10 21:52:55','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (319,'2023-01-11 20:55:24','/portal-centenario/','Não Logado'),
 (320,'2023-01-11 20:55:27','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (321,'2023-01-11 21:25:19','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (322,'2023-01-11 21:25:19','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (323,'2023-01-11 21:30:01','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (324,'2023-01-11 21:30:01','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (325,'2023-01-11 21:39:53','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (326,'2023-01-11 21:41:18','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (327,'2023-01-11 21:47:05','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (328,'2023-01-11 21:49:27','/portal-centenario/dashboard-transparencia.php','Não Logado');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (329,'2023-01-11 21:49:54','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (330,'2023-01-11 21:51:14','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (331,'2023-01-11 21:51:14','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (332,'2023-01-11 21:58:01','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (333,'2023-01-11 21:58:18','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (334,'2023-01-11 22:02:10','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (335,'2023-01-11 22:04:23','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (336,'2023-01-11 22:08:46','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (337,'2023-01-11 22:09:11','/portal-centenario/dashboard-transparencia.php','Não Logado'),
 (338,'2023-01-11 22:09:17','/portal-centenario/customer-login.php','Não Logado'),
 (339,'2023-01-11 22:09:22','/portal-centenario/','André Dornelas'),
 (340,'2023-01-11 22:09:30','/portal-centenario/servicos-materiais.php','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (341,'2023-01-11 22:09:32','/portal-centenario/dashboard-transparencia.php','André Dornelas'),
 (342,'2023-01-11 22:10:10','/portal-centenario/dashboard-transparencia.php','André Dornelas'),
 (343,'2023-01-11 22:25:48','/portal-centenario/','André Dornelas'),
 (344,'2023-01-11 22:25:52','/portal-centenario/dashboard-transparencia.php','André Dornelas'),
 (345,'2023-01-11 22:32:58','/portal-centenario/dashboard-transparencia.php','André Dornelas'),
 (346,'2023-01-11 22:33:02','/portal-centenario/dashboard-transparencia','André Dornelas'),
 (347,'2023-01-11 22:33:04','/portal-centenario/','André Dornelas'),
 (348,'2023-01-11 22:33:07','/portal-centenario/noticias.php','André Dornelas'),
 (349,'2023-01-11 22:44:06','/portal-centenario/','André Dornelas'),
 (350,'2023-01-11 22:44:08','/portal-centenario/','André Dornelas'),
 (351,'2023-01-11 22:44:11','/portal-centenario/noticias.php','André Dornelas'),
 (352,'2023-01-11 22:44:16','/portal-centenario/noticias.php','André Dornelas'),
 (353,'2023-01-11 22:44:52','/portal-centenario/noticias.php','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (354,'2023-01-11 22:44:53','/portal-centenario/noticias.php','André Dornelas'),
 (355,'2023-01-11 22:44:53','/portal-centenario/noticias.php','André Dornelas'),
 (356,'2023-01-11 22:44:53','/portal-centenario/noticias.php','André Dornelas'),
 (357,'2023-01-11 22:44:55','/portal-centenario/noticias','André Dornelas'),
 (358,'2023-01-11 22:45:00','/portal-centenario/noticia-page?id=3','André Dornelas'),
 (359,'2023-01-11 22:45:04','/portal-centenario/noticias','André Dornelas'),
 (360,'2023-01-11 22:45:05','/portal-centenario/noticia-page?id=2','André Dornelas'),
 (361,'2023-01-11 22:45:06','/portal-centenario/noticias','André Dornelas'),
 (362,'2023-01-11 22:45:07','/portal-centenario/servicos-materiais','André Dornelas'),
 (363,'2023-01-11 22:45:08','/portal-centenario/servicos-materiais?q=','André Dornelas'),
 (364,'2023-01-11 22:45:11','/portal-centenario/servicos-materiais-detalhe?id=3','André Dornelas'),
 (365,'2023-01-11 22:45:25','/portal-centenario/servicos-materiais-detalhe?id=3','André Dornelas'),
 (366,'2023-01-11 22:47:58','/portal-centenario/servicos-materiais','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (367,'2023-01-11 22:48:08','/portal-centenario/servicos-materiais','André Dornelas'),
 (368,'2023-01-11 22:48:13','/portal-centenario/servicos-materiais?q=TESTE','André Dornelas'),
 (369,'2023-01-11 22:48:18','/portal-centenario/dashboard-transparencia','André Dornelas'),
 (370,'2023-01-11 22:48:33','/portal-centenario/account','André Dornelas'),
 (371,'2023-01-11 22:48:34','/portal-centenario/admin-cadastro-lote','André Dornelas'),
 (372,'2023-01-11 22:48:40','/portal-centenario/admin-cadastro-lote','André Dornelas'),
 (373,'2023-01-11 22:48:48','/portal-centenario/admin-cadastro-lote','André Dornelas'),
 (374,'2023-01-11 22:49:45','/portal-centenario/','André Dornelas'),
 (375,'2023-01-11 22:49:47','/portal-centenario/noticia-page?id=1','André Dornelas'),
 (376,'2023-01-11 22:50:22','/portal-centenario/account','André Dornelas'),
 (377,'2023-01-11 22:50:24','/portal-centenario/admin-controle-caixa','André Dornelas'),
 (378,'2023-01-11 22:50:26','/portal-centenario/admin-controle-caixa?comp=02/2023','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (379,'2023-01-11 22:50:27','/portal-centenario/admin-controle-caixa?comp=01/2023','André Dornelas'),
 (380,'2023-01-11 22:50:35','/portal-centenario/admin-controle-caixa?comp=02/2023','André Dornelas'),
 (381,'2023-01-11 22:50:37','/portal-centenario/admin-controle-caixa?comp=01/2023','André Dornelas'),
 (382,'2023-01-11 22:50:39','/portal-centenario/admin-controle-caixa?comp=02/2023','André Dornelas'),
 (383,'2023-01-11 22:50:52','/portal-centenario/dashboard-transparencia','André Dornelas'),
 (384,'2023-01-11 22:51:00','/portal-centenario/dashboard-transparencia','André Dornelas'),
 (385,'2023-01-11 22:51:04','/portal-centenario/account','André Dornelas'),
 (386,'2023-01-11 22:51:07','/portal-centenario/account-info','André Dornelas'),
 (387,'2023-01-11 22:51:10','/portal-centenario/password-reset','André Dornelas'),
 (388,'2023-01-11 22:51:13','/portal-centenario/admin-cadastro-lote','André Dornelas'),
 (389,'2023-01-11 22:51:31','/portal-centenario/admin-cadastro-lote','André Dornelas'),
 (390,'2023-01-11 22:51:36','/portal-centenario/admin-cadastro-lote','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (391,'2023-01-11 22:51:44','/portal-centenario/admin-cadastro-lote','André Dornelas'),
 (392,'2023-01-11 22:52:00','/portal-centenario/account','André Dornelas'),
 (393,'2023-01-11 22:52:02','/portal-centenario/admin-controle-caixa','André Dornelas'),
 (394,'2023-01-11 22:52:04','/portal-centenario/admin-controle-caixa?comp=01/2023','André Dornelas'),
 (395,'2023-01-11 22:52:06','/portal-centenario/account','André Dornelas'),
 (396,'2023-01-11 22:52:08','/portal-centenario/admin-controle-despesa','André Dornelas'),
 (397,'2023-01-11 22:55:39','/portal-centenario/admin-controle-despesa?comp=01/2023','André Dornelas'),
 (398,'2023-01-11 22:56:20','/portal-centenario/admin-controle-despesa?comp=02/2023','André Dornelas'),
 (399,'2023-01-11 22:56:22','/portal-centenario/admin-controle-despesa?comp=01/2023','André Dornelas'),
 (400,'2023-01-11 22:56:43','/portal-centenario/admin-controle-despesa?comp=01/2023','André Dornelas'),
 (401,'2023-01-11 22:56:47','/portal-centenario/admin-controle-despesa?comp=01/2023','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (402,'2023-01-11 22:56:48','/portal-centenario/admin-controle-despesa?comp=01/2023','André Dornelas'),
 (403,'2023-01-11 22:56:52','/portal-centenario/admin-controle-despesa?comp=01/2023','André Dornelas'),
 (404,'2023-01-11 22:56:54','/portal-centenario/admin-controle-despesa?comp=01/2023','André Dornelas'),
 (405,'2023-01-11 22:56:58','/portal-centenario/admin-controle-despesa?comp=01/2023','André Dornelas'),
 (406,'2023-01-11 22:57:14','/portal-centenario/admin-controle-despesa?comp=01/2023','André Dornelas'),
 (407,'2023-01-11 22:57:16','/portal-centenario/dashboard-transparencia','André Dornelas'),
 (408,'2023-01-11 22:57:34','/portal-centenario/dashboard-transparencia','André Dornelas'),
 (409,'2023-01-11 22:58:29','/portal-centenario/noticias','André Dornelas'),
 (410,'2023-01-11 22:58:30','/portal-centenario/noticia-page?id=3','André Dornelas'),
 (411,'2023-01-11 22:58:42','/portal-centenario/noticia-page?id=1','André Dornelas'),
 (412,'2023-01-11 22:58:46','/portal-centenario/noticia-page?id=2','André Dornelas');
INSERT INTO `requisicao` (`id`,`data`,`url`,`user`) VALUES 
 (413,'2023-01-11 22:58:50','/portal-centenario/','André Dornelas'),
 (414,'2023-01-11 22:58:58','/portal-centenario/noticia-page?id=1','André Dornelas'),
 (415,'2023-01-11 22:59:01','/portal-centenario/','André Dornelas'),
 (416,'2023-01-11 22:59:03','/portal-centenario/dashboard-transparencia','André Dornelas'),
 (417,'2023-01-11 22:59:13','/portal-centenario/','Não Logado'),
 (418,'2023-01-11 22:59:15','/portal-centenario/dashboard-transparencia','Não Logado'),
 (419,'2023-01-11 22:59:25','/portal-centenario/servicos-materiais','Não Logado'),
 (420,'2023-01-11 22:59:26','/portal-centenario/servicos-materiais?q=','Não Logado');
/*!40000 ALTER TABLE `requisicao` ENABLE KEYS */;


--
-- Table structure for table `pjc_db`.`review_servicomaterial`
--

DROP TABLE IF EXISTS `review_servicomaterial`;
CREATE TABLE `review_servicomaterial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id do comentario',
  `id_servicomaterial` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id do servico ou material',
  `user_id` int(11) NOT NULL COMMENT 'Id do morador',
  `author` varchar(64) NOT NULL COMMENT 'Nome ou alias do cliente',
  `text` text NOT NULL COMMENT 'Texto descritivo',
  `rating` int(1) NOT NULL DEFAULT '0' COMMENT 'Nota',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Status de exibicao: 1= exibir 0 = nao exibir',
  `date_added` datetime NOT NULL COMMENT 'Data da inclusao',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='Tabela de comentarios de servicos ou material';

--
-- Dumping data for table `pjc_db`.`review_servicomaterial`
--

/*!40000 ALTER TABLE `review_servicomaterial` DISABLE KEYS */;
INSERT INTO `review_servicomaterial` (`id`,`id_servicomaterial`,`user_id`,`author`,`text`,`rating`,`status`,`date_added`) VALUES 
 (1,2,1,'Dornelas','Cimento top e barato! ',5,1,'2022-12-20 22:02:12'),
 (2,3,1,'André Dornelas','Areia ruim da porra',1,1,'2022-12-28 20:15:00'),
 (3,3,1,'André Dornelas','horrivel',1,1,'2022-12-28 20:16:07'),
 (4,3,1,'André Dornelas','pqp',1,1,'2022-12-28 20:16:17'),
 (5,1,1,'André Dornelas','preço top e entrega rapida p carai',5,1,'2022-12-28 20:46:53'),
 (6,4,1,'André Dornelas','laje ruim da porra!',1,1,'2023-01-05 16:57:38'),
 (7,4,1,'André Dornelas','esse cara é bom',5,1,'2023-01-05 17:30:00'),
 (8,3,1,'André Dornelas','mano<br />\nq areia boa<br />\nda porra',4,1,'2023-01-06 14:51:22'),
 (9,5,1,'André Dornelas','cobra caro e é pinguço',1,1,'2023-01-08 20:45:43'),
 (10,3,1,'André Dornelas','teste',1,1,'2023-01-11 22:45:22');
/*!40000 ALTER TABLE `review_servicomaterial` ENABLE KEYS */;


--
-- Table structure for table `pjc_db`.`servico_material`
--

DROP TABLE IF EXISTS `servico_material`;
CREATE TABLE `servico_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id do registro',
  `titulo` varchar(150) NOT NULL DEFAULT '' COMMENT 'titulo',
  `texto` text NOT NULL COMMENT 'texto',
  `data_criacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'data criacao',
  `user` varchar(100) NOT NULL DEFAULT '' COMMENT 'usuario criador',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='servicos e materiais';

--
-- Dumping data for table `pjc_db`.`servico_material`
--

/*!40000 ALTER TABLE `servico_material` DISABLE KEYS */;
INSERT INTO `servico_material` (`id`,`titulo`,`texto`,`data_criacao`,`user`) VALUES 
 (1,'Areia , pedra, pedrisco','Jose da Areia, preço top ','2022-12-20 18:28:34',''),
 (2,'Cimento barato','Emporio do cimento CPII por 28,90','2022-12-20 20:41:14',''),
 (3,'Areia fina','Areia jacarei da boa','2022-12-20 21:02:38',''),
 (4,'ze da laje','lajes de qualidade pelo menor preço do universo!\nvalor da laje : R$ 50000','2023-01-05 16:57:15','André Dornelas'),
 (5,'Pedreiro bom','Esse cara é barato e bom\nTelefone: 88989898\nValor do dia: 20','2023-01-05 17:30:50','André Dornelas'),
 (6,'bloco','Blocos top bagarai<br />\nentrega rápida<br />\nsem quebras<br />\n11 9989898 - José ','2023-01-05 18:33:50','André Dornelas'),
 (7,'teste','teadsf <br />\nSDASD','2023-01-11 22:48:07','André Dornelas');
/*!40000 ALTER TABLE `servico_material` ENABLE KEYS */;


--
-- Table structure for table `pjc_db`.`usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id do usuario',
  `id_perfil` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id do perfil',
  `senha` varchar(50) NOT NULL DEFAULT '' COMMENT 'senha',
  `nome` varchar(120) NOT NULL DEFAULT '' COMMENT 'nome',
  `nr_lote` int(3) unsigned NOT NULL DEFAULT '0' COMMENT 'numero do lote',
  `email` varchar(200) NOT NULL DEFAULT '' COMMENT 'email',
  `celular` varchar(15) NOT NULL DEFAULT '' COMMENT 'nr celular',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='cadastro de usuarios';

--
-- Dumping data for table `pjc_db`.`usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`,`id_perfil`,`senha`,`nome`,`nr_lote`,`email`,`celular`) VALUES 
 (1,777,'123','André Dornelas',277,'andredornelas.araujo@gmail.com','(11) 96554-3053');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
