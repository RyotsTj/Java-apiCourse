--
-- Table structure for table `admin_info`
--

DROP TABLE IF EXISTS `admin_info`;

CREATE TABLE `admin_info` (
  `admin_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理者の名前',
  `mail` varchar(320) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理者のメールアドレス',
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理者の電話番号',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ログインパスワード',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作が行われた日時',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作が行われた日時 (create_dateと一致)',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理者情報テーブル';

INSERT INTO `admin_info` VALUES ('dotlife','運営事務局','sample.com','090××××××××','$2a$10$lC4aebTI9REPrc0c5mxJU.uGd1GvzG.wPcHTN5oxTEB3jt23P.0fW',0,'2024-01-23 00:00:00','2024-01-23 00:00:00'),('tokyo_operater','[東京]オペレータ','sample.com','090××××××××','$2a$10$lC4aebTI9REPrc0c5mxJU.uGd1GvzG.wPcHTN5oxTEB3jt23P.0fW',0,'2024-01-23 00:00:00','2024-01-23 00:00:00');

--
-- Table structure for table `category_info`
--

DROP TABLE IF EXISTS `category_info`;

CREATE TABLE `category_info` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `delete_flag` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `center_info`
--

DROP TABLE IF EXISTS `center_info`;

CREATE TABLE `center_info` (
  `center_id` int NOT NULL AUTO_INCREMENT COMMENT '主キー、在庫センターの一意なID',
  `center_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '在庫センターの住所',
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operational_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_storage_capacity` int DEFAULT NULL,
  `current_storage_capacity` int DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '在庫センター情報に関する補足など',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作が行われた日時',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作が行われた日時 (create_dateと一致)',
  PRIMARY KEY (`center_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在庫センター情報テーブル';

INSERT INTO `center_info` VALUES (1,'メインセンター','100-0001','東京都千代田区千代田1-1','03-1234-5678','山田太郎','0',1000,500,NULL,0,'2025-07-15 22:29:18','2025-07-15 22:29:18'),(2,'サテライトセンター','150-0002','東京都渋谷区渋谷2-2-2','03-8765-4321','佐藤花子','0',500,250,NULL,0,'2025-07-15 22:29:18','2025-07-15 22:29:18'),(3,'名古屋センター','450-0002','愛知県名古屋市中村区名駅4-4-4','052-000-1111','佐藤次郎','1',600,0,'設備メンテナンス中',0,'2025-07-12 07:46:38','2025-07-12 07:46:38');

--
-- Table structure for table `operation_log`
--

DROP TABLE IF EXISTS `operation_log`;

CREATE TABLE `operation_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `admin_id` varchar(255) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `delete_flag` varchar(255) NOT NULL,
  `operate_type` varchar(255) NOT NULL,
  `operation_details` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `table_id` int NOT NULL,
  `target_id` int NOT NULL,
  `update_date` datetime(6) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `parts_category_info`
--

DROP TABLE IF EXISTS `parts_category_info`;

CREATE TABLE `parts_category_info` (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '主キー、部品カテゴリの一意なID',
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作が行われた日時',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作が行われた日時 (create_dateと一致)',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部品カテゴリ情報テーブル';

INSERT INTO `parts_category_info` VALUES (1,'フレーム',0,'2025-07-15 22:29:18','2025-07-15 22:29:18'),(2,'モーター',0,'2025-07-15 22:29:18','2025-07-15 22:29:18'),(3,'プロペラ',0,'2025-07-15 22:29:18','2025-07-15 22:29:18');

--
-- Table structure for table `parts_stock`
--

DROP TABLE IF EXISTS `parts_stock`;

CREATE TABLE `parts_stock` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `center_id` int NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int NOT NULL DEFAULT '0' COMMENT '部品在庫の数量',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録された日時',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新された日時',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部品在庫テーブル';

INSERT INTO `parts_stock` VALUES (1,1,'ドローン',1,'ドローンの部品',50,0,'2025-07-12 07:45:26','2025-07-12 19:18:05'),(2,2,'歯車ユニット',2,'減速用ギア一式',200,0,'2025-07-12 07:45:26','2025-07-12 07:45:26'),(3,3,'プラスチックカバー',3,'ABS 樹脂製外装カバー',0,0,'2025-07-12 07:45:26','2025-07-12 07:45:26'),(4,1,'加速度センサモジュール',2,'3軸加速度センサ',150,0,'2025-07-12 07:45:26','2025-07-12 07:45:26'),(5,2,'ボールベアリング',1,'精密深溝玉軸受',350,0,'2025-07-12 07:45:26','2025-07-12 07:45:26'),(6,1,'スマホ用マイコン',1,'ARM Cortex-M 系マイコン',500,0,'2025-07-12 07:45:26','2025-07-12 19:18:05');

--
-- Table structure for table `parts_stock_history`
--

DROP TABLE IF EXISTS `parts_stock_history`;

CREATE TABLE `parts_stock_history` (
  `history_id` int NOT NULL AUTO_INCREMENT COMMENT '主キー、部品入出庫履歴の一意なID',
  `stock_id` int NOT NULL COMMENT '部品在庫ID (外部キー:部品在庫テーブル)',
  `transaction_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '取引種別 (RECEIVE:入荷, RECEIVE_CANCEL:入荷取消, PRODUCTION_OUT:製造出庫, PRODUCTION_CANCEL:製造取消, ADJUSTMENT:調整)',
  `transaction_date` datetime NOT NULL COMMENT '業務上の処理日時（実際の入荷・出庫日時）',
  `amount_before` int NOT NULL COMMENT '処理前の在庫数量',
  `amount_change` int NOT NULL COMMENT '変動数量 (正:入荷/入庫, 負:出庫)',
  `amount_after` int NOT NULL COMMENT '処理後の在庫数量',
  `supplier_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '仕入先企業名',
  `purchase_order_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '発注書番号',
  `operator_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '処理担当者名（外部システム連携時）',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備考・処理詳細',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'システム登録日時',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部品入出庫履歴テーブル';

--
-- Table structure for table `products_category_info`
--

DROP TABLE IF EXISTS `products_category_info`;

CREATE TABLE `products_category_info` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作が行われた日時',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作が行われた日時 (create_dateと一致)',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='製品カテゴリ情報テーブル';

--
-- Table structure for table `products_stock`
--

DROP TABLE IF EXISTS `products_stock`;

CREATE TABLE `products_stock` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `center_id` int NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int NOT NULL DEFAULT '0' COMMENT '製品在庫の数量',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録された日時',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新された日時',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='製品在庫テーブル';

DROP TABLE IF EXISTS `products_stock_history`;

CREATE TABLE `products_stock_history` (
  `history_id` int NOT NULL AUTO_INCREMENT COMMENT '主キー、製品入出荷履歴の一意なID',
  `stock_id` int NOT NULL COMMENT '製品在庫ID (外部キー:製品在庫テーブル)',
  `transaction_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '取引種別 (PRODUCTION_IN:製造入庫, SHIPMENT:出荷, SHIPMENT_CANCEL:出荷取消, ADJUSTMENT:調整)',
  `transaction_date` datetime NOT NULL COMMENT '業務上の処理日時（実際の入庫・出荷日時）',
  `amount_before` int NOT NULL COMMENT '処理前の在庫数量',
  `amount_change` int NOT NULL COMMENT '変動数量 (正:入庫, 負:出荷)',
  `amount_after` int NOT NULL COMMENT '処理後の在庫数量',
  `customer_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '顧客企業名',
  `order_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '受注番号・出荷指示番号',
  `operator_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '処理担当者名（外部システム連携時）',
  `shipping_address` text COLLATE utf8mb4_unicode_ci COMMENT '出荷先住所',
  `shipping_date` date DEFAULT NULL COMMENT '出荷予定日',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備考・処理詳細',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'システム登録日時',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='製品入出荷履歴テーブル';

--
-- Table structure for table `stock_info`
--

DROP TABLE IF EXISTS `stock_info`;

CREATE TABLE `stock_info` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `amount` int DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `delete_flag` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `category_id` int NOT NULL,
  `center_id` int NOT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `FKk6mnj5y3d4nr7tccl9raech0m` (`category_id`),
  KEY `FKcw2bfvepliag374heetmbu104` (`center_id`),
  CONSTRAINT `FKcw2bfvepliag374heetmbu104` FOREIGN KEY (`center_id`) REFERENCES `center_info` (`center_id`),
  CONSTRAINT `FKk6mnj5y3d4nr7tccl9raech0m` FOREIGN KEY (`category_id`) REFERENCES `category_info` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
