-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.55-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema psi_hotel
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ psi_hotel;
USE psi_hotel;

--
-- Table structure for table `psi_hotel`.`t_apartamentos`
--

DROP TABLE IF EXISTS `t_apartamentos`;
CREATE TABLE `t_apartamentos` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `APTO` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRICAO` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TABELA` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `VALOR_HR1` double NOT NULL,
  `VALOR_HR2` double NOT NULL,
  `VALOR_HE1` double NOT NULL,
  `VALOR_HE2` double NOT NULL,
  `VALOR_P1` double NOT NULL,
  `VALOR_P2` double NOT NULL,
  `VALOR_D1` double NOT NULL,
  `VALOR_D2` double NOT NULL,
  `DIARIA_24H1` double NOT NULL,
  `DIARIA_24H2` double NOT NULL,
  `DIARIA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `CHV_D` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_apartamentos`
--

/*!40000 ALTER TABLE `t_apartamentos` DISABLE KEYS */;
INSERT INTO `t_apartamentos` (`FICHA`,`APTO`,`DESCRICAO`,`TABELA`,`VALOR_HR1`,`VALOR_HR2`,`VALOR_HE1`,`VALOR_HE2`,`VALOR_P1`,`VALOR_P2`,`VALOR_D1`,`VALOR_D2`,`DIARIA_24H1`,`DIARIA_24H2`,`DIARIA`,`CHV_D`) VALUES 
 (1,'01','APTO PADRAO (VENTILADOR DE TETO)','1',30,35,5,10,50,60,50,60,100,120,'','LIVRE'),
 (2,'02','APTO C/ AR CONDICIONADO','1',35,40,10,10,70,80,70,80,120,140,'','LIVRE'),
 (3,'03','APTO C/ AR CONDICIONADO','1',35,40,10,10,70,80,70,80,120,140,'','LIVRE'),
 (4,'04','APTO PADRAO (VENTILADOR DE TETO)','1',30,35,5,10,50,60,50,60,100,120,'','LIVRE'),
 (5,'05','APTO C/ AR CONDICIONADO','1',35,40,10,10,70,80,70,80,120,140,'','LIVRE'),
 (6,'06','APTO C/ AR CONDICIONADO','1',35,40,10,10,70,80,70,80,120,140,'','LIVRE'),
 (7,'07','APTO PADRAO (VENTILADOR DE TETO)','1',30,35,5,10,50,60,50,60,100,120,'','LIVRE'),
 (8,'08','APTO PADRAO (VENTILADOR DE TETO)','1',30,35,5,10,50,60,50,60,100,120,'','LIVRE'),
 (9,'09','APTO PADRAO (VENTILADOR DE TETO)','1',30,35,5,10,50,60,50,60,100,120,'000006','MANUTENÇÃO'),
 (18,'21','VENDAS AVULSAS','1',0,0,0,0,0,0,0,0,0,0,'','LIVRE');
