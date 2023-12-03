-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2023 at 04:51 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duan1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `productId` int NOT NULL,
  `qty` int NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `userId`, `productId`, `qty`, `productName`, `productPrice`, `productImage`) VALUES
(48, 1, 26, 1, 'Bàn phím cơ DareU EK1280 V2 RGB Blue Switch', '990000', '9a090592c8.png');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(2, 'Bàn phím', 1),
(4, 'Tai nghe', 1),
(5, 'Chuột', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(39, 31, '2021-12-07', '2021-12-07', 'Complete'),
(40, 1, '2023-12-03', NULL, 'Processing');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `orderId` int NOT NULL,
  `productId` int NOT NULL,
  `qty` int NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(40, 40, 32, 1, '950000', 'Chuột Logitech G502 Hero Gaming', '1fab16a5e8.png');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int NOT NULL,
  `qty` int NOT NULL,
  `des` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(23, 'Bàn phím MonsGeek M1 QMK Silver AKKO Switch v3 Cream Yellow Pro', '2790000', '2590000', '79ff6dc01b.png', 1, '2023-12-03', 2, 60, 'Thiết kế:	75% có núm xoay\r\nKết nối:	USB Type-C to USB, có thể tháo rời\r\nKeycap:	Keycap PBT Double-Shot / OEM profile\r\nLoại switch:	AKKO Switch v3 – Cream Yellow Pro\r\nLed:	LED nền RGB / South-Facing Mạch Xuôi (Backlit, 4028 SMD LED dạng SMD) với nhiều chế độ\r\nHotswap 5 pin, mạch xuôi (South-Facing) –\r\nHỗ trợ QMK / VIA\r\nHỗ trợ: 	NKRO / Multimedia / Macro / Khóa phím windows\r\nPhụ kiện:	Cover che bụi – Dây cáp – Phụ kiện backup\r\nTương thích:	Windows / MacOS / Linux\r\nKích thước:	332x147x33mm\r\nTrọng lượng:	1.962kg', 1, 19),
(24, 'Bàn phím E-Dra EK387L RGB Red Switch', '849000', '690000', '163a9e9167.png', 1, '2023-12-03', 2, 49, 'Thương hiệu:	E-Dra\r\nMàu sắc: 	Đen\r\nModel:	EK387L RGB\r\nKết nối:	USB Type C\r\nSố phím:	87 Phím\r\nKích thước:	TKL\r\nĐèn led:	RGB\r\nSwitch Huano:	Red\r\nKeycaps:	Double injection\r\nDây:	1.7m\r\nAntighosting:	Full antishosting keys\r\nTương thích hệ điều hành:	Windows 98 / 2000 / ME / NT / XP / win 7,8,10\r\nTrọng lượng:	855g', 1, 13),
(25, 'bàn phím DareU EK75 White Black', '890000', '690000', '3113bce163.png', 1, '2023-12-03', 2, 46, 'Loại kết nối	Có dây\r\nLayout	80 key + 1 knob (US）\r\nKeycap	ABS double injection\r\nSwitch	AREU customized Dream switch\r\nDriver	Chưa có driver riêng\r\nKey Conflict	N-Key Rollover\r\nLED 	Rainbow\r\nTrọng lượng	651g+/-10g\r\nKích thước	30.2 x 333.2 x 140.4mm', 1, 28),
(26, 'Bàn phím cơ DareU EK1280 V2 RGB Blue Switch', '1090000', '990000', '9a090592c8.png', 1, '2023-12-03', 2, 60, 'Thương hiệu	DareU\r\nModel	Bàn Phím Gaming DAREU EK1280 v2 RGB\r\nMàu sắc	Đen\r\nKết nối	Có dây\r\nKiểu dáng	104 phím\r\nSize	Full size\r\nĐèn led	RGB\r\nSwitch	DareU \"D\" Switch: Blue / Red / Brown\r\nKeycaps	ABS Doubleshot\r\nDây	Dài 1,8m\r\nKích thước	440 x 140 x 36 mm\r\nTính năng	N-Key Rollover, led Rainbow', 1, 24),
(27, 'Bàn phím Rapoo V500L Rainbow Red Switch', '899000', '540000', 'e4d43d12f9.png', 1, '2023-12-03', 2, 38, 'Thương hiệu	Rapoo\r\nModel	V500L\r\nMàu sắc	Đen\r\nKiểu bàn phím	Bàn phím có dây\r\nKiểu kết nối	USB\r\nKích thước	Full size\r\nSwitch	Rapoo Switch Red\r\nĐèn LED	Rainbow', 1, 29),
(28, 'Chuột Razer Basilisk V3', '1990000', '990000', '0a818c78d5.png', 1, '2023-12-03', 5, 28, 'Thiết kế	Thuận tay phải\r\nKết nối	Có dây (Cáp Razer Speedflex)\r\nThời lượng pin	Không có\r\nĐèn RGB	Razer Chroma RGB\r\nCảm biến	Quang học\r\nĐộ nhạy tối đa	26000\r\nTốc độ tối đa	650\r\nSố nút	11\r\nĐộ bền	70 triệu lần nhấp\r\nBộ nhớ bo mạch	5\r\nLót chuột	100% PTFE\r\nCáp	Cáp Razer Speedflex\r\nCon lăn	Bánh xe nghiêng Razer HyperScroll 4 chiều\r\nChế độ quay tự do và chế độ quay tự do được kích hoạt bằng điện tử\r\nTrọng lượng	101 g / 3,56 oz (Không bao gồm cáp)\r\nKích thước	Chiều dài: 130 mm / 5,11 inch\r\nChiều rộng: 60 mm / 2,36 inch\r\nChiều cao: 42,5 mm / 1,67 inch\r\nTương thích dock	Không có', 1, 37),
(29, 'Chuột Corsair Katar Pro Ultra Light', '450000', '420000', 'd0cff0fd93.png', 1, '2023-12-03', 5, 37, 'Thương hiệu\r\n\r\nCorsair\r\n\r\nKết nối\r\n\r\nUSB\r\n\r\nKích thước\r\n\r\n115.8x64.2x37.8mm (dài x rộng x cao)\r\n\r\nTrọng lượng\r\n\r\n69g\r\n\r\nDPI tối đa\r\n\r\n12400\r\n\r\nLed\r\n\r\nĐơn sắc\r\n\r\nPhần mềm\r\n\r\nICUE', 1, 34),
(31, 'Chuột Razer DeathAdder Essential (RZ01-03850100-R3M1)', '1290000', '490000', '5322624ad6.png', 1, '2023-12-03', 5, 50, 'Hãng sản xuất:	Razer\r\nModel:	Deathadder Essential\r\nSố nút:	5 nút có thể lập trình\r\nKiểu kết nối:	Có dây, dây nhựa\r\nĐèn LED	Led Green đơn sắc\r\nMàu sắc:	Đen\r\nKết nối	USB 2.0\r\nKiểu cầm:	Ergonomic / Công thái học\r\nĐộ phân giải (CPI/DPI)	6400DPI\r\nCảm biến:	Cảm biến quang học (Optical)\r\nThời gian phản hồi:	1ms\r\nGia tốc:	220 IPS / 30G\r\nKích thước:	127.0 x 61.7  x 42.7 mm\r\nTrọng lượng:	96g', 1, 0),
(32, 'Chuột Logitech G502 Hero Gaming', '1590000', '950000', '1fab16a5e8.png', 1, '2023-12-03', 5, 17, 'Cảm biến:	HERO\r\nĐộ phân giải: 	100 - 25.000 dpi\r\nTăng tốc tối đa:	> 40 G\r\nTốc độ tối đa:	> 400 IPS\r\nNút:	11 nút\r\nĐịnh dạng dữ liệu USB:	16 bit/trục\r\nTốc độ báo cáo USB: 	1000 Hz (1ms)\r\nBộ vi xử lý:	ARM 32-bit\r\nBộ nhớ tích hợp:	Tối đa 5 cấu hình (yêu cầu phần mềm 127.1.7)\r\nChân PTFE:	> 250 ki-lô-mét\r\nLIGHTSYNC RGB:	1 khu vực\r\nKích thước:	132 x 75 x 40 mm \r\nTrọng lượng: 	121 g\r\nĐộ dài dây:	2,10 m (dây cao su)', 1, 32),
(35, 'Tai Nghe Rapoo VH650 RGB Virtual 7.1 Purple', '990000', '850000', '8c78700739.png', 1, '2023-12-03', 4, 42, 'Thương hiệu:	Rapoo\r\nBảo hành:	24 tháng\r\nModel:	Rapoo VH650 7.1\r\nMàu sắc:	Tím\r\nKiểu tai nghe:	Over-ear\r\nKhả năng cách âm:	Có\r\nKiểu kết nối:	Có dây\r\nĐèn led:	Có RGB\r\nChuẩn kết nối:	USB 2.0\r\nMicrophone:	Có\r\nChất liệu đệm tai nghe :	Chất liệu cao cấp\r\nTần số:	20HZ - 20000HZ\r\nTrở kháng:	Tai nghe: 32 ohm\r\nMicro: 2200 ohm\r\nĐộ nhạy:	Tai nghe: 103 ±3dB\r\nMicro: -42 ±2dB\r\nTrọng lượng:	 389g', 1, 17),
(36, 'Tai nghe Corsair HS55 Wireless Core Black (CA-9011290-AP)', '2845000', '1590000', 'a2a3ff7533.png', 1, '2023-12-03', 4, 41, 'Thương hiệu	Corsair\r\nBảo hành	24 tháng\r\nModel	\r\nTai nghe Corsair HS55 Wireless Core Black (CA-9011290-AP)\r\nMàu sắc	Đen\r\nKiểu tai nghe	Over-ear\r\nKiểu kết nối	Không dây (USB Wireless Receiver), Bluetooth\r\nThời lượng Pin	Lên đến 24 giờ\r\nPhạm vi tai nghe không dây	30ft ( 10.2m)\r\nMicrophone	Đa hướng\r\nChất liệu khung	Khung kim loại, đệm tai xốp Foam\r\nTương thích	PC, PlayStation 4\r\nTrở kháng	Tai nghe: 32000 Ohms\r\nMicro: 1 kHz\r\nTần số	Tai nghe: 20Hz - 20.000Hz\r\nMicro: 100Hz - 10.000Hz\r\nĐộ nhạy	Tai nghe: 114dB (+/- 3dB)\r\nMicro: -41dB (+/- 2dB)\r\nChất lượng âm thanh	\r\nStereo\r\n\r\nÂm thanh vòm	Không\r\nKhả năng cách âm	Có\r\nTrình điều khiển tai nghe	50mm', 1, 27),
(37, 'Tai nghe HP HyperX Cloud III Wireless Black', '4389998', '3890000', 'cfdb03b959.png', 1, '2023-12-03', 4, 55, 'Hãng sản xuất:\r\n\r\nHP HyperX\r\n\r\nModel:\r\n\r\nCloud III Black Wireless\r\n\r\nBảo hành\r\n\r\n24 Tháng\r\n\r\nTần số đáp ứng:	\r\n10Hz-21kHz\r\n\r\nChiều dài dây cáp:\r\n\r\nCáp tai nghe 1.2m, Cáp USB dongle 1m3\r\n\r\nMàng loa:\r\n\r\n53mm\r\n\r\nLoại khung:\r\n\r\nNhôm\r\n\r\nĐộ nhạy:\r\n\r\n-21.5 dBV (0dB = 1V / Pa ở 1kHz)\r\n\r\nKết nối thông qua jack:\r\n\r\nUSB-A hoặc USB-C\r\nPhụ kiện đi kèm:\r\n\r\nMicrophone,  souncard USB\r\n\r\nTương thích:\r\n\r\n- PC, PS5, PS4, Xbox Series X|S, Xbox One, Nintendo Switch, Mac và các thiết bị di động.\r\n- Các đầu nối 3,5mm, USB-A và USB-C\r\n\r\nÂm thanh vòm:\r\n\r\n7.1\r\n\r\nPhạm vi tai nghe không dây	Lên đến 20m\r\nPin:	Dung lượng pin: 120 giờ\r\nThời gian sạc: 4,5 giờ', 1, 12),
(38, 'Tai nghe Corsair HS55 Carbon', '1290000', '990000', '95a25dad96.png', 1, '2023-12-03', 4, 43, 'Thương hiệu:	Corsair\r\nBảo hành:	24 Tháng\r\nModel:	Corsair HS55 Carbon\r\nMàu sắc:	Đen\r\nKiểu tai nghe	Over-ear\r\nKiểu kết nối:	Có dây\r\nMicrophone:	Có\r\nDây:	Dài 1,8m\r\nTần số :	Tai nghe: 20Hz - 20000Hz\r\nMicro: 100Hz - 10000Hz\r\nTrở kháng:	Tai nghe: 32k Ohms @ 1 kHz\r\nMicro: 2.2k Ohms\r\nĐộ nhạy:	Tai nghe: 114dB (+/-3dB)\r\nMicro: -41dB (+/-3dB)\r\nDrivers:	50mm\r\nTương thích:	PC, Mac, PlayStation 4/5, Xbox One / Series XS, Nintendo Switch, Mobile devices\r\nKhả năng cách âm:	Có', 1, 34),
(39, 'Tai nghe Razer Barracuda X 2022', '2599000', '2390000', 'ecc1e45347.png', 1, '2023-12-03', 4, 56, 'Thương hiệu	Razer\r\nModel	Razer Barracuda X 2022\r\nMàu sắc	Đen\r\nKiểu tai nghe	Over-ear\r\nKiểu kết nối	USB Type-C Wireless (2.4GHz), Bluetooth 5.2, 3.5mm Analog\r\nKích thước	Đường kính earcup bên trong: 60 mm x 40 mm\r\nĐộ nhạy	-42 ± 3 dB\r\nTrọng lượng	\r\n250g\r\nTần số	20 Hz – 20 kHz', 1, 23),
(40, 'Chuột Logitech G102 LightSync Black', '599000', '398999', 'efb0c383f1.png', 1, '2023-12-03', 5, 45, 'Thương hiệu\r\n\r\nLogitech\r\n\r\nTên sản phẩm\r\n\r\nLogitech G102 Lightsync RGB\r\n\r\nThiết kế\r\n\r\nĐối xứng - Ambidextrous\r\n\r\nMắt đọc\r\n\r\nMercury Sensor\r\n\r\nĐiểm ảnh trên 1 inch (DPI)\r\n\r\n8000\r\n\r\nIPS\r\n\r\n200\r\n\r\nGia tốc\r\n\r\n30g\r\n\r\nTần số phản hồi\r\n\r\n1000Hz\r\n\r\nChất liệu vỏ\r\n\r\nNhựa ABS\r\n\r\nMàu sắc\r\n\r\nĐen\r\n\r\nSố lượng nút bấm\r\n\r\n6\r\n\r\nSwitch\r\n\r\nOmron\r\n\r\nTuổi thọ\r\n\r\n50 triệu lần nhấn\r\n\r\nLED\r\n\r\nRGB Lightsync\r\n\r\nKết nối\r\n\r\nUSB\r\n\r\nĐộ dài dây (cm)\r\n\r\n210\r\n\r\nKích thước (mm)\r\n\r\nDài 116.6 x Rộng 62.15 x Cao 38.2\r\n\r\nTrọng lượng (gr)\r\n\r\n85g (không cable)\r\n\r\nPhần mềm\r\n\r\nLogitech G-Hub', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL,
  `isConfirmed` tinyint NOT NULL DEFAULT '0',
  `captcha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`, `isConfirmed`, `captcha`) VALUES
(1, 'admin@gmail.com', 'Nguyễn Lập An Khương', '2021-11-01', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '', 1, ''),
(31, 'admin1@gmail.com', 'admin', '2021-12-06', 'c4ca4238a0b923820dcc509a6f75849b', 2, 1, 'HaNoi', 1, '56661'),
(32, 'daovanson2308@gmail.com', 'Dao Van Son', '2004-08-23', '9a17065799b3398cad8310341156d3b7', 2, 1, 'Ha Noi', 0, '49460');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
