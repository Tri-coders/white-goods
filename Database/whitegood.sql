-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2020 at 09:14 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

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
  `description` text DEFAULT NULL,
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
  `model_price` int(11) NOT NULL,
  `model_img` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `whitegoodcategory_id` int(11) NOT NULL,
  `quantity` varchar(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`model_id`, `model_no`, `model_price`, `model_img`, `brand_id`, `whitegoodcategory_id`, `quantity`) VALUES
(1, 'Samsung 253 LRT28T3032SE/HL ', 20490, 'http://128.199.30.114:9000/model/1.jpg', 1, 2, '1'),
(2, 'Samsung 324 L RT34T4513S8/HL', 32290, 'http://128.199.30.114:9000/model/2.jpg', 1, 2, '1'),
(3, 'Samsung 700 L RS72R5001M9/TL', 74990, 'http://128.199.30.114:9000/model/3.jpg', 1, 2, '1'),
(4, 'Samsung 192 L RR19T271BR2/NL', 12990, 'http://128.199.30.114:9000/model/4.jpg', 1, 2, '1'),
(5, 'LG 284 Litres GL-T302RPZY', 36190, 'http://128.199.30.114:9000/model/5.png', 2, 2, '1'),
(6, 'LG 188 Litres GL-B191KPDD', 16990, 'http://128.199.30.114:9000/model/6.png', 2, 2, '1'),
(7, 'LG 188 Litres GL-B191KSDD     ', 15990, 'http://128.199.30.114:9000/model/7.png', 2, 2, '1'),
(8, 'LG 374 Litres GC-B459NLFF ', 46990, 'http://128.199.30.114:9000/model/8.png', 2, 2, '1'),
(9, 'Godrej 236 L RF EON 236B 25 HI RY DR', 18290, 'http://128.199.30.114:9000/model/9.jpg', 3, 2, '1'),
(10, 'Godrej 190 L RD 1905 PTDI 53 GL BL', 16190, 'http://128.199.30.114:9000/model/10.jpg', 3, 2, '1'),
(11, 'Godrej 231 L RF EON 245A 15 HF SI ST', 16790, 'http://128.199.30.114:9000/model/11.jpg', 3, 2, '1'),
(12, 'Godrej 260 L RF EON 260C 35 RCIF ST RH', 22990, 'http://128.199.30.114:9000/model/12.jpg', 3, 2, '1'),
(13, 'Whirlpool 190 L WDE 205 CLS 2S', 11290, 'http://128.199.30.114:9000/model/13.jpg', 4, 2, '1'),
(14, 'Whirlpool 265 L IF INV CNV 278', 24240, 'http://128.199.30.114:9000/model/14.jpg', 4, 2, '1'),
(15, 'Whirlpool 340 L IF INV CNV 355', 30990, 'http://128.199.30.114:9000/model/15.jpg', 4, 2, '1'),
(16, 'Whirlpool 245 L NEO 258H ROY WINE ABYSS (2S)-N', 19490, 'http://128.199.30.114:9000/model/16.jpg', 4, 2, '1'),
(17, 'AR18TV5HLTU Split AC powered by Triple Inverter with Convertible Mode 5.00kW (1.5T)', 34990, 'http://128.199.30.114:9000/model/17.jpg', 1, 1, '1'),
(18, 'AR18TY3CAWK Inverter Split AC powered by AI Auto Cooling 5.00kW (1.5T)', 52000, 'http://128.199.30.114:9000/model/18.jpg', 1, 1, '1'),
(19, 'AR18TY3QBBU Inverter Split AC powered by Digital Inverter with Faster Cooling 4.98kW (1.5T)', 39000, 'http://128.199.30.114:9000/model/19.jpg', 1, 1, '1'),
(20, 'AR12RG3BAWK On-Off Split AC powered by long lasting cooling 3.30kW (1.0T)', 45000, 'http://128.199.30.114:9000/model/20.jpg', 1, 1, '1'),
(21, 'Whirlpool 0.8 Ton 3 Star Split Inverter AC - White (0.8T MAGICOOL INVERTER 3S COPR-W-I/ODU, Copper C', 34990, 'http://128.199.30.114:9000/model/21.jpg', 4, 1, '1'),
(22, 'Whirlpool 1 Ton 3 Star Split AC - White, Grey', 52000, 'http://128.199.30.114:9000/model/22.jpg', 4, 1, '1'),
(23, 'Whirlpool 1.5 Ton 3 Star Window AC ', 39000, 'http://128.199.30.114:9000/model/23.jpg', 4, 1, '1'),
(24, 'Whirlpool 1 Ton 3 Star Split Inverter AC - White', 45000, 'http://128.199.30.114:9000/model/24.jpg', 4, 1, '1'),
(25, 'GIC 24 MGP5 WRA', 34990, 'http://128.199.30.114:9000/model/25.jpg', 3, 1, '1'),
(26, 'GSC 12NTC3 WTA', 52000, 'http://128.199.30.114:9000/model/26.jpg', 3, 1, '1'),
(27, 'GIC 12FTC3-WSA', 39000, 'http://128.199.30.114:9000/model/27.jpg', 3, 1, '1'),
(28, 'GIC 18JTC3-WTA', 45000, 'http://128.199.30.114:9000/model/28.jpg', 3, 1, '1'),
(29, 'Dual Inverter Hot & Cold Split Air Conditioner with 4 Way Swing LS-H18VNXD', 34990, 'http://128.199.30.114:9000/model/29.png', 2, 1, '1'),
(30, 'DUAL Inverter Window Air Conditioner with Ocean Black Protection JW-Q09WUZA', 52000, 'http://128.199.30.114:9000/model/30.png', 2, 1, '1'),
(31, 'Dual Inverter 3 Star Split Air Conditioner with 4-in-1 Convertible Cooling & Ocean Black Fin LS-Q18P', 39000, 'http://128.199.30.114:9000/model/31.png', 2, 1, '1'),
(32, 'Dual Inverter 5 Star Split Air Conditioner with Anti Allergic Filter & 4-in1 Convertible Cooling LS-', 45000, 'http://128.199.30.114:9000/model/32.png', 2, 1, '1'),
(33, 'CE78JDM Convection MWO with SlimFry™, 21L', 11900, 'https://drive.google.com/file/d/1FnlpouTn4peNdOUuEQcwP8AHJ1YXMI4v/view?usp=sharing', 1, 3, '1'),
(34, 'MC28M6036CK Convection MWO with Masala & Sun-Dry, 28L', 16800, 'https://drive.google.com/file/d/1v1qUEdvznlPokYIYS1O3tH0H9n2bap_i/view?usp=sharing', 1, 3, '1'),
(35, 'MC28H5013AK Convection MWO with Curd Any Time 28L', 9990, 'https://drive.google.com/file/d/14pppot6-sFduea5_VrppPp6Tx2tn9O0W/view?usp=sharing', 1, 3, '1'),
(36, 'MC32K7056CC Convection MWO with Masala & Sun Dry™, 32L', 22600, 'https://drive.google.com/file/d/1t5JR441hmxyPjom9UwcYTnOvGzDGfayU/view?usp=sharing', 1, 3, '1'),
(37, 'Godrej 23 L Convection Microwave Oven GME 523 CF1 RM', 8896, 'https://drive.google.com/file/d/1IMa75TxNVDz0Wd62epP4nlNpQiXZibqg/view?usp=sharing', 3, 3, '1'),
(38, 'Godrej 20 L Solo Microwave Oven GMX 20SA2BLM', 4990, 'https://drive.google.com/file/d/1Eq5PnMIp0JdIs9paYSrY8qsCHqbTeSDw/view?usp=sharing', 3, 3, '1'),
(39, 'Godrej 20 L Grill Microwave Oven GME 720 GF1 PZ', 7800, 'https://drive.google.com/file/d/1_QbRqBW9IQhm3PHY4fAlUAydQ06hps6c/view?usp=sharing', 3, 3, '1'),
(40, 'Godrej 28 L Convection Microwave Oven GME 728 CF1 PM', 13900, 'https://drive.google.com/file/d/1CDsRLEEWHlWHe1sZy93zoP1l9MX85nPL/view?usp=sharing', 3, 3, '1'),
(41, 'Whirlpool 20 L Solo Microwave Oven MAGICOOK PRO 20SE black', 6400, 'https://drive.google.com/file/d/1q2-Ke-T9ANSrPZ2CZ6oC04ZTzMAkzPcS/view?usp=sharing', 4, 3, '1'),
(42, 'Whirlpool 30 L Convection Microwave Oven MAGICOOK 30L Wine Magnolia', 15900, 'https://drive.google.com/file/d/1WsTMuHWJsBpv8lcaayZhgJ_p8b3W1Hjg/view?usp=sharing', 4, 3, '1'),
(43, 'Whirlpool 20 L Convection Microwave Oven Magicook Pro 22CE', 9150, 'https://drive.google.com/file/d/1BFDQQlv8YvwK7o64VpeRoZenyqa_xURI/view?usp=sharing', 4, 3, '1'),
(44, 'Whirlpool 25 L Convection Microwave Oven GT-288 (25 L Jet Crisp)', 11099, 'https://drive.google.com/file/d/1lJ53O_WEi4xK7oShCTuAamwXO1eEQ9ol/view?usp=sharing', 4, 3, '1'),
(45, 'LG All In One Microwave Oven MJEN326SF', 30790, 'https://drive.google.com/file/d/1Xg7FnsvyUmylymZDRILEkFZ6vosBycqD/view?usp=sharing', 2, 3, '1'),
(46, 'LG Microwave Oven with Diet Fry™ and 251 Auto cook Menu MC2886BLT', 15890, 'https://drive.google.com/file/d/1GPCj8N9d9-Sqo2HFwFFYdSrrnFiLgu0c/view?usp=sharing', 2, 3, '1'),
(47, '42L NeoChef Microwave with Smart Inverter MS4295DIS', 14490, 'https://drive.google.com/file/d/1J0Mr-Wj7iGbg0Qpm0_fm9__o6J0JtRjz/view?usp=sharing', 2, 3, '1'),
(48, '20 L Grill with Glass Door MH2044DB', 8090, 'https://drive.google.com/file/d/1K7l8AftXhmNqskOgNoHP4q2He1SaexHw/view?usp=sharing', 2, 3, '1'),
(49, 'WA65T4560NS Top Loading with ActivWash 6.5 Kg', 21300, 'https://drive.google.com/file/d/12nJfSeSe02kVoqdnBBBmA9xpB4EtjWWY/view?usp=sharing', 1, 4, '1'),
(50, 'WA10T5260BV Top Loading with Inverter Motor 10.0Kg', 32100, 'https://drive.google.com/file/d/1ow3e-kity2FiXlLH-3h8EuljYzM87092/view?usp=sharing', 1, 4, '1'),
(51, 'WA65N4261SS Top Loading with Digital Inverter motor 6.5Kg', 21800, 'https://drive.google.com/file/d/1w8xGK8G8tbYYJ1K-YHUVwltmXaBfhhmA/view?usp=sharing', 1, 4, '1'),
(52, 'WA70T4262BS Top Loading with Wobble Technology 7.0Kg', 22200, 'https://drive.google.com/file/d/1w08wlpw5qv2qadgzSeFarSrRx7BgTP4z/view?usp=sharing', 1, 4, '1'),
(53, 'Wash 8Kg and Spin 6 Kg, 5 Star, Rust Free Body, Roller Jet Pulsator, P8030SGAZ', 14990, 'https://drive.google.com/file/d/14lW7ep_7CZV7HTyp4KEqy4LU03fp79RA/view?usp=sharing', 2, 4, '1'),
(54, '8.0Kg, AI Direct Drive™ Washer with Steam™ & TurboWash™ FHV1408ZWB', 47990, 'https://drive.google.com/file/d/1xeApqjscIGv-Y18rejSy_HXoz1vTyZN2/view?usp=sharing', 2, 4, '1'),
(55, '8.0kg, 5 Star, Amber Steel, Jet Spray+, Punch+ 3, TurboDrum T80SJAS1Z', 31290, 'https://drive.google.com/file/d/1SWs0Ddn6rKqTS0yTlFIFF4qq8etMzShH/view?usp=sharing', 2, 4, '1'),
(56, '8.0 Kg, 6 Motion Direct Drive, Touch Panel, Fuzzy Logic, Baby Care, Sports wear, Child Lock, Front L', 34990, 'https://drive.google.com/file/d/1Tb-fXcH8PaOu-FJMAsDfKkciqysmYz-y/view?usp=sharing', 2, 4, '1'),
(57, 'Whirlpool 6.2 kg Hard Water wash Fully Automatic Top Load Grey', 12499, 'https://drive.google.com/file/d/1fT4SPw1FSE98rDVhtFDcabm9hfkjN7bA/view?usp=sharing', 4, 4, '1'),
(58, 'Whirlpool 7 kg 5 Star,Turbo Scrub Technology Semi Automatic Top Load Grey SUPERB ATOM 70S GREY DAZZL', 9299, 'https://drive.google.com/file/d/1lxu8kU5nIdz0_m3nGISDnKhzo4FwN9vL/view?usp=sharing', 4, 4, '1'),
(59, 'Whirlpool 7.5 kg 5 Star, Ace Wash Station Semi Automatic Top Load Grey ACE 7.5 SUPREME GREY DAZZLE', 9990, 'https://drive.google.com/file/d/14hVWsbJHlgiyMq6xcdrxvWvQQmoYjITM/view?usp=sharing', 4, 4, '1'),
(60, 'Whirlpool 8.2 kg Supersoak Technology Semi Automatic Top Load Pink ACE 8.2 SUPER SOAK (TULIP PINK) (', 11499, 'https://drive.google.com/file/d/1i1a0Lc8kcrt1kHm7KEVtZuFUopKT71YA/view?usp=sharing', 4, 4, '1'),
(61, 'Godrej 7 kg Fully Automatic Top Load Grey WTEON 700 AD 5.0 ROGR', 14790, 'https://drive.google.com/file/d/11qk96W-o5KyzFvwyETrd-LC98VLz5TVJ/view?usp=sharing', 3, 4, '1'),
(62, 'Godrej 6.2 kg Fully Automatic Top Load Grey WT EON 620 A Gp Gr', 11990, 'https://drive.google.com/file/d/1aehegvbEOWx7sWGHxpFG4FBLtJqqK0f-/view?usp=sharing', 3, 4, '1'),
(63, 'Godrej 8.5 kg Semi Automatic Top Load Red, White WS EDGE 8.5 TB3 M', 12999, 'https://drive.google.com/file/d/1LkK5QphMLwpGhU3DUXI6uhe2Ox8_KatY/view?usp=sharing', 3, 4, '1'),
(64, 'Godrej 7 kg Semi Automatic Top Load White, Blue WSAXIS 70 5.SN2 T BL', 9190, 'https://drive.google.com/file/d/1yqtGzANOHgr_UIzO1JV2uRRaFOcGENr8/view?usp=sharing', 3, 4, '1');

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `part_id` int(11) NOT NULL,
  `part_no` varchar(50) NOT NULL,
  `part_name` varchar(100) NOT NULL,
  `part_price` int(11) NOT NULL,
  `part_img` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `whitegoodcategory_id` int(11) NOT NULL,
  `quantity` varchar(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`part_id`, `part_no`, `part_name`, `part_price`, `part_img`, `brand_id`, `whitegoodcategory_id`, `quantity`) VALUES
