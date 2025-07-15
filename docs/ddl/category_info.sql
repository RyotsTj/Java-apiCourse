DROP TABLE IF EXISTS `category_info`;

CREATE TABLE `category_info` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `delete_flag` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
