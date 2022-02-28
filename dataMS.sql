CREATE TABLE `product`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `price` INT NOT NULL,
    `stack` INT NOT NULL
);
ALTER TABLE
    `product` ADD PRIMARY KEY `product_id_primary`(`id`);
CREATE TABLE `product_num`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` INT NOT NULL,
    `num_product` INT NOT NULL
);
ALTER TABLE
    `product_num` ADD PRIMARY KEY `product_num_id_primary`(`id`);
CREATE TABLE `order_num`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `coustumer_id` INT NOT NULL,
    `num_order` INT NOT NULL
);
ALTER TABLE
    `order_num` ADD PRIMARY KEY `order_num_id_primary`(`id`);
CREATE TABLE `coustumer`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `f_name` VARCHAR(255) NOT NULL,
    `l_name` VARCHAR(255) NOT NULL,
    `coustumer_address` VARCHAR(255) NOT NULL,
    `phone` INT NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `coustumer` ADD PRIMARY KEY `coustumer_id_primary`(`id`);
ALTER TABLE
    `coustumer` ADD INDEX `coustumer_email_index`(`email`);
ALTER TABLE
    `coustumer` ADD INDEX `coustumer_password_index`(`password`);
CREATE TABLE `order`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_num_id` INT NOT NULL,
    `order_num_id` INT NOT NULL,
    `date` DATE NOT NULL,
    `address_order` TEXT NOT NULL
);
ALTER TABLE
    `order` ADD PRIMARY KEY `order_id_primary`(`id`);
ALTER TABLE
    `order` ADD CONSTRAINT `order_product_num_id_foreign` FOREIGN KEY(`product_num_id`) REFERENCES `product_num`(`id`);
ALTER TABLE
    `product_num` ADD CONSTRAINT `product_num_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`id`);
ALTER TABLE
    `order` ADD CONSTRAINT `order_order_num_id_foreign` FOREIGN KEY(`order_num_id`) REFERENCES `order_num`(`id`);
ALTER TABLE
    `order_num` ADD CONSTRAINT `order_num_coustumer_id_foreign` FOREIGN KEY(`coustumer_id`) REFERENCES `coustumer`(`id`);