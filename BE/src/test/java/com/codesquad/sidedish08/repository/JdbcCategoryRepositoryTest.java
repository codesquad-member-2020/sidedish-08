package com.codesquad.sidedish08.repository;

import static org.assertj.core.api.Assertions.assertThat;

import com.codesquad.sidedish08.model.dto.Main;
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
}
