package com.codesquad.sidedish08.service;

import com.codesquad.sidedish08.dao.DishRepository;
import com.codesquad.sidedish08.model.Dish;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class DetailService {

  private final DishRepository dishRepository;

  public DetailService(
      DishRepository dishRepository) {
    this.dishRepository = dishRepository;
  }

  public List<Dish> detail(String hash) {
    return dishRepository.findByHash(hash);
  }
}
