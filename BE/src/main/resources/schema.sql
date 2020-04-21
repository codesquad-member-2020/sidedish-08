DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `dish`;

CREATE TABLE `category`
(
    `id`   BIGINT      NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
);


CREATE TABLE `dish`
(
    `id`           BIGINT       NOT NULL AUTO_INCREMENT,
    `detail_hash`  VARCHAR(45)  NULL,
    `title`        VARCHAR(100) NULL,
    `description`  VARCHAR(500) NULL,
    `price`        INT          NULL,
    `category_id`  BIGINT       NOT NULL REFERENCES category (id),
    `category_key` int,
    PRIMARY KEY (`id`)
)
