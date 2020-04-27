package com.codesquad.sidedish08.service;


import static com.codesquad.sidedish08.service.DishService.Category.MAIN;
import static com.codesquad.sidedish08.service.DishService.Category.SIDE;
import static com.codesquad.sidedish08.service.DishService.Category.SOUP;

import com.codesquad.sidedish08.model.dto.Main;
import com.codesquad.sidedish08.repository.CategoryRepository;
import com.codesquad.sidedish08.repository.JdbcCategoryRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class DishService {

  private final CategoryRepository categoryRepository;
  private final JdbcCategoryRepository jdbcCategoryRepository;

  public DishService(CategoryRepository categoryRepository,
      JdbcCategoryRepository jdbcCategoryRepository) {
    this.categoryRepository = categoryRepository;
    this.jdbcCategoryRepository = jdbcCategoryRepository;
  }

  public List<Main> mainDish() {
    return jdbcCategoryRepository.findById(MAIN.getId());
  }

  public List<Main> soupDish() {
    return jdbcCategoryRepository.findById(SOUP.getId());
  }

  public List<Main> sideDish() {
    return jdbcCategoryRepository.findById(SIDE.getId());
  }

  public Main mainDetail(String detailHash) {
    return jdbcCategoryRepository.findByHash(detailHash, MAIN.getId());
  }

  public Main soupDetail(String detailHash) {
    return jdbcCategoryRepository.findByHash(detailHash, SOUP.getId());
  }

  public Main sideDetail(String detailHash) {
    return jdbcCategoryRepository.findByHash(detailHash, SIDE.getId());
  }


  enum Category {
    MAIN(1L),
    SOUP(2L),
    SIDE(3L);

    private long id;

    Category(long id) {
      this.id = id;
    }

    public long getId() {
      return id;
    }
  }
}
