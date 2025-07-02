-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 21, 2023 at 01:25 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_salesunit`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add tb_register', 7, 'add_tb_register'),
(26, 'Can change tb_register', 7, 'change_tb_register'),
(27, 'Can delete tb_register', 7, 'delete_tb_register'),
(28, 'Can view tb_register', 7, 'view_tb_register'),
(29, 'Can add tb_shop', 8, 'add_tb_shop'),
(30, 'Can change tb_shop', 8, 'change_tb_shop'),
(31, 'Can delete tb_shop', 8, 'delete_tb_shop'),
(32, 'Can view tb_shop', 8, 'view_tb_shop'),
(33, 'Can add tb_product', 9, 'add_tb_product'),
(34, 'Can change tb_product', 9, 'change_tb_product'),
(35, 'Can delete tb_product', 9, 'delete_tb_product'),
(36, 'Can view tb_product', 9, 'view_tb_product'),
(37, 'Can add tb_feedback', 10, 'add_tb_feedback'),
(38, 'Can change tb_feedback', 10, 'change_tb_feedback'),
(39, 'Can delete tb_feedback', 10, 'delete_tb_feedback'),
(40, 'Can view tb_feedback', 10, 'view_tb_feedback'),
(41, 'Can add tb_cart', 11, 'add_tb_cart'),
(42, 'Can change tb_cart', 11, 'change_tb_cart'),
(43, 'Can delete tb_cart', 11, 'delete_tb_cart'),
(44, 'Can view tb_cart', 11, 'view_tb_cart'),
(45, 'Can add order_item_tb', 12, 'add_order_item_tb'),
(46, 'Can change order_item_tb', 12, 'change_order_item_tb'),
(47, 'Can delete order_item_tb', 12, 'delete_order_item_tb'),
(48, 'Can view order_item_tb', 12, 'view_order_item_tb'),
(49, 'Can add tb_payment', 13, 'add_tb_payment'),
(50, 'Can change tb_payment', 13, 'change_tb_payment'),
(51, 'Can delete tb_payment', 13, 'delete_tb_payment'),
(52, 'Can view tb_payment', 13, 'view_tb_payment'),
(53, 'Can add tb_reviews', 14, 'add_tb_reviews'),
(54, 'Can change tb_reviews', 14, 'change_tb_reviews'),
(55, 'Can delete tb_reviews', 14, 'delete_tb_reviews'),
(56, 'Can view tb_reviews', 14, 'view_tb_reviews');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(12, 'salesUnitapp', 'order_item_tb'),
(11, 'salesUnitapp', 'tb_cart'),
(10, 'salesUnitapp', 'tb_feedback'),
(13, 'salesUnitapp', 'tb_payment'),
(9, 'salesUnitapp', 'tb_product'),
(7, 'salesUnitapp', 'tb_register'),
(14, 'salesUnitapp', 'tb_reviews'),
(8, 'salesUnitapp', 'tb_shop'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-04-04 07:46:02.810447'),
(2, 'auth', '0001_initial', '2023-04-04 07:46:03.419803'),
(3, 'admin', '0001_initial', '2023-04-04 07:46:03.560422'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-04-04 07:46:03.576047'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-04-04 07:46:03.591672'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-04-04 07:46:03.669794'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-04-04 07:46:03.732292'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-04-04 07:46:03.763541'),
(9, 'auth', '0004_alter_user_username_opts', '2023-04-04 07:46:03.794789'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-04-04 07:46:03.872912'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-04-04 07:46:03.888535'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-04-04 07:46:03.888535'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-04-04 07:46:03.919785'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-04-04 07:46:03.935410'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-04-04 07:46:03.966658'),
(16, 'auth', '0011_update_proxy_permissions', '2023-04-04 07:46:03.982284'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-04-04 07:46:03.997908'),
(18, 'sessions', '0001_initial', '2023-04-04 07:46:04.060407'),
(19, 'salesUnitapp', '0001_initial', '2023-04-04 11:01:57.118805'),
(20, 'salesUnitapp', '0002_tb_shop', '2023-04-05 09:41:21.161185'),
(21, 'salesUnitapp', '0003_tb_product', '2023-04-06 05:57:58.656443'),
(22, 'salesUnitapp', '0004_tb_product_shop_id', '2023-04-06 06:05:20.933589'),
(23, 'salesUnitapp', '0005_tb_feedback', '2023-04-12 04:49:01.557262'),
(24, 'salesUnitapp', '0006_tb_cart', '2023-04-12 10:02:42.522589'),
(25, 'salesUnitapp', '0007_order_item_tb', '2023-04-13 12:05:33.853306'),
(26, 'salesUnitapp', '0008_tb_payment', '2023-04-14 10:53:03.268952'),
(27, 'salesUnitapp', '0009_tb_reviews', '2023-04-21 06:02:17.083667');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('hsmkpibffdaun0stm4hnpdb4jw7ly310', 'eyJpZCI6M30:1ppjVK:Cr_0_3xFGCnA_p_qua9lN-fJeLFgKErZOw5Kq2RM1hc', '2023-05-05 05:40:18.231721'),
('i8ex4bsgo6fe68f8do7y33tx578uzoug', 'eyJpZCI6MX0:1ppokX:O3fENl-kE0NJ7A_1ysYTYrwb61-grBOMoNiNTUYvjwk', '2023-05-05 11:16:21.564609'),
('t9d5x3wupa5mrk9u9f88td2xu1sl7een', 'eyJpZCI6MX0:1pjekJ:6DPhiP-a6_A37QnVUA8f16cwjnyYS6_EpzDsSr4ZF_Y', '2023-04-18 11:22:39.522331'),
('xi52bjio6kxaksplo7c6zyjjy1kpwssm', 'e30:1poLsK:rOLYendExaSC34Lq9bN7IUezixRs7L7C9CXYXgb17Zw', '2023-05-01 10:14:20.142978');

-- --------------------------------------------------------

--
-- Table structure for table `salesunitapp_order_item_tb`
--

CREATE TABLE `salesunitapp_order_item_tb` (
  `id` bigint(20) NOT NULL,
  `total` varchar(30) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `payment_status` varchar(30) NOT NULL,
  `packing_status` varchar(30) NOT NULL,
  `cart_id_id` bigint(20) NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesunitapp_order_item_tb`
