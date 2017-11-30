DROP DATABASE IF EXISTS pbs;

CREATE DATABASE pbs;

USE pbs;

-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'quotes'
-- 
-- ---

DROP TABLE IF EXISTS `quotes`;
		
CREATE TABLE `quotes` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `id_customers` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'customers'
-- 
-- ---

DROP TABLE IF EXISTS `customers`;
		
CREATE TABLE `customers` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'products'
-- 
-- ---

DROP TABLE IF EXISTS `products`;
		
CREATE TABLE `products` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'quote line items'
-- 
-- ---

DROP TABLE IF EXISTS `quote_line_items`;
		
CREATE TABLE `quote_line_items` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `id_quotes` INTEGER NULL,
  `id_products` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `quotes` ADD FOREIGN KEY (id_customers) REFERENCES `customers` (`id`);
ALTER TABLE `quote_line_items` ADD FOREIGN KEY (id_quotes) REFERENCES `quotes` (`id`);
ALTER TABLE `quote_line_items` ADD FOREIGN KEY (id_products) REFERENCES `products` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `quotes` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `customers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `quote line items` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `quotes` (`id`,`id_customers`) VALUES
-- ('','');
-- INSERT INTO `customers` (`id`) VALUES
-- ('');
-- INSERT INTO `products` (`id`) VALUES
-- ('');
-- INSERT INTO `quote line items` (`id`,`id_quotes`,`id_products`) VALUES
-- ('','','');