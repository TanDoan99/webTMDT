-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2020 at 02:54 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demoshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_by` int(11) NOT NULL DEFAULT 1,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(1, 'Sản phẩm', 0, '2020-11-20 08:05:37', 1, '2020-11-20 08:05:37', 0),
(2, 'Điện thoại', 1, '2020-11-20 08:05:48', 1, '2020-11-20 08:05:48', 0),
(3, 'Điện thoại cũ', 2, '2020-11-20 08:05:58', 1, '2020-11-20 08:05:58', 0),
(8, 'Phụ kiện', 0, '2020-11-22 12:39:07', 1, '2020-11-22 12:39:07', 0),
(9, 'Sim-thẻ cào', 0, '2020-11-22 12:40:55', 1, '2020-11-23 14:45:57', 0),
(10, 'Sim', 9, '2020-11-22 12:41:07', 1, '2020-11-22 12:41:07', 0),
(11, 'Thẻ cào', 9, '2020-11-22 12:41:39', 1, '2020-11-23 05:30:40', 0),
(12, 'Điện thoại mới', 2, '2020-11-22 12:42:08', 1, '2020-11-23 05:30:25', 0),
(15, 'Danh muc 1', 0, '2020-11-25 03:06:02', 1, '2020-11-25 03:06:02', 0),
(16, '1-1', 15, '2020-11-25 03:08:49', 1, '2020-11-25 03:08:49', 0),
(17, '1-2', 15, '2020-11-25 03:08:49', 1, '2020-11-25 03:08:49', 0),
(18, '1-3', 15, '2020-11-25 03:08:49', 1, '2020-11-25 03:08:49', 0),
(19, '1-2-2', 17, '2020-11-25 03:10:25', 1, '2020-11-25 03:10:25', 0),
(20, '1-2-3', 17, '2020-11-25 03:10:25', 1, '2020-11-25 03:10:25', 0),
(21, '1-2-1', 17, '2020-11-25 03:10:25', 1, '2020-11-25 03:10:25', 0),
(22, '1-3-1', 18, '2020-11-25 03:12:12', 1, '2020-11-25 03:12:12', 0),
(23, '1-2-3-1', 20, '2020-11-27 02:43:59', 1, '2020-11-27 02:43:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `create_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `website`, `message`, `create_date`) VALUES
(1, 'Lâm Ngọc Khương', 'chatwithme9x@gmail.com', 'https://ngockhuong.com', 'Liên hệ admin trang', '2020-11-13 06:00:00'),
(2, 'Lâm Ngọc Khương', 'chatwithme9x@gmail.com', 'https://ngockhuong.com', 'Liên hệ admin trang', '2020-11-13 06:00:00'),
(3, 'Trần Văn Sơn', 'sontv@vinaenter.com', 'http://vinaenter.edu.vn', 'Liên hệ admin trang', '2020-11-13 06:00:00'),
(4, 'Hoa Hồng', 'chatwithme9x@gmail.com', 'http://vinaenter.edu.vn', 'Liên hệ admin trang', '2020-11-13 06:00:00'),
(17, 'manhcuong', 'manhcuong.vn.1995@gmail.com', 'abc.com', 'cam on', '2020-11-13 06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `total_money` int(11) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` float NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_by` int(11) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `total_money`, `payment_method`, `discount`, `create_date`, `create_by`, `update_date`, `update_by`, `status`) VALUES
(1, 10000, 'Thanh toán tại nhà', 0.5, '2020-12-06 03:02:48', 17, '2020-12-06 03:02:48', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `sale_off` int(11) NOT NULL DEFAULT 0,
  `preview` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `camera_feature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `battery_capacity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) DEFAULT 0,
  `producer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_date` date DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_by` int(11) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `price`, `sale_off`, `preview`, `storage`, `ram`, `camera_feature`, `battery_capacity`, `count`, `producer`, `release_date`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(2, 'Iphone 4', 3, 999999000, 10000, 'Điện thoại rất thông minh', '32 GB', '50 GB', 'Chụp sắc nét, ko nhòe', '3000 mAh', 0, 'Apple', '2020-12-16', '2020-12-04 13:12:05', 1, '2020-12-04 13:12:05', 0),
(3, 'Iphone 4', 3, 999999000, 10000, 'Điện thoại thông minh', '64 GB', '50 GB', 'Chụp sắc nét, ko nhòe', '3000 mAh', 0, 'Apple', '2020-12-22', '2020-12-04 13:12:45', 1, '2020-12-04 13:12:45', 0),
(4, 'Iphone 5', 3, 999999000, 10000, 'Điện thoại thông minh', '64 GB', '50 GB', 'Chụp sắc nét, ko nhòe', '3000 mAh', 0, 'Apple', '2020-12-22', '2020-12-04 13:13:19', 1, '2020-12-04 13:13:19', 0),
(5, 'Iphone 6s', 3, 999999000, 10000, 'Điện thoại thông minh', '64 GB', '50 GB', 'Chụp sắc nét, ko nhòe', '3000 mAh', 0, 'Apple', '2020-12-17', '2020-12-04 13:13:40', 1, '2020-12-04 13:13:40', 0),
(6, 'Iphone 7', 3, 999999000, 10000, 'Điện thoại thông minh', '64 GB', '50 GB', 'Chụp sắc nét, ko nhòe', '3000 mAh', 0, 'Apple', '2020-12-17', '2020-12-04 13:14:04', 1, '2020-12-04 13:14:04', 0),
(7, 'Iphone 7 Plus', 3, 999999000, 10000, 'Điện thoại thông minh', '64 GB', '50 GB', 'Chụp sắc nét, ko nhòe', '3000 mAh', 0, 'Apple', '2020-12-17', '2020-12-04 13:14:24', 1, '2020-12-04 13:14:24', 0),
(8, 'iphone8', 3, 999999000, 10000, 'Điện thoại rất thông minh', '320 GB', '50 GB', 'Chụp sắc nét, ko nhòe', '50000 mAh', 0, 'Apple', '2020-12-01', '2020-12-04 13:16:05', 1, '2020-12-04 13:16:05', 0),
(9, 'Iphone 10 Plus', 12, 999999000, 10000, 'Điện thoại rất thông minh', '64 GB', '500 GB', 'Chụp sắc nét, ko nhòe', '3000 mAh', 0, 'Apple', '2021-01-06', '2020-12-04 13:16:37', 1, '2020-12-04 13:16:37', 0),
(10, 'Iphone 11 pro max', 12, 999999000, 10000, 'Điện thoại rất thông minh', '64 GB', '50 GB', 'Chụp sắc nét, ko nhòe', '3000 mAh', 0, 'Apple', '2020-12-29', '2020-12-04 13:17:14', 1, '2020-12-04 13:17:14', 0),
(11, 'Samsung A', 12, 999999000, 10000, 'Điện thoại rất thông minh', '64 GB', '50 GB', 'Chụp sắc nét, ko nhòe', '3000 mAh', 0, 'Apple', '2020-12-29', '2020-12-04 13:17:34', 1, '2020-12-04 13:17:34', 0),
(12, 'Samsung B', 12, 999999000, 10000, 'Điện thoại rất thông minh', '64 GB', '50 GB', 'Chụp sắc nét, ko nhòe', '3000 mAh', 0, 'SamSung', '2020-12-29', '2020-12-04 13:18:03', 1, '2020-12-04 13:18:03', 0),
(13, 'Samsung C', 12, 999999000, 10000, 'Điện thoại rất thông minh', '64 GB', '50 GB', 'Chụp sắc nét, ko nhòe', '3000 mAh', 0, 'SamSung', '2020-12-29', '2020-12-04 13:18:37', 1, '2020-12-04 13:18:37', 0),
(14, 'Samsung S', 12, 999999000, 10000, 'Điện thoại rất thông minh', '64 GB', '50 GB', 'Chụp sắc nét, ko nhòe', '3000 mAh', 0, 'SamSung', '2020-12-29', '2020-12-04 13:19:03', 1, '2020-12-04 13:19:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `name`, `product_id`, `update_date`, `update_by`) VALUES
(4, '1.jpg', 2, '2020-12-04 13:12:05', 0),
(5, '2.jpg', 2, '2020-12-04 13:12:05', 0),
(6, '3.jpg', 2, '2020-12-04 13:12:05', 0),
(7, '4.jpg', 3, '2020-12-04 13:12:45', 0),
(8, '5.jpg', 3, '2020-12-04 13:12:45', 0),
(9, '6.jpg', 3, '2020-12-04 13:12:45', 0),
(10, '7.jpg', 4, '2020-12-04 13:13:19', 0),
(11, '8.jpg', 4, '2020-12-04 13:13:19', 0),
(12, '9.jpg', 4, '2020-12-04 13:13:19', 0),
(13, '10.jpg', 4, '2020-12-04 13:13:19', 0),
(14, '11.jpg', 5, '2020-12-04 13:13:40', 0),
(15, '12.jpg', 5, '2020-12-04 13:13:40', 0),
(16, '13.jpg', 5, '2020-12-04 13:13:40', 0),
(17, '14.jpg', 6, '2020-12-04 13:14:04', 0),
(18, '15.jpg', 6, '2020-12-04 13:14:04', 0),
(19, '16.jpg', 6, '2020-12-04 13:14:04', 0),
(20, '17.jpg', 7, '2020-12-04 13:14:24', 0),
(21, '18.jpg', 7, '2020-12-04 13:14:24', 0),
(22, '19.jpg', 7, '2020-12-04 13:14:24', 0),
(23, '20.jpg', 8, '2020-12-04 13:16:05', 0),
(24, '21.jpg', 8, '2020-12-04 13:16:05', 0),
(25, '22.jpg', 8, '2020-12-04 13:16:05', 0),
(26, '23.jpg', 9, '2020-12-04 13:16:37', 0),
(27, '24.jpg', 9, '2020-12-04 13:16:37', 0),
(28, '25.jpg', 9, '2020-12-04 13:16:37', 0),
(29, '26.jpg', 10, '2020-12-04 13:17:14', 0),
(30, '27.jpg', 10, '2020-12-04 13:17:14', 0),
(31, '28.jpg', 10, '2020-12-04 13:17:14', 0),
(32, '29.jpg', 11, '2020-12-04 13:17:34', 0),
(33, '30.jpg', 11, '2020-12-04 13:17:34', 0),
(34, '31.jpg', 11, '2020-12-04 13:17:34', 0),
(35, '32.jpg', 12, '2020-12-04 13:18:03', 0),
(36, '33.jpg', 12, '2020-12-04 13:18:03', 0),
(37, '34.jpg', 12, '2020-12-04 13:18:03', 0),
(38, '35.jpg', 13, '2020-12-04 13:18:37', 0),
(39, '36.jpg', 13, '2020-12-04 13:18:37', 0),
(40, '37.jpg', 13, '2020-12-04 13:18:37', 0),
(41, '38.jpg', 14, '2020-12-04 13:19:03', 0),
(42, '39.jpg', 14, '2020-12-04 13:19:03', 0),
(43, '40.jpg', 14, '2020-12-04 13:19:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone_number` int(11) NOT NULL DEFAULT 0,
  `create_date` timestamp NULL DEFAULT current_timestamp(),
  `create_by` int(11) DEFAULT 1,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `address`, `telephone_number`, `create_date`, `create_by`, `update_date`, `update_by`, `status`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'abcxyz', 'Truong Chinh2', 123456789, NULL, NULL, '2020-12-02 14:50:48', 1, 1),
