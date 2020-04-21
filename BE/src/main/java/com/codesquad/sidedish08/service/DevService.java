package com.codesquad.sidedish08.service;

import static com.codesquad.sidedish08.util.ResponseUtils.getResultMap;

import com.codesquad.sidedish08.repository.CategoryRepository;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public class DevService {

  private final CategoryRepository categoryRepository;

  public DevService(
      CategoryRepository categoryRepository) {
    this.categoryRepository = categoryRepository;
  }

  public Map<String, ?> category() {
    return getResultMap("category", categoryRepository.findAll());
  }
}
