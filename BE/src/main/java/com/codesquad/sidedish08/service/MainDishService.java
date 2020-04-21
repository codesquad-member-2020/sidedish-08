package com.codesquad.sidedish08.service;

import static com.codesquad.sidedish08.util.ResponseUtils.getResultMap;

import com.codesquad.sidedish08.repository.CategoryRepository;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public class MainDishService implements BasicService {

  private final CategoryRepository categoryRepository;

  public MainDishService(CategoryRepository categoryRepository) {
    this.categoryRepository = categoryRepository;
  }

  public Map<String, ?> dish() {
    return getResultMap("dish", categoryRepository.findById(1L));
  }

  public Map<String, ?> detail(String detailHash) {
    return getResultMap("dish", null);
  }
}
