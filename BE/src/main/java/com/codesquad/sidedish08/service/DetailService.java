package com.codesquad.sidedish08.service;


import com.codesquad.sidedish08.model.Dish;
import com.codesquad.sidedish08.model.dto.Detail;
import com.codesquad.sidedish08.repository.DishRepository;
import java.util.NoSuchElementException;
import org.springframework.stereotype.Service;

@Service
public class DetailService {

  private final DishRepository dishRepository;

  public DetailService(DishRepository dishRepository) {
    this.dishRepository = dishRepository;
  }

  public Detail detail(String hash) {
    Dish dish = dishRepository.findByHash(hash).orElseThrow(NoSuchElementException::new);
    return Detail.of(dish);
  }
}
