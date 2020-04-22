package com.codesquad.sidedish08.service;

import com.codesquad.sidedish08.model.Category;
import com.codesquad.sidedish08.repository.CategoryRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class DevService {

  private final CategoryRepository categoryRepository;

  public DevService(
      CategoryRepository categoryRepository) {
    this.categoryRepository = categoryRepository;
  }

  public List<Category> category() {
    return categoryRepository.findAll();
  }
}
