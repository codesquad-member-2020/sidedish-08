package com.codesquad.sidedish08.service;

import static com.codesquad.sidedish08.util.ResponseUtils.getResultMap;

import com.codesquad.sidedish08.repository.CategoryRepository;
import com.codesquad.sidedish08.repository.JdbcCategoryRepository;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public class MainDishService implements BasicService {

  private final CategoryRepository categoryRepository;
  private final JdbcCategoryRepository jdbcCategoryRepository;

  public MainDishService(CategoryRepository categoryRepository,
      JdbcCategoryRepository jdbcCategoryRepository) {
    this.categoryRepository = categoryRepository;
    this.jdbcCategoryRepository = jdbcCategoryRepository;
  }


  public Map<String, ?> dish() {
//    return getResultMap("dish", categoryRepository.findById(1L));
    return getResultMap("body", jdbcCategoryRepository.findById());
  }

  public Map<String, ?> detail(String detailHash) {
    return getResultMap("dish", null);
  }
}
