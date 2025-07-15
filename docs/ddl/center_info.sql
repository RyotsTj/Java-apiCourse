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
