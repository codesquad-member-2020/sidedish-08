INSERT INTO `category` (`type`)
VALUES ('든든한 반찬');
INSERT INTO `category` (`type`)
VALUES ('국물 요리');
INSERT INTO `category` (`type`)
VALUES ('밑반찬');

INSERT INTO `dish` (`hash`, `image`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HBDEF', 'http://public.codesquad.kr/jk/storeapp/data/2d3f99a9a35601f4e98837bc4d39b2c8.jpg',
        '[미노리키친] 규동 250g', '일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥', 6500, 1, 0);
INSERT INTO `dish` (`hash`, `image`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HDF73', 'http://public.codesquad.kr/jk/storeapp/data/7674311a02ba7c88675f3186ddaeef9e.jpg',
        '[빅마마의밥친구] 아삭 고소한 연근고기조림 250g', '편식하는 아이도 좋아하는 건강한 연근조림', 5500, 1, 1);
INSERT INTO `dish` (`hash`, `image`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HF778', 'http://public.codesquad.kr/jk/storeapp/data/cad8eee316cf7151e07638aa57b32a9d.jpg',
        '[소중한식사] 골뱅이무침 195g', '매콤새콤달콤, 반찬으로도 안주로도 좋은', 7000, 1, 2);
INSERT INTO `dish` (`hash`, `image`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HFB53',
        'https://public.codesquad.kr/jk/storeapp/data/b6beada6b89af950289003d929936d9c.jpg',
        '[옹가솜씨] 꽁치간장조림 240g', '생강 향이 산뜻한', 5800, 1, 3);

INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('새벽배송', 1, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('전국배송', 1, 1);

INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('이벤트특가', 1, 0);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('론칭특가', 1, 1);