(1, 'SMR01', 'Compressor', 2500, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 1, 2, '1'),
(2, 'SMR02', 'Compressor', 3000, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 1, 2, '1'),
(3, 'SMR03', 'Compressor', 3500, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 1, 2, '1'),
(4, 'SMR04', 'Compressor', 1500, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 1, 2, '1'),
(5, 'SMR10', 'Condenser Coil', 300, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 1, 2, '1'),
(6, 'SMR11', 'Condenser Coil', 500, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 1, 2, '1'),
(7, 'SMR12', 'Condenser Coil', 800, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 1, 2, '1'),
(8, 'SMR13', 'Condenser Coil', 1500, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 1, 2, '1'),
(9, 'SMR20', 'Refrigerator Lamp', 50, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 1, 2, '1'),
(10, 'SMR21', 'Refrigerator Lamp', 80, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 1, 2, '1'),
(11, 'SMR22', 'Refrigerator Lamp', 100, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 1, 2, '1'),
(12, 'SMR30', 'Refrigerator Thermostat', 300, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 1, 2, '1'),
(13, 'SMR31', 'Refrigerator Thermostat', 500, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 1, 2, '1'),
(14, 'SMR23', 'Refrigerator Lamp', 150, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 1, 2, '1'),
(15, 'SMR32', 'Refrigerator Thermostat', 550, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 1, 2, '1'),
(16, 'SMR33', 'Refrigerator Thermostat', 750, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 1, 2, '1'),
(17, 'LGR01', 'Compressor', 2500, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 2, 2, '1'),
(18, 'LGR02', 'Compressor', 3000, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 2, 2, '1'),
(19, 'LGR03', 'Compressor', 3500, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 2, 2, '1'),
(20, 'LGR04', 'Compressor', 1500, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 2, 2, '1'),
(21, 'LGR10', 'Condenser Coil', 300, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 2, 2, '1'),
(22, 'LGR11', 'Condenser Coil', 500, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 2, 2, '1'),
(23, 'LGR12', 'Condenser Coil', 550, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 2, 2, '1'),
(24, 'LGR13', 'Condenser Coil', 800, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 2, 2, '1'),
(25, 'LGR20', 'Refrigerator Lamp', 50, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 2, 2, '1'),
(26, 'LGR21', 'Refrigerator Lamp', 80, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 2, 2, '1'),
(27, 'LGR22', 'Refrigerator Lamp', 100, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 2, 2, '1'),
(28, 'LGR23', 'Refrigerator Lamp', 150, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 2, 2, '1'),
(29, 'LGR30', 'Refrigerator Thermostat', 300, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 2, 2, '1'),
(30, 'LGR31', 'Refrigerator Thermostat', 500, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 2, 2, '1'),
(31, 'LGR32', 'Refrigerator Thermostat', 550, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 2, 2, '1'),
(32, 'LGR33', 'Refrigerator Thermostat', 750, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 2, 2, '1'),
(33, 'GR01', 'Compressor', 2500, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 3, 2, '1'),
(34, 'GR02', 'Compressor', 3000, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 3, 2, '1'),
(35, 'GR03', 'Compressor', 3500, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 3, 2, '1'),
(36, 'GR04', 'Compressor', 1500, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 3, 2, '1'),
(37, 'GR10', 'Condenser Coil', 300, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 3, 2, '1'),
(38, 'GR11', 'Condenser Coil', 500, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 3, 2, '1'),
(39, 'GR12', 'Condenser Coil', 800, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 3, 2, '1'),
(40, 'GR13', 'Condenser Coil', 150, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 3, 2, '1'),
(41, 'GR20', 'Refrigerator Lamp', 50, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 3, 2, '1'),
(42, 'GR21', 'Refrigerator Lamp', 80, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 3, 2, '1'),
(43, 'GR22', 'Refrigerator Lamp', 100, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 3, 2, '1'),
(44, 'GR23', 'Refrigerator Lamp', 150, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 3, 2, '1'),
(45, 'GR30', 'Refrigerator Thermostat', 300, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 3, 2, '1'),
(46, 'GR31', 'Refrigerator Thermostat', 500, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 3, 2, '1'),
(47, 'GR32', 'Refrigerator Thermostat', 550, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 3, 2, '1'),
(48, 'GR33', 'Refrigerator Thermostat', 750, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 3, 2, '1'),
(49, 'WR01', 'Compressor', 2500, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 4, 2, '1'),
(50, 'WR02', 'Compressor', 3000, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 4, 2, '1'),
(51, 'WR03', 'Compressor', 3500, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 4, 2, '1'),
(52, 'WR04', 'Compressor', 1500, 'http://128.199.30.114:9000/part/Refrigerator_Compressor.jpg', 4, 2, '1'),
(53, 'WR10', 'Condenser Coil', 300, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 4, 2, '1'),
(54, 'WR11', 'Condenser Coil', 500, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 4, 2, '1'),
(55, 'WR12', 'Condenser Coil', 800, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 4, 2, '1'),
(56, 'WR13', 'Condenser Coil', 1500, 'http://128.199.30.114:9000/part/Refrigerator_Condenser_Coil.jpeg', 4, 2, '1'),
(57, 'WR20', 'Refrigerator Lamp', 50, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 4, 2, '1'),
(58, 'WR21', 'Refrigerator Lamp', 80, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 4, 2, '1'),
(59, 'WR22', 'Refrigerator Lamp', 100, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 4, 2, '1'),
(60, 'WR23', 'Refrigerator Lamp', 150, 'http://128.199.30.114:9000/part/Refrigerator_Lamp.jpg', 4, 2, '1'),
(61, 'WR30', 'Refrigerator Thermostat', 300, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 4, 2, '1'),
(62, 'WR31', 'Refrigerator Thermostat', 500, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 4, 2, '1'),
(63, 'WR32', 'Refrigerator Thermostat', 550, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 4, 2, '1'),
(64, 'WR33', 'Refrigerator Thermostat', 750, 'http://128.199.30.114:9000/part/Refrigerator_Thermostat.jpg', 4, 2, '1'),
(65, 'SMA01', 'Ac Copper Pipe', 540, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 1, 1, '1'),
(66, 'SMA02', 'Ac Copper Pipe', 600, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 1, 1, '1'),
(67, 'SMA03', 'Ac Copper Pipe', 640, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 1, 1, '1'),
(68, 'SMA04', 'Ac Copper Pipe', 700, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 1, 1, '1'),
(69, 'SMA10', 'AC Condensers', 1500, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 1, 1, '1'),
(70, 'SMA11', 'AC Condensers', 1800, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 1, 1, '1'),
(71, 'SMA12', 'AC Condensers', 2000, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 1, 1, '1'),
(72, 'SMA13', 'AC Condensers', 2500, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 1, 1, '1'),
(73, 'SMA20', 'PVC Blue Drain Pipe', 120, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 1, 1, '1'),
(74, 'SMA21', 'PVC Blue Drain Pipe', 150, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 1, 1, '1'),
(75, 'SMA22', 'PVC Blue Drain Pipe', 180, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 1, 1, '1'),
(76, 'SMA23', 'PVC Blue Drain Pipe', 200, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 1, 1, '1'),
(77, 'WA01', 'Ac Copper Pipe', 540, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 4, 1, '1'),
(78, 'WA02', 'Ac Copper Pipe', 600, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 4, 1, '1'),
(79, 'WA03', 'Ac Copper Pipe', 640, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 4, 1, '1'),
(80, 'WA04', 'Ac Copper Pipe', 700, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 4, 1, '1'),
(81, 'WA10', 'AC Condensers', 1500, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 4, 1, '1'),
(82, 'WA11', 'AC Condensers', 1800, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 4, 1, '1'),
(83, 'WA12', 'AC Condensers', 2000, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 4, 1, '1'),
(84, 'WA13', 'AC Condensers', 2500, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 4, 1, '1'),
(85, 'WA20', 'PVC Blue Drain Pipe', 120, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 4, 1, '1'),
(86, 'WA21', 'PVC Blue Drain Pipe', 180, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 4, 1, '1'),
(87, 'WA22', 'PVC Blue Drain Pipe', 150, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 4, 1, '1'),
(88, 'WA23', 'PVC Blue Drain Pipe', 200, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 4, 1, '1'),
(89, 'GA01', 'Ac Copper Pipe', 540, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 3, 1, '1'),
(90, 'GA02', 'Ac Copper Pipe', 600, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 3, 1, '1'),
(91, 'GA03', 'Ac Copper Pipe', 640, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 3, 1, '1'),
(92, 'GA04', 'Ac Copper Pipe', 700, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 3, 1, '1'),
(93, 'GA10', 'AC Condensers', 1500, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 3, 1, '1'),
(94, 'GA11', 'AC Condensers', 1800, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 3, 1, '1'),
(95, 'GA12', 'AC Condensers', 2000, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 3, 1, '1'),
(96, 'GA13', 'AC Condensers', 2500, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 3, 1, '1'),
(97, 'GA20', 'PVC Blue Drain Pipe', 120, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 3, 1, '1'),
(98, 'GA21', 'PVC Blue Drain Pipe', 150, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 3, 1, '1'),
(99, 'GA22', 'PVC Blue Drain Pipe', 180, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 3, 1, '1'),
(100, 'GA23', 'PVC Blue Drain Pipe', 200, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 3, 1, '1'),
(101, 'LGA01', 'Ac Copper Pipe', 540, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 2, 1, '1'),
(102, 'LGA02', 'Ac Copper Pipe', 600, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 2, 1, '1'),
(103, 'LGA03', 'Ac Copper Pipe', 640, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 2, 1, '1'),
(104, 'LGA04', 'Ac Copper Pipe', 700, 'http://128.199.30.114:9000/part/AC_copper_wire.jpg', 2, 1, '1'),
(105, 'LGA10', 'AC Condensers', 1500, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 2, 1, '1'),
(106, 'LGA11', 'AC Condensers', 1800, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 2, 1, '1'),
(107, 'LGA12', 'AC Condensers', 2000, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 2, 1, '1'),
(108, 'LGA13', 'AC Condensers', 2500, 'http://128.199.30.114:9000/part/AC_condensors.jpg', 2, 1, '1'),
(109, 'LGA20', 'PVC Blue Drain Pipe', 120, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 2, 1, '1'),
(110, 'LGA21', 'PVC Blue Drain Pipe', 150, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 2, 1, '1'),
(111, 'LGA22', 'PVC Blue Drain Pipe', 180, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 2, 1, '1'),
(112, 'LGA23', 'PVC Blue Drain Pipe', 200, 'http://128.199.30.114:9000/part/AC_drain_pipe.jpg', 2, 1, '1'),
(113, 'SMO01', 'Magnetron', 999, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 1, 3, '1'),
(114, 'SMO02', 'Magnetron', 999, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 1, 3, '1'),
(115, 'SMO03', 'Magnetron', 1200, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 1, 3, '1'),
(116, 'SMO04', 'Magnetron', 1500, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 1, 3, '1'),
(117, 'SMO10', 'Capacitor', 100, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 1, 3, '1'),
(118, 'SMO11', 'Capacitor', 120, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 1, 3, '1'),
(119, 'SMO12', 'Capacitor', 150, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 1, 3, '1'),
(120, 'SMO13', 'Capacitor', 180, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 1, 3, '1'),
(121, 'SMO20', 'MicroWave Fuse', 250, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 1, 3, '1'),
(122, 'SMO21', 'MicroWave Fuse', 280, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 1, 3, '1'),
(123, 'SMO22', 'MicroWave Fuse', 300, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 1, 3, '1'),
(124, 'SMO23', 'MicroWave Fuse', 320, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 1, 3, '1'),
(125, 'GO01', 'Magnetron', 999, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 3, 3, '1'),
(126, 'GO02', 'Magnetron', 999, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 3, 3, '1'),
(127, 'GO03', 'Magnetron', 1200, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 3, 3, '1'),
(128, 'GO04', 'Magnetron', 1500, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 3, 3, '1'),
(129, 'GO10', 'Capacitor', 100, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 3, 3, '1'),
(130, 'GO11', 'Capacitor', 120, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 3, 3, '1'),
(131, 'GO12', 'Capacitor', 150, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 3, 3, '1'),
(132, 'GO13', 'Capacitor', 180, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 3, 3, '1'),
(133, 'GO20', 'MicroWave Fuse', 250, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 3, 3, '1'),
(134, 'GO21', 'MicroWave Fuse', 280, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 3, 3, '1'),
(135, 'GO22', 'MicroWave Fuse', 300, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 3, 3, '1'),
(136, 'GO23', 'MicroWave Fuse', 320, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 3, 3, '1'),
(137, 'WO01', 'Magnetron', 999, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 4, 3, '1'),
(138, 'WO02', 'Magnetron', 999, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 4, 3, '1'),
(139, 'WO03', 'Magnetron', 1200, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 4, 3, '1'),
(140, 'WO04', 'Magnetron', 1500, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 4, 3, '1'),
(141, 'WO10', 'Capacitor', 100, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 4, 3, '1'),
(142, 'WO11', 'Capacitor', 120, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 4, 3, '1'),
(143, 'WO12', 'Capacitor', 150, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 4, 3, '1'),
(144, 'WO13', 'Capacitor', 180, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 4, 3, '1'),
(145, 'WO20', 'MicroWave Fuse', 250, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 4, 3, '1'),
(146, 'WO21', 'MicroWave Fuse', 280, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 4, 3, '1'),
(147, 'WO22', 'MicroWave Fuse', 300, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 4, 3, '1'),
(148, 'WO23', 'MicroWave Fuse', 320, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 4, 3, '1'),
(149, 'LGO01', 'Magnetron', 999, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 2, 3, '1'),
(150, 'LGO02', 'Magnetron', 999, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 2, 3, '1'),
(151, 'LGO03', 'Magnetron', 1200, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 2, 3, '1'),
(152, 'LGO04', 'Magnetron', 1500, 'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing', 2, 3, '1'),
(153, 'LGO10', 'Capacitor', 100, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 2, 3, '1'),
(154, 'LGO11', 'Capacitor', 120, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 2, 3, '1'),
(155, 'LGO12', 'Capacitor', 150, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 2, 3, '1'),
(156, 'LGO13', 'Capacitor', 180, 'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing', 2, 3, '1'),
(157, 'LGO20', 'MicroWave Fuse', 250, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 2, 3, '1'),
(158, 'LGO21', 'MicroWave Fuse', 280, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 2, 3, '1'),
(159, 'LGO22', 'MicroWave Fuse', 300, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 2, 3, '1'),
(160, 'LGO22', 'MicroWave Fuse', 300, 'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing', 2, 3, '1'),
(161, 'SMW01', 'Washing Machine Motor', 450, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 1, 4, '1'),
(162, 'SMW02', 'Washing Machine Motor', 450, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 1, 4, '1'),
(163, 'SMW03', 'Washing Machine Motor', 470, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 1, 4, '1'),
(164, 'SMW04', 'Washing Machine Motor', 500, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 1, 4, '1'),
(165, 'SMW10', 'Washing Machine pcb', 2000, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 1, 4, '1'),
(166, 'SMW11', 'Washing Machine pcb', 2000, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 1, 4, '1'),
(167, 'SMW12', 'Washing Machine pcb', 2200, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 1, 4, '1'),
(168, 'SMW13', 'Washing Machine pcb', 2500, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 1, 4, '1'),
(169, 'SMW20', 'Washing Machine Timer', 130, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 1, 4, '1'),
(170, 'SMW21', 'Washing Machine Timer', 130, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 1, 4, '1'),
(171, 'SMW22', 'Washing Machine Timer', 150, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 1, 4, '1'),
(172, 'SMW23', 'Washing Machine Timer', 180, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 1, 4, '1'),
(173, 'LGW01', 'Washing Machine Motor', 450, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 2, 4, '1'),
(174, 'LGW02', 'Washing Machine Motor', 450, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 2, 4, '1'),
(175, 'LGW03', 'Washing Machine Motor', 470, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 2, 4, '1'),
(176, 'LGW04', 'Washing Machine Motor', 500, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 2, 4, '1'),
(177, 'LGW10', 'Washing Machine pcb', 2000, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 2, 4, '1'),
(178, 'LGW11', 'Washing Machine pcb', 2000, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 2, 4, '1'),
(179, 'LGW12', 'Washing Machine pcb', 2200, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 2, 4, '1'),
(180, 'LGW13', 'Washing Machine pcb', 2500, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 2, 4, '1'),
(181, 'LGW20', 'Washing Machine Timer', 130, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 2, 4, '1'),
(182, 'LGW21', 'Washing Machine Timer', 130, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 2, 4, '1'),
(183, 'LGW22', 'Washing Machine Timer', 150, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 2, 4, '1'),
(184, 'LGW23', 'Washing Machine Timer', 180, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 2, 4, '1'),
(185, 'WW01', 'Washing Machine Motor', 450, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 4, 4, '1'),
(186, 'WW02', 'Washing Machine Motor', 450, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 4, 4, '1'),
(187, 'WW03', 'Washing Machine Motor', 470, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 4, 4, '1'),
(188, 'WW04', 'Washing Machine Motor', 500, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 4, 4, '1'),
(189, 'WW10', 'Washing Machine pcb', 2000, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 4, 4, '1'),
(190, 'WW11', 'Washing Machine pcb', 2000, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 4, 4, '1'),
(191, 'WW12', 'Washing Machine pcb', 2200, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 4, 4, '1'),
(192, 'WW13', 'Washing Machine pcb', 2500, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 4, 4, '1'),
(193, 'WW20', 'Washing Machine Timer', 130, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 4, 4, '1'),
(194, 'WW21', 'Washing Machine Timer', 130, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 4, 4, '1'),
(195, 'WW22', 'Washing Machine Timer', 150, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 4, 4, '1'),
(196, 'WW23', 'Washing Machine Timer', 180, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 4, 4, '1'),
(197, 'GW01', 'Washing Machine Motor', 450, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 3, 4, '1'),
(198, 'GW02', 'Washing Machine Motor', 450, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 3, 4, '1'),
(199, 'GW03', 'Washing Machine Motor', 470, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 3, 4, '1'),
(200, 'GW04', 'Washing Machine Motor', 500, 'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing', 3, 4, '1'),
(201, 'GW10', 'Washing Machine pcb', 2000, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 3, 4, '1'),
(202, 'GW11', 'Washing Machine pcb', 2000, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 3, 4, '1'),
(203, 'GW12', 'Washing Machine pcb', 2200, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 3, 4, '1'),
(204, 'GW13', 'Washing Machine pcb', 2500, 'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing', 3, 4, '1'),
(205, 'GW20', 'Washing Machine Timer', 130, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 3, 4, '1'),
(206, 'GW21', 'Washing Machine Timer', 130, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 3, 4, '1'),
(207, 'GW22', 'Washing Machine Timer', 150, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 3, 4, '1'),
(208, 'GW23', 'Washing Machine Timer', 180, 'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing', 3, 4, '1');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(10) NOT NULL,
  `user_id` int(4) NOT NULL,
  `title` varchar(35) NOT NULL,
  `description` text DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(15) NOT NULL,
  `pin` varchar(6) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` varchar(10) NOT NULL,
  `time` varchar(8) NOT NULL,
  `service_charge` int(11) NOT NULL,
  `item_cost` int(11) NOT NULL,
  `is_discount` varchar(1) NOT NULL,
  `discount_percent` varchar(5) NOT NULL,
  `total_amount` double NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(5) NOT NULL,
  `reason` text DEFAULT NULL,
  `otp` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`request_id`, `user_id`, `title`, `description`, `name`, `address`, `city`, `pin`, `contact`, `email`, `date`, `time`, `service_charge`, `item_cost`, `is_discount`, `discount_percent`, `total_amount`, `timestamp`, `status`, `reason`, `otp`) VALUES
(1, 11, 'Refridgerator install', 'Install samsung 253 LRT28T3032SE/HL model refridgerator and give demo to customer', 'Sarthak Patil', '32/A, Sai Apartments, M.G. Nagar, Kurla (W.)', 'Mumbai', '400070', '8208023919', 'prabodh.shewalkar@gmail.com', '2020/12/05', '12:20', 200, 20490, '1', '5', 19656, '2020-12-17 17:16:25', '00', NULL, NULL),
(2, 11, 'AC repair', 'Repairing of AC of model AR18TV5HLTU. The problem is of cooling system.', 'Aren Buttler', 'Room NO. 5, Ganesh Chawl, Samarth Nagar, Kalwa(E)', 'Mumbai', '432008', '8208023919', 'prabodh.shewalkar@gmail.com', '2020/12/20', '12:20', 20, 20, '1', '5', 20, '2020-12-17 17:16:47', '00', NULL, NULL),
(3, 11, 'Wahing Machine Install', 'description1', 'Shankar Khanna', 'address', 'Mumbai', '444505', '1234567890', 'prabodh.shewalkar@gmail.com', '2020/12/28', '20:20', 20, 20, '1', '50', 20, '2020-12-17 17:17:04', '00', NULL, NULL),
(4, 11, 'title1', 'description1', 'name', 'address', 'city', '444505', '1234567890', 'prabodh.shewalkar@gmail.com', '2020/12/18', '20:20', 20, 20, '1', '5', 38, '2020-12-04 15:25:41', '11', NULL, NULL),
(5, 11, 'refridgerator repair', 'description1', 'Samar Kadam', 'address', 'Mumbai', '444505', '1234567890', 'prabodh.shewalkar@gmail.com', '2020/12/18', '20:20', 20, 20, '1', '3', 38.8, '2020-12-17 17:17:28', '00', NULL, NULL),
(6, 11, 'title1', 'description1234', 'prabodh', 'iudp', 'washim', '444505', '8208023919', 'prabodh.shewalkar@gmail.com', '2020/11/11', '18:30', 50, 1000, '1', '33.0', 703.5, '2020-12-04 15:25:27', '10', NULL, NULL),
(7, 11, 'Oven Repair', 'New des', 'Pra', 'prabodh cha ghar', 'washim', '444505', '8208023919', 'prabodh.shewalkar@gmail.com', '2020/10/17', '07:20', 20, 500, '1', '9.0', 473.2, '2020-12-17 17:12:03', '00', NULL, NULL),
(8, 10, 'AC installation', 'sanket desc', 'Sanket', 'sanket ka ghar', 'mumbai', '444505', '1234567890', 'sanket@gmail.com', '2020/10/14', '11:00', 60, 650, '1', '20.0', 568, '2020-12-17 17:12:22', '00', NULL, NULL),
(9, 11, 'Title11', 'Description11', 'Prabodh', 'I.U.D.P 11', 'Washim', '444505', '8208023919', 'prabodh.shewalkar@gmail.com', '2020/12/05', '15:40', 20, 20, '5', '1', 20, '2020-12-16 18:30:00', '11', NULL, NULL),
(10, 11, 'New 11', 'New des', 'Pra', 'prabodh cha ghar 11', 'washim', '444505', '8208023919', 'prabodh.shewalkar@gmail.com', '2020/10/17', '07:20', 20, 500, '1', '9.0', 473.2, '2020-12-09 12:09:38', '11', NULL, NULL),
(11, 11, 'title11title', 'description111', 'name', 'address11', 'city', '444505', '1234567890', 'prabodh.shewalkar@gmail.com', '2020/12/18', '20:20', 20, 20, '1', '3', 38.8, '2020-12-03 12:23:19', '11', NULL, NULL),
(12, 11, 'new11Prab', 'Prabodh11 desc', 'Prabodh', 'prabodh11 house', 'mumbai', '444505', '1234567890', 'sanket@gmail.com', '2020/10/14', '11:00', 60, 650, '1', '20.0', 568, '2020-12-17 09:51:40', '11', NULL, NULL),
(13, 11, 'Title10', 'Description10', 'Prabodh', 'I.U.D.P 10', 'Washim', '444505', '8208023919', 'prabodh.shewalkar@gmail.com', '2020/12/05', '15:40', 20, 20, '5', '1', 20, '2020-12-17 09:53:47', '10', NULL, NULL),
(14, 11, 'New 10', 'New des 10', 'Pra', 'prabodh cha ghar 10', 'washim', '444505', '8208023919', 'prabodh.shewalkar@gmail.com', '2020/10/17', '07:20', 20, 500, '1', '9.0', 473.2, '2020-12-09 12:09:38', '10', NULL, NULL),
(15, 11, 'title10title', 'description110', 'name', 'address10', 'city', '444505', '1234567890', 'prabodh.shewalkar@gmail.com', '2020/12/18', '20:20', 20, 20, '1', '3', 38.8, '2020-12-03 12:23:19', '10', NULL, NULL),
(16, 11, 'new10Prab', 'Prabodh10 desc', 'Prabodh', 'prabodh10 house', 'mumbai', '444505', '1234567890', 'sanket@gmail.com', '2020/10/14', '11:00', 60, 650, '1', '20.0', 568, '2020-12-09 12:16:58', '10', NULL, NULL),
(17, 11, 'Title01', 'Description01', 'Prabodh', 'I.U.D.P 01', 'Washim', '444505', '8208023919', 'prabodh.shewalkar@gmail.com', '2020/12/05', '15:40', 20, 20, '5', '1', 20, '2020-12-17 09:53:47', '01', NULL, NULL),
(18, 11, 'pra', 'New des 01', 'Pra', 'prabodh cha ghar 01', 'washim', '444505', '8208023919', 'prabodh.shewalkar@gmail.com', '2020/10/17', '07:20', 20, 500, '1', '9.0', 473.2, '2020-12-09 12:09:38', '01', NULL, NULL),
(19, 11, 'title01title', 'description01', 'name', 'address01', 'city', '444505', '1234567890', 'prabodh.shewalkar@gmail.com', '2020/12/18', '20:20', 20, 20, '1', '3', 38.8, '2020-12-03 12:23:19', '01', NULL, NULL),
(20, 11, 'new01Prab', 'Prabodh01 desc', 'Prabodh', 'prabodh10 house', 'mumbai', '444505', '1234567890', 'sanket@gmail.com', '2020/10/14', '11:00', 60, 650, '1', '20.0', 568, '2020-12-09 12:16:58', '01', NULL, NULL),
(21, 11, 'title1', 'description1234', 'prabodh', 'iudp', 'washim', '444505', '8208023919', 'prabodh.shewalkar@gmail.com', '2020/11/11', '18:30', 50, 1000, '1', '33.0', 703.5, '2020-12-04 15:25:27', '01', NULL, NULL);

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
  `is_deleted` varchar(1) DEFAULT NULL,
  `token` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `name`, `address`, `city`, `pin`, `contact`, `email`, `role`, `image`, `is_deleted`, `token`) VALUES
(8, 'Admin', 'Automobile Premier Road, Kurla (West)', 'Mumbai', '400070', '9702717188', 'sanketdeveloper00@gmail.com', 0, NULL, '0', 'dI6cdpk1QFCvwaOrCvynKR:APA91bE32QHs3DVgSYKoXFC8nk-9enTEGUegtMixepBT24920T2lJwMyonJiSiBBm69_AIIL6CWfYqbKElWscMDpduFohSm_g3g5PjhmXTUI9UaV6t1DuGlbwBmzC75plXzT9XEUHcMZ'),
(9, 'Sameer SIngh', 'Khindipada, Bhandup (West)', 'Mumbai', '400078', '9082171403', 'sanketdeshmukh880@gmail.com', 1, 'http://128.199.30.114:9000/images/Manager.png', '0', 'dI6cdpk1QFCvwaOrCvynKR:APA91bE32QHs3DVgSYKoXFC8nk-9enTEGUegtMixepBT24920T2lJwMyonJiSiBBm69_AIIL6CWfYqbKElWscMDpduFohSm_g3g5PjhmXTUI9UaV6t1DuGlbwBmzC75plXzT9XEUHcMZ'),
(10, 'Sanket Deshmukh', '2, Jatadhari Chawl, New Sanjay Niwas, Bhandup (West)', 'Mumbai', '400078', '9702717188', 'meetsanket24@gmail.com', 2, 'http://128.199.30.114:9000/images/sanket.jpg', '0', 'dI6cdpk1QFCvwaOrCvynKR:APA91bE32QHs3DVgSYKoXFC8nk-9enTEGUegtMixepBT24920T2lJwMyonJiSiBBm69_AIIL6CWfYqbKElWscMDpduFohSm_g3g5PjhmXTUI9UaV6t1DuGlbwBmzC75plXzT9XEUHcMZ'),
(11, 'Prabodh', 'I.U.D.P. colony washim ', 'Washim', '444505', '8208023919', 'prabodh.shewalkar@gmail.com', 2, 'http://128.199.30.114:9000/images/Prabodh.jpg', '0', 'e_qFpS3eRsaCPyrtaarp6O:APA91bGwu7oQYAMp8IH5dmECHsq1I86XNwU-ZAdSFRKvpRmhr-GO3oAffSeve0SItEwGvhl9TwmGOMS2xQ3evw5zY5gPD-ij3oPU66HOTSRqjBa8kdh4UG9iElQp5v7OW5empambwvQY'),
(12, 'Afif Shaikh', 'MK Residency Kurla West', 'Mumbai', '400070', '9769320992', 'shaikhafif48@gmail.com', 2, 'http://128.199.30.114:9000/images/afif.png', '0', 'dI6cdpk1QFCvwaOrCvynKR:APA91bE32QHs3DVgSYKoXFC8nk-9enTEGUegtMixepBT24920T2lJwMyonJiSiBBm69_AIIL6CWfYqbKElWscMDpduFohSm_g3g5PjhmXTUI9UaV6t1DuGlbwBmzC75plXzT9XEUHcMZ');

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
  MODIFY `request_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
