package com.codesquad.sidedish08.service;


import static com.codesquad.sidedish08.util.ResponseUtils.getResultMap;

import com.codesquad.sidedish08.model.dto.Main;
import com.codesquad.sidedish08.repository.CategoryRepository;
import com.codesquad.sidedish08.repository.JdbcCategoryRepository;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public class MainDishService {

  private final CategoryRepository categoryRepository;
  private final JdbcCategoryRepository jdbcCategoryRepository;

  public MainDishService(CategoryRepository categoryRepository,
      JdbcCategoryRepository jdbcCategoryRepository) {
    this.categoryRepository = categoryRepository;
    this.jdbcCategoryRepository = jdbcCategoryRepository;
  }

  public List<Main> dish() {
    return jdbcCategoryRepository.findById(1L);
  }

  public Map<String, Object> detail(String detailHash) {
    return getResultMap("dish", null);
  }
}
