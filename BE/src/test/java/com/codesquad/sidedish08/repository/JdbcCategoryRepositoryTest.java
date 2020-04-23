package com.codesquad.sidedish08.repository;

import static org.assertj.core.api.Assertions.assertThat;

import com.codesquad.sidedish08.model.Badge;
import com.codesquad.sidedish08.model.Delivery;
import com.codesquad.sidedish08.model.dto.Main;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class JdbcCategoryRepositoryTest {

  private final Logger logger = LoggerFactory.getLogger(JdbcCategoryRepository.class);

  @Autowired
  JdbcCategoryRepository jdbcCategoryRepository;

  @Test
  void findByHash() {
    String hash = "HBDEF";
    Main main = jdbcCategoryRepository.findByHash(hash);
    assertThat(main).isNotNull();
    logger.debug("Main : {}", main);
  }

  @Test
  void findDeliveryByDishId() {
    Long id = 1L;
    List<Delivery> deliveryList = jdbcCategoryRepository.findDeliveryByDishId(id);
    assertThat(deliveryList.size()).isEqualTo(2);
    logger.debug("Delivery : {}", deliveryList);
  }

  @Test
  void findBadgeByDishId() {
    Long id = 1L;
    List<Badge> badges = jdbcCategoryRepository.findBadgeByDishId(id);
    assertThat(badges.size()).isEqualTo(2);
    logger.debug("badges : {}", badges);
  }
}
