-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 13, 2020 at 03:53 PM
-- Server version: 5.7.25
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psi_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_apartamentos`
--

CREATE TABLE `t_apartamentos` (
  `FICHA` int(6) NOT NULL,
  `APTO` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRICAO` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TABELA` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `VALOR_HR1` double NOT NULL,
  `VALOR_HR2` double NOT NULL,
  `FRANQUIA` time NOT NULL,
  `VALOR_HE1` double NOT NULL,
  `VALOR_HE2` double NOT NULL,
  `VALOR_P1` double NOT NULL,
  `VALOR_P2` double NOT NULL,
  `VALOR_D1` double NOT NULL,
  `VALOR_D2` double NOT NULL,
  `DIARIA_24H1` double NOT NULL,
  `DIARIA_24H2` double NOT NULL,
  `DIARIA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `CHV_D` varchar(18) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_apartamentos`
--

INSERT INTO `t_apartamentos` (`FICHA`, `APTO`, `DESCRICAO`, `TABELA`, `VALOR_HR1`, `VALOR_HR2`, `FRANQUIA`, `VALOR_HE1`, `VALOR_HE2`, `VALOR_P1`, `VALOR_P2`, `VALOR_D1`, `VALOR_D2`, `DIARIA_24H1`, `DIARIA_24H2`, `DIARIA`, `CHV_D`) VALUES
(1, '01', 'APTO PADRAO (VENTILADOR DE TETO) ', '1', 30, 35, '02:00:00', 5, 10, 50, 60, 50, 60, 100, 120, '', 'LIVRE'),
(2, '02', 'APTO C/ AR CONDICIONADO', '1', 35, 40, '02:00:00', 10, 10, 70, 80, 70, 80, 120, 140, '', 'LIVRE'),
(3, '03', 'APTO C/ AR CONDICIONADO', '1', 35, 40, '02:00:00', 10, 10, 70, 80, 70, 80, 120, 140, '', 'LIVRE'),
(4, '04', 'APTO PADRAO (VENTILADOR DE TETO)', '1', 30, 35, '02:00:00', 5, 10, 50, 60, 50, 60, 100, 120, '000030', 'HORA'),
(5, '05', 'APTO C/ AR CONDICIONADO', '1', 35, 40, '02:00:00', 10, 10, 70, 80, 70, 80, 120, 140, '', 'LIVRE'),
(6, '06', 'APTO C/ AR CONDICIONADO', '1', 35, 40, '02:00:00', 10, 10, 70, 80, 70, 80, 120, 140, '', 'LIVRE'),
(7, '07', 'APTO PADRAO (VENTILADOR DE TETO)', '1', 30, 35, '02:00:00', 5, 10, 50, 60, 50, 60, 100, 120, '', 'LIVRE'),
(8, '08', 'APTO PADRAO (VENTILADOR DE TETO)', '1', 30, 35, '02:00:00', 5, 10, 50, 60, 50, 60, 100, 120, '', 'LIVRE'),
(9, '09', 'APTO PADRAO (VENTILADOR DE TETO)', '1', 30, 35, '23:59:59', 5, 10, 50, 60, 50, 60, 100, 120, '', 'MANUTENÇÃO'),
(18, '21', 'VENDAS AVULSAS', '1', 0, 0, '23:59:59', 0, 0, 0, 0, 0, 0, 0, 0, '', 'LIVRE');

-- --------------------------------------------------------

--
-- Table structure for table `t_caixa`
--

CREATE TABLE `t_caixa` (
  `FICHA` int(6) NOT NULL,
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
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='t_caixa';

--
-- Dumping data for table `t_caixa`
--

INSERT INTO `t_caixa` (`FICHA`, `CAIXA`, `ENTRADA`, `SAIDA`, `RECEPCAO`, `T_CXAREC`, `T_CXADEIXADO`, `T_DIARIAS`, `T_PEDIDOS`, `T_EXTRAS`, `T_DESCONTOS`, `T_BRUTO`, `T_META`, `T_COMISSAO`, `T_CARTAO`, `T_DINHEIRO`, `T_RECEBIDO`, `T_REPCXA`, `T_DESPESAS`, `T_VALES`, `T_VALETRANSPORTE`, `T_LIQENV`, `T_DIF`, `T_REC`, `ENVIO_OK`, `ENVIO_DT`, `CHV`) VALUES
(1, '000001', '2020-09-15 15:01:23', '2020-09-18 12:29:50', 'SUPORTE', 100, 100, 1090, 67.5, 0, 215, 557.5, 0, 0, 0, 557.5, 557.5, 0, 0, 0, 0, 557.5, 0, 0, '1', '2020-09-18 12:29:58', 'F'),
(2, '000002', '2020-09-18 12:30:07', '2020-10-05 21:16:25', 'SUPORTE', 100, 100, 1645, 127.5, 0, 625, 472.5, 0, 0, 0, 472.5, 472.5, 0, 41.35, 20, 9, 402.15, 0, 0, '1', '2020-10-06 15:02:12', 'F'),
(3, '000003', '2020-10-05 21:16:42', '2020-10-08 16:36:30', 'GERENCIA', 100, 100, 40, 61.5, 0, 0, 95, 0, 0, 0, 95, 95, 0, 15.5, 10, 10, 59.5, 0, 0, '1', '2020-10-08 16:37:01', 'F'),
(4, '000004', '2020-10-08 16:37:27', NULL, 'GERENCIA', 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '2020-10-08 16:37:27', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `t_coletas`
--

CREATE TABLE `t_coletas` (
  `FICHA` int(6) NOT NULL,
  `DH_COLETA` datetime NOT NULL,
  `RECEPCAO` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `LC` int(11) NOT NULL,
  `FR` int(11) NOT NULL,
  `TB` int(11) NOT NULL,
  `TR` int(11) NOT NULL,
  `TP` int(11) NOT NULL,
  `EC` int(11) NOT NULL,
  `COLETA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_contas`
--

CREATE TABLE `t_contas` (
  `FICHA` int(11) NOT NULL,
  `ID_CONTA` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CONTA` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `SALDO` double NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_diarias`
--

CREATE TABLE `t_diarias` (
  `FICHA` int(6) NOT NULL,
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
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_diarias`
--

