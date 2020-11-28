-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2020 at 08:49 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whitegood`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billing_id` int(10) NOT NULL,
  `request_id` int(10) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`) VALUES
(1, 'Samsung'),
(2, 'LG'),
(3, 'Godrej'),
(4, 'Whirlpool');

-- --------------------------------------------------------

--
-- Table structure for table `employee_role`
--

CREATE TABLE `employee_role` (
  `user_id` int(4) NOT NULL,
  `install` varchar(1) NOT NULL,
  `inventory` varchar(1) NOT NULL,
  `demo` varchar(1) NOT NULL,
  `upgrade` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_role`
--

INSERT INTO `employee_role` (`user_id`, `install`, `inventory`, `demo`, `upgrade`) VALUES
(9, '0', '0', '0', '0'),
(10, '1', '0', '1', '1'),
(11, '0', '0', '0', '1'),
(12, '0', '0', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `product_id` varchar(15) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text,
  `price` int(10) NOT NULL,
  `quantity` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `user_id` int(4) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`user_id`, `password`) VALUES
(8, '$2b$10$jwj/rz0sj7kw6LgFG7d6WeyWJiixq6qKcgQreznr1ShrlgtjcnQf.'),
(9, '$2b$10$HYZ6BlJ8v63gDQUthubUx.MAj.3gkDNSUHg.7Rcr5pSFMjq./EgaO'),
(10, '$2b$10$4v7up9pw.OAkoqfiSfZ6aOPbyIHhn3rIbf6tiviwT3E4CBSYgWJsW'),
(9, '$2b$10$0fkbXizzv7UTE4gSlkJpUOetJOED.e4ljPy3tFztzf5T0YF.ytY7a'),
(9, '$2b$10$Ab4OdmUcon5Lk6WQU6JxNuTNcwygBlqXTsditNqi7tmXTTemogX9O'),
(11, '$2b$10$zet8wo1hfBA863cIvuLXjud.q61l9tbfomkYBsPxtJ6pS7yRGHFgO'),
(9, '$2b$10$QlqzKYk2MoNuVEWWxktOWeNJyRJ9PR5fke92MLvDIPJastiyFgmU6'),
(9, '$2b$10$cN4wa9pNYGhZaRJ3Z2ClJeUW0XHtUpapiOpmPSY6WkMnw0yU3.rcO'),
(12, '$2b$10$A788pSDkTboNgKUW6whT0u8XRhUDxllIxvusbUvu5DiNffoUkhW8u');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `model_id` int(11) NOT NULL,
  `model_no` varchar(100) NOT NULL,
  `model_price` varchar(100) NOT NULL,
  `model_img` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `whitegoodcategory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`model_id`, `model_no`, `model_price`, `model_img`, `brand_id`, `whitegoodcategory_id`) VALUES
(1, 'Samsung 253 LRT28T3032SE/HL ', 'Rs 20,490', 'https://drive.google.com/file/d/1LtkYCwCXY2SN20oUUcZwaaz9VsHMJDe4/view?usp=sharing', 1, 2),
(2, 'Samsung 324 L RT34T4513S8/HL', 'Rs 32,290', 'https://drive.google.com/file/d/1vA8KNShswY0xLfOyQVIzVPXH6qAuVO5R/view?usp=sharing', 1, 2),
(3, 'Samsung 700 L RS72R5001M9/TL', 'Rs 74,990', 'https://drive.google.com/file/d/1XQuBs24LnOvZa9CkhCyj7bb5UbsjDFQu/view?usp=sharing', 1, 2),
(4, 'Samsung 192 L RR19T271BR2/NL', 'Rs 12,990', 'https://drive.google.com/file/d/1UabetkLWZKb9IiDlSzKLSOGNfuBGeNil/view?usp=sharing', 1, 2),
(5, 'LG 284 Litres GL-T302RPZY', 'Rs 36,190', 'https://drive.google.com/file/d/1hJG0Cp_EwV1BiSUzKBRquwYoW2GqqDbz/view?usp=sharing', 2, 2),
(6, 'LG 188 Litres GL-B191KPDD', 'Rs 16,990', 'https://drive.google.com/file/d/1LJvdhwVbswkNtV-cFn1DrkIhdTd7w_Wn/view?usp=sharing', 2, 2),
(7, 'LG 188 Litres GL-B191KSDD     ', 'Rs 15,990 ', 'https://drive.google.com/file/d/1FTsWg_PZ-4kaIAHDZu1SBxGBW4HBgk0H/view?usp=sharing', 2, 2),
(8, 'LG 374 Litres GC-B459NLFF ', 'Rs 46,990', 'https://drive.google.com/file/d/1PEZJ2JRBfLgiCrVumGALL1ANUSxY3-qi/view?usp=sharing', 2, 2),
(9, 'Godrej 236 L RF EON 236B 25 HI RY DR', 'Rs 18,290', 'https://drive.google.com/file/d/1O3ZZ8LVDL3BCQmJf-H7HjYgzLWh9GPXT/view?usp=sharing', 3, 2),
(10, 'Godrej 190 L RD 1905 PTDI 53 GL BL', 'Rs 16,190', 'https://drive.google.com/file/d/1RoayNoAc8qY7o6BRnpHOWcHLG4HNawFY/view?usp=sharing', 3, 2),
(11, 'Godrej 231 L RF EON 245A 15 HF SI ST', 'Rs 16,790', 'https://drive.google.com/file/d/1guKQYNNSnYOdsD5aqkp80MF8Nij7ugqQ/view?usp=sharing', 3, 2),
(12, 'Godrej 260 L RF EON 260C 35 RCIF ST RH', 'Rs 22,990', 'https://drive.google.com/file/d/19Qk1J9jTIIKjKUjQ6-JN9F3eW3IYu5b2/view?usp=sharing', 3, 2),
(13, 'Whirlpool 190 L WDE 205 CLS 2S', 'Rs 11,290', 'https://drive.google.com/file/d/1fJf61hB-kj6luHNkPBL3qKt0hm3VFQ_e/view?usp=sharing', 4, 2),
(14, 'Whirlpool 265 L IF INV CNV 278', 'Rs 24,240', 'https://drive.google.com/file/d/1Fd6_pJ_iq2Md03UjjgYs_lMCq5GviCWa/view?usp=sharing', 4, 2),
(15, 'Whirlpool 340 L IF INV CNV 355', 'Rs 30,990', 'https://drive.google.com/file/d/11fNenz1gGr1kc7g3ztt7YThCY_RpUZo4/view?usp=sharing', 4, 2),
(16, 'Whirlpool 245 L NEO 258H ROY WINE ABYSS (2S)-N', 'Rs 19,490', 'https://drive.google.com/file/d/1biP2GfvzNLsT31ox84-wmzyDg4BHrq1b/view?usp=sharing', 4, 2),
(17, 'AR18TV5HLTU Split AC powered by Triple Inverter with Convertible Mode 5.00kW (1.5T)', 'Rs 34,990', 'https://drive.google.com/file/d/1H6cFW9JE51vEYV3foqKQuiyfjRHkyJhW/view?usp=sharing', 1, 1),
(18, 'AR18TY3CAWK Inverter Split AC powered by AI Auto Cooling 5.00kW (1.5T)', 'Rs 52,000', 'https://drive.google.com/file/d/10kVpHKzts-W35_odKAbwpJP9wwpNti5I/view?usp=sharing', 1, 1),
(19, 'AR18TY3QBBU Inverter Split AC powered by Digital Inverter with Faster Cooling 4.98kW (1.5T)', 'Rs 39,000', 'https://drive.google.com/file/d/1hmT-TdpzKFSEVs8pgJovuuvtooljTaPR/view?usp=sharing', 1, 1),
(20, 'AR12RG3BAWK On-Off Split AC powered by long lasting cooling 3.30kW (1.0T)', 'Rs 45,000', 'https://drive.google.com/file/d/1HhWqdaheA00aI0LU7U8WlWf8jM175h7J/view?usp=sharing', 1, 1),
(21, 'Whirlpool 0.8 Ton 3 Star Split Inverter AC - White (0.8T MAGICOOL INVERTER 3S COPR-W-I/ODU, Copper C', 'Rs 34,990', 'https://drive.google.com/file/d/1oJBOTKnV40Vo1qpF_DTO3iDWiK0mIlzD/view?usp=sharing', 4, 1),
(22, 'Whirlpool 1 Ton 3 Star Split AC - White, Grey', 'Rs 52,000', 'https://drive.google.com/file/d/1QWYKW8T1-1iGw1TByM6PJEqIdtPYfwSr/view?usp=sharing', 4, 1),
(23, 'Whirlpool 1.5 Ton 3 Star Window AC ', 'Rs 39,000', 'https://drive.google.com/file/d/1fcFEczijWgZ5lSk_YBIJJC4l2OwDC8Ga/view?usp=sharing', 4, 1),
(24, 'Whirlpool 1 Ton 3 Star Split Inverter AC - White', 'Rs 45,000', 'https://drive.google.com/file/d/1mPQOS65NszCBkhx2YLeXdVGqPj_nZSiJ/view?usp=sharing', 4, 1),
(25, 'GIC 24 MGP5 WRA', 'Rs 34,990', 'https://drive.google.com/file/d/19PObl_TDc02R8M5P3yHXDduuTiiQD3_4/view?usp=sharing', 3, 1),
(26, 'GSC 12NTC3 WTA', 'Rs 52,000', 'https://drive.google.com/file/d/12XEXDd0MKgiBfA6hjjqo_n7BXVdTAbCO/view?usp=sharing', 3, 1),
(27, 'GIC 12FTC3-WSA', 'Rs 39,000', 'https://drive.google.com/file/d/1BcYfLZPmN-pW1iCN3u4Cb1-_Pc_JreD-/view?usp=sharing', 3, 1),
(28, 'GIC 18JTC3-WTA', 'Rs 45,000', 'https://drive.google.com/file/d/1H7Qn8qTNa_htPgtCUUt5fY7xD9aB8bqa/view?usp=sharing', 3, 1),
(29, 'Dual Inverter Hot & Cold Split Air Conditioner with 4 Way Swing LS-H18VNXD', 'Rs 34,990', 'https://drive.google.com/file/d/1YEj7O5IgMJheo0VxJOaj9EQRuAk-fmaq/view?usp=sharing', 2, 1),
(30, 'DUAL Inverter Window Air Conditioner with Ocean Black Protection JW-Q09WUZA', 'Rs 52,000', 'https://drive.google.com/file/d/1Zn6GWNDnxh4M71-bJS2YUbK3l4-1_0ZA/view?usp=sharing', 2, 1),
(31, 'Dual Inverter 3 Star Split Air Conditioner with 4-in-1 Convertible Cooling & Ocean Black Fin LS-Q18P', 'Rs 39,000', 'https://drive.google.com/file/d/1YEj7O5IgMJheo0VxJOaj9EQRuAk-fmaq/view?usp=sharing', 2, 1),
(32, 'Dual Inverter 5 Star Split Air Conditioner with Anti Allergic Filter & 4-in1 Convertible Cooling LS-', 'Rs 45,000', 'https://drive.google.com/file/d/1B5NAISe_vNfKH_yINBRwOHWkuhyvZC9q/view?usp=sharing', 2, 1),
(33, 'CE78JDM Convection MWO with SlimFry™, 21L', 'Rs 11,900', 'https://drive.google.com/file/d/1FnlpouTn4peNdOUuEQcwP8AHJ1YXMI4v/view?usp=sharing', 1, 3),
(34, 'MC28M6036CK Convection MWO with Masala & Sun-Dry, 28L', 'Rs 16,800', 'https://drive.google.com/file/d/1v1qUEdvznlPokYIYS1O3tH0H9n2bap_i/view?usp=sharing', 1, 3),
(35, 'MC28H5013AK Convection MWO with Curd Any Time 28L', 'Rs 9,990', 'https://drive.google.com/file/d/14pppot6-sFduea5_VrppPp6Tx2tn9O0W/view?usp=sharing', 1, 3),
(36, 'MC32K7056CC Convection MWO with Masala & Sun Dry™, 32L', 'Rs 22,600', 'https://drive.google.com/file/d/1t5JR441hmxyPjom9UwcYTnOvGzDGfayU/view?usp=sharing', 1, 3),
(37, 'Godrej 23 L Convection Microwave Oven GME 523 CF1 RM', 'Rs 8,896', 'https://drive.google.com/file/d/1IMa75TxNVDz0Wd62epP4nlNpQiXZibqg/view?usp=sharing', 3, 3),
(38, 'Godrej 20 L Solo Microwave Oven GMX 20SA2BLM', 'Rs 4,990', 'https://drive.google.com/file/d/1Eq5PnMIp0JdIs9paYSrY8qsCHqbTeSDw/view?usp=sharing', 3, 3),
(39, 'Godrej 20 L Grill Microwave Oven GME 720 GF1 PZ', 'Rs 7,800', 'https://drive.google.com/file/d/1_QbRqBW9IQhm3PHY4fAlUAydQ06hps6c/view?usp=sharing', 3, 3),
(40, 'Godrej 28 L Convection Microwave Oven GME 728 CF1 PM', 'Rs 13,900', 'https://drive.google.com/file/d/1CDsRLEEWHlWHe1sZy93zoP1l9MX85nPL/view?usp=sharing', 3, 3),
(41, 'Whirlpool 20 L Solo Microwave Oven MAGICOOK PRO 20SE black', 'Rs 6,400', 'https://drive.google.com/file/d/1q2-Ke-T9ANSrPZ2CZ6oC04ZTzMAkzPcS/view?usp=sharing', 4, 3),
(42, 'Whirlpool 30 L Convection Microwave Oven MAGICOOK 30L Wine Magnolia', 'Rs 15,900', 'https://drive.google.com/file/d/1WsTMuHWJsBpv8lcaayZhgJ_p8b3W1Hjg/view?usp=sharing', 4, 3),
(43, 'Whirlpool 20 L Convection Microwave Oven Magicook Pro 22CE', 'Rs 9,150', 'https://drive.google.com/file/d/1BFDQQlv8YvwK7o64VpeRoZenyqa_xURI/view?usp=sharing', 4, 3),
(44, 'Whirlpool 25 L Convection Microwave Oven GT-288 (25 L Jet Crisp)', 'Rs 11,099', 'https://drive.google.com/file/d/1lJ53O_WEi4xK7oShCTuAamwXO1eEQ9ol/view?usp=sharing', 4, 3),
(45, 'LG All In One Microwave Oven MJEN326SF', 'Rs 30,790', 'https://drive.google.com/file/d/1Xg7FnsvyUmylymZDRILEkFZ6vosBycqD/view?usp=sharing', 2, 3),
(46, 'LG Microwave Oven with Diet Fry™ and 251 Auto cook Menu MC2886BLT', 'Rs 15,890', 'https://drive.google.com/file/d/1GPCj8N9d9-Sqo2HFwFFYdSrrnFiLgu0c/view?usp=sharing', 2, 3),
(47, '42L NeoChef Microwave with Smart Inverter MS4295DIS', 'Rs 14,490', 'https://drive.google.com/file/d/1J0Mr-Wj7iGbg0Qpm0_fm9__o6J0JtRjz/view?usp=sharing', 2, 3),
(48, '20 L Grill with Glass Door MH2044DB', 'Rs 8,090', 'https://drive.google.com/file/d/1K7l8AftXhmNqskOgNoHP4q2He1SaexHw/view?usp=sharing', 2, 3),
(49, 'WA65T4560NS Top Loading with ActivWash 6.5 Kg', 'Rs 21,300', 'https://drive.google.com/file/d/12nJfSeSe02kVoqdnBBBmA9xpB4EtjWWY/view?usp=sharing', 1, 4),
(50, 'WA10T5260BV Top Loading with Inverter Motor 10.0Kg', 'Rs 32,100', 'https://drive.google.com/file/d/1ow3e-kity2FiXlLH-3h8EuljYzM87092/view?usp=sharing', 1, 4),
(51, 'WA65N4261SS Top Loading with Digital Inverter motor 6.5Kg', 'Rs 21,800', 'https://drive.google.com/file/d/1w8xGK8G8tbYYJ1K-YHUVwltmXaBfhhmA/view?usp=sharing', 1, 4),
(52, 'WA70T4262BS Top Loading with Wobble Technology 7.0Kg', 'Rs 22,200', 'https://drive.google.com/file/d/1w08wlpw5qv2qadgzSeFarSrRx7BgTP4z/view?usp=sharing', 1, 4),
(53, 'Wash 8Kg and Spin 6 Kg, 5 Star, Rust Free Body, Roller Jet Pulsator, P8030SGAZ', 'Rs 14,990', 'https://drive.google.com/file/d/14lW7ep_7CZV7HTyp4KEqy4LU03fp79RA/view?usp=sharing', 2, 4),
(54, '8.0Kg, AI Direct Drive™ Washer with Steam™ & TurboWash™ FHV1408ZWB', 'Rs 47,990', 'https://drive.google.com/file/d/1xeApqjscIGv-Y18rejSy_HXoz1vTyZN2/view?usp=sharing', 2, 4),
(55, '8.0kg, 5 Star, Amber Steel, Jet Spray+, Punch+ 3, TurboDrum T80SJAS1Z', 'Rs 31,290', 'https://drive.google.com/file/d/1SWs0Ddn6rKqTS0yTlFIFF4qq8etMzShH/view?usp=sharing', 2, 4),
(56, '8.0 Kg, 6 Motion Direct Drive, Touch Panel, Fuzzy Logic, Baby Care, Sports wear, Child Lock, Front L', 'Rs 34,990', 'https://drive.google.com/file/d/1Tb-fXcH8PaOu-FJMAsDfKkciqysmYz-y/view?usp=sharing', 2, 4),
(57, 'Whirlpool 6.2 kg Hard Water wash Fully Automatic Top Load Grey', 'Rs 12,499', 'https://drive.google.com/file/d/1fT4SPw1FSE98rDVhtFDcabm9hfkjN7bA/view?usp=sharing', 4, 4),
(58, 'Whirlpool 7 kg 5 Star,Turbo Scrub Technology Semi Automatic Top Load Grey SUPERB ATOM 70S GREY DAZZL', 'Rs 9,299', 'https://drive.google.com/file/d/1lxu8kU5nIdz0_m3nGISDnKhzo4FwN9vL/view?usp=sharing', 4, 4),
(59, 'Whirlpool 7.5 kg 5 Star, Ace Wash Station Semi Automatic Top Load Grey ACE 7.5 SUPREME GREY DAZZLE', 'Rs 9,990', 'https://drive.google.com/file/d/14hVWsbJHlgiyMq6xcdrxvWvQQmoYjITM/view?usp=sharing', 4, 4),
(60, 'Whirlpool 8.2 kg Supersoak Technology Semi Automatic Top Load Pink ACE 8.2 SUPER SOAK (TULIP PINK) (', 'Rs 11,499', 'https://drive.google.com/file/d/1i1a0Lc8kcrt1kHm7KEVtZuFUopKT71YA/view?usp=sharing', 4, 4),
(61, 'Godrej 7 kg Fully Automatic Top Load Grey WTEON 700 AD 5.0 ROGR', 'Rs 14,790', 'https://drive.google.com/file/d/11qk96W-o5KyzFvwyETrd-LC98VLz5TVJ/view?usp=sharing', 3, 4),
(62, 'Godrej 6.2 kg Fully Automatic Top Load Grey WT EON 620 A Gp Gr', 'Rs 11,990', 'https://drive.google.com/file/d/1aehegvbEOWx7sWGHxpFG4FBLtJqqK0f-/view?usp=sharing', 3, 4),
(63, 'Godrej 8.5 kg Semi Automatic Top Load Red, White WS EDGE 8.5 TB3 M', 'Rs 12,999', 'https://drive.google.com/file/d/1LkK5QphMLwpGhU3DUXI6uhe2Ox8_KatY/view?usp=sharing', 3, 4),
(64, 'Godrej 7 kg Semi Automatic Top Load White, Blue WSAXIS 70 5.SN2 T BL', 'Rs 9,190', 'https://drive.google.com/file/d/1yqtGzANOHgr_UIzO1JV2uRRaFOcGENr8/view?usp=sharing', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `part_id` int(11) NOT NULL,
  `part_no` varchar(50) NOT NULL,
  `part_name` varchar(100) NOT NULL,
  `part_price` varchar(50) NOT NULL,
  `part_img` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `whitegoodcategory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`part_id`, `part_no`, `part_name`, `part_price`, `part_img`, `brand_id`, `whitegoodcategory_id`) VALUES
