package com.codesquad.sidedish08.service;

import static com.codesquad.sidedish08.model.dto.DetailDto.getDetailDto;

import com.codesquad.sidedish08.dao.DishRepository;
import com.codesquad.sidedish08.model.dto.DetailDto;
import java.util.NoSuchElementException;
import org.springframework.stereotype.Service;

@Service
public class DetailService {

  private final DishRepository dishRepository;

  public DetailService(
      DishRepository dishRepository) {
    this.dishRepository = dishRepository;
  }

  public DetailDto detail(String hash) {
    return getDetailDto(dishRepository.findByHash(hash).orElseThrow(NoSuchElementException::new));
  }
}
