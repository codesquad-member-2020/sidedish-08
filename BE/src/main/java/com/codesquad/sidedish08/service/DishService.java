package com.codesquad.sidedish08.service;


import com.codesquad.sidedish08.model.dto.Main;
import com.codesquad.sidedish08.repository.JdbcCategoryRepository;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class DishService {

  private static final Logger logger = LoggerFactory.getLogger(DishService.class);
  private final JdbcCategoryRepository jdbcCategoryRepository;

  public DishService(JdbcCategoryRepository jdbcCategoryRepository) {
    this.jdbcCategoryRepository = jdbcCategoryRepository;
  }

  public List<Main> dish(Long categoryId) {
    return jdbcCategoryRepository.findById(categoryId);
  }

  public Main detail(Long categoryId, String hash) {
    return jdbcCategoryRepository.findByHash(categoryId, hash);
  }
}