INSERT INTO `t_diarias` (`FICHA`, `CONTA`, `AP`, `TIPO`, `DS`, `DT_ENTRADA`, `DT_SAIDA`, `HR_ENTRADA`, `HR_SAIDA`, `RC_ENTRADA`, `RC_SAIDA`, `CX_ENTRADA`, `CX_SAIDA`, `HR_USO`, `HR_FRANQUIA`, `HR_EXCEDENTES`, `VR_LOCACAO`, `VR_HE`, `VR_HORASEXCEDENTES`, `VR_HORASUSO`, `VR_PEDIDOS`, `VR_EXTRAS`, `VR_DESCONTO`, `VR_TOTAL`, `RC_CE`, `RC_DE`, `VR_ENTRADA`, `RC_CS`, `RC_DS`, `VR_SAIDA`, `RC_CARTAO`, `RC_DINHEIRO`, `VR_RECEBIDO`, `VR_TROCO`, `DF_TROCO`, `CAIXA`, `CHECK_OUT`, `CHV`) VALUES
(1, '000001', '05', 'HORA', 3, '2020-09-15', '2020-09-15', '15:01:32', '17:27:31', 'SUPORTE', 'GERENCIA', '000001', '000001', '02:25:59', '01:00:00', '01:25:59', 35, 10, 20, 55, 34, 0, 10, 79, 0, 50, 50, 0, 29, 29, 0, 79, 79, 0, 0, '000001', 'N', 'F'),
(2, '000002', '02', 'HORA', 3, '2020-09-15', '2020-09-15', '15:18:55', '19:15:29', 'GERENCIA', 'GERENCIA', '000001', '000001', '03:56:34', '01:00:00', '02:56:34', 35, 10, 30, 65, 3.5, 0, 0, 68.5, 0, 35, 35, 0, 33.5, 33.5, 0, 68.5, 68.5, 0, 0, '000001', 'N', 'F'),
(3, '000003', '04', 'HORA', 5, '2020-09-17', '2020-09-17', '14:02:02', '14:04:42', 'GERENCIA', 'GERENCIA', '000001', '000001', '00:02:40', '01:00:00', '00:00:00', 30, 5, 0, 30, 17, 0, 5, 42, 0, 50, 50, 0, 0, 0, 0, 50, 50, 8, 8, '000001', 'N', 'F'),
(4, '000004', '01', 'HORA', 5, '2020-09-17', '2020-09-17', '14:03:14', '17:53:32', 'GERENCIA', 'GERENCIA', '000001', '000001', '03:50:18', '01:00:00', '02:50:18', 30, 5, 15, 45, 3, 0, 0, 48, 0, 30, 30, 0, 18, 18, 0, 48, 48, 0, 0, '000001', 'N', 'F'),
(5, '000005', '02', 'HORA', 5, '2020-09-17', '2020-09-17', '14:51:39', '15:39:53', 'GERENCIA', 'GERENCIA', '000001', '000001', '00:48:14', '01:00:00', '00:00:00', 35, 10, 0, 35, 10, 0, 0, 45, 0, 35, 35, 0, 10, 10, 0, 45, 45, 0, 0, '000001', 'N', 'F'),
(6, '000006', '03', 'HORA', 5, '2020-09-17', '2020-09-17', '16:42:45', '16:42:58', 'GERENCIA', 'GERENCIA', '000001', '000001', '00:00:13', '01:00:00', '00:00:00', 35, 10, 0, 35, 0, 0, 0, 35, 0, 50, 50, 0, 0, 0, 0, 50, 50, 15, 15, '000001', 'N', 'F'),
(7, '000007', '07', 'PERNOITE', 5, '2020-09-17', '2020-09-18', '19:37:33', '12:29:06', 'GERENCIA', 'SUPORTE', '000001', '000001', '16:51:33', '16:37:27', '00:14:06', 50, 5, 0, 50, 0, 0, 0, 50, 0, 50, 50, 0, 0, 0, 0, 50, 50, 0, 0, '000001', 'N', 'F'),
(8, '000008', '05', 'HORA', 5, '2020-09-17', '2020-09-18', '19:37:46', '12:28:52', 'GERENCIA', 'SUPORTE', '000001', '000001', '16:51:06', '01:00:00', '15:51:06', 35, 10, 160, 195, 0, 0, 100, 95, 0, 50, 50, 0, 45, 45, 0, 95, 95, 0, 0, '000001', 'N', 'F'),
(9, '000009', '02', 'HORA', 5, '2020-09-17', '2020-09-18', '19:42:44', '12:28:32', 'GERENCIA', 'SUPORTE', '000001', '000001', '16:45:48', '01:00:00', '15:45:48', 35, 10, 160, 195, 0, 0, 100, 95, 0, 35, 35, 0, 60, 60, 0, 95, 95, 0, 0, '000001', 'N', 'F'),
(10, '000010', '01', 'HORA', 2, '2020-09-21', '2020-09-21', '11:37:43', '12:18:27', 'GERENCIA', 'GERENCIA', '000002', '000002', '00:40:44', '01:00:00', '00:00:00', 30, 5, 0, 30, 28, 0, 0, 58, 0, 30, 30, 0, 28, 28, 0, 58, 58, 0, 0, '000002', 'N', 'F'),
(11, '000011', '03', 'HORA', 5, '2020-09-24', '2020-09-24', '11:17:40', '14:00:20', 'GERENCIA', 'GERENCIA', '000002', '000002', '02:42:40', '01:00:00', '01:42:40', 35, 10, 20, 55, 33, 0, 0, 88, 0, 35, 35, 0, 53, 53, 0, 88, 88, 0, 0, '000002', 'N', 'F'),
(12, '000012', '01', 'HORA', 5, '2020-09-24', '2020-09-24', '14:00:48', '14:10:09', 'GERENCIA', 'GERENCIA', '000002', '000002', '00:09:21', '01:00:00', '00:00:00', 30, 5, 0, 30, 0, 0, 0, 30, 0, 50, 50, 0, 0, 0, 0, 50, 50, 20, 20, '000002', 'N', 'F'),
(13, '000013', '03', 'HORA', 5, '2020-09-24', '2020-10-05', '14:11:41', '12:32:22', 'GERENCIA', 'GERENCIA', '000002', '000002', '22:20:41', '01:00:00', '21:20:41', 35, 10, 220, 255, 0, 0, 220, 35, 0, 35, 35, 0, 0, 0, 0, 35, 35, 0, 0, '000002', 'N', 'F'),
(14, '000014', '06', 'HORA', 5, '2020-09-24', '2020-10-05', '14:11:47', '12:32:43', 'GERENCIA', 'GERENCIA', '000002', '000002', '22:20:56', '01:00:00', '21:20:56', 35, 10, 220, 255, 0, 0, 225, 30, 0, 50, 50, 0, 0, 0, 0, 50, 50, 20, 20, '000002', 'N', 'F'),
(15, '000015', '07', 'HORA', 5, '2020-09-24', '2020-10-05', '14:11:54', '12:32:58', 'GERENCIA', 'GERENCIA', '000002', '000002', '22:21:04', '01:00:00', '21:21:04', 30, 5, 110, 140, 0, 0, 110, 30, 0, 50, 50, 0, 20, 20, 0, 70, 70, 40, 40, '000002', 'N', 'F'),
(16, '000016', '03', 'HORA', 2, '2020-10-05', '2020-10-05', '13:29:20', '21:13:05', 'GERENCIA', 'GERENCIA', '000002', '000002', '07:43:45', '01:00:00', '06:43:45', 35, 10, 70, 105, 25.5, 0, 70, 60.5, 0, 50, 50, 0, 10.5, 10.5, 0, 60.5, 60.5, 0, 0, '000002', 'N', 'F'),
(17, '000017', '07', 'HORA', 2, '2020-10-05', '2020-10-05', '13:29:28', '21:14:25', 'GERENCIA', 'GERENCIA', '000002', '000002', '07:44:57', '01:00:00', '06:44:57', 30, 5, 35, 65, 41, 0, 0, 106, 0, 30, 30, 0, 76, 76, 0, 106, 106, 0, 0, '000002', 'N', 'F'),
(18, '000018', '05', 'HORA', 2, '2020-10-05', '2020-10-05', '21:05:21', '21:13:36', 'GERENCIA', 'GERENCIA', '000002', '000002', '00:08:15', '01:00:00', '00:00:00', 35, 10, 0, 35, 0, 0, 0, 35, 0, 50, 50, 0, 0, 0, 0, 50, 50, 15, 15, '000002', 'N', 'F'),
(19, '000019', '01', 'HORA', 3, '2020-10-06', '2020-10-06', '12:36:05', '14:49:53', 'GERENCIA', 'GERENCIA', '000003', '000003', '02:13:48', '01:00:00', '01:13:48', 30, 5, 5, 35, 10, 0, 0, 45, 0, 50, 50, 0, 0, 0, 0, 50, 50, 5, 5, '000003', 'N', 'F'),
(20, '000020', '03', 'HORA', 3, '2020-10-06', '2020-10-08', '14:48:36', '16:37:35', 'GERENCIA', 'GERENCIA', '000003', '000004', '01:48:59', '01:00:00', '00:48:59', 35, 10, 10, 45, 51.5, 0, 0, 96.5, 0, 50, 50, 0, 46.5, 46.5, 0, 96.5, 96.5, 0, 0, '000003', 'N', 'F'),
(21, '000021', '04', 'HORA', 5, '2020-10-08', '2020-10-09', '16:49:16', '12:08:42', 'GERENCIA', 'GERENCIA', '000004', '000004', '19:19:26', '01:00:00', '18:19:26', 30, 5, 95, 125, 0, 0, 95, 30, 0, 50, 50, 0, 0, 0, 0, 50, 50, 20, 20, '000004', 'N', 'F'),
(22, '000022', '02', 'HORA', 5, '2020-10-08', '2020-10-09', '16:49:26', '12:08:27', 'GERENCIA', 'GERENCIA', '000004', '000004', '19:19:01', '01:00:00', '18:19:01', 35, 10, 190, 225, 0, 0, 190, 35, 0, 35, 35, 0, 0, 0, 0, 35, 35, 0, 0, '000004', 'N', 'F'),
(23, '000023', '01', 'HORA', 6, '2020-10-09', '2020-10-09', '12:11:39', '13:52:57', 'GERENCIA', 'GERENCIA', '000004', '000004', '01:41:18', '01:00:00', '00:41:18', 35, 10, 10, 45, 10, 0, 0, 55, 0, 50, 50, 0, 5, 5, 0, 55, 55, 0, 0, '000004', 'N', 'F'),
(24, '000024', '01', 'DIARIA', 6, '2020-10-09', '2020-10-10', '14:02:15', '11:16:19', 'GERENCIA', 'GERENCIA', '000004', '000004', '21:14:04', '12:00:00', '09:14:04', 60, 10, 90, 150, 0, 0, 0, 150, 0, 100, 100, 0, 50, 50, 0, 150, 150, 0, 0, '000004', 'N', 'F'),
(25, '000025', '07', 'HORA', 6, '2020-10-09', '2020-10-10', '14:02:30', '11:16:35', 'GERENCIA', 'GERENCIA', '000004', '000004', '21:14:05', '01:00:00', '20:14:05', 35, 10, 200, 235, 8, 0, 200, 43, 0, 50, 50, 0, 0, 0, 0, 50, 50, 7, 7, '000004', 'N', 'F'),
(26, '000026', '01', 'HORA', 3, '2020-10-13', '2020-10-13', '11:21:29', '11:43:39', 'GERENCIA', 'GERENCIA', '000004', '000004', '00:22:10', '01:00:00', '00:00:00', 30, 5, 0, 30, 35, 0, 0, 65, 0, 50, 50, 0, 15, 15, 0, 65, 65, 0, 0, '000004', 'N', 'F'),
(27, '000027', '02', 'HORA', 4, '2020-11-04', '2020-11-04', '10:38:47', '12:54:01', 'SUPORTE', 'GERENCIA', '000004', '000004', '02:15:14', '01:00:00', '01:15:14', 35, 10, 10, 45, 13.5, 0, 0, 58.5, 0, 50, 50, 0, 8.5, 8.5, 0, 58.5, 58.5, 0, 0, '000004', 'N', 'F'),
(28, '000028', '01', 'HORA', 6, '2020-11-06', '2020-11-06', '17:26:21', '17:30:11', 'SUPORTE', 'SUPORTE', '000004', '000004', '00:03:50', '01:00:00', '00:00:00', 35, 10, 0, 35, 25, 0, 0, 60, 0, 50, 50, 0, 10, 10, 0, 60, 60, 0, 0, '000004', 'N', 'F'),
(29, '000029', '03', 'HORA', 6, '2020-11-06', '2020-11-06', '17:27:06', '19:44:33', 'SUPORTE', 'GERENCIA', '000004', '000004', '02:17:27', '01:00:00', '01:17:27', 40, 10, 20, 60, 8.5, 0, 0, 68.5, 0, 40, 40, 0, 28.5, 28.5, 0, 68.5, 68.5, 0, 0, '000004', 'N', 'F'),
(30, '000030', '04', 'HORA', 6, '2020-11-06', '2020-11-06', '17:27:52', '00:00:00', 'SUPORTE', '', '000004', '', '00:00:00', '02:00:00', '00:00:00', 35, 10, 0, 0, 13.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '000004', 'N', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `t_empresa`
--

CREATE TABLE `t_empresa` (
  `FICHA` int(6) NOT NULL,
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
  `PATH_3` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_empresa`
--

INSERT INTO `t_empresa` (`FICHA`, `EMPRESA`, `CNPJ`, `INSCRICAO`, `ENDERECO`, `BAIRRO`, `CIDADE`, `UF`, `CEP`, `TELEFONE`, `FAX`, `CELULAR`, `RESPONSAVEL`, `EMAIL`, `SMTP_HOST`, `SMTP_USER`, `SMTP_PASSWORD`, `SMTP_PORT`, `VERSAO`, `DT_ULTRV`, `SAIDA_I`, `SC_SIZE`, `ULTIMA_C`, `VR_MINIMO`, `TXA_CM`, `TOLERANCIA`, `LOGOMARCA`, `AVISO`, `TIPO_ACESSO`, `LOCAL_SERV`, `LOCAL_USER`, `LOCAL_PASSWORD`, `LOCAL_DB`, `WEB_SERV`, `WEB_USER`, `WEB_PASSWORD`, `WEB_DB`, `PATH_APLICACAO`, `ENVIO_BACKUP`, `ENVIO_SMTP`, `ENVIO_HTTP`, `PATH_1`, `PATH_2`, `PATH_3`) VALUES
(1, 'MOTEL VIP', '18.000.000/0001-00', 'ISENTA', 'RUA DOS TUPIS, 1.743 BELO HORIZONTE MG', 'BARRO PRETO', 'BELO HORIZONTE', 'MG', '31090-160', '(31) 3295-7723', '', '(31) 98671-1053', 'JOSE CARLOS DOS SANTOS', 'josecarlossantos0659@gmail.com', 'smtp.gmail.com', 'user', 'password', 587, '10.3', '2020-05-31', 1, 1280, '000000', 0, 0, 15, '', 'PERNOITES a partir das 19h até 12h\r\nDIÁRIAS a partir das 06h até 18h\r\n24HS (qualquer horário do dia/noite)\r\nTolerância até 15 minutos! \r\n(hora/pernoite/diária e transferências)\r\nSuporte Técnico: (31) 98410-7540\r\nf/c Ezequias Martins', 'LOCAL', 'http://127.0.0.1', 'root', '', 'psi_hotel', 'https://201.0.000.00', 'root', '', 'psi_hotel', 'E:\\PSI-SOFTWARE\\PSI-HOTEL v10.3-DX\\', '0', '0', '0', 'E:\\PSI-SOFTWARE\\PSI-HOTEL v10.3-DX\\impressos\\CAIXA\\', 'E:\\PSI-SOFTWARE\\PSI-HOTEL v10.3-DX\\impressos\\CANHOTOS\\', 'E:\\PSI-SOFTWARE\\PSI-HOTEL v10.3-DX\\impressos\\CONTAS\\');

-- --------------------------------------------------------

--
-- Table structure for table `t_estoque`
--

CREATE TABLE `t_estoque` (
  `FICHA` int(6) NOT NULL,
  `DH_LANCAMENTO` datetime NOT NULL,
  `ID_GRUPO` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `ID_PRODUTO` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `HISTORICO` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `UNIDADE` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `SD_ANTERIOR` int(11) NOT NULL,
  `ENTRADAS` int(11) NOT NULL,
  `SAIDAS` int(11) NOT NULL,
  `SD_ATUAL` int(11) NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_estoque`
--

INSERT INTO `t_estoque` (`FICHA`, `DH_LANCAMENTO`, `ID_GRUPO`, `ID_PRODUTO`, `HISTORICO`, `UNIDADE`, `SD_ANTERIOR`, `ENTRADAS`, `SAIDAS`, `SD_ATUAL`, `CHV`) VALUES
(1, '2020-09-15 15:01:48', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000001', 'UN', -25, 0, 2, -27, '1'),
(2, '2020-09-15 15:02:01', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000001', 'UN', -98, 0, 2, -100, '1'),
(3, '2020-09-15 15:02:25', '02', '03', 'PEDIDO N.000001 REF. CONTA N.000001', 'UN', -1, 0, 1, -2, '1'),
(4, '2020-09-15 15:35:41', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000002', 'UN', -19, 0, 1, -20, '1'),
(5, '2020-09-17 14:03:29', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000003', 'UN', -20, 0, 1, -21, '1'),
(6, '2020-09-17 14:04:13', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000003', 'UN', -100, 0, 2, -102, '1'),
(7, '2020-09-17 14:04:47', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000003', 'UN', -21, 0, 1, -22, '1'),
(8, '2020-09-17 15:16:24', '08', '01', 'PEDIDO N.000001 REF. CONTA N.000004', 'UN', -3, 0, 1, -4, '1'),
(9, '2020-09-17 15:16:37', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000005', 'UN', -102, 0, 2, -104, '1'),
(10, '2020-09-21 11:43:00', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000010', 'UN', -104, 0, 2, -106, '1'),
(11, '2020-09-21 11:43:15', '02', '03', 'PEDIDO N.000001 REF. CONTA N.000010', 'UN', -2, 0, 1, -3, '1'),
(12, '2020-09-24 11:18:10', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000011', 'UN', -22, 0, 2, -24, '1'),
(13, '2020-09-24 11:18:22', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000011', 'UN', -106, 0, 2, -108, '1'),
(14, '2020-09-24 11:27:12', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000011', 'UN', -108, 0, 2, -110, '1'),
(15, '2020-09-24 11:27:31', '02', '03', 'PEDIDO N.000001 REF. CONTA N.000011', 'UN', -3, 0, 1, -4, '1'),
(16, '2020-09-24 11:29:46', '01', '04', 'PEDIDO N.000001 REF. CONTA N.000011', 'UN', -29, 0, 1, -30, '1'),
(17, '2020-10-05 18:59:43', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000016', 'UN', -24, 0, 1, -25, '1'),
(18, '2020-10-05 19:24:46', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000016', 'UN', -110, 0, 2, -112, '1'),
(19, '2020-10-05 20:09:25', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000016', 'UN', -25, 0, 1, -26, '1'),
(20, '2020-10-05 20:10:04', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000017', 'UN', -27, 0, 1, -28, '1'),
(21, '2020-10-05 20:12:42', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000017', 'UN', -112, 0, 2, -114, '1'),
(22, '2020-10-05 20:13:57', '02', '03', 'PEDIDO N.000001 REF. CONTA N.000017', 'UN', -1, 0, 1, -2, '1'),
(23, '2020-10-05 20:14:08', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000017', 'UN', -114, 0, 1, -115, '1'),
(24, '2020-10-05 20:32:11', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000016', 'UN', -115, 0, 1, -116, '1'),
(25, '2020-10-05 20:55:11', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000016', 'UN', -26, 0, 1, -27, '1'),
(26, '2020-10-06 14:45:06', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000019', 'UN', -116, 0, 2, -118, '1'),
(27, '2020-10-06 14:52:59', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000020', 'UN', -27, 0, 1, -28, '1'),
(28, '2020-10-06 14:53:04', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000020', 'UN', -118, 0, 2, -120, '1'),
(29, '2020-10-06 14:53:18', '02', '03', 'PEDIDO N.000001 REF. CONTA N.000020', 'UN', -2, 0, 1, -3, '1'),
(30, '2020-10-06 14:57:11', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000020', 'DS', 0, 0, 1, -1, '1'),
(31, '2020-10-06 14:57:21', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000020', 'UN', -28, 0, 1, -29, '1'),
(32, '2020-10-06 14:57:31', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000020', 'UN', -120, 0, 1, -121, '1'),
(33, '2020-10-09 12:11:57', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000023', 'UN', -121, 0, 2, -123, '1'),
(34, '2020-10-09 14:02:37', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000025', 'UN', -123, 0, 1, -124, '1'),
(35, '2020-10-09 14:06:30', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000025', 'UN', -29, 0, 1, -30, '1'),
(36, '2020-10-13 11:21:53', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000026', 'UN', -124, 0, 2, -126, '1'),
(37, '2020-10-13 11:22:04', '02', '03', 'PEDIDO N.000001 REF. CONTA N.000026', 'UN', 0, 0, 1, -1, '1'),
(38, '2020-10-13 11:22:14', '01', '04', 'PEDIDO N.000001 REF. CONTA N.000026', 'UN', -30, 0, 1, -31, '1'),
(39, '2020-10-13 11:22:27', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000026', 'UN', -126, 0, 1, -127, '1'),
(40, '2020-11-04 12:53:43', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000027', 'UN', -28, 0, 1, -29, '1'),
(41, '2020-11-04 12:53:48', '02', '02', 'PEDIDO N.000001 REF. CONTA N.000027', '6', 0, 0, 1, -1, '1'),
(42, '2020-11-06 17:28:19', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000028', 'UN', -127, 0, 2, -129, '1'),
(43, '2020-11-06 17:29:16', '02', '03', 'PEDIDO N.000001 REF. CONTA N.000028', 'UN', -1, 0, 1, -2, '1'),
(44, '2020-11-06 17:29:38', '01', '04', 'PEDIDO N.000001 REF. CONTA N.000029', 'UN', -31, 0, 1, -32, '1'),
(45, '2020-11-06 19:45:32', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000029', 'UN', -29, 0, 1, -30, '1'),
(46, '2020-11-11 11:36:31', '01', '00', 'PEDIDO N.000001 REF. CONTA N.000030', 'UN', -30, 0, 1, -31, '1'),
(47, '2020-11-11 11:36:44', '01', '01', 'PEDIDO N.000001 REF. CONTA N.000030', 'UN', -129, 0, 2, -131, '1');

-- --------------------------------------------------------

--
-- Table structure for table `t_feriados`
--

CREATE TABLE `t_feriados` (
  `FICHA` int(6) NOT NULL,
  `DT_EVENTO` date NOT NULL,
  `DATA` date NOT NULL,
  `FERIADO` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_feriados`
--

INSERT INTO `t_feriados` (`FICHA`, `DT_EVENTO`, `DATA`, `FERIADO`, `CHV`) VALUES
(1, '2020-01-01', '0000-00-00', 'ANO NOVO', 'A'),
(2, '2020-02-25', '0000-00-00', 'CARNAVAL', 'A'),
(3, '2020-04-10', '0000-00-00', 'SEXTA FEIRA DA PAIXÃO', 'A'),
(5, '2020-04-21', '0000-00-00', 'TIRADENTES', 'A'),
(6, '2020-05-01', '0000-00-00', 'DIA DO TRABALHADOR', 'A'),
(8, '2020-06-20', '0000-00-00', 'CORPUS CHRISTI', 'A'),
(11, '2020-06-12', '0000-00-00', 'DIA DOS NAMORADOS', 'A'),
(13, '2020-09-07', '0000-00-00', 'INDEPENDÊNCIA DO BRASIL', 'A'),
(14, '2020-10-12', '0000-00-00', 'N. SRA. APARECIDA', 'A'),
(15, '2020-11-02', '0000-00-00', 'DIA DE FINADOS', 'A'),
(16, '2020-11-15', '0000-00-00', 'PROCLAMAÇÃO DA REPÚBLICA', 'A'),
(18, '2020-12-12', '0000-00-00', 'ANIVERSÃRIO DE BH', 'A'),
(19, '2020-12-25', '0000-00-00', 'NATAL', 'A'),
(21, '2020-12-31', '0000-00-00', 'FIM DE ANO (ANO NOVO)', 'A'),
(22, '2020-04-09', '0000-00-00', 'VÉSPERA DE FERIADO', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `t_fornecedores`
--

CREATE TABLE `t_fornecedores` (
  `FICHA` int(6) NOT NULL,
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
  `EMAIL` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_fornecedores`
--

INSERT INTO `t_fornecedores` (`FICHA`, `ID_FORNEC`, `FORNECEDOR`, `ENDERECO`, `BAIRRO`, `CIDADE`, `UF`, `CEP`, `CNPJ`, `INSCRICAO`, `CONTATO`, `TELEFONE`, `FAX`, `CELULAR`, `EMAIL`) VALUES
(9, '000001', 'DISTRIBUIDORA ABC LTDA', 'RUA DAS ACÁCIAS, 1000 LJ 01', 'COMERCIÁRIOS', 'BELO HORIZONTE', 'MG', '31000-000', '00.000.000/0001-00', '000.000.000.0000', 'RUI AMARAL', '(31) 3241-2304', '(31) 3241-2304', '(31) 98410-7540', 'email@provedor.com.br');

-- --------------------------------------------------------

--
-- Table structure for table `t_grupos`
--

CREATE TABLE `t_grupos` (
  `FICHA` int(6) NOT NULL,
  `ID_GRUPO` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `GRUPO` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_grupos`
--

INSERT INTO `t_grupos` (`FICHA`, `ID_GRUPO`, `GRUPO`, `CHV`) VALUES
(1, '01', 'BEBIDAS', '0'),
(2, '02', 'PRODUTOS ALIMENTÍCIOS', '0'),
(3, '03', 'SUPRIMENTOS DA COPA', '0'),
(4, '04', 'MATERIAL DE LIMPEZA', '0'),
(5, '05', 'PRODUTOS DE CONSUMO', '0'),
(6, '06', 'MAT. DE ESCRITÓRIO E SUPRIM.', '0'),
(7, '07', 'ROUPARIA', '0'),
(8, '08', 'DIVERSOS', '0');

-- --------------------------------------------------------

--
-- Table structure for table `t_idc`
--

CREATE TABLE `t_idc` (
  `FICHA` int(10) UNSIGNED NOT NULL,
  `ID` varchar(6) NOT NULL DEFAULT '',
  `IDC` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_idc`
--

INSERT INTO `t_idc` (`FICHA`, `ID`, `IDC`) VALUES
(1, '000001', 7),
(2, '000003', 7),
(3, '000005', 1),
(4, '000009', 9),
(5, '000008', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_pedidos`
--

CREATE TABLE `t_pedidos` (
  `FICHA` int(6) NOT NULL,
  `COMANDA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `CONTA` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `DH_LANCAMENTO` datetime NOT NULL,
  `ID_PRODUTO` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `PRODUTO` char(45) COLLATE utf8_unicode_ci NOT NULL,
  `QTD` int(6) NOT NULL,
  `VR_UN` double NOT NULL,
  `VR_TOTAL` double NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_pedidos`
--

INSERT INTO `t_pedidos` (`FICHA`, `COMANDA`, `CONTA`, `DH_LANCAMENTO`, `ID_PRODUTO`, `PRODUTO`, `QTD`, `VR_UN`, `VR_TOTAL`, `CHV`) VALUES
(1, '000001', '000001', '2020-09-15 15:01:48', '002', 'AGUA M S/GAS', 2, 3, 6, '1'),
(2, '000001', '000001', '2020-09-15 15:02:01', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1'),
(3, '000001', '000001', '2020-09-15 15:02:25', '032', 'PC DE FRANGO A PASSARINHO', 1, 18, 18, '1'),
(4, '000001', '000002', '2020-09-15 15:35:41', '001', 'AGUA M C/ GAS', 1, 3.5, 3.5, '1'),
(5, '000001', '000003', '2020-09-17 14:03:29', '001', 'AGUA M C/ GAS', 1, 3.5, 3.5, '1'),
(6, '000001', '000003', '2020-09-17 14:04:13', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1'),
(7, '000001', '000003', '2020-09-17 14:04:47', '001', 'AGUA M C/ GAS', 1, 3.5, 3.5, '1'),
(8, '000001', '000004', '2020-09-17 15:16:24', '013', 'CHINELOS DESCARTÁVEIS (PAR)', 1, 3, 3, '1'),
(9, '000001', '000005', '2020-09-17 15:16:37', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1'),
(10, '000001', '000010', '2020-09-21 11:43:00', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1'),
(11, '000001', '000010', '2020-09-21 11:43:15', '032', 'PC DE FRANGO A PASSARINHO', 1, 18, 18, '1'),
(13, '000001', '000011', '2020-09-24 11:18:22', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1'),
(15, '000001', '000011', '2020-09-24 11:27:31', '032', 'PC DE FRANGO A PASSARINHO', 1, 18, 18, '1'),
(16, '000001', '000011', '2020-09-24 11:29:46', '042', 'REFRIGERANTE  (LATA)', 1, 5, 5, '1'),
(17, '000001', '000016', '2020-10-05 18:59:43', '001', 'AGUA M C/ GAS', 1, 3.5, 3.5, '1'),
(18, '000001', '000016', '2020-10-05 19:24:46', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1'),
(19, '000001', '000016', '2020-10-05 20:09:25', '001', 'AGUA M C/ GAS', 1, 3.5, 3.5, '1'),
(20, '000001', '000017', '2020-10-05 20:10:04', '002', 'AGUA M S/GAS', 1, 3, 3, '1'),
(21, '000001', '000017', '2020-10-05 20:12:42', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1'),
(22, '000001', '000017', '2020-10-05 20:13:57', '031', 'PC DE LINGUIÇA C/ FRITAS', 1, 23, 23, '1'),
(23, '000001', '000017', '2020-10-05 20:14:08', '011', 'CERVEJA (LATA 350ML)', 1, 5, 5, '1'),
(24, '000001', '000016', '2020-10-05 20:32:11', '011', 'CERVEJA (LATA 350ML)', 1, 5, 5, '1'),
(25, '000001', '000016', '2020-10-05 20:55:11', '001', 'AGUA M C/ GAS', 1, 3.5, 3.5, '1'),
(26, '000001', '000019', '2020-10-06 14:45:06', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1'),
(27, '000001', '000020', '2020-10-06 14:52:59', '001', 'AGUA M C/ GAS', 1, 3.5, 3.5, '1'),
(28, '000001', '000020', '2020-10-06 14:53:04', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1'),
(29, '000001', '000020', '2020-10-06 14:53:18', '031', 'PC DE LINGUIÇA C/ FRITAS', 1, 23, 23, '1'),
(30, '000001', '000020', '2020-10-06 14:57:11', '003', 'BACARDI', 1, 7, 7, '1'),
(31, '000001', '000020', '2020-10-06 14:57:21', '002', 'AGUA M S/GAS', 1, 3, 3, '1'),
(32, '000001', '000020', '2020-10-06 14:57:31', '011', 'CERVEJA (LATA 350ML)', 1, 5, 5, '1'),
(33, '000001', '000023', '2020-10-09 12:11:57', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1'),
(34, '000001', '000025', '2020-10-09 14:02:37', '011', 'CERVEJA (LATA 350ML)', 1, 5, 5, '1'),
(35, '000001', '000025', '2020-10-09 14:06:30', '002', 'AGUA M S/GAS', 1, 3, 3, '1'),
(36, '000001', '000026', '2020-10-13 11:21:53', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1'),
(37, '000001', '000026', '2020-10-13 11:22:04', '033', 'PC DE FRITAS', 1, 15, 15, '1'),
(38, '000001', '000026', '2020-10-13 11:22:14', '042', 'REFRIGERANTE  (LATA)', 1, 5, 5, '1'),
(39, '000001', '000026', '2020-10-13 11:22:27', '011', 'CERVEJA (LATA 350ML)', 1, 5, 5, '1'),
(40, '000001', '000027', '2020-11-04 12:53:43', '001', 'AGUA M C/ GAS', 1, 3.5, 3.5, '1'),
(41, '000001', '000027', '2020-11-04 12:53:48', '022', 'HAMBURGUER (MICROONDAS)', 1, 10, 10, '1'),
(42, '000001', '000028', '2020-11-06 17:28:19', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1'),
(43, '000001', '000028', '2020-11-06 17:29:16', '033', 'PC DE FRITAS', 1, 15, 15, '1'),
(44, '000001', '000029', '2020-11-06 17:29:38', '042', 'REFRIGERANTE  (LATA)', 1, 5, 5, '1'),
(45, '000001', '000029', '2020-11-06 19:45:32', '001', 'AGUA M C/ GAS', 1, 3.5, 3.5, '1'),
(46, '000001', '000030', '2020-11-11 11:36:31', '001', 'AGUA M C/ GAS', 1, 3.5, 3.5, '1'),
(47, '000001', '000030', '2020-11-11 11:36:44', '011', 'CERVEJA (LATA 350ML)', 2, 5, 10, '1');

-- --------------------------------------------------------

--
-- Table structure for table `t_produtos`
--

CREATE TABLE `t_produtos` (
  `FICHA` int(6) NOT NULL,
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
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_produtos`
--

INSERT INTO `t_produtos` (`FICHA`, `ID_GRUPO`, `ID_PRODUTO`, `PRODUTO`, `UNIDADE`, `VR_CUSTO`, `VR_VENDA`, `ESTQ_M`, `ENTRADAS`, `SAIDAS`, `SD_ATUAL`, `CHV`) VALUES
(2, '01', '001', 'AGUA M C/ GAS ', 'UN', 0, 3.5, 0, 0, 31, -31, '1'),
(3, '01', '002', 'AGUA M S/GAS ', 'UN', 0, 3, 0, 0, 30, -30, '1'),
(8, '01', '003', 'BACARDI ', 'DS', 0, 7, 0, 0, 1, -1, '1'),
(9, '02', '004', 'BOM BOM', 'UN', 0, 2, 0, 0, 2, -2, '1'),
(11, '02', '005', 'CAFE PARA  PERNOITE COBRADO', 'UN', 0, 15, 0, 0, 1, -1, '1'),
(12, '01', '006', 'CAIPIRINHA', 'DS', 0, 4.5, 0, 0, 0, 0, '1'),
(13, '01', '007', 'CAIPIVODKA', 'DS', 0, 5, 0, 0, 0, 0, '1'),
(14, '01', '008', 'CAMPARI ', 'DS', 0, 9, 0, 0, 0, 0, '1'),
(15, '01', '009', 'CATUABA 300 ML', 'UN', 4, 8, 0, 0, 1, -1, '1'),
(16, '01', '010', 'CATUABA G F', 'UN', 0, 19, 0, 0, 0, 0, '1'),
(17, '01', '011', 'CERVEJA (LATA 350ML)', 'UN', 0, 5, 0, 0, 131, -131, '1'),
(18, '01', '012', 'CERVEJA ZERO ( ALCOOL)', 'UN', 0, 7, 0, 0, 1, -1, '1'),
(19, '08', '013', 'CHINELOS DESCARTÁVEIS (PAR)', 'UN', 0, 3, 0, 0, 4, -4, '1'),
(20, '08', '014', 'CIGARO FREE (MAÇO)', 'UN', 6, 15, 0, 0, 0, 0, '1'),
(21, '08', '015', 'CIGARRO DERBY (MAÇO)', 'UN', 0, 13.5, 0, 0, 0, 0, '1'),
(22, '08', '016', 'CIGARRO SAN MARINO', 'UN', 0, 7, 0, 0, 8, -8, '1'),
(23, '08', '017', 'COBRAR TAÇA QUEBRADA', 'UN', 8, 10, 0, 0, 0, 0, '1'),
(24, '08', '018', 'CONDICIONADOR (SACHE)', 'UN', 0, 2, 0, 0, 0, 0, '1'),
(25, '01', '019', 'CONHAQUE', 'UN', 0, 5, 0, 0, 1, -1, '1'),
(26, '01', '020', 'CUBA LIBRE', 'DS', 0, 9, 0, 0, 0, 0, '1'),
(29, '02', '021', 'HALLS ( UNID)', 'UN', 0, 2, 0, 0, 2, -2, '1'),
(30, '02', '022', 'HAMBURGUER (MICROONDAS)', '6', 0, 10, 0, 0, 1, -1, '1'),
(31, '01', '023', 'ICE', 'UN', 0, 8, 0, 0, 0, 0, '1'),
(32, '08', '024', 'ISQUEIRO', 'UN', 0, 7, 0, 0, 2, -2, '1'),
(33, '08', '025', 'KIT DENTAL DESCARTAVEL', 'UN', 0, 5, 0, 0, 2, -2, '1'),
(34, '02', '026', 'LASANHA', 'UN', 0, 18, 0, 0, 2, -2, '1'),
(35, '08', '027', 'LUBRIFICANTE', 'UN', 0, 3, 0, 0, 18, -18, '1'),
(36, '01', '028', 'MARTINE', 'DS', 0, 7, 0, 0, 0, 0, '1'),
(37, '02', '029', 'MIXTO QUENTE', 'UN', 0, 4, 0, 0, 5, -5, '1'),
(38, '02', '030', 'PC DE BOLINHO DE MANDIOCA', 'UN', 0, 15, 0, 0, 0, 0, '1'),
(39, '02', '031', 'PC DE LINGUIÇA C/ FRITAS', 'UN', 0, 23, 0, 0, 3, -3, '1'),
(40, '02', '032', 'PC DE FRANGO A PASSARINHO', 'UN', 0, 18, 0, 0, 4, -4, '1'),
(41, '02', '033', 'PC DE FRITAS', 'UN', 0, 15, 0, 0, 2, -2, '1'),
(43, '02', '034', 'PC DE LINGUIÇA CALABRESA', 'UN', 0, 18, 0, 0, 0, 0, '1'),
(44, '02', '035', 'PC FRANGO PASSARINHO C/ FRITAS', 'PC', 0, 23, 0, 0, 5, -5, '1'),
(45, '02', '036', 'PC LING.CALABRESA C/ MANDIOQUINHA', 'UN', 10, 23, 0, 0, 0, 0, '1'),
(46, '08', '037', 'PENTE DESCARTAVEL', 'UN', 0, 2, 0, 0, 0, 0, '1'),
(48, '01', '038', 'PINGA 51', 'UN', 2, 3, 0, 0, 7, -7, '1'),
(49, '08', '039', 'PRESERVATIVO', 'UN', 0, 3, 0, 0, 20, -20, '1'),
(50, '08', '040', 'PRESTOBARBA', 'UN', 0, 3.5, 0, 0, 0, 0, '1'),
(51, '01', '041', 'RED BULL', 'UN', 0, 13, 0, 0, 0, 0, '1'),
(52, '01', '042', 'REFRIGERANTE  (LATA)', 'UN', 0, 5, 0, 0, 32, -32, '1'),
(54, '02', '043', 'SALGADINHO', 'UN', 0, 3.5, 0, 0, 0, 0, '1'),
(55, '08', '044', 'SHAMPOO (SACHE)', 'UN', 0, 2, 0, 0, 0, 0, '1'),
(56, '01', '045', 'SKOL BEATS', 'UN', 0, 10, 0, 0, 1, -1, '1'),
(57, '02', '046', 'PC DE ARROZ BRANCO', 'UN', 0, 5, 0, 0, 1, -1, '1'),
(58, '08', '047', 'TOCA DE BANHO', 'UN', 0, 2, 0, 0, 0, 0, '1'),
(59, '01', '048', 'VINHO SUAVE (GARRAFA 700ML)', 'GF', 0, 19, 0, 0, 2, -2, '1'),
(60, '01', '049', 'VINHO TAÇA (200ML)', 'TC', 0, 8, 0, 0, 0, 0, '1'),
(61, '01', '050', 'VODKA ORLOFF', 'DS', 0, 7, 0, 0, 0, 0, '1'),
(62, '01', '051', 'WHISKY BELL`S', 'UN', 0, 10, 0, 0, 0, 0, '1'),
(63, '01', '052', 'WHISKYS  OLD EIGHT', 'UN', 0, 10, 0, 0, 0, 0, '1'),
(64, '01', '053', 'WHITE HORSE (CAVALO BRANCO)', 'DS', 0, 15, 0, 0, 0, 0, '1'),
(66, '01', '054', 'SUCO NATURAL', 'UN', 0, 5, 0, 0, 2, -2, '1'),
(71, '01', '055', 'SUCO DE LATA 300ML', 'UN', 0, 5, 0, 0, 1, -1, '1'),
(72, '01', '056', 'CAFE PARA PERNOITE CORTESIA', 'UN', 0, 0, 0, 0, 7, -7, '1'),
(73, '02', '057', 'PC COSTELINHA', 'UN', 0, 25, 0, 0, 0, 0, '1'),
(74, '02', '058', 'PC COSTELINHA C/ FRITAS', 'UN', 0, 33, 0, 0, 2, -2, '1'),
(75, '08', '059', 'TOALHA EXTRA', 'UN', 0, 2.5, 0, 0, 7, -7, '1'),
(76, '08', '060', 'LENÇOL EXTRA ', 'UN', 0, 2.5, 0, 0, 4, -4, '1'),
(78, '02', '061', 'PC DE BACOM ', 'UN', 0, 23, 3, 0, 0, 3, '1'),
(79, '02', '062', 'PC DE BACOM COM FRITAS', 'UN', 0, 30, 0, 0, 0, 0, '1'),
(80, '02', '063', 'PC DE BACOM COM MANDIOCA', 'UN', 0, 30, 0, 0, 0, 0, '1'),
(81, '02', '064', 'PC FRANGO A PARMEGIANA', 'UN', 0, 26, 0, 0, 0, 0, '1'),
(82, '02', '065', 'NOVIDADE MASSA DEL GRANO', 'UN', 0, 26, 3, 0, 0, 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `t_rouparia`
--

CREATE TABLE `t_rouparia` (
  `FICHA` int(6) NOT NULL,
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
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_rouparia`
--

INSERT INTO `t_rouparia` (`FICHA`, `DIARIA`, `DH_RETIRADA`, `LC`, `FR`, `TB`, `TR`, `TP`, `TM`, `EC`, `COLETA`, `CHV`) VALUES
(1, '000001', '2020-09-15 17:27:54', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(2, '000002', '2020-09-15 19:15:46', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(3, '000003', '2020-09-17 14:06:01', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(4, '000005', '2020-09-17 16:01:54', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(5, '000006', '2020-09-17 17:46:16', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(6, '000004', '2020-09-17 18:36:04', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(7, '000009', '2020-09-18 12:29:22', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(8, '000008', '2020-09-18 12:29:27', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(9, '000007', '2020-09-18 12:29:35', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(10, '000010', '2020-09-24 11:17:57', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(11, '000011', '2020-09-24 14:00:42', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(12, '000012', '2020-10-05 12:32:03', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(13, '000013', '2020-10-05 12:33:27', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(14, '000014', '2020-10-05 12:33:32', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(15, '000015', '2020-10-05 12:33:36', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(16, '000017', '2020-10-05 21:14:55', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(17, '000016', '2020-10-05 21:15:01', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(18, '000018', '2020-10-05 21:15:06', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(19, '000019', '2020-10-06 14:51:08', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(20, '000020', '2020-10-08 16:42:10', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(21, '000022', '2020-10-09 12:09:06', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(22, '000021', '2020-10-09 12:09:10', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(23, '000023', '2020-10-09 13:53:11', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(24, '000024', '2020-10-10 11:16:49', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(25, '000025', '2020-10-10 11:16:58', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(26, '000026', '2020-10-13 11:43:56', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(27, '000027', '2020-11-04 12:54:29', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(28, '000028', '2020-11-06 17:31:54', 1, 2, 2, 0, 0, 0, 0, '', 'S'),
(29, '000029', '2020-11-06 20:02:43', 1, 2, 2, 0, 0, 0, 0, '', 'S');

-- --------------------------------------------------------

--
-- Table structure for table `t_usuarios`
--

CREATE TABLE `t_usuarios` (
  `FICHA` int(6) NOT NULL,
  `ID` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `USUARIO` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `SENHA` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `HR_ENTRADA` time NOT NULL,
  `HR_SAIDA` time NOT NULL,
  `IDC` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_usuarios`
--

INSERT INTO `t_usuarios` (`FICHA`, `ID`, `USUARIO`, `SENHA`, `HR_ENTRADA`, `HR_SAIDA`, `IDC`) VALUES
(9, '000001', 'GERENCIA', '*FEBD3F175627C983536CFD57AC42DE8D823AAD91', '07:00:00', '19:00:00', 7),
(11, '000003', 'ADMINISTRAÇÃO', '*1A030512019B7B4B97167D5515EBB6C7105EB12F', '07:00:00', '19:00:00', 9),
(21, '000005', 'DIARISTA', '*B605506AD326DC1729B84E074D697EDA13DE8C1F', '07:00:00', '19:00:00', 1),
(22, '000007', 'SUPORTE', '*1A030512019B7B4B97167D5515EBB6C7105EB12F', '07:00:00', '19:00:00', 9),
(23, '000008', 'VISITANTE', '*4CB947971FACB7AB4E93FAF2078DD186A4C91A46', '07:00:00', '19:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_apartamentos`
--
ALTER TABLE `t_apartamentos`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_caixa`
--
ALTER TABLE `t_caixa`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_coletas`
--
ALTER TABLE `t_coletas`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_contas`
--
ALTER TABLE `t_contas`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_diarias`
--
ALTER TABLE `t_diarias`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_empresa`
--
ALTER TABLE `t_empresa`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_estoque`
--
ALTER TABLE `t_estoque`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_feriados`
--
ALTER TABLE `t_feriados`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_fornecedores`
--
ALTER TABLE `t_fornecedores`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_grupos`
--
ALTER TABLE `t_grupos`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_idc`
--
ALTER TABLE `t_idc`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_pedidos`
--
ALTER TABLE `t_pedidos`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_produtos`
--
ALTER TABLE `t_produtos`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_rouparia`
--
ALTER TABLE `t_rouparia`
  ADD PRIMARY KEY (`FICHA`);

--
-- Indexes for table `t_usuarios`
--
ALTER TABLE `t_usuarios`
  ADD PRIMARY KEY (`FICHA`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_apartamentos`
--
ALTER TABLE `t_apartamentos`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `t_caixa`
--
ALTER TABLE `t_caixa`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_coletas`
--
ALTER TABLE `t_coletas`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_diarias`
--
ALTER TABLE `t_diarias`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `t_empresa`
--
ALTER TABLE `t_empresa`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_estoque`
--
ALTER TABLE `t_estoque`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `t_feriados`
--
ALTER TABLE `t_feriados`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `t_fornecedores`
--
ALTER TABLE `t_fornecedores`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_grupos`
--
ALTER TABLE `t_grupos`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_idc`
--
ALTER TABLE `t_idc`
  MODIFY `FICHA` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_pedidos`
--
ALTER TABLE `t_pedidos`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `t_produtos`
--
ALTER TABLE `t_produtos`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `t_rouparia`
--
ALTER TABLE `t_rouparia`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `t_usuarios`
--
ALTER TABLE `t_usuarios`
  MODIFY `FICHA` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
