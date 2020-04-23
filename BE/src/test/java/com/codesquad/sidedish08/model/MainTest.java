package com.codesquad.sidedish08.model;

import com.codesquad.sidedish08.model.dto.Main;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MainTest {

  private final Logger logger = LoggerFactory.getLogger(MainTest.class);

  @Test
  void 메인_응답_생성테스트() {
    Main main = new Main.Builder()
        .hash("HBDEF")
        .image(
            "\"https://public.codesquad.kr/jk/storeapp/data/2d3f99a9a35601f4e98837bc4d39b2c8.jpg\"")
        .alt("[미노리키친] 규동 250g")
//        .deliveryType("새벽배송")
//        .deliveryType("전국택배")
        .title("[미노리키친] 규동 250g")
        .description("일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥")
        .normalPrice("6500")
        .specialPrice("7000")
//        .badge("이벤트특가")
        .build();

    logger.debug("Main : {}", main);
  }

}
