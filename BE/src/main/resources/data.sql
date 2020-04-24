INSERT INTO `category` (`type`)
VALUES ('든든한 반찬');
INSERT INTO `category` (`type`)
VALUES ('국물 요리');
INSERT INTO `category` (`type`)
VALUES ('밑반찬');


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HBDEF', '[미노리키친] 규동 250g', '일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥', 6500, 1, 0);
INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HDF73', '[빅마마의밥친구] 아삭 고소한 연근고기조림 250g', '편식하는 아이도 좋아하는 건강한 연근조림', 5500, 1, 1);
INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HF778', '[소중한식사] 골뱅이무침 195g', '매콤새콤달콤, 반찬으로도 안주로도 좋은', 7000, 1, 2);
INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HFB53', '[옹가솜씨] 꽁치간장조림 240g', '생강 향이 산뜻한', 5800, 1, 3);
INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HBBCC', '[마샐미디쉬] 유자소스 연근무침 250g', '향긋한 유자향과 아삭한 연근', 6500, 3, 0);
INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('H1939', '[동네부엌] 쇠고기야채장조림 200g', '부드러운 고기부터 밥비벼먹기 딱좋은 국물까지', 7400, 3, 1);
INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('H8EA5', '[소중한식사] 도라지초무침 150g', '새콤달콤 입맛 돋우는', 4000, 3, 2);
INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('H602F', '[미노리키친] 일본식 우엉조림(킨피라고보) 80g', '한국식 우엉조림과는 다른 진한 감칠맛', 3300, 3, 3);


INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 1, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 1, 1);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 2, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 2, 1);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 3, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 3, 1);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 4, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 4, 1);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 5, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 5, 1);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 6, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 6, 1);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 7, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 7, 1);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 8, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 8, 1);

INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('EVENT', 1, 0);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('LAUNCHING', 1, 1);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('EVENT', 3, 0);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('LAUNCHING', 4, 0);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('LAUNCHING', 6, 0);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('EVENT', 7, 0);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('LAUNCHING', 7, 1);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('EVENT', 8, 0);


INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/2d3f99a9a35601f4e98837bc4d39b2c8.jpg',
        'top', 1, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/7674311a02ba7c88675f3186ddaeef9e.jpg',
        'top', 2, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/cad8eee316cf7151e07638aa57b32a9d.jpg',
        'top', 3, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/b6beada6b89af950289003d929936d9c.jpg',
        'top', 4, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/fdb0d5fcfb86e332505785225a6d9ade.jpg',
        'top', 5, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/e5646e5fc09a01a9243979b229e0572b.jpg',
        'top', 6, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/4cfd1954861ebd18b5b53e558a8e902e.jpg',
        'top', 7, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/422befe07f7e2860b9a83a8d7049ec2e.jpg',
        'top', 8, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/4cce011a4a352c22cd399a60271b4921.jpg',
        'thumb', 1, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/6ef14155afc5b47e8c9efd762f7a6096.jpg',
        'thumb', 1, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/8744504ff3bc315f901dca1f26fe63a1.jpg',
        'thumb', 2, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/e30bd6de9340fc05db3cd1d1329b2c56.jpg',
        'thumb', 2, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/a8c434715709fe855f3ea1554ec362b6.jpg',
        'detail', 1, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/b2b3d0d2107ab91b16e0eb804cd84bc9.jpg',
        'detail', 1, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/c0dd6887c9d9368604fc70d7fc3c4598.jpg',
        'detail', 1, 3);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HDF73/d2e3274c95c832bc9bfbcebbd548f61b.jpg',
        'detail', 2, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HDF73/d9e4fa00652483d74b46317d38159a2f.jpg',
        'detail', 2, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HDF73/d7799b67683128642453f9e2b4c8ce84.jpg',
        'detail', 2, 3);
