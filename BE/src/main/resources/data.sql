INSERT INTO `category` (`type`)
VALUES ('든든한 반찬');
INSERT INTO `category` (`type`)
VALUES ('국물 요리');
INSERT INTO `category` (`type`)
VALUES ('밑반찬');


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HBDEF', '[미노리키친] 규동 250g', '일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥', 6500, 1, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 1, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 1, 1);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('EVENT', 1, 0);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('LAUNCHING', 1, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/2d3f99a9a35601f4e98837bc4d39b2c8.jpg',
        'top', 1, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/4cce011a4a352c22cd399a60271b4921.jpg',
        'thumb', 1, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/6ef14155afc5b47e8c9efd762f7a6096.jpg',
        'thumb', 1, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/a8c434715709fe855f3ea1554ec362b6.jpg',
        'detail', 1, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/b2b3d0d2107ab91b16e0eb804cd84bc9.jpg',
        'detail', 1, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/c0dd6887c9d9368604fc70d7fc3c4598.jpg',
        'detail', 1, 3);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HDF73', '[빅마마의밥친구] 아삭 고소한 연근고기조림 250g', '편식하는 아이도 좋아하는 건강한 연근조림', 5500, 1, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/7674311a02ba7c88675f3186ddaeef9e.jpg',
        'top', 2, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/8744504ff3bc315f901dca1f26fe63a1.jpg',
        'thumb', 2, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/e30bd6de9340fc05db3cd1d1329b2c56.jpg',
        'thumb', 2, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HDF73/d2e3274c95c832bc9bfbcebbd548f61b.jpg',
        'detail', 2, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HDF73/d9e4fa00652483d74b46317d38159a2f.jpg',
        'detail', 2, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HDF73/d7799b67683128642453f9e2b4c8ce84.jpg',
        'detail', 2, 3);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HF778', '[소중한식사] 골뱅이무침 195g', '매콤새콤달콤, 반찬으로도 안주로도 좋은', 7000, 1, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/cad8eee316cf7151e07638aa57b32a9d.jpg',
        'top', 3, 0);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HFB53', '[옹가솜씨] 꽁치간장조림 240g', '생강 향이 산뜻한', 5800, 1, 3);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/b6beada6b89af950289003d929936d9c.jpg',
        'top', 4, 0);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HBBCC', '[마샐미디쉬] 유자소스 연근무침 250g', '향긋한 유자향과 아삭한 연근', 6500, 3, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 5, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 5, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/fdb0d5fcfb86e332505785225a6d9ade.jpg',
        'top', 5, 0);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('H1939', '[동네부엌] 쇠고기야채장조림 200g', '부드러운 고기부터 밥비벼먹기 딱좋은 국물까지', 7400, 3, 1);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 6, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 6, 1);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('LAUNCHING', 6, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/e5646e5fc09a01a9243979b229e0572b.jpg',
        'top', 6, 0);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('H8EA5', '[소중한식사] 도라지초무침 150g', '새콤달콤 입맛 돋우는', 4000, 3, 2);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 7, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 7, 1);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('EVENT', 7, 0);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('LAUNCHING', 7, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/4cfd1954861ebd18b5b53e558a8e902e.jpg',
        'top', 7, 0);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('H602F', '[미노리키친] 일본식 우엉조림(킨피라고보) 80g', '한국식 우엉조림과는 다른 진한 감칠맛', 3300, 3, 3);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 8, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 8, 1);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('EVENT', 8, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/422befe07f7e2860b9a83a8d7049ec2e.jpg',
        'top', 8, 0);

INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('H72C3', '[수하동] 특곰탕 850g', '100% 한우양지로 끓여낸 70년전통의 서울식곰탕', 15000, 2, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 9, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 9, 1);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('EVENT', 9, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/d1fccf125f0a78113d0e06cb888f2e74.jpg',
        'top', 9, 0);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HA6EE', '[탐나는밥상] 동태탕 1000g', '칼칼한 국물이 속 풀기에 딱 좋은 동태탕', 14000, 2, 1);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 10, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 10, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/c069bc32cb37727c59e1f0c2839311a0.jpg',
        'top', 10, 0);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HE2E9', '[국물닷컴] 치즈부대찌개 600g', '안주용 부대찌개와는 달라 밥말아먹기 딱 좋은', 5500, 2, 2);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 11, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 11, 1);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('EVENT', 11, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/6edbb16da52708e8533b85fbf743f882.jpg',
        'top', 11, 0);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('HAA47', '[집밥의완성] 스키야키 1.5kg (2~3인분)', '진한 풍미의 일본식 전골, 스키야키 ', 19800, 2, 3);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 12, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 12, 1);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('EVENT', 12, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('https://public.codesquad.kr/jk/storeapp/data/892f3e7f043bfa7dbbcd58f88eecac36.jpg',
        'top', 12., 0);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('H077F', '[마더앤찬] 코다리구이 320g', '큼지막하고 살집 많은 동태 한 마리로 만든 코다리구이입니다.', 7500, 1, 4);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 13, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 13, 1);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('LAUNCHING', 13, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/0221110ead70dfd455e40703bbdd6252.jpg',
        'top', 13, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/0221110ead70dfd455e40703bbdd6252.jpg',
        'thumb', 13, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HDF73/2d408898494ac950d7d2cfd6c36d59c2.jpg',
        'thumb', 13, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HDF73/62c8bb77facfc9c3be81f9bf45b27f2a.jpg',
        'thumb', 13, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HDF73/f6d73afc0ebc1efa71eaea32e9d846f2.jpg',
        'thumb', 13, 3);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('H4665', '[남도애꽃] 반건조 문어조림 120g', '씹을수록 감칠맛나는 문어살의 쫄깃함', 4600, 1, 5);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 14, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 14, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/385f4106ac26f6e4fe7c640714f405a5.jpg',
        'top', 14, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/385f4106ac26f6e4fe7c640714f405a5.jpg',
        'thumb', 14, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HDF73/2d408898494ac950d7d2cfd6c36d59c2.jpg',
        'thumb', 14, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HDF73/62c8bb77facfc9c3be81f9bf45b27f2a.jpg',
        'thumb', 14, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/HDF73/f6d73afc0ebc1efa71eaea32e9d846f2.jpg',
        'thumb', 14, 3);


INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('H26C7', '[모이세] 육개장 1팩(600g)', '제주3대해장국 맛집의 인기메뉴', 5900, 2, 4);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 15, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 15, 1);
INSERT INTO `badge` (`type`, `dish_id`, `dish_key`)
VALUES ('LAUNCHING', 15, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/8fd330b5f5dbccbcbf4f5731e5e9e29b.jpg',
        'top', 15, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/H26C7/2ad963a9f63d371826748c852a0025c3.jpg',
        'thumb', 15, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/H26C7/f945d8ac1dccc3f931bcaf35de5de582.jpg',
        'thumb', 15, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/H26C7/bacb0b8186371bfafbd92dbeec718e13.jpg',
        'thumb', 15, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/H26C7/3d67aabd2751620367e1d1ac3e3d7ef2.jpg',
        'detail', 15, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/H26C7/855b42b4e80162e6930f06aa80bd1272.jpg',
        'detail', 15, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/H26C7/1966de56cf138639d5d50d4bf2db8e72.jpg',
        'detail', 15, 2);

INSERT INTO `dish` (`hash`, `title`, `description`, `price`, `category_id`, `category_key`)
VALUES ('H9F0B', '빅마마의밥친구] 갈치포무침 150g', '쉽게 접할수 없는 꼬순내가득 갈치포 무침', 7000, 3, 4);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('EARLY_MORNING', 16, 0);
INSERT INTO `delivery` (`type`, `dish_id`, `dish_key`)
VALUES ('NATIONAL', 16, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/d0b5d2be962947d9534e2140d1b34b2d.jpg',
        'top', 16, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/d0b5d2be962947d9534e2140d1b34b2d.jpg',
        'thumb', 16, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/H602F/edc6bae2e2663f05b4e8eb5a2b95d68f.jpg',
        'thumb', 16, 1);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/H602F/c935f5913dc66b11ebceeef85485c438.jpg',
        'thumb', 16, 2);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/H602F/670e7deefe1d84a4f4e058655fbd4d7c.jpg',
        'detail', 16, 0);
INSERT INTO `image` (`url`, `type`, `dish_id`, `dish_key`)
VALUES ('http://public.codesquad.kr/jk/storeapp/data/detail/H602F/1898cda038e92454395b8ffca8cd4393.jpg',
        'detail', 16, 1);