/*!40000 ALTER TABLE `t_apartamentos` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_caixa`
--

DROP TABLE IF EXISTS `t_caixa`;
CREATE TABLE `t_caixa` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `CAIXA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `ENTRADA` datetime DEFAULT NULL,
  `SAIDA` datetime DEFAULT NULL,
  `RECEPCAO` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `T_CXAREC` double NOT NULL,
  `T_CXADEIXADO` double NOT NULL,
  `T_DIARIAS` double NOT NULL,
  `T_PEDIDOS` double NOT NULL,
  `T_EXTRAS` double NOT NULL,
  `T_DESCONTOS` double NOT NULL,
  `T_BRUTO` double NOT NULL,
  `T_META` double NOT NULL,
  `T_COMISSAO` double NOT NULL,
  `T_CARTAO` double NOT NULL,
  `T_DINHEIRO` double NOT NULL,
  `T_RECEBIDO` double NOT NULL,
  `T_REPCXA` double NOT NULL,
  `T_DESPESAS` double NOT NULL,
  `T_VALES` double NOT NULL,
  `T_VALETRANSPORTE` double NOT NULL,
  `T_LIQENV` double NOT NULL,
  `T_DIF` double NOT NULL,
  `T_REC` double NOT NULL,
  `ENVIO_OK` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENVIO_DT` datetime NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='t_caixa';

--
-- Dumping data for table `psi_hotel`.`t_caixa`
--

/*!40000 ALTER TABLE `t_caixa` DISABLE KEYS */;
INSERT INTO `t_caixa` (`FICHA`,`CAIXA`,`ENTRADA`,`SAIDA`,`RECEPCAO`,`T_CXAREC`,`T_CXADEIXADO`,`T_DIARIAS`,`T_PEDIDOS`,`T_EXTRAS`,`T_DESCONTOS`,`T_BRUTO`,`T_META`,`T_COMISSAO`,`T_CARTAO`,`T_DINHEIRO`,`T_RECEBIDO`,`T_REPCXA`,`T_DESPESAS`,`T_VALES`,`T_VALETRANSPORTE`,`T_LIQENV`,`T_DIF`,`T_REC`,`ENVIO_OK`,`ENVIO_DT`,`CHV`) VALUES 
 (1,'000001','2020-08-13 15:25:28','2020-08-17 13:22:43','SUPORTE',100,100,525,33,5,105,343,0,0,40,303,343,0,105,30,10,158,0,0,'1','2020-08-17 13:23:13','F'),
 (2,'000002','2020-08-17 13:35:27',NULL,'SUPORTE',100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0','2020-08-17 13:35:27','A'),
 (3,'000002','2020-08-17 13:36:47','2020-08-18 16:59:18','SUPORTE',100,100,70,10,0,0,45,0,0,0,45,45,0,0,0,0,0,0,0,'0','2020-08-17 13:36:47','A');
/*!40000 ALTER TABLE `t_caixa` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_coletas`
--

DROP TABLE IF EXISTS `t_coletas`;
CREATE TABLE `t_coletas` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `DH_COLETA` datetime NOT NULL,
  `RECEPCAO` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `LC` int(11) NOT NULL,
  `FR` int(11) NOT NULL,
  `TB` int(11) NOT NULL,
  `TR` int(11) NOT NULL,
  `TP` int(11) NOT NULL,
  `EC` int(11) NOT NULL,
  `COLETA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_coletas`
--

/*!40000 ALTER TABLE `t_coletas` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_coletas` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_contas`
--

DROP TABLE IF EXISTS `t_contas`;
CREATE TABLE `t_contas` (
  `FICHA` int(11) NOT NULL,
  `ID_CONTA` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CONTA` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `SALDO` double NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_contas`
--

/*!40000 ALTER TABLE `t_contas` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_contas` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_diarias`
--

DROP TABLE IF EXISTS `t_diarias`;
CREATE TABLE `t_diarias` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `CONTA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `AP` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `TIPO` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `DS` smallint(1) NOT NULL,
  `DT_ENTRADA` date NOT NULL,
  `DT_SAIDA` date NOT NULL,
  `HR_ENTRADA` time NOT NULL,
  `HR_SAIDA` time NOT NULL,
  `RC_ENTRADA` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `RC_SAIDA` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `CX_ENTRADA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `CX_SAIDA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `HR_USO` time NOT NULL,
  `HR_FRANQUIA` time NOT NULL,
  `HR_EXCEDENTES` time NOT NULL,
  `VR_LOCACAO` double NOT NULL,
  `VR_HE` double NOT NULL,
  `VR_HORASEXCEDENTES` double NOT NULL,
  `VR_HORASUSO` double NOT NULL,
  `VR_PEDIDOS` double NOT NULL,
  `VR_EXTRAS` double NOT NULL,
  `VR_DESCONTO` double NOT NULL,
  `VR_TOTAL` double NOT NULL,
  `RC_CE` double NOT NULL,
  `RC_DE` double NOT NULL,
  `VR_ENTRADA` double NOT NULL,
  `RC_CS` double NOT NULL,
  `RC_DS` double NOT NULL,
  `VR_SAIDA` double NOT NULL,
  `RC_CARTAO` double NOT NULL,
  `RC_DINHEIRO` double NOT NULL,
  `VR_RECEBIDO` double NOT NULL,
  `VR_TROCO` double NOT NULL,
  `DF_TROCO` double NOT NULL,
  `CAIXA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `CHECK_OUT` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_diarias`
--

/*!40000 ALTER TABLE `t_diarias` DISABLE KEYS */;
INSERT INTO `t_diarias` (`FICHA`,`CONTA`,`AP`,`TIPO`,`DS`,`DT_ENTRADA`,`DT_SAIDA`,`HR_ENTRADA`,`HR_SAIDA`,`RC_ENTRADA`,`RC_SAIDA`,`CX_ENTRADA`,`CX_SAIDA`,`HR_USO`,`HR_FRANQUIA`,`HR_EXCEDENTES`,`VR_LOCACAO`,`VR_HE`,`VR_HORASEXCEDENTES`,`VR_HORASUSO`,`VR_PEDIDOS`,`VR_EXTRAS`,`VR_DESCONTO`,`VR_TOTAL`,`RC_CE`,`RC_DE`,`VR_ENTRADA`,`RC_CS`,`RC_DS`,`VR_SAIDA`,`RC_CARTAO`,`RC_DINHEIRO`,`VR_RECEBIDO`,`VR_TROCO`,`DF_TROCO`,`CAIXA`,`CHECK_OUT`,`CHV`) VALUES 
 (1,'000001','01','HORA',5,'2020-08-13','2020-08-15','15:25:45','16:02:54','SUPORTE','SUPORTE','000001','000001','00:37:09','01:00:00','00:00:00',30,5,0,30,0,5,0,35,0,50,50,0,0,0,0,50,50,15,15,'000001','N','F'),
 (2,'000002','04','DIARIA',5,'2020-08-13','2020-08-15','15:26:13','16:03:32','SUPORTE','SUPORTE','000001','000001','00:37:19','12:00:00','00:00:00',50,5,0,50,0,0,0,50,0,50,50,0,0,0,0,50,50,0,0,'000001','N','F'),
 (3,'000003','06','HORA',5,'2020-08-13','2020-08-15','15:26:30','16:03:21','SUPORTE','SUPORTE','000001','000001','00:36:51','01:00:00','00:00:00',35,10,0,35,0,0,0,35,0,35,35,0,0,0,0,35,35,0,0,'000001','N','F'),
 (4,'000004','02','HORA',5,'2020-08-13','2020-08-15','23:57:42','16:03:52','SUPORTE','SUPORTE','000001','000001','16:06:10','01:00:00','15:06:10',35,10,150,185,0,0,105,80,0,35,35,0,45,45,0,80,80,0,0,'000001','N','F');
INSERT INTO `t_diarias` (`FICHA`,`CONTA`,`AP`,`TIPO`,`DS`,`DT_ENTRADA`,`DT_SAIDA`,`HR_ENTRADA`,`HR_SAIDA`,`RC_ENTRADA`,`RC_SAIDA`,`CX_ENTRADA`,`CX_SAIDA`,`HR_USO`,`HR_FRANQUIA`,`HR_EXCEDENTES`,`VR_LOCACAO`,`VR_HE`,`VR_HORASEXCEDENTES`,`VR_HORASUSO`,`VR_PEDIDOS`,`VR_EXTRAS`,`VR_DESCONTO`,`VR_TOTAL`,`RC_CE`,`RC_DE`,`VR_ENTRADA`,`RC_CS`,`RC_DS`,`VR_SAIDA`,`RC_CARTAO`,`RC_DINHEIRO`,`VR_RECEBIDO`,`VR_TROCO`,`DF_TROCO`,`CAIXA`,`CHECK_OUT`,`CHV`) VALUES 
 (5,'000005','21','MANUTENÇÃO',6,'2020-08-14','2020-08-14','00:05:41','00:05:57','SUPORTE','SUPORTE','000001','000001','00:00:16','00:00:00','00:00:16',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'000001','N','F'),
 (6,'000006','09','MANUTENÇÃO',6,'2020-08-14','2020-08-14','00:06:09','00:00:00','SUPORTE','','000001','','00:00:00','00:00:00','00:00:00',0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'000001','N','A'),
 (7,'000007','01','HORA',7,'2020-08-15','2020-08-15','19:14:33','19:15:47','SUPORTE','SUPORTE','000001','000001','00:01:14','01:00:00','00:00:00',35,10,0,35,33,0,0,68,0,35,35,0,33,33,0,68,68,0,0,'000001','N','F'),
 (8,'000008','05','HORA',7,'2020-08-15','2020-08-15','19:17:07','19:29:41','SUPORTE','SUPORTE','000001','000001','00:12:34','01:00:00','00:00:00',40,10,0,40,0,0,0,40,40,0,40,0,0,0,40,0,40,0,0,'000001','N','F');
INSERT INTO `t_diarias` (`FICHA`,`CONTA`,`AP`,`TIPO`,`DS`,`DT_ENTRADA`,`DT_SAIDA`,`HR_ENTRADA`,`HR_SAIDA`,`RC_ENTRADA`,`RC_SAIDA`,`CX_ENTRADA`,`CX_SAIDA`,`HR_USO`,`HR_FRANQUIA`,`HR_EXCEDENTES`,`VR_LOCACAO`,`VR_HE`,`VR_HORASEXCEDENTES`,`VR_HORASUSO`,`VR_PEDIDOS`,`VR_EXTRAS`,`VR_DESCONTO`,`VR_TOTAL`,`RC_CE`,`RC_DE`,`VR_ENTRADA`,`RC_CS`,`RC_DS`,`VR_SAIDA`,`RC_CARTAO`,`RC_DINHEIRO`,`VR_RECEBIDO`,`VR_TROCO`,`DF_TROCO`,`CAIXA`,`CHECK_OUT`,`CHV`) VALUES 
 (9,'000009','02','HORA',2,'2020-08-17','2020-08-17','12:46:55','13:46:35','SUPORTE','SUPORTE','000001','000002','00:59:40','01:00:00','00:00:00',35,10,0,35,0,0,0,35,0,35,35,0,0,0,0,35,35,0,0,'000001','N','F'),
 (10,'000010','03','HORA',2,'2020-08-17','2020-08-17','13:38:35','13:40:28','SUPORTE','SUPORTE','000002','000002','00:01:53','01:00:00','00:00:00',35,10,0,35,10,0,0,45,0,35,35,0,10,10,0,45,45,0,0,'000002','N','F'),
 (11,'000011','01','HORA',7,'2020-09-12','2020-09-12','00:02:56','00:04:39','SUPORTE','SUPORTE','000002','000002','00:01:43','01:00:00','00:00:00',35,10,0,35,7,0,0,42,0,50,50,0,0,0,0,50,50,8,8,'000002','N','F');
/*!40000 ALTER TABLE `t_diarias` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_empresa`
--

DROP TABLE IF EXISTS `t_empresa`;
CREATE TABLE `t_empresa` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `EMPRESA` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CNPJ` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `INSCRICAO` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `ENDERECO` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `BAIRRO` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `CIDADE` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `UF` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `CEP` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `TELEFONE` varchar(18) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `FAX` varchar(18) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `CELULAR` varchar(18) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `RESPONSAVEL` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SMTP_HOST` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `SMTP_USER` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `SMTP_PASSWORD` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `SMTP_PORT` int(3) NOT NULL,
  `VERSAO` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `DT_ULTRV` date NOT NULL,
  `SAIDA_I` int(1) NOT NULL,
  `SC_SIZE` int(11) NOT NULL,
  `ULTIMA_C` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `VR_MINIMO` double NOT NULL,
  `TXA_CM` double NOT NULL,
  `TOLERANCIA` int(11) NOT NULL,
  `LOGOMARCA` blob NOT NULL,
  `AVISO` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `TIPO_ACESSO` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `LOCAL_SERV` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `LOCAL_USER` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `LOCAL_PASSWORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LOCAL_DB` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `WEB_SERV` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `WEB_USER` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `WEB_PASSWORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `WEB_DB` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `PATH_APLICACAO` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ENVIO_BACKUP` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENVIO_SMTP` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENVIO_HTTP` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `PATH_1` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `PATH_2` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `PATH_3` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_empresa`
--

/*!40000 ALTER TABLE `t_empresa` DISABLE KEYS */;
INSERT INTO `t_empresa` (`FICHA`,`EMPRESA`,`CNPJ`,`INSCRICAO`,`ENDERECO`,`BAIRRO`,`CIDADE`,`UF`,`CEP`,`TELEFONE`,`FAX`,`CELULAR`,`RESPONSAVEL`,`EMAIL`,`SMTP_HOST`,`SMTP_USER`,`SMTP_PASSWORD`,`SMTP_PORT`,`VERSAO`,`DT_ULTRV`,`SAIDA_I`,`SC_SIZE`,`ULTIMA_C`,`VR_MINIMO`,`TXA_CM`,`TOLERANCIA`,`LOGOMARCA`,`AVISO`,`TIPO_ACESSO`,`LOCAL_SERV`,`LOCAL_USER`,`LOCAL_PASSWORD`,`LOCAL_DB`,`WEB_SERV`,`WEB_USER`,`WEB_PASSWORD`,`WEB_DB`,`PATH_APLICACAO`,`ENVIO_BACKUP`,`ENVIO_SMTP`,`ENVIO_HTTP`,`PATH_1`,`PATH_2`,`PATH_3`) VALUES 
 (1,'HOTEL MODELO LTDA','18.000.000/0001-00','ISENTA','RUA DOS TUPIS, 1.743 BELO HORIZONTE MG','BARRO PRETO','BELO HORIZONTE','MG','31090-160','(31) 3295-7723','','(31) 98671-1053','ANTÔNIO JOSE SILVA','antoniojosesilva@hotelmodelo.com.br','smtp.gmail.com','user','password',587,'10.3','2020-05-31',1,1280,'000000',0,0,15,'','PERNOITES a partir das 19h até 12h\r\nDIÁRIAS a partir das 06h até 18h\r\n24HS (qualquer horário do dia/noite)\r\nTempo de Tolerância somente até 15 minutos (hora/pernoite/diária e transferências)\r\nSuporte Técnico: (31) 98410-7540\r\nf/c Ezequias Martins','LOCAL','http://127.0.0.1','root','','psi_hotel','https://201.0.000.00','root','','psi_hotel','E:\\PSI-SOFTWARE\\PSI-HOTEL v10.3-DX','0','0','0','E:\\PSI-SOFTWARE\\PSI-HOTEL v10.3-DX\\impressos\\caixa\\','E:\\PSI-SOFTWARE\\PSI-HOTEL v10.3-DX\\impressos\\canhotos\\','E:\\PSI-SOFTWARE\\PSI-HOTEL v10.3-DX\\impressos\\contas\\');
/*!40000 ALTER TABLE `t_empresa` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_estoque`
--

DROP TABLE IF EXISTS `t_estoque`;
CREATE TABLE `t_estoque` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `DH_LANCAMENTO` datetime NOT NULL,
  `ID_GRUPO` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `ID_PRODUTO` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `HISTORICO` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `UNIDADE` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `SD_ANTERIOR` int(11) NOT NULL,
  `ENTRADAS` int(11) NOT NULL,
  `SAIDAS` int(11) NOT NULL,
  `SD_ATUAL` int(11) NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_estoque`
--

/*!40000 ALTER TABLE `t_estoque` DISABLE KEYS */;
INSERT INTO `t_estoque` (`FICHA`,`DH_LANCAMENTO`,`ID_GRUPO`,`ID_PRODUTO`,`HISTORICO`,`UNIDADE`,`SD_ANTERIOR`,`ENTRADAS`,`SAIDAS`,`SD_ATUAL`,`CHV`) VALUES 
 (1,'2020-08-15 19:14:56','1','03','PEDIDO N.000001 REF. CONTA N.000007','UN',0,0,1,-1,'1'),
 (2,'2020-08-15 19:15:03','2','04','PEDIDO N.000002 REF. CONTA N.000007','UN',0,0,1,-1,'1'),
 (3,'2020-08-15 19:15:28','1','01','PEDIDO N.000003 REF. CONTA N.000007','UN',-94,0,2,-96,'1'),
 (4,'2020-08-17 13:39:34','1','01','PEDIDO N.000001 REF. CONTA N.000010','UN',-96,0,2,-98,'1'),
 (5,'2020-09-12 00:03:11','01','00','PEDIDO N.000001 REF. CONTA N.000011','UN',0,0,2,-2,'1');
/*!40000 ALTER TABLE `t_estoque` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_feriados`
--

DROP TABLE IF EXISTS `t_feriados`;
CREATE TABLE `t_feriados` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `DT_EVENTO` date NOT NULL,
  `DATA` date NOT NULL,
  `FERIADO` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_feriados`
--

/*!40000 ALTER TABLE `t_feriados` DISABLE KEYS */;
INSERT INTO `t_feriados` (`FICHA`,`DT_EVENTO`,`DATA`,`FERIADO`,`CHV`) VALUES 
 (1,'2020-01-01','0000-00-00','ANO NOVO','A'),
 (2,'2020-02-25','0000-00-00','CARNAVAL','A'),
 (3,'2020-04-10','0000-00-00','SEXTA FEIRA DA PAIXÃO','A'),
 (5,'2020-04-21','0000-00-00','TIRADENTES','A'),
 (6,'2020-05-01','0000-00-00','DIA DO TRABALHADOR','A'),
 (8,'2020-06-20','0000-00-00','CORPUS CHRISTI','A'),
 (11,'2020-06-12','0000-00-00','DIA DOS NAMORADOS','A'),
 (13,'2020-09-07','0000-00-00','INDEPENDÊNCIA DO BRASIL','A'),
 (14,'2020-10-12','0000-00-00','N. SRA. APARECIDA','A'),
 (15,'2020-11-02','0000-00-00','DIA DE FINADOS','A'),
 (16,'2020-11-15','0000-00-00','PROCLAMAÇÃO DA REPÚBLICA','A'),
 (18,'2020-12-12','0000-00-00','ANIVERSÃRIO DE BH','A'),
 (19,'2020-12-25','0000-00-00','NATAL','A'),
 (21,'2020-12-31','0000-00-00','FIM DE ANO (ANO NOVO)','A'),
 (22,'2020-04-09','0000-00-00','VÉSPERA DE FERIADO','A');
/*!40000 ALTER TABLE `t_feriados` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_fornecedores`
--

DROP TABLE IF EXISTS `t_fornecedores`;
CREATE TABLE `t_fornecedores` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `ID_FORNEC` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `FORNECEDOR` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `ENDERECO` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `BAIRRO` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `CIDADE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `UF` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `CEP` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `CNPJ` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `INSCRICAO` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `CONTATO` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `TELEFONE` varchar(18) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `FAX` varchar(18) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `CELULAR` varchar(18) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EMAIL` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_fornecedores`
--

/*!40000 ALTER TABLE `t_fornecedores` DISABLE KEYS */;
INSERT INTO `t_fornecedores` (`FICHA`,`ID_FORNEC`,`FORNECEDOR`,`ENDERECO`,`BAIRRO`,`CIDADE`,`UF`,`CEP`,`CNPJ`,`INSCRICAO`,`CONTATO`,`TELEFONE`,`FAX`,`CELULAR`,`EMAIL`) VALUES 
 (9,'000001','DISTRIBUIDORA ABC LTDA','RUA DAS ACÁCIAS, 1000 LJ 01','COMERCIÁRIOS','BELO HORIZONTE','MG','31000-000','00.000.000/0001-00','000.000.000.0000','RUI AMARAL','(31) 3241-2304','(31) 3241-2304','(31) 98410-7540','email@provedor.com.br');
/*!40000 ALTER TABLE `t_fornecedores` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_grupos`
--

DROP TABLE IF EXISTS `t_grupos`;
CREATE TABLE `t_grupos` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `ID_GRUPO` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `GRUPO` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_grupos`
--

/*!40000 ALTER TABLE `t_grupos` DISABLE KEYS */;
INSERT INTO `t_grupos` (`FICHA`,`ID_GRUPO`,`GRUPO`,`CHV`) VALUES 
 (1,'01','BEBIDAS','0'),
 (2,'02','PRODUTOS ALIMENTÍCIOS','0'),
 (3,'03','SUPRIMENTOS DA COPA','0'),
 (4,'04','MATERIAL DE LIMPEZA','0'),
 (5,'05','PRODUTOS DE CONSUMO','0'),
 (6,'06','MAT. DE ESCRITÓRIO E SUPRIM.','0'),
 (7,'07','ROUPARIA','0'),
 (8,'08','DIVERSOS','0');
/*!40000 ALTER TABLE `t_grupos` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_idc`
--

DROP TABLE IF EXISTS `t_idc`;
CREATE TABLE `t_idc` (
  `FICHA` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID` varchar(6) NOT NULL DEFAULT '',
  `IDC` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `psi_hotel`.`t_idc`
--

/*!40000 ALTER TABLE `t_idc` DISABLE KEYS */;
INSERT INTO `t_idc` (`FICHA`,`ID`,`IDC`) VALUES 
 (1,'000001',7),
 (2,'000003',7),
 (3,'000005',1),
 (4,'000009',9),
 (5,'000008',0);
/*!40000 ALTER TABLE `t_idc` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_pedidos`
--

DROP TABLE IF EXISTS `t_pedidos`;
CREATE TABLE `t_pedidos` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `COMANDA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `CONTA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `DH_LANCAMENTO` datetime NOT NULL,
  `ID_PRODUTO` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `PRODUTO` char(45) COLLATE utf8_unicode_ci NOT NULL,
  `QTD` int(6) NOT NULL,
  `VR_UN` double NOT NULL,
  `VR_TOTAL` double NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_pedidos`
--

/*!40000 ALTER TABLE `t_pedidos` DISABLE KEYS */;
INSERT INTO `t_pedidos` (`FICHA`,`COMANDA`,`CONTA`,`DH_LANCAMENTO`,`ID_PRODUTO`,`PRODUTO`,`QTD`,`VR_UN`,`VR_TOTAL`,`CHV`) VALUES 
 (1,'000001','000007','2020-08-15 19:14:56','035','PC DE ARROZ BRANCO',1,5,5,'1'),
 (2,'000002','000007','2020-08-15 19:15:03','040','PC DE FRANGO A PASSARINHO',1,18,18,'1'),
 (3,'000003','000007','2020-08-15 19:15:28','012','CERVEJA (LATA 350ML)',2,5,10,'1'),
 (4,'000001','000010','2020-08-17 13:39:34','012','CERVEJA (LATA 350ML)',2,5,10,'1'),
 (5,'000001','000011','2020-09-12 00:03:11','001','AGUA M C/ GAS',2,3.5,7,'1');
/*!40000 ALTER TABLE `t_pedidos` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_produtos`
--

DROP TABLE IF EXISTS `t_produtos`;
CREATE TABLE `t_produtos` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `ID_GRUPO` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `ID_PRODUTO` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `PRODUTO` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `UNIDADE` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `VR_CUSTO` double NOT NULL,
  `VR_VENDA` double NOT NULL,
  `ESTQ_M` int(11) NOT NULL,
  `ENTRADAS` int(11) NOT NULL,
  `SAIDAS` int(11) NOT NULL,
  `SD_ATUAL` int(11) NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_produtos`
--

/*!40000 ALTER TABLE `t_produtos` DISABLE KEYS */;
INSERT INTO `t_produtos` (`FICHA`,`ID_GRUPO`,`ID_PRODUTO`,`PRODUTO`,`UNIDADE`,`VR_CUSTO`,`VR_VENDA`,`ESTQ_M`,`ENTRADAS`,`SAIDAS`,`SD_ATUAL`,`CHV`) VALUES 
 (2,'01','001','AGUA M C/ GAS ','UN',0,3.5,0,0,19,-19,'1'),
 (3,'01','002','AGUA M S/GAS ','UN',0,3,0,0,25,-25,'1'),
 (8,'01','003','BACARDI ','DS',0,7,0,0,0,0,'1'),
 (9,'02','004','BOM BOM','UN',0,2,0,0,2,-2,'1'),
 (11,'02','005','CAFE PARA  PERNOITE COBRADO','UN',0,15,0,0,0,0,'1'),
 (12,'01','006','CAIPIRINHA','DS',0,4.5,0,0,0,0,'1'),
 (13,'01','007','CAIPIVODKA','DS',0,5,0,0,0,0,'1'),
 (14,'01','008','CAMPARI ','DS',0,9,0,0,0,0,'1'),
 (15,'01','009','CATUABA 300 ML','UN',4,8,0,0,1,-1,'1'),
 (16,'01','010','CATUABA G F','UN',0,19,0,0,0,0,'1'),
 (17,'01','011','CERVEJA (LATA 350ML)','UN',0,5,0,0,98,-98,'1'),
 (18,'01','012','CERVEJA ZERO ( ALCOOL)','UN',0,7,0,0,1,-1,'1'),
 (19,'08','013','CHINELOS DESCARTÁVEIS (PAR)','UN',0,3,0,0,3,-3,'1'),
 (20,'08','014','CIGARO FREE (MAÇO)','UN',6,15,0,0,0,0,'1'),
 (21,'08','015','CIGARRO DERBY (MAÇO)','UN',0,13.5,0,0,0,0,'1'),
 (22,'08','016','CIGARRO SAN MARINO','UN',0,7,0,0,8,-8,'1');
INSERT INTO `t_produtos` (`FICHA`,`ID_GRUPO`,`ID_PRODUTO`,`PRODUTO`,`UNIDADE`,`VR_CUSTO`,`VR_VENDA`,`ESTQ_M`,`ENTRADAS`,`SAIDAS`,`SD_ATUAL`,`CHV`) VALUES 
 (23,'08','017','COBRAR TAÇA QUEBRADA','UN',8,10,0,0,0,0,'1'),
 (24,'08','018','CONDICIONADOR (SACHE)','UN',0,2,0,0,0,0,'1'),
 (25,'01','019','CONHAQUE','UN',0,5,0,0,1,-1,'1'),
 (26,'01','020','CUBA LIBRE','DS',0,9,0,0,0,0,'1'),
 (29,'02','021','HALLS ( UNID)','UN',0,2,0,0,2,-2,'1'),
 (30,'02','022','HAMBURGUER (MICROONDAS)','6',0,10,0,0,0,0,'1'),
 (31,'01','023','ICE','UN',0,8,0,0,0,0,'1'),
 (32,'08','024','ISQUEIRO','UN',0,7,0,0,2,-2,'1'),
 (33,'08','025','KIT DENTAL DESCARTAVEL','UN',0,5,0,0,2,-2,'1'),
 (34,'02','026','LASANHA','UN',0,18,0,0,2,-2,'1'),
 (35,'08','027','LUBRIFICANTE','UN',0,3,0,0,18,-18,'1'),
 (36,'01','028','MARTINE','DS',0,7,0,0,0,0,'1'),
 (37,'02','029','MIXTO QUENTE','UN',0,4,0,0,5,-5,'1'),
 (38,'02','030','PC DE BOLINHO DE MANDIOCA','UN',0,15,0,0,0,0,'1'),
 (39,'02','031','PC DE LINGUIÇA C/ FRITAS','UN',0,23,0,0,1,-1,'1'),
 (40,'02','032','PC DE FRANGO A PASSARINHO','UN',0,18,0,0,1,-1,'1');
INSERT INTO `t_produtos` (`FICHA`,`ID_GRUPO`,`ID_PRODUTO`,`PRODUTO`,`UNIDADE`,`VR_CUSTO`,`VR_VENDA`,`ESTQ_M`,`ENTRADAS`,`SAIDAS`,`SD_ATUAL`,`CHV`) VALUES 
 (41,'02','033','PC DE FRITAS','UN',0,15,0,0,0,0,'1'),
 (43,'02','034','PC DE LINGUIÇA CALABRESA','UN',0,18,0,0,0,0,'1'),
 (44,'02','035','PC FRANGO PASSARINHO C/ FRITAS','PC',0,23,0,0,4,-4,'1'),
 (45,'02','036','PC LING.CALABRESA C/ MANDIOQUINHA','UN',10,23,0,0,0,0,'1'),
 (46,'08','037','PENTE DESCARTAVEL','UN',0,2,0,0,0,0,'1'),
 (48,'01','038','PINGA 51','UN',2,3,0,0,7,-7,'1'),
 (49,'08','039','PRESERVATIVO','UN',0,3,0,0,20,-20,'1'),
 (50,'08','040','PRESTOBARBA','UN',0,3.5,0,0,0,0,'1'),
 (51,'01','041','RED BULL','UN',0,13,0,0,0,0,'1'),
 (52,'01','042','REFRIGERANTE  (LATA)','UN',0,5,0,0,29,-29,'1'),
 (54,'02','043','SALGADINHO','UN',0,3.5,0,0,0,0,'1'),
 (55,'08','044','SHAMPOO (SACHE)','UN',0,2,0,0,0,0,'1'),
 (56,'01','045','SKOL BEATS','UN',0,10,0,0,1,-1,'1'),
 (57,'02','046','PC DE ARROZ BRANCO','UN',0,5,0,0,1,-1,'1'),
 (58,'08','047','TOCA DE BANHO','UN',0,2,0,0,0,0,'1'),
 (59,'01','048','VINHO SUAVE (GARRAFA 700ML)','GF',0,19,0,0,2,-2,'1');
INSERT INTO `t_produtos` (`FICHA`,`ID_GRUPO`,`ID_PRODUTO`,`PRODUTO`,`UNIDADE`,`VR_CUSTO`,`VR_VENDA`,`ESTQ_M`,`ENTRADAS`,`SAIDAS`,`SD_ATUAL`,`CHV`) VALUES 
 (60,'01','049','VINHO TAÇA (200ML)','TC',0,8,0,0,0,0,'1'),
 (61,'01','050','VODKA ORLOFF','DS',0,7,0,0,0,0,'1'),
 (62,'01','051','WHISKY BELL`S','UN',0,10,0,0,0,0,'1'),
 (63,'01','052','WHISKYS  OLD EIGHT','UN',0,10,0,0,0,0,'1'),
 (64,'01','053','WHITE HORSE (CAVALO BRANCO)','DS',0,15,0,0,0,0,'1'),
 (66,'01','054','SUCO NATURAL','UN',0,5,0,0,2,-2,'1'),
 (71,'01','055','SUCO DE LATA 300ML','UN',0,5,0,0,1,-1,'1'),
 (72,'01','056','CAFE PARA PERNOITE CORTESIA','UN',0,0,0,0,7,-7,'1'),
 (73,'02','057','PC COSTELINHA','UN',0,25,0,0,0,0,'1'),
 (74,'02','058','PC COSTELINHA C/ FRITAS','UN',0,33,0,0,2,-2,'1'),
 (75,'08','059','TOALHA EXTRA','UN',0,2.5,0,0,7,-7,'1'),
 (76,'08','060','LENÇOL EXTRA ','UN',0,2.5,0,0,4,-4,'1'),
 (78,'02','061','PC DE BACOM ','UN',0,23,3,0,0,3,'1'),
 (79,'02','062','PC DE BACOM COM FRITAS','UN',0,30,0,0,0,0,'1'),
 (80,'02','063','PC DE BACOM COM MANDIOCA','UN',0,30,0,0,0,0,'1');
INSERT INTO `t_produtos` (`FICHA`,`ID_GRUPO`,`ID_PRODUTO`,`PRODUTO`,`UNIDADE`,`VR_CUSTO`,`VR_VENDA`,`ESTQ_M`,`ENTRADAS`,`SAIDAS`,`SD_ATUAL`,`CHV`) VALUES 
 (81,'02','064','PC FRANGO A PARMEGIANA','UN',0,26,0,0,0,0,'1'),
 (82,'02','065','NOVIDADE MASSA DEL GRANO','UN',0,26,3,0,0,0,'1');
/*!40000 ALTER TABLE `t_produtos` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_rouparia`
--

DROP TABLE IF EXISTS `t_rouparia`;
CREATE TABLE `t_rouparia` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `DIARIA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `DH_RETIRADA` datetime NOT NULL,
  `LC` int(11) NOT NULL,
  `FR` int(11) NOT NULL,
  `TB` int(11) NOT NULL,
  `TR` int(11) NOT NULL,
  `TP` int(11) NOT NULL,
  `TM` int(11) NOT NULL,
  `EC` int(11) NOT NULL,
  `COLETA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_rouparia`
--

/*!40000 ALTER TABLE `t_rouparia` DISABLE KEYS */;
INSERT INTO `t_rouparia` (`FICHA`,`DIARIA`,`DH_RETIRADA`,`LC`,`FR`,`TB`,`TR`,`TP`,`TM`,`EC`,`COLETA`,`CHV`) VALUES 
 (1,'000001','2020-08-15 16:26:54',1,2,2,0,0,0,0,'','S'),
 (2,'000004','2020-08-15 16:28:08',1,2,2,0,0,0,0,'','S'),
 (3,'000002','2020-08-15 16:28:16',1,2,2,0,0,0,0,'','S'),
 (4,'000003','2020-08-15 16:28:22',1,2,2,0,0,0,0,'','S'),
 (5,'000007','2020-08-15 19:17:38',1,2,2,0,0,0,0,'','S'),
 (6,'000008','2020-08-15 19:29:52',1,2,2,0,0,0,0,'','S'),
 (7,'000010','2020-08-17 13:46:52',1,2,2,0,0,0,0,'','S'),
 (8,'000009','2020-08-17 13:48:15',1,2,2,0,0,0,0,'','S'),
 (9,'000011','2020-09-12 00:42:36',1,2,2,0,0,0,0,'','S');
/*!40000 ALTER TABLE `t_rouparia` ENABLE KEYS */;


--
-- Table structure for table `psi_hotel`.`t_usuarios`
--

DROP TABLE IF EXISTS `t_usuarios`;
CREATE TABLE `t_usuarios` (
  `FICHA` int(6) NOT NULL AUTO_INCREMENT,
  `ID` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `USUARIO` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `SENHA` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `HR_ENTRADA` time NOT NULL,
  `HR_SAIDA` time NOT NULL,
  `IDC` int(1) NOT NULL,
  PRIMARY KEY (`FICHA`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `psi_hotel`.`t_usuarios`
--

/*!40000 ALTER TABLE `t_usuarios` DISABLE KEYS */;
INSERT INTO `t_usuarios` (`FICHA`,`ID`,`USUARIO`,`SENHA`,`HR_ENTRADA`,`HR_SAIDA`,`IDC`) VALUES 
 (9,'000001','GERENCIA','*FEBD3F175627C983536CFD57AC42DE8D823AAD91','07:00:00','19:00:00',7),
 (11,'000003','ADM','*1A030512019B7B4B97167D5515EBB6C7105EB12F','07:00:00','19:00:00',7),
 (21,'000005','DIARISTA','*B605506AD326DC1729B84E074D697EDA13DE8C1F','07:00:00','19:00:00',1),
 (22,'000007','SUPORTE','*1A030512019B7B4B97167D5515EBB6C7105EB12F','07:00:00','19:00:00',9),
 (23,'000008','VISITANTE','*4CB947971FACB7AB4E93FAF2078DD186A4C91A46','07:00:00','19:00:00',0);
/*!40000 ALTER TABLE `t_usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
