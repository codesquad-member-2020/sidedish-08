DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `dish`;
DROP TABLE IF EXISTS `delivery`;
DROP TABLE IF EXISTS `badge`;
DROP TABLE IF EXISTS `thumb_image`;

CREATE TABLE `category`
(
    `id`   BIGINT      NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `dish`
(
    `id`           BIGINT       NOT NULL AUTO_INCREMENT,
    `hash`         VARCHAR(45)  NULL,
    `title`        VARCHAR(100) NULL,
    `description`  VARCHAR(500) NULL,
    `price`        INT          NULL,
    `category_id`  BIGINT       NOT NULL REFERENCES category (id),
    `category_key` INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `delivery`
(
    `id`       BIGINT      NOT NULL AUTO_INCREMENT,
    `type`     VARCHAR(45) NULL,
    `dish_id`  BIGINT      NOT NULL REFERENCES dish (id),
    `dish_key` INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `badge`
(
    `id`       BIGINT      NOT NULL AUTO_INCREMENT,
    `type`     VARCHAR(45) NULL,
    `dish_id`  BIGINT      NOT NULL,
    `dish_key` INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `image`
(
    `id`       INT          NOT NULL AUTO_INCREMENT,
    `url`      VARCHAR(500) NULL,
    `type`     VARCHAR(45)  NULL,
    `dish_id`  BIGINT       NOT NULL,
    `dish_key` INT,
    PRIMARY KEY (`id`)
);