(1, 'SMR01', 'Compressor', '2500', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 1, 2),
(2, 'SMR02', 'Compressor', '3000', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 1, 2),
(3, 'SMR03', 'Compressor', '3500', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 1, 2),
(4, 'SMR04', 'Compressor', '1500', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 1, 2),
(5, 'SMR10', 'Condenser Coil', '300', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 1, 2),
(6, 'SMR11', 'Condenser Coil', '500', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 1, 2),
(7, 'SMR12', 'Condenser Coil', '800', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 1, 2),
(8, 'SMR13', 'Condenser Coil', '1500', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 1, 2),
(9, 'SMR20', 'Refrigerator Lamp', '50', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 1, 2),
(10, 'SMR21', 'Refrigerator Lamp', '80', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 1, 2),
(11, 'SMR22', 'Refrigerator Lamp', '100', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 1, 2),
(12, 'SMR30', 'Refrigerator Thermostat', '300', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 1, 2),
(13, 'SMR31', 'Refrigerator Thermostat', '500', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 1, 2),
(14, 'SMR23', 'Refrigerator Lamp', '150', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 1, 2),
(15, 'SMR32', 'Refrigerator Thermostat', '550', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 1, 2),
(16, 'SMR33', 'Refrigerator Thermostat', '750', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 1, 2),
(17, 'LGR01', 'Compressor', '2500', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 2, 2),
(18, 'LGR02', 'Compressor', '3000', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 2, 2),
(19, 'LGR03', 'Compressor', '3500', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 2, 2),
(20, 'LGR04', 'Compressor', '1500', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 2, 2),
(21, 'LGR10', 'Condenser Coil', '300', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 2, 2),
(22, 'LGR11', 'Condenser Coil', '500', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 2, 2),
(23, 'LGR12', 'Condenser Coil', '550', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 2, 2),
(24, 'LGR13', 'Condenser Coil', '800', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 2, 2),
(25, 'LGR20', 'Refrigerator Lamp', '50', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 2, 2),
(26, 'LGR21', 'Refrigerator Lamp', '80', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 2, 2),
(27, 'LGR22', 'Refrigerator Lamp', '100', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 2, 2),
(28, 'LGR23', 'Refrigerator Lamp', '150', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 2, 2),
(29, 'LGR30', 'Refrigerator Thermostat', '300', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 2, 2),
(30, 'LGR31', 'Refrigerator Thermostat', '500', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 2, 2),
(31, 'LGR32', 'Refrigerator Thermostat', '550', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 2, 2),
(32, 'LGR33', 'Refrigerator Thermostat', '750', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 2, 2),
(33, 'GR01', 'Compressor', '2500', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 3, 2),
(34, 'GR02', 'Compressor', '3000', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 3, 2),
(35, 'GR03', 'Compressor', '3500', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 3, 2),
(36, 'GR04', 'Compressor', '1500', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 3, 2),
(37, 'GR10', 'Condenser Coil', '300', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 3, 2),
(38, 'GR11', 'Condenser Coil', '500', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 3, 2),
(39, 'GR12', 'Condenser Coil', '800', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 3, 2),
(40, 'GR13', 'Condenser Coil', '150', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 3, 2),
(41, 'GR20', 'Refrigerator Lamp', '50', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 3, 2),
(42, 'GR21', 'Refrigerator Lamp', '80', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 3, 2),
(43, 'GR22', 'Refrigerator Lamp', '100', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 3, 2),
(44, 'GR23', 'Refrigerator Lamp', '150', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 3, 2),
(45, 'GR30', 'Refrigerator Thermostat', '300', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 3, 2),
(46, 'GR31', 'Refrigerator Thermostat', '500', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 3, 2),
(47, 'GR32', 'Refrigerator Thermostat', '550', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 3, 2),
(48, 'GR33', 'Refrigerator Thermostat', '750', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 3, 2),
(49, 'WR01', 'Compressor', '2500', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 4, 2),
(50, 'WR02', 'Compressor', '3000', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 4, 2),
(51, 'WR03', 'Compressor', '3500', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 4, 2),
(52, 'WR04', 'Compressor', '1500', 'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing', 4, 2),
(53, 'WR10', 'Condenser Coil', '300', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 4, 2),
(54, 'WR11', 'Condenser Coil', '500', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 4, 2),
(55, 'WR12', 'Condenser Coil', '800', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 4, 2),
(56, 'WR13', 'Condenser Coil', '1500', 'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing', 4, 2),
(57, 'WR20', 'Refrigerator Lamp', '50', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 4, 2),
(58, 'WR21', 'Refrigerator Lamp', '80', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 4, 2),
(59, 'WR22', 'Refrigerator Lamp', '100', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 4, 2),
(60, 'WR23', 'Refrigerator Lamp', '150', 'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing', 4, 2),
(61, 'WR30', 'Refrigerator Thermostat', '300', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 4, 2),
(62, 'WR31', 'Refrigerator Thermostat', '500', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 4, 2),
(63, 'WR32', 'Refrigerator Thermostat', '550', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 4, 2),
(64, 'WR33', 'Refrigerator Thermostat', '750', 'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing', 4, 2),
(65, 'SMA01', 'Ac Copper Pipe', '540', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 1, 1),
(66, 'SMA02', 'Ac Copper Pipe', '600', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 1, 1),
(67, 'SMA03', 'Ac Copper Pipe', '640', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 1, 1),
(68, 'SMA04', 'Ac Copper Pipe', '700', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 1, 1),
(69, 'SMA10', 'AC Condensers', '1500', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 1, 1),
(70, 'SMA11', 'AC Condensers', '1800', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 1, 1),
(71, 'SMA12', 'AC Condensers', '2000', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 1, 1),
(72, 'SMA13', 'AC Condensers', '2500', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 1, 1),
(73, 'SMA20', 'PVC Blue Drain Pipe', '120', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 1, 1),
(74, 'SMA21', 'PVC Blue Drain Pipe', '150', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 1, 1),
(75, 'SMA22', 'PVC Blue Drain Pipe', '180', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 1, 1),
(76, 'SMA23', 'PVC Blue Drain Pipe', '200', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 1, 1),
(77, 'WA01', 'Ac Copper Pipe', '540', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 4, 1),
(78, 'WA02', 'Ac Copper Pipe', '600', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 4, 1),
(79, 'WA03', 'Ac Copper Pipe', '640', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 4, 1),
(80, 'WA04', 'Ac Copper Pipe', '700', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 4, 1),
(81, 'WA10', 'AC Condensers', '1500', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 4, 1),
(82, 'WA11', 'AC Condensers', '1800', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 4, 1),
(83, 'WA12', 'AC Condensers', '2000', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 4, 1),
(84, 'WA13', 'AC Condensers', '2500', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 4, 1),
(85, 'WA20', 'PVC Blue Drain Pipe', '120', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 4, 1),
(86, 'WA21', 'PVC Blue Drain Pipe', '180', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 4, 1),
(87, 'WA22', 'PVC Blue Drain Pipe', '150', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 4, 1),
(88, 'WA23', 'PVC Blue Drain Pipe', '200', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 4, 1),
(89, 'GA01', 'Ac Copper Pipe', '540', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 3, 1),
(90, 'GA02', 'Ac Copper Pipe', '600', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 3, 1),
(91, 'GA03', 'Ac Copper Pipe', '640', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 3, 1),
(92, 'GA04', 'Ac Copper Pipe', '700', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 3, 1),
(93, 'GA10', 'AC Condensers', '1500', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 3, 1),
(94, 'GA11', 'AC Condensers', '1800', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 3, 1),
(95, 'GA12', 'AC Condensers', '2000', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 3, 1),
(96, 'GA13', 'AC Condensers', '2500', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 3, 1),
(97, 'GA20', 'PVC Blue Drain Pipe', '120', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 3, 1),
(98, 'GA21', 'PVC Blue Drain Pipe', '150', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 3, 1),
(99, 'GA22', 'PVC Blue Drain Pipe', '180', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 3, 1),
(100, 'GA23', 'PVC Blue Drain Pipe', '200', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 3, 1),
(101, 'LGA01', 'Ac Copper Pipe', '540', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 2, 1),
(102, 'LGA02', 'Ac Copper Pipe', '600', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 2, 1),
(103, 'LGA03', 'Ac Copper Pipe', '640', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 2, 1),
(104, 'LGA04', 'Ac Copper Pipe', '700', 'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing', 2, 1),
(105, 'LGA10', 'AC Condensers', '1500', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 2, 1),
(106, 'LGA11', 'AC Condensers', '1800', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 2, 1),
(107, 'LGA12', 'AC Condensers', '2000', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 2, 1),
(108, 'LGA13', 'AC Condensers', '2500', 'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing', 2, 1),
(109, 'LGA20', 'PVC Blue Drain Pipe', '120', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 2, 1),
(110, 'LGA21', 'PVC Blue Drain Pipe', '150', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 2, 1),
(111, 'LGA22', 'PVC Blue Drain Pipe', '180', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 2, 1),
(112, 'LGA23', 'PVC Blue Drain Pipe', '200', 'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing', 2, 1),
(113, 'SMO01', 'Magnetron', '999', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 1, 3),
(114, 'SMO02', 'Magnetron', '999', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 1, 3),
(115, 'SMO03', 'Magnetron', '1200', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 1, 3),
(116, 'SMO04', 'Magnetron', '1500', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 1, 3),
(117, 'SMO10', 'Capacitor', '100', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 1, 3),
(118, 'SMO11', 'Capacitor', '120', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 1, 3),
(119, 'SMO12', 'Capacitor', '150', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 1, 3),
(120, 'SMO13', 'Capacitor', '180', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 1, 3),
(121, 'SMO20', 'MicroWave Fuse', '250', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 1, 3),
(122, 'SMO21', 'MicroWave Fuse', '280', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 1, 3),
(123, 'SMO22', 'MicroWave Fuse', '300', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 1, 3),
(124, 'SMO23', 'MicroWave Fuse', '320', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 1, 3),
(125, 'GO01', 'Magnetron', '999', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 3, 3),
(126, 'GO02', 'Magnetron', '999', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 3, 3),
(127, 'GO03', 'Magnetron', '1200', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 3, 3),
(128, 'GO04', 'Magnetron', '1500', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 3, 3),
(129, 'GO10', 'Capacitor', '100', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 3, 3),
(130, 'GO11', 'Capacitor', '120', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 3, 3),
(131, 'GO12', 'Capacitor', '150', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 3, 3),
(132, 'GO13', 'Capacitor', '180', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 3, 3),
(133, 'GO20', 'MicroWave Fuse', '250', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 3, 3),
(134, 'GO21', 'MicroWave Fuse', '280', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 3, 3),
(135, 'GO22', 'MicroWave Fuse', '300', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 3, 3),
(136, 'GO23', 'MicroWave Fuse', '320', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 3, 3),
(137, 'WO01', 'Magnetron', '999', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 4, 3),
(138, 'WO02', 'Magnetron', '999', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 4, 3),
(139, 'WO03', 'Magnetron', '1200', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 4, 3),
(140, 'WO04', 'Magnetron', '1500', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 4, 3),
(141, 'WO10', 'Capacitor', '100', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 4, 3),
(142, 'WO11', 'Capacitor', '120', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 4, 3),
(143, 'WO12', 'Capacitor', '150', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 4, 3),
(144, 'WO13', 'Capacitor', '180', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 4, 3),
(145, 'WO20', 'MicroWave Fuse', '250', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 4, 3),
(146, 'WO21', 'MicroWave Fuse', '280', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 4, 3),
(147, 'WO22', 'MicroWave Fuse', '300', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 4, 3),
(148, 'WO23', 'MicroWave Fuse', '320', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 4, 3),
(149, 'LGO01', 'Magnetron', '999', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 2, 3),
(150, 'LGO02', 'Magnetron', '999', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 2, 3),
(151, 'LGO03', 'Magnetron', '1200', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 2, 3),
(152, 'LGO04', 'Magnetron', '1500', 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 2, 3),
(153, 'LGO10', 'Capacitor', '100', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 2, 3),
(154, 'LGO11', 'Capacitor', '120', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 2, 3),
(155, 'LGO12', 'Capacitor', '150', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 2, 3),
(156, 'LGO13', 'Capacitor', '180', 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 2, 3),
(157, 'LGO20', 'MicroWave Fuse', '250', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 2, 3),
(158, 'LGO21', 'MicroWave Fuse', '280', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 2, 3),
(159, 'LGO22', 'MicroWave Fuse', '300', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 2, 3),
(160, 'LGO22', 'MicroWave Fuse', '300', 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 2, 3),
(161, 'SMW01', 'Washing Machine Motor', '450', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 1, 4),
(162, 'SMW02', 'Washing Machine Motor', '450', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 1, 4),
(163, 'SMW03', 'Washing Machine Motor', '470', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 1, 4),
(164, 'SMW04', 'Washing Machine Motor', '500', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 1, 4),
(165, 'SMW10', 'Washing Machine pcb', '2000', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 1, 4),
(166, 'SMW11', 'Washing Machine pcb', '2000', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 1, 4),
(167, 'SMW12', 'Washing Machine pcb', '2200', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 1, 4),
(168, 'SMW13', 'Washing Machine pcb', '2500', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 1, 4),
(169, 'SMW20', 'Washing Machine Timer', '130', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 1, 4),
(170, 'SMW21', 'Washing Machine Timer', '130', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 1, 4),
(171, 'SMW22', 'Washing Machine Timer', '150', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 1, 4),
(172, 'SMW23', 'Washing Machine Timer', '180', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 1, 4),
(173, 'LGW01', 'Washing Machine Motor', '450', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 2, 4),
(174, 'LGW02', 'Washing Machine Motor', '450', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 2, 4),
(175, 'LGW03', 'Washing Machine Motor', '470', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 2, 4),
(176, 'LGW04', 'Washing Machine Motor', '500', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 2, 4),
(177, 'LGW10', 'Washing Machine pcb', '2000', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 2, 4),
(178, 'LGW11', 'Washing Machine pcb', '2000', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 2, 4),
(179, 'LGW12', 'Washing Machine pcb', '2200', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 2, 4),
(180, 'LGW13', 'Washing Machine pcb', '2500', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 2, 4),
(181, 'LGW20', 'Washing Machine Timer', '130', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 2, 4),
(182, 'LGW21', 'Washing Machine Timer', '130', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 2, 4),
(183, 'LGW22', 'Washing Machine Timer', '150', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 2, 4),
(184, 'LGW23', 'Washing Machine Timer', '180', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 2, 4),
(185, 'WW01', 'Washing Machine Motor', '450', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 4, 4),
(186, 'WW02', 'Washing Machine Motor', '450', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 4, 4),
(187, 'WW03', 'Washing Machine Motor', '470', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 4, 4),
(188, 'WW04', 'Washing Machine Motor', '500', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 4, 4),
(189, 'WW10', 'Washing Machine pcb', '2000', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 4, 4),
(190, 'WW11', 'Washing Machine pcb', '2000', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 4, 4),
(191, 'WW12', 'Washing Machine pcb', '2200', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 4, 4),
(192, 'WW13', 'Washing Machine pcb', '2500', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 4, 4),
(193, 'WW20', 'Washing Machine Timer', '130', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 4, 4),
(194, 'WW21', 'Washing Machine Timer', '130', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 4, 4),
(195, 'WW22', 'Washing Machine Timer', '150', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 4, 4),
(196, 'WW23', 'Washing Machine Timer', '180', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 4, 4),
(197, 'GW01', 'Washing Machine Motor', '450', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 3, 4),
(198, 'GW02', 'Washing Machine Motor', '450', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 3, 4),
(199, 'GW03', 'Washing Machine Motor', '470', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 3, 4),
(200, 'GW04', 'Washing Machine Motor', '500', 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 3, 4),
(201, 'GW10', 'Washing Machine pcb', '2000', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 3, 4),
(202, 'GW11', 'Washing Machine pcb', '2000', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 3, 4),
(203, 'GW12', 'Washing Machine pcb', '2200', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 3, 4),
(204, 'GW13', 'Washing Machine pcb', '2500', 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 3, 4),
(205, 'GW20', 'Washing Machine Timer', '130', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 3, 4),
(206, 'GW21', 'Washing Machine Timer', '130', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 3, 4),
(207, 'GW22', 'Washing Machine Timer', '150', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 3, 4),
(208, 'GW23', 'Washing Machine Timer', '180', 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(10) NOT NULL,
  `user_id` int(4) NOT NULL,
  `title` varchar(20) NOT NULL,
  `description` text,
  `name` varchar(35) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(15) NOT NULL,
  `pin` varchar(6) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` varchar(10) NOT NULL,
  `time` varchar(8) NOT NULL,
  `status` int(11) NOT NULL,
  `otp` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `request_id` int(10) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` int(4) NOT NULL,
  `name` varchar(35) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(15) NOT NULL,
  `pin` varchar(8) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` int(1) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `is_deleted` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `name`, `address`, `city`, `pin`, `contact`, `email`, `role`, `image`, `is_deleted`) VALUES
(8, 'Admin', 'Automobile Premier Road, Kurla (West)', 'Mumbai', '400070', '9702717188', 'sanketdeveloper00@gmail.com', 0, NULL, '0'),
(9, 'Sameer SIngh', 'Khindipada, Bhandup (West)', 'Mumbai', '400078', '9082171403', 'sanketdeshmukh880@gmail.com', 1, NULL, '0'),
(10, 'Sanket Deshmukh', '2, Jatadhari Chawl, New Sanjay Niwas, Bhandup (West)', 'Mumbai', '400078', '9702717188', 'meetsanket24@gmail.com', 2, 'http://128.199.30.114:9000/images/sanket.jpg', '0'),
(11, 'Prabodh', 'I.U.D.P. colony washim ', 'Washim', '444505', '8208023919', 'prabodh.shewalkar@gmail.com', 2, NULL, '0'),
(12, 'Afif Shaikh', 'MK Residency Kurla West', 'Mumbai', '400070', '9769320992', 'shaikhafif48@gmail.com', 2, 'http://128.199.30.114:9000/images/afif.png', '0');

-- --------------------------------------------------------

--
-- Table structure for table `whitegoodcategory`
--

CREATE TABLE `whitegoodcategory` (
  `good_id` int(11) NOT NULL,
  `good_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `whitegoodcategory`
--

INSERT INTO `whitegoodcategory` (`good_id`, `good_name`) VALUES
(1, 'AC'),
(2, 'Refrigerator'),
(3, 'Oven'),
(4, 'WashingMachine');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billing_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `employee_role`
--
ALTER TABLE `employee_role`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `whitegoodcategory_id` (`whitegoodcategory_id`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`part_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `whitegoodcategory_id` (`whitegoodcategory_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `whitegoodcategory`
--
ALTER TABLE `whitegoodcategory`
  ADD PRIMARY KEY (`good_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `billing_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `part_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `whitegoodcategory`
--
ALTER TABLE `whitegoodcategory`
  MODIFY `good_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`);

--
-- Constraints for table `employee_role`
--
ALTER TABLE `employee_role`
  ADD CONSTRAINT `employee_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`);

--
-- Constraints for table `login_details`
--
ALTER TABLE `login_details`
  ADD CONSTRAINT `login_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`);

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  ADD CONSTRAINT `model_ibfk_2` FOREIGN KEY (`whitegoodcategory_id`) REFERENCES `whitegoodcategory` (`good_id`);

--
-- Constraints for table `parts`
--
ALTER TABLE `parts`
  ADD CONSTRAINT `parts_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  ADD CONSTRAINT `parts_ibfk_2` FOREIGN KEY (`whitegoodcategory_id`) REFERENCES `whitegoodcategory` (`good_id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`);

--
-- Constraints for table `sells`
--
ALTER TABLE `sells`
  ADD CONSTRAINT `sells_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
