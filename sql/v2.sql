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
 (1,0,'Notícias','noticia-page.php',1,0),
 (2,0,'Serviços e Materiais','servicos-materiais.php',1,1),
 (3,0,'Fotos','fotos.php',1,2),
 (4,0,'Transparência','dashboard-transparencia.php',1,3),
 (5,0,'Classificados','classificados-visualizar.php',0,4),
 (6,5,'Visualizar','classificados-visualizar.php',1,1),
 (7,5,'Anunciar','classificados-anunciar.php',1,2);
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='financeiro - despesas';

--
-- Dumping data for table `pjc_db`.`fi_despesa`
--

/*!40000 ALTER TABLE `fi_despesa` DISABLE KEYS */;
INSERT INTO `fi_despesa` (`id`,`mes_ano_referencia`,`descricao`,`data_despesa`,`valor_despesa`) VALUES 
 (1,'2022-12-01 00:00:00','Pagamento Ronda','2022-12-10 00:00:00',4700.00),
 (9,'2023-01-01 00:00:00','teste','2022-12-18 00:00:00',1000.00);
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Financeiro - Dados mestre';

--
-- Dumping data for table `pjc_db`.`fi_main`
--

/*!40000 ALTER TABLE `fi_main` DISABLE KEYS */;
INSERT INTO `fi_main` (`id`,`valor_caixa`,`mes_ano_referencia`) VALUES 
 (1,577.00,'2022-12-01 00:00:00');
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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COMMENT='financeiro - receita';

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
 (44,209,'2023-01-01 00:00:00','2022-12-17 00:00:00',150.00),
 (45,232,'2023-01-01 00:00:00','2022-12-17 00:00:00',150.00);
INSERT INTO `fi_receita` (`id`,`id_lote`,`mes_ano_referencia`,`data_receita`,`valor_receita`) VALUES 
 (46,234,'2023-01-01 00:00:00','2022-12-17 00:00:00',150.00),
 (47,240,'2023-01-01 00:00:00','2022-12-17 00:00:00',150.00),
 (48,241,'2023-01-01 00:00:00','2022-12-17 00:00:00',150.00),
 (49,242,'2023-01-01 00:00:00','2022-12-17 00:00:00',150.00),
 (50,243,'2023-01-01 00:00:00','2022-12-17 00:00:00',150.00),
 (51,244,'2023-01-01 00:00:00','2022-12-17 00:00:00',150.00),
 (52,245,'2023-01-01 00:00:00','2022-12-17 00:00:00',150.00),
 (53,246,'2023-01-01 00:00:00','2022-12-17 00:00:00',150.00),
 (54,307,'2022-12-01 00:00:00','2022-12-17 00:00:00',150.00),
 (55,308,'2022-12-01 00:00:00','2022-12-17 00:00:00',150.00),
 (56,288,'2022-12-01 00:00:00','2022-12-19 00:00:00',150.00);
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
 (227,'-','2323',0,0,0),
 (228,'-',NULL,0,0,0),
 (229,'-',NULL,0,0,0),
 (230,'-',NULL,0,0,0),
 (231,'-',NULL,0,0,0),
 (232,'Lauro H de Oliveira','(45) 45454-5454',1,0,0),
 (233,'-',NULL,0,0,0),
 (234,'Zezé',NULL,1,0,0),
 (235,'-',NULL,0,0,0),
 (236,'-',NULL,0,0,0),
 (237,'-',NULL,0,0,0),
 (238,'-',NULL,0,0,0),
 (239,'-',NULL,0,0,0),
 (240,'Maria Filomena de Oliveira Fernandes',NULL,1,0,0),
 (241,'Sandra Valéria F Santos',NULL,1,0,0),
 (242,'José Roberto Blanco',NULL,1,0,0);
INSERT INTO `lote` (`id`,`nome_proprietario`,`telefone`,`flag_contribui`,`flag_construido`,`flag_construindo`) VALUES 
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
 (270,'Thiago Sarraf','11554455555',1,0,0),
 (271,'-',NULL,0,0,0);
INSERT INTO `lote` (`id`,`nome_proprietario`,`telefone`,`flag_contribui`,`flag_construido`,`flag_construindo`) VALUES 
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='tabela de noticias';

--
-- Dumping data for table `pjc_db`.`noticia`
--

/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
INSERT INTO `noticia` (`id`,`titulo`,`conteudo`,`data_noticia`,`url_foto_noticia`) VALUES 
 (1,'Chuvas fortes castigam o bairro','As constantes chuvas estão fudendo todas as ruas do bairro!','2022-12-12 21:34:00','img/noticias/n1.jpeg');
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
-- Table structure for table `pjc_db`.`perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id do perfil',
  `descricao` varchar(50) NOT NULL DEFAULT '' COMMENT 'descricao do perfil',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='cadastro de perfis';

--
-- Dumping data for table `pjc_db`.`perfil`
--

/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` (`id`,`descricao`) VALUES 
 (1,'Administrador'),
 (2,'Morador');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;


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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabela de comentarios de servicos ou material';

--
-- Dumping data for table `pjc_db`.`review_servicomaterial`
--

/*!40000 ALTER TABLE `review_servicomaterial` DISABLE KEYS */;
INSERT INTO `review_servicomaterial` (`id`,`id_servicomaterial`,`user_id`,`author`,`text`,`rating`,`status`,`date_added`) VALUES 
 (1,2,1,'Dornelas','Cimento top e barato! ',5,1,'2022-12-20 22:02:12');
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='servicos e materiais';

--
-- Dumping data for table `pjc_db`.`servico_material`
--

/*!40000 ALTER TABLE `servico_material` DISABLE KEYS */;
INSERT INTO `servico_material` (`id`,`titulo`,`texto`,`data_criacao`) VALUES 
 (1,'Areia , pedra, pedrisco','Jose da Areia, preço top ','2022-12-20 18:28:34'),
 (2,'Cimento barato','Emporio do cimento CPII por 28,90','2022-12-20 20:41:14'),
 (3,'Areia fina','Areia jacarei da boa','2022-12-20 21:02:38');
/*!40000 ALTER TABLE `servico_material` ENABLE KEYS */;


--
-- Table structure for table `pjc_db`.`usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id do usuario',
  `id_perfil` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id do perfil',
  `login` varchar(20) NOT NULL DEFAULT '' COMMENT 'login',
  `senha` varchar(50) NOT NULL DEFAULT '' COMMENT 'senha',
  `nome` varchar(70) NOT NULL DEFAULT '' COMMENT 'nome',
  `sobrenome` varchar(100) NOT NULL DEFAULT '' COMMENT 'sobrenome',
  `nr_lote` int(3) unsigned NOT NULL DEFAULT '0' COMMENT 'numero do lote',
  `email` varchar(200) NOT NULL DEFAULT '' COMMENT 'email',
  `celular` varchar(15) NOT NULL DEFAULT '' COMMENT 'nr celular',
  `flag_contribui_ronda` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'flag se contribui com a ronda',
  `flag_trocar_senha` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'flag se precisa trocar a senha',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='cadastro de usuarios';

--
-- Dumping data for table `pjc_db`.`usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
