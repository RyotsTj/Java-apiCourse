--
-- Table structure for table `admin_info`
--

DROP TABLE IF EXISTS admin_info;

CREATE TABLE admin_info (
    admin_id VARCHAR(100) NOT NULL PRIMARY KEY COMMENT '主キー、管理者の一意なID',
    admin_name VARCHAR(100) NOT NULL COMMENT '管理者の名前',
    mail VARCHAR(320) NOT NULL COMMENT '管理者のメールアドレス',
    phone_number VARCHAR(20) NOT NULL COMMENT '管理者の電話番号',
    password VARCHAR(255) NOT NULL COMMENT 'ログインパスワード',
    delete_flag TINYINT(1) NOT NULL DEFAULT 0 COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
    create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作が行われた日時',
    update_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作が行われた日時 (create_dateと一致)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理者情報テーブル';

INSERT INTO admin_info VALUES ('amoibeojt','運営事務局','sample.com','090××××××××','$2a$10$lC4aebTI9REPrc0c5mxJU.uGd1GvzG.wPcHTN5oxTEB3jt23P.0fW',0,'2024-01-23 00:00:00','2024-01-23 00:00:00'),('tokyo_operater','[東京]オペレータ','sample.com','090××××××××','$2a$10$lC4aebTI9REPrc0c5mxJU.uGd1GvzG.wPcHTN5oxTEB3jt23P.0fW',0,'2024-01-23 00:00:00','2024-01-23 00:00:00');

--
-- Table structure for table `center_info`
--

DROP TABLE IF EXISTS center_info;

CREATE TABLE center_info (
    center_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主キー、在庫センターの一意なID',
    center_name VARCHAR(20) NOT NULL COMMENT '在庫センター名',
    post_code VARCHAR(10) NOT NULL COMMENT '在庫センターの郵便番号',
    address VARCHAR(255) NOT NULL COMMENT '在庫センターの住所',
    phone_number VARCHAR(20) NOT NULL COMMENT '在庫センターの管理者の電話番号',
    manager_name VARCHAR(100) NOT NULL COMMENT '在庫センターの管理者名',
    operational_status TINYINT(1) NOT NULL DEFAULT 0 COMMENT '稼働のステータス (0:稼働中, 1:稼働停止)',
    max_storage_capacity VARCHAR(10) NOT NULL COMMENT '在庫センターの最大保管容量 (m³)',
    current_storage_capacity VARCHAR(10) NOT NULL COMMENT '在庫センターの現在保管容量 (m³)',
    notes VARCHAR(255) NULL COMMENT '在庫センター情報に関する補足など',
    delete_flag TINYINT(1) NOT NULL DEFAULT 0 COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
    create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作が行われた日時',
    update_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作が行われた日時 (create_dateと一致)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在庫センター情報テーブル';
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO center_info VALUES (1,'メインセンター','100-0001','東京都千代田区千代田1-1','03-1234-5678','山田太郎','0',1000,500,NULL,0,'2025-07-15 22:29:18','2025-07-15 22:29:18'),(2,'サテライトセンター','150-0002','東京都渋谷区渋谷2-2-2','03-8765-4321','佐藤花子','0',500,250,NULL,0,'2025-07-15 22:29:18','2025-07-15 22:29:18'),(3,'名古屋センター','450-0002','愛知県名古屋市中村区名駅4-4-4','052-000-1111','佐藤次郎','1',600,0,'設備メンテナンス中',0,'2025-07-12 07:46:38','2025-07-12 07:46:38'),(4,'東京物流センター','105-0000','東京都港区','03-1234-5678','田中 太郎','0',500,350,NULL,0,'2025-07-17 20:31:18','2025-07-17 20:31:18'),(5,'大阪物流センター','530-0000','大阪府大阪市','06-8765-4321','鈴木 一郎','0',300,250,NULL,0,'2025-07-17 20:31:18','2025-07-17 20:31:18'),(6,'名古屋物流センター','460-0000','愛知県名古屋市','052-123-4567','佐藤 花子','0',600,250,NULL,0,'2025-07-17 20:31:18','2025-07-17 20:31:18'),(7,'仙台物流センター','980-0000','宮城県仙台市','022-234-5678','中田 太郎','1',400,300,NULL,0,'2025-07-17 20:31:18','2025-07-17 20:31:18'),(8,'福岡物流センター','810-0000','福岡県福岡市','092-234-5678','近藤 一郎','0',350,150,NULL,0,'2025-07-17 20:31:18','2025-07-17 20:31:18'),(9,'北海道物流センター','060-0000','北海道札幌市','011-234-5678','小池 花子','0',1200,250,NULL,0,'2025-07-17 20:31:18','2025-07-17 20:31:18'),(10,'静岡物流センター','420-0000','静岡県静岡市','054-123-4567','中田 太郎','1',400,300,NULL,0,'2025-07-17 20:31:18','2025-07-17 20:31:18'),(11,'山梨物流センター','400-0000','山梨県山梨市','055-123-4567','小山 勇気','0',400,300,NULL,0,'2025-07-17 20:31:18','2025-07-17 20:31:18');

--
-- Table structure for table `parts_category_info`
--

DROP TABLE IF EXISTS parts_category_info;

CREATE TABLE parts_category_info (
    category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主キー、部品カテゴリの一意なID',
    category_name VARCHAR(20) NOT NULL COMMENT '部品カテゴリの名称',
    delete_flag TINYINT(1) NOT NULL DEFAULT 0 COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
    create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作が行われた日時',
    update_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作が行われた日時 (create_dateと一致)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部品カテゴリ情報テーブル';

INSERT INTO parts_category_info VALUES (1,'フレーム',0,'2025-07-15 22:29:18','2025-07-15 22:29:18'),(2,'モーター',0,'2025-07-15 22:29:18','2025-07-15 22:29:18'),(3,'プロペラ',0,'2025-07-15 22:29:18','2025-07-15 22:29:18'),(4,'レンズ',0,'2025-07-15 22:29:18','2025-07-15 22:29:18'),(5,'アーム',0,'2025-07-15 22:29:18','2025-07-15 22:29:18');

--
-- Table structure for table `parts_stock`
--

DROP TABLE IF EXISTS parts_stock;

CREATE TABLE parts_stock (
    stock_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主キー、部品在庫の一意なID',
    category_id INT NOT NULL COMMENT '部品カテゴリの分類情報 (外部キー:部品カテゴリ情報テーブル)',
    name VARCHAR(255) NOT NULL COMMENT '部品在庫の名称',
    center_id INT NOT NULL COMMENT '在庫センター情報 (外部キー:在庫センター情報テーブル)',
    description VARCHAR(255) NULL COMMENT '部品在庫に関する説明',
    amount INT NOT NULL DEFAULT 0 COMMENT '部品在庫の数量',
    delete_flag TINYINT(1) NOT NULL DEFAULT 0 COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
    create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録された日時',
    update_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新された日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部品在庫テーブル';

INSERT INTO parts_stock VALUES (1,1,'ドローン',1,'ドローンの部品',50,0,'2025-07-12 07:45:26','2025-07-12 19:18:05'),(2,2,'歯車ユニット',2,'減速用ギア一式',200,0,'2025-07-12 07:45:26','2025-07-12 07:45:26'),(3,3,'プラスチックカバー',3,'ABS 樹脂製外装カバー',0,0,'2025-07-12 07:45:26','2025-07-12 07:45:26'),(4,1,'加速度センサモジュール',2,'3軸加速度センサ',150,0,'2025-07-12 07:45:26','2025-07-12 07:45:26'),(5,2,'ボールベアリング',1,'精密深溝玉軸受',350,0,'2025-07-12 07:45:26','2025-07-12 07:45:26'),(6,1,'スマホ用マイコン',1,'ARM Cortex-M 系マイコン',500,0,'2025-07-12 07:45:26','2025-07-12 19:18:05');

--
-- Table structure for table `parts_stock_history`
--

DROP TABLE IF EXISTS parts_stock_history;

CREATE TABLE parts_stock_history (
    history_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主キー、部品入出庫履歴の一意なID',
    stock_id INT NOT NULL COMMENT '部品在庫ID (外部キー:部品在庫テーブル)',
    transaction_type VARCHAR(20) NOT NULL COMMENT '取引種別 (RECEIVE:入荷, RECEIVE_CANCEL:入荷取消, PRODUCTION_OUT:製造出庫, PRODUCTION_CANCEL:製造取消, ADJUSTMENT:調整)',
    transaction_date DATETIME NOT NULL COMMENT '業務上の処理日時（実際の入荷・出庫日時）',
    amount_before INT NOT NULL COMMENT '処理前の在庫数量',
    amount_change INT NOT NULL COMMENT '変動数量 (正:入荷/入庫, 負:出庫)',
    amount_after INT NOT NULL COMMENT '処理後の在庫数量',
    supplier_name VARCHAR(100) NULL COMMENT '仕入先企業名',
    purchase_order_no VARCHAR(50) NULL COMMENT '発注書番号',
    operator_name VARCHAR(50) NULL COMMENT '処理担当者名（外部システム連携時）',
    remarks VARCHAR(255) NULL COMMENT '備考・処理詳細',
    delete_flag TINYINT(1) NOT NULL DEFAULT 0 COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
    create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'システム登録日時',
    update_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部品入出庫履歴テーブル';

INSERT INTO parts_stock_history VALUES (1,1,'RECEIVE','2025-07-06 08:00:00',45,5,50,'部品商社A','PO-1001','山田 太郎','定期入荷',0,'2025-07-06 08:01:00','2025-07-06 08:01:00'),(2,1,'PRODUCTION_OUT','2025-07-07 09:30:00',50,-10,40,NULL,NULL,'佐藤 花子','製造出庫',0,'2025-07-07 09:31:00','2025-07-07 09:31:00'),(3,2,'ADJUSTMENT','2025-07-08 10:45:00',20,5,25,NULL,NULL,'高橋 次郎','在庫調整',0,'2025-07-08 10:46:00','2025-07-08 10:46:00'),(4,3,'RECEIVE_CANCEL','2025-07-09 11:15:00',0,0,0,'部品商社B','PO-1002','伊藤 美咲','入荷キャンセル',0,'2025-07-09 11:16:00','2025-07-09 11:16:00'),(5,4,'PRODUCTION_IN','2025-07-10 12:30:00',25,10,35,NULL,NULL,'中村 浩','製造入庫',0,'2025-07-10 12:31:00','2025-07-10 12:31:00'),(9,2,'RECEIVE','2025-07-17 09:00:00',200,50,250,'仕入先A','PO-3001','田村 太郎','定期入荷',0,'2025-07-17 20:47:59','2025-07-17 20:47:59'),(10,3,'PRODUCTION_OUT','2025-07-17 10:15:00',150,-30,120,NULL,NULL,'佐藤 花子','製造出庫',0,'2025-07-17 20:47:59','2025-07-17 20:47:59'),(11,1,'ADJUSTMENT','2025-07-17 11:30:00',45,5,50,NULL,NULL,'鈴木 次郎','在庫調整',0,'2025-07-17 20:47:59','2025-07-17 20:47:59'),(12,4,'PRODUCTION_CANCEL','2025-07-17 12:45:00',350,10,360,NULL,NULL,'高橋 一郎','製造取消',0,'2025-07-17 20:47:59','2025-07-17 20:47:59'),(13,5,'RECEIVE_CANCEL','2025-07-17 14:00:00',20,-10,10,'仕入先B','PO-3002','山本 花子','入荷取消',0,'2025-07-17 20:47:59','2025-07-17 20:47:59'),(14,6,'PRODUCTION_OUT','2025-07-17 15:15:00',500,-50,450,NULL,NULL,'井上 太郎','製造出庫',0,'2025-07-17 20:47:59','2025-07-17 20:47:59'),(15,2,'ADJUSTMENT','2025-07-17 16:30:00',250,0,250,NULL,NULL,'小林 直樹','在庫調整（確認）',0,'2025-07-17 20:47:59','2025-07-17 20:47:59'),(16,3,'PRODUCTION_IN','2025-07-17 17:45:00',120,20,140,NULL,NULL,'石井 花子','製造入庫',0,'2025-07-17 20:47:59','2025-07-17 20:47:59'),(17,1,'RECEIVE','2025-07-17 18:00:00',50,15,65,'仕入先C','PO-3003','田中 次郎','スポット入荷',0,'2025-07-17 20:47:59','2025-07-17 20:47:59'),(18,5,'PRODUCTION_CANCEL','2025-07-17 19:15:00',10,0,10,NULL,NULL,'佐々木 愛','製造取消',0,'2025-07-17 20:47:59','2025-07-17 20:47:59');

--
-- Table structure for table `products_category_info`
--

DROP TABLE IF EXISTS products_category_info;

CREATE TABLE products_category_info (
    category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主キー、製品カテゴリの一意なID',
    category_name VARCHAR(20) NOT NULL COMMENT '製品カテゴリの名称',
    delete_flag TINYINT(1) NOT NULL DEFAULT 0 COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
    create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作が行われた日時',
    update_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作が行われた日時 (create_dateと一致)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='製品カテゴリ情報テーブル';

INSERT INTO products_category_info VALUES (1,'完成ドローン',0,'2025-07-15 10:00:00','2025-07-15 10:00:00'),(2,'センサーモジュール',0,'2025-07-15 10:00:00','2025-07-15 10:00:00'),(3,'コントローラー',0,'2025-07-15 10:00:00','2025-07-15 10:00:00'),(4,'バッテリーキット',0,'2025-07-15 10:00:00','2025-07-15 10:00:00'),(5,'急速充電器',0,'2025-07-15 10:00:00','2025-07-15 10:00:00');

--
-- Table structure for table `products_stock`
--

DROP TABLE IF EXISTS products_stock;

CREATE TABLE products_stock (
    stock_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主キー、製品在庫の一意なID',
    category_id INT NOT NULL COMMENT '製品カテゴリの分類情報 (外部キー:製品カテゴリ情報テーブル)',
    name VARCHAR(255) NOT NULL COMMENT '製品在庫の名称',
    center_id INT NOT NULL COMMENT '在庫センター情報 (外部キー:在庫センター情報テーブル)',
    description VARCHAR(255) NULL COMMENT '製品在庫に関する説明',
    amount INT NOT NULL DEFAULT 0 COMMENT '製品在庫の数量',
    delete_flag TINYINT(1) NOT NULL DEFAULT 0 COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
    create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録された日時',
    update_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新された日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='製品在庫テーブル';

INSERT INTO products_stock VALUES (1,1,'ドローン A セット',1,'完成品ドローンA＋予備バッテリー',10,0,'2025-07-01 09:00:00','2025-07-10 12:00:00'),(2,2,'GPS センサーモジュール',2,'高精度 GPS モジュール',50,0,'2025-07-02 10:30:00','2025-07-11 13:15:00'),(3,3,'メインコントローラー基板',3,'ドローン制御用メイン基板',25,0,'2025-07-03 11:45:00','2025-07-12 14:30:00'),(4,4,'バッテリーキット（5000mAh）',1,'長時間飛行用バッテリー×2本',30,0,'2025-07-04 13:00:00','2025-07-13 15:45:00'),(5,5,'急速充電器 QC3.0 対応',2,'2ポート急速充電器',75,0,'2025-07-05 14:15:00','2025-07-14 16:00:00');

--
-- Table structure for table `products_stock_history`
--

DROP TABLE IF EXISTS products_stock_history;

CREATE TABLE products_stock_history (
    history_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主キー、製品入出荷履歴の一意なID',
    stock_id INT NOT NULL COMMENT '製品在庫ID (外部キー:製品在庫テーブル)',
    transaction_type VARCHAR(20) NOT NULL COMMENT '取引種別 (PRODUCTION_IN:製造入庫, SHIPMENT:出荷, SHIPMENT_CANCEL:出荷取消, ADJUSTMENT:調整)',
    transaction_date DATETIME NOT NULL COMMENT '業務上の処理日時（実際の入庫・出荷日時）',
    amount_before INT NOT NULL COMMENT '処理前の在庫数量',
    amount_change INT NOT NULL COMMENT '変動数量 (正:入庫, 負:出荷)',
    amount_after INT NOT NULL COMMENT '処理後の在庫数量',
    customer_name VARCHAR(100) NULL COMMENT '顧客企業名',
    order_no VARCHAR(50) NULL COMMENT '受注番号・出荷指示番号',
    operator_name VARCHAR(50) NULL COMMENT '処理担当者名（外部システム連携時）',
    shipping_address TEXT NULL COMMENT '出荷先住所',
    shipping_date DATE NULL COMMENT '出荷予定日',
    remarks VARCHAR(255) NULL COMMENT '備考・処理詳細',
    delete_flag TINYINT(1) NOT NULL DEFAULT 0 COMMENT '論理削除フラグ (0:未削除, 1:削除済)',
    create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'システム登録日時',
    update_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='製品入出荷履歴テーブル';

INSERT INTO products_stock_history VALUES (1,1,'PRODUCTION_IN','2025-07-06 07:00:00',5,5,10,NULL,NULL,'山本 一郎','東京都千代田区1-1-1','2025-07-07','新規製造入庫',0,'2025-07-06 07:01:00','2025-07-06 07:01:00'),(2,1,'SHIPMENT','2025-07-07 14:00:00',10,-3,7,'企業X','SO-2001','佐々木 花子','大阪市北区2-2-2','2025-07-08','得意先出荷',0,'2025-07-07 14:01:00','2025-07-07 14:01:00'),(3,2,'ADJUSTMENT','2025-07-08 15:15:00',25,2,27,NULL,NULL,'鈴木 次郎',NULL,NULL,'在庫修正',0,'2025-07-08 15:16:00','2025-07-08 15:16:00'),(4,3,'SHIPMENT_CANCEL','2025-07-09 16:30:00',50,0,50,'企業Y','SO-2002','田中 美香',NULL,NULL,'出荷キャンセル',0,'2025-07-09 16:31:00','2025-07-09 16:31:00'),(5,4,'PRODUCTION_OUT','2025-07-10 17:45:00',35,-10,25,NULL,NULL,'小林 誠',NULL,NULL,'出庫処理',0,'2025-07-10 17:46:00','2025-07-10 17:46:00'),(6,2,'PRODUCTION_IN','2025-07-18 09:30:00',27,13,40,NULL,NULL,'田中 一郎','東京都港区1-2-3','2025-07-19','追加生産入庫',0,'2025-07-17 20:49:49','2025-07-17 20:49:49'),(7,1,'SHIPMENT','2025-07-18 10:45:00',7,-2,5,'企業Z','SO-3001','清水 花子','大阪市中央区3-4-5','2025-07-20','定期出荷',0,'2025-07-17 20:49:49','2025-07-17 20:49:49'),(8,3,'ADJUSTMENT','2025-07-18 12:00:00',50,5,55,NULL,NULL,'岩田 次郎',NULL,NULL,'棚卸差異調整',0,'2025-07-17 20:49:49','2025-07-17 20:49:49'),(9,4,'SHIPMENT_CANCEL','2025-07-18 13:15:00',25,0,25,'企業Y','SO-3002','小川 太郎',NULL,NULL,'出荷取消',0,'2025-07-17 20:49:49','2025-07-17 20:49:49'),(10,5,'PRODUCTION_OUT','2025-07-18 14:30:00',45,-15,30,NULL,NULL,'佐々木 一郎',NULL,NULL,'量産出庫',0,'2025-07-17 20:49:49','2025-07-17 20:49:49'),(11,6,'PRODUCTION_IN','2025-07-18 15:45:00',140,60,200,NULL,NULL,'山下 花子',NULL,NULL,'納品分入庫',0,'2025-07-17 20:49:49','2025-07-17 20:49:49'),(12,2,'ADJUSTMENT','2025-07-18 17:00:00',40,-5,35,NULL,NULL,'高橋 次郎',NULL,NULL,'出荷差異調整',0,'2025-07-17 20:49:49','2025-07-17 20:49:49'),(13,1,'SHIPMENT','2025-07-18 18:15:00',5,-1,4,'企業A','SO-3003','松本 太郎','福岡市博多区1-1-1','2025-07-20','スポット出荷',0,'2025-07-17 20:49:49','2025-07-17 20:49:49'),(14,4,'PRODUCTION_IN','2025-07-18 19:30:00',25,10,35,NULL,NULL,'渡辺 花子',NULL,NULL,'繁忙期追加入庫',0,'2025-07-17 20:49:49','2025-07-17 20:49:49'),(15,5,'PRODUCTION_CANCEL','2025-07-18 20:45:00',30,0,30,NULL,NULL,'岡田 次郎',NULL,NULL,'製造ライン取消',0,'2025-07-17 20:49:49','2025-07-17 20:49:49');