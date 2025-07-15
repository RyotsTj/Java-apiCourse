DROP TABLE IF EXISTS `products_category_info`;

CREATE TABLE `products_category_info` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作が行われた日時',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作が行われた日時 (create_dateと一致)',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='製品カテゴリ情報テーブル';