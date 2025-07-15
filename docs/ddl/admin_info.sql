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
