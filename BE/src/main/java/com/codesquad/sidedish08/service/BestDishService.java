package com.codesquad.sidedish08.service;

import com.codesquad.sidedish08.message.CategoryId;
import com.codesquad.sidedish08.message.ErrorMessages;
import com.codesquad.sidedish08.model.dto.Main;
import com.codesquad.sidedish08.repository.JdbcCategoryRepository;
import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class BestDishService {

  private static final Logger logger = LoggerFactory.getLogger(DishService.class);
  private final JdbcCategoryRepository jdbcCategoryRepository;

  public BestDishService(JdbcCategoryRepository jdbcCategoryRepository) {
    this.jdbcCategoryRepository = jdbcCategoryRepository;
  }

  public List<Main> dish(Long categoryId) {
    if (Arrays.stream(CategoryId.values()).noneMatch(category -> category.getId() == categoryId)) {
      throw new NoSuchElementException(ErrorMessages.NO_SUCH_CATEGORY_ID);
    }
    return jdbcCategoryRepository.findBestDishByCategoryId(categoryId);
  }
}
