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
