-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 30, 2023 at 02:42 AM
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
(4, 'Chuột', 1),
(5, 'Tai nghe', 1);

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
(39, 31, '2023-11-20', '2023-11-20', 'Complete'),
(40, 1, '2023-11-29', '2023-12-02', 'Delivering');

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
(36, 39, 7, 2, '3190000', 'GUITAR YAMAHA CX40', 'd3ac08c33e.jpg'),
(37, 39, 4, 1, '749000000', 'Boston GP-156', 'a30bcd79d7.jpg'),
(38, 39, 8, 3, '19000000', 'Taylor 114E', 'cb50eef0d8.jpg'),
(39, 39, 9, 4, '4200000', 'Takamine D2D', '758ded2800.jpg'),
(40, 40, 6, 1, '990000', 'Tai nghe Corsair HS55 Carbon', '17.png'),
(41, 40, 3, 1, '2590000', 'Bàn phím MonsGeek M1 QMK Black AKKO Switch v3 Cream Yellow Pro', '1.png'),
(42, 40, 8, 1, '690000', 'Chuột gaming Rapoo VT200 Wireless', '12.png');

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
  `des` varchar(1000) NOT NULL,
  `qty` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `des`, `qty`, `status`, `soldCount`) VALUES
(2, 'Bàn phím MonsGeek M1 QMK Silver AKKO Switch v3 Cream Yellow Pro', '2590000', '2390000', '2.png', 1, '0000-00-00', 2, 'MonsGeek M1 QMK Silver AKKO Switch v3 Cream Yellow Pro mang đến trải nghiệm nhanh và chính xác để bạn duy trì hiệu suất làm việc và giải trí cao. Nếu bạn đang phân vân trong việc lựa chọn một chiếc bàn phím cơ ưng ý thì hãy xem ngay MonsGeek M1 QMK Silver.', NULL, 1, 4),
(3, 'Bàn phím MonsGeek M1 QMK Black AKKO Switch v3 Cream Yellow Pro', '2790', '2590000', '1.png', 1, '0000-00-00', 2, 'MonsGeek M1 QMK Black AKKO Switch v3 Cream Yellow Pro mang đến trải nghiệm nhanh và chính xác để bạn duy trì hiệu suất làm việc và giải trí cao. Nếu bạn đang phân vân trong việc lựa chọn một chiếc bàn phím cơ ưng ý thì hãy xem ngay MonsGeek M1 QMK Black.', NULL, 1, 2),
(4, 'Chuột Logitech G502 Hero Gaming', '950000', '876000', '11.png', 1, '0000-00-00', 2, 'Ngoài hiệu suất cốt lõi và các tính năng cá nhân, nhiều chi tiết được thiết kế và chế tạo với sự tận tâm. Logitech G502 Hero là một trong những dòng chuột gaming giá rẻ so với các sản phẩm ở cùng phân khúc với dây bện với nút buộc dây có khóa nhám, phần cầm nắm bên có viền cao su, cửa từ vào khoang để khối nặng và nhiều hơn nữa.', NULL, 1, 1),
(5, 'Tai Nghe Rapoo VH650 RGB Virtual 7.1 Purple', '990000', '850000', '14.png', 1, '0000-00-00', 5, 'Chưa có mô tả cho sản phẩm', NULL, 1, 2),
(6, 'Tai nghe Corsair HS55 Carbon', '1290000', '990000', '17.png', 1, '0000-00-00', 5, 'HS55 Stereo là dòng sản phẩm tai nghe máy tính mới nhất đến từ Corsair với nhiều cải tiến về công nghệ âm thanh mang đến cho người dùng những trải nghiệm tuyệt vời trong những trò chơi mình yêu thích. ', NULL, 1, 4),
(7, 'Bàn phím cơ DareU EK75 White Black DareU Dream switch', '690000', '590000', '4.png', 1, '2021-12-07', 2, 'DareU EK75 White Black dòng bàn phím cơ sở hữu thiết kế siêu nhỏ gọn với layout 75%, 80 nút bấm hỗ trợ tốt mọi nhu cầu sử dụng ở bất kỳ đâu khi cần. Đặc biệt, nhờ vào phối màu basic trắng đen được kết hợp hài hòa tạo điều kiện thuận lợi khi lựa chọn chuột máy tính, tai nghe gaming để Setup các góc máy làm việc và chơi game đẹp mắt. Hứa hẹn đây sẽ là một trong những mẫu bàn phím DareU  rất đáng trải nghiệm.', NULL, 1, 2),
(8, 'Chuột gaming Rapoo VT200 Wireless', '890000', '690000', '12.png', 1, '2021-12-07', 4, 'Chuột Rapoo VT200 Wireless sở hữu kích thước vừa vặn với lòng bàn tay người trưởng thành, ngăn chặn tình trạng \"căng\" các ngón tay khi thao tác chuột Rapoo trong thời gian dài. Đây là dòng chuột gaming giá rẻ mang đến cho bạn cảm giác sử dụng linh động, dễ chịu hơn. ', NULL, 1, 4),
(9, 'Chuột Razer DeathAdder Essential (RZ01-03850100-R3M1)', '1290000', '489999', '7a75344a82.png', 1, '2021-12-07', 4, 'Chuột gaming DeathAdder Essential được Razer thiết kế với kiểu dáng công thái học (Ergonomic) cổ điển. Thiết kế đẹp mắt và khác biệt ở các dòng chuột máy tính khác, tạo ra sự thoải mái, cho phép người chơi duy trì mức hiệu suất cao trong suốt thời gian chơi game dài, vì vậy bạn sẽ không bao giờ bị ngập ngừng trong các trận chiến nóng bỏng. ', NULL, 1, 4),
(10, 'Chuột Logitech G102 LightSync Black', '599000', '376000', '9f53a27d89.png', 1, '2021-12-07', 4, 'Chuột Logitech G102 Lightsync RGB lại được trang bị led  RGB 16,8 triệu màu .Chọn một màu hay trộn 3 màu, hiệu ứng có sẵn hay tạo hiệu ứng của riêng bạn . Sự lựa chọn là của bạn ! Bạn còn có thể đồng bộ chuột với thiết bị LIGHTSYNC của Logitech G khác giúp góc máy trở nên đồng bộ và độc đáo hơn.', NULL, 1, 0),
(11, 'Chuột Corsair Katar Pro Wireless', '1090000', '714000', '300081861b.png', 1, '2021-12-07', 4, 'Tận hưởng sự nhanh nhạy và tiện lợi với công nghệ không dây Slipstream CORSAIR siêu nhanh, dưới 1ms hoặc kết nối với nhiều loại thiết bị có Bluetooth® độ trễ thấp được cấp nguồn với chỉ một pin AA. Một trong những đối thủ cạnh tranh với chuột Logitech và các thương hiệu lớn khác.', NULL, 1, 0),
(12, 'Chuột Razer Basilisk V3', '1990000', '990000', '9ee82ccb66.png', 1, '2021-12-07', 4, 'Basilisk V3 rất được ưa chuộng từ các game thủ. Không chỉ vì những tính năng đắc lực và độc đáo mà còn ghi điểm bởi thiết kế ấn tượng và tiện lợi. Thiết kế của nó hỗ trợ hoàn hảo cho thao tác tay của bạn. Và các nút của chuột được bố trí ở vị trí tối ưu nhất để bạn có thể sử dụng nhanh chóng và dễ dàng nhất có thể.', NULL, 1, 0),
(13, 'Bàn phím Rapoo V500L Rainbow Blue Switch', '899000', '550000', '0a9dbda945.png', 1, '2021-12-07', 2, 'Bàn phím cơ giá rẻ Rapoo V500L mang một thiết kế full-size cần thiết, được trang bị đèn bàn phím riêng biệt giữa các phím, thiết kế không gây xung đột khi ấn và các phím tắt tiện lợi.', NULL, 1, 0),
(14, 'Bàn phím cơ DareU EK1280 V2 RGB Red Switch', '756000', '556000', 'c48fb3d3a2.png', 1, '2021-12-07', 2, 'Chưa có mô tả cho sản phẩm', NULL, 1, 0),
(15, 'Bàn phím cơ DareU EK75 White Black DareU Dream switch', '590000', '390000', '43b064e9a5.png', 1, '2021-12-07', 2, 'DareU EK75 White Black dòng bàn phím cơ sở hữu thiết kế siêu nhỏ gọn với layout 75%, 80 nút bấm hỗ trợ tốt mọi nhu cầu sử dụng ở bất kỳ đâu khi cần. Đặc biệt, nhờ vào phối màu basic trắng đen được kết hợp hài hòa tạo điều kiện thuận lợi khi lựa chọn chuột máy tính, tai nghe gaming để Setup các góc máy làm việc và chơi game đẹp mắt. ', NULL, 1, 0),
(16, 'Bàn phím Razer Blackwidow V4 75% Black Tactile', '5090000', '4890000', 'b3c3f11914.png', 1, '2021-12-07', 2, 'Razer BlackWidow v4 75% là một chiếc bàn phím rất thú vị vừa được Razer ra mắt. Vừa nhắm đến đối tượng game thủ, vừa cung cấp khả năng tuỳ biến tuyệt vời cho dân tập tành tuỳ chỉnh bàn phím cơ, tiêu biểu với tính năng hotswap', NULL, 1, 0),
(17, 'Bàn phím MonsGeek M1 QMK Silver AKKO Switch v3 Cream Yellow Pro', '2790000', '2590000', '795e24c41e.png', 1, '2021-12-07', 2, 'MonsGeek M1 QMK Silver sở hữu ngoại hình với lớp vỏ full nhôm cứng cáp. Lấy màu xám làm chủ đạo để làm tôn thêm vẻ đẹp sang trọng. Tạo hiệu ứng từ đậm đến nhạt dựa vào việc sắp xếp màu sắc của keycaps hồng biến chiếc bàn phím máy tính MonsGeek thu hút ngay từ ánh nhìn đầu tiên. ', NULL, 1, 0),
(18, 'Bàn phím MonsGeek M1 QMK Black AKKO Switch v3 Cream Yellow Pro', '2590000', '2390000', 'cd83c79206.png', 1, '2021-12-07', 5, 'MonsGeek M1 QMK Black sở hữu ngoại hình với lớp vỏ full nhôm cứng cáp. Lấy màu đen làm chủ đạo để làm tôn thêm vẻ đẹp huyền bí và sự mạnh mẽ. Tạo hiệu ứng từ đậm đến nhạt dựa vào việc sắp xếp màu sắc của keycaps biến chiếc bàn phím máy tính MonsGeek thu hút ngay từ ánh nhìn đầu tiên. \r\n\r\n', 4, 1, 0);

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
(1, 'admin@gmail.com', 'Admin', '2023-11-20', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '', 1, ''),
(31, 'sondao@gmail.com', 'Sondao', '2023-11-26', '345678', 2, 1, 'Ha Noi', 1, '56661');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
