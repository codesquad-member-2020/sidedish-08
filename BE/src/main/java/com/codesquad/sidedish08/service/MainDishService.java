package com.codesquad.sidedish08.service;


import com.codesquad.sidedish08.model.dto.Main;
import com.codesquad.sidedish08.repository.CategoryRepository;
import com.codesquad.sidedish08.repository.JdbcCategoryRepository;
import java.util.List;
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

  public Main detail(String detailHash) {
    return jdbcCategoryRepository.findByHash(detailHash);
  }
}
