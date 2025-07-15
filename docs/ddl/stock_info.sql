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
