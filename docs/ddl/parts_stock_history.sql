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
