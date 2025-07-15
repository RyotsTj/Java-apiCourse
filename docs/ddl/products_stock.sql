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