--

INSERT INTO `salesunitapp_order_item_tb` (`id`, `total`, `date`, `time`, `payment_status`, `packing_status`, `cart_id_id`, `product_id_id`, `user_id_id`) VALUES
(1, '600', '2023-04-17', '13:07:54', 'pending', 'pending', 4, 1, 3),
(2, '600', '2023-04-17', '13:07:54', 'pending', 'delivered', 12, 2, 3),
(8, '3050', '2023-04-17', '14:31:54', 'pending', 'pending', 17, 3, 3),
(9, '1550', '2023-04-17', '15:43:04', 'pending', 'pending', 18, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `salesunitapp_tb_cart`
--

CREATE TABLE `salesunitapp_tb_cart` (
  `id` bigint(20) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `total_price` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `product_id_id` bigint(20) DEFAULT NULL,
  `user_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesunitapp_tb_cart`
--

INSERT INTO `salesunitapp_tb_cart` (`id`, `qty`, `date`, `total_price`, `status`, `product_id_id`, `user_id_id`) VALUES
(4, '2', '2023-04-12', '200', 'paid', 1, 3),
(12, '1', '2023-04-13', '150', 'paid', 2, 3),
(14, '1', '2023-04-17', '100', 'paid', 1, 3),
(15, '1', '2023-04-17', '100', 'paid', 1, 3),
(17, '2', '2023-04-17', '3000', 'paid', 3, 3),
(18, '1', '2023-04-17', '1500', 'paid', 3, 3),
(19, '2', '2023-04-20', '3000', 'pending', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `salesunitapp_tb_feedback`
--

CREATE TABLE `salesunitapp_tb_feedback` (
  `id` bigint(20) NOT NULL,
  `feedback` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `user_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesunitapp_tb_feedback`
--

INSERT INTO `salesunitapp_tb_feedback` (`id`, `feedback`, `date`, `status`, `user_id_id`) VALUES
(1, 'not bad', '2023-04-12', 'pending', 3);

-- --------------------------------------------------------

--
-- Table structure for table `salesunitapp_tb_payment`
--

CREATE TABLE `salesunitapp_tb_payment` (
  `id` bigint(20) NOT NULL,
  `date` varchar(100) NOT NULL,
  `total_amt` varchar(100) NOT NULL,
  `card_name` varchar(100) NOT NULL,
  `card_number` varchar(100) NOT NULL,
  `card_cvv` varchar(100) NOT NULL,
  `card_expdate` varchar(100) NOT NULL,
  `pay_status` varchar(100) NOT NULL,
  `order_id_id` bigint(20) NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesunitapp_tb_payment`
--

INSERT INTO `salesunitapp_tb_payment` (`id`, `date`, `total_amt`, `card_name`, `card_number`, `card_cvv`, `card_expdate`, `pay_status`, `order_id_id`, `product_id_id`, `user_id_id`) VALUES
(1, '', '', 'csb', '454545454545', '123', '1988', 'paid', 8, 3, 3),
(2, '', '', 'csb', '343434333333', '123', '1988', 'paid', 9, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `salesunitapp_tb_product`
--

CREATE TABLE `salesunitapp_tb_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `mesure` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `discription` varchar(500) NOT NULL,
  `status` varchar(100) NOT NULL,
  `shop_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesunitapp_tb_product`
--

INSERT INTO `salesunitapp_tb_product` (`id`, `name`, `img`, `qty`, `mesure`, `price`, `discription`, `status`, `shop_id_id`) VALUES
(1, 'cat  toy', 'product/catimg.jpeg', '1', 'no', '100', 'high quality product good', 'pending', 1),
(2, 'Dog toy', 'product/dogimg.jpeg', '0', 'nos', '150', 'good quality', 'pending', 1),
(3, 'cooler', 'product/a8d68883791645.5d47eee6ae194.jpg', '10', 'no', '1500', 'good to use', 'pending', 2);

-- --------------------------------------------------------

--
-- Table structure for table `salesunitapp_tb_register`
--

CREATE TABLE `salesunitapp_tb_register` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pswd` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `utype` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesunitapp_tb_register`
--

INSERT INTO `salesunitapp_tb_register` (`id`, `name`, `email`, `pswd`, `phone`, `address`, `utype`, `status`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', '', '', 'admin', ''),
(2, 'sneha', 'sneha123@gmail.com', '123', '9766767665', 'Agar Malwaa', 'user', 'pending'),
(3, 'appu', 'appu@gmail.com', '123', '9890888888', 'Mannuthy', 'user', 'pending'),
(4, 'kathu', 'kathu@gmail.com', '123', '78867868768768', 'Agar Malwaa', 'user', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `salesunitapp_tb_reviews`
--

CREATE TABLE `salesunitapp_tb_reviews` (
  `id` bigint(20) NOT NULL,
  `review` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesunitapp_tb_reviews`
--

INSERT INTO `salesunitapp_tb_reviews` (`id`, `review`, `date`, `product_id_id`, `user_id_id`) VALUES
(1, 'poor', '2023-04-21 15:31:40.237682', 3, 3),
(2, 'good', '2023-04-21 15:35:32.354729', 3, 3),
(3, 'good', '2023-04-21 16:14:07.625365', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `salesunitapp_tb_shop`
--

CREATE TABLE `salesunitapp_tb_shop` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pswd` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `img` varchar(100) NOT NULL,
  `licence_no` varchar(100) NOT NULL,
  `licenceid_img` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesunitapp_tb_shop`
--

INSERT INTO `salesunitapp_tb_shop` (`id`, `name`, `email`, `pswd`, `phone`, `address`, `img`, `licence_no`, `licenceid_img`, `status`) VALUES
(1, 'kalyan ', 'kalyan@gmail.com', '123', '900000000000', 'thrissur, kerala', 'shops/aa.jpg', 'HY768686666666', 'licence/IMG20230329085534.jpg', 'approved'),
(2, 'selecx', 'selecx@gmail.com', '123', '76767676767', 'Thrissur', 'shops/brainstorm-4222728__340.webp', 'HY7686323232', 'licence/IMG20230329085534_RXcxyPG.jpg', 'approved');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `salesunitapp_order_item_tb`
--
ALTER TABLE `salesunitapp_order_item_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salesUnitapp_order_i_cart_id_id_50de4c0e_fk_salesUnit` (`cart_id_id`),
  ADD KEY `salesUnitapp_order_i_product_id_id_6d0a8860_fk_salesUnit` (`product_id_id`),
  ADD KEY `salesUnitapp_order_i_user_id_id_781e9c5e_fk_salesUnit` (`user_id_id`);

--
-- Indexes for table `salesunitapp_tb_cart`
--
ALTER TABLE `salesunitapp_tb_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salesUnitapp_tb_cart_product_id_id_a671bba2_fk_salesUnit` (`product_id_id`),
  ADD KEY `salesUnitapp_tb_cart_user_id_id_76d63101_fk_salesUnit` (`user_id_id`);

--
-- Indexes for table `salesunitapp_tb_feedback`
--
ALTER TABLE `salesunitapp_tb_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salesUnitapp_tb_feed_user_id_id_c311d77f_fk_salesUnit` (`user_id_id`);

--
-- Indexes for table `salesunitapp_tb_payment`
--
ALTER TABLE `salesunitapp_tb_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salesUnitapp_tb_paym_order_id_id_792e676a_fk_salesUnit` (`order_id_id`),
  ADD KEY `salesUnitapp_tb_paym_product_id_id_d22c5076_fk_salesUnit` (`product_id_id`),
  ADD KEY `salesUnitapp_tb_paym_user_id_id_544e3613_fk_salesUnit` (`user_id_id`);

--
-- Indexes for table `salesunitapp_tb_product`
--
ALTER TABLE `salesunitapp_tb_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salesUnitapp_tb_prod_shop_id_id_d026a7e3_fk_salesUnit` (`shop_id_id`);

--
-- Indexes for table `salesunitapp_tb_register`
--
ALTER TABLE `salesunitapp_tb_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salesunitapp_tb_reviews`
--
ALTER TABLE `salesunitapp_tb_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salesUnitapp_tb_revi_product_id_id_d62f507b_fk_salesUnit` (`product_id_id`),
  ADD KEY `salesUnitapp_tb_revi_user_id_id_731abec0_fk_salesUnit` (`user_id_id`);

--
-- Indexes for table `salesunitapp_tb_shop`
--
ALTER TABLE `salesunitapp_tb_shop`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `salesunitapp_order_item_tb`
--
ALTER TABLE `salesunitapp_order_item_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `salesunitapp_tb_cart`
--
ALTER TABLE `salesunitapp_tb_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `salesunitapp_tb_feedback`
--
ALTER TABLE `salesunitapp_tb_feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salesunitapp_tb_payment`
--
ALTER TABLE `salesunitapp_tb_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salesunitapp_tb_product`
--
ALTER TABLE `salesunitapp_tb_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salesunitapp_tb_register`
--
ALTER TABLE `salesunitapp_tb_register`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salesunitapp_tb_reviews`
--
ALTER TABLE `salesunitapp_tb_reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salesunitapp_tb_shop`
--
ALTER TABLE `salesunitapp_tb_shop`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `salesunitapp_order_item_tb`
--
ALTER TABLE `salesunitapp_order_item_tb`
  ADD CONSTRAINT `salesUnitapp_order_i_cart_id_id_50de4c0e_fk_salesUnit` FOREIGN KEY (`cart_id_id`) REFERENCES `salesunitapp_tb_cart` (`id`),
  ADD CONSTRAINT `salesUnitapp_order_i_product_id_id_6d0a8860_fk_salesUnit` FOREIGN KEY (`product_id_id`) REFERENCES `salesunitapp_tb_product` (`id`),
  ADD CONSTRAINT `salesUnitapp_order_i_user_id_id_781e9c5e_fk_salesUnit` FOREIGN KEY (`user_id_id`) REFERENCES `salesunitapp_tb_register` (`id`);

--
-- Constraints for table `salesunitapp_tb_cart`
--
ALTER TABLE `salesunitapp_tb_cart`
  ADD CONSTRAINT `salesUnitapp_tb_cart_product_id_id_a671bba2_fk_salesUnit` FOREIGN KEY (`product_id_id`) REFERENCES `salesunitapp_tb_product` (`id`),
  ADD CONSTRAINT `salesUnitapp_tb_cart_user_id_id_76d63101_fk_salesUnit` FOREIGN KEY (`user_id_id`) REFERENCES `salesunitapp_tb_register` (`id`);

--
-- Constraints for table `salesunitapp_tb_feedback`
--
ALTER TABLE `salesunitapp_tb_feedback`
  ADD CONSTRAINT `salesUnitapp_tb_feed_user_id_id_c311d77f_fk_salesUnit` FOREIGN KEY (`user_id_id`) REFERENCES `salesunitapp_tb_register` (`id`);

--
-- Constraints for table `salesunitapp_tb_payment`
--
ALTER TABLE `salesunitapp_tb_payment`
  ADD CONSTRAINT `salesUnitapp_tb_paym_order_id_id_792e676a_fk_salesUnit` FOREIGN KEY (`order_id_id`) REFERENCES `salesunitapp_order_item_tb` (`id`),
  ADD CONSTRAINT `salesUnitapp_tb_paym_product_id_id_d22c5076_fk_salesUnit` FOREIGN KEY (`product_id_id`) REFERENCES `salesunitapp_tb_product` (`id`),
  ADD CONSTRAINT `salesUnitapp_tb_paym_user_id_id_544e3613_fk_salesUnit` FOREIGN KEY (`user_id_id`) REFERENCES `salesunitapp_tb_register` (`id`);

--
-- Constraints for table `salesunitapp_tb_product`
--
ALTER TABLE `salesunitapp_tb_product`
  ADD CONSTRAINT `salesUnitapp_tb_prod_shop_id_id_d026a7e3_fk_salesUnit` FOREIGN KEY (`shop_id_id`) REFERENCES `salesunitapp_tb_shop` (`id`);

--
-- Constraints for table `salesunitapp_tb_reviews`
--
ALTER TABLE `salesunitapp_tb_reviews`
  ADD CONSTRAINT `salesUnitapp_tb_revi_product_id_id_d62f507b_fk_salesUnit` FOREIGN KEY (`product_id_id`) REFERENCES `salesunitapp_tb_product` (`id`),
  ADD CONSTRAINT `salesUnitapp_tb_revi_user_id_id_731abec0_fk_salesUnit` FOREIGN KEY (`user_id_id`) REFERENCES `salesunitapp_tb_register` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