(3, 'cuong', '202cb962ac59075b964b07152d234b70', 'cuong', 'Truong Chinh', 12233, '2020-12-01 14:45:49', NULL, '2020-12-03 09:47:10', 3, 1),
(4, 'adsa', 'asdas', '', '', 0, '2020-12-01 14:45:49', NULL, '2020-11-18 04:24:25', NULL, 1),
(5, 'admin1', '202cb962ac59075b964b07152d234b70', 'Manh cuong ', '123 truong chinh', 0, NULL, NULL, '2020-11-18 05:22:28', 5, 1),
(8, 'cuong123', '202cb962ac59075b964b07152d234b70', NULL, NULL, 0, '2020-12-03 09:55:10', 1, '2020-12-03 09:55:10', NULL, 1),
(9, 'cuong1233', '202cb962ac59075b964b07152d234b70', NULL, NULL, 0, '2020-12-03 10:08:20', 1, '2020-12-03 10:08:20', NULL, 1),
(15, 'cuong3', '202cb962ac59075b964b07152d234b70', NULL, NULL, 0, '2020-12-04 12:25:50', 1, '2020-12-04 12:25:50', NULL, 1),
(16, 'cuong4', '202cb962ac59075b964b07152d234b70', 'cuong', '123', 123, '2020-12-04 12:26:27', 1, '2020-12-04 12:29:15', 16, 1),
(17, '123', '202cb962ac59075b964b07152d234b70', 'cuong', 'truong chinh', 828274541, '2020-12-06 03:01:01', 1, '2020-12-06 03:02:48', 17, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
