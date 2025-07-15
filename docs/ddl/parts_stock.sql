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