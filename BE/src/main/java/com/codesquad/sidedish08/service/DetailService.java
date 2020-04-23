package com.codesquad.sidedish08.service;

import static com.codesquad.sidedish08.model.dto.DetailDTO.getDetailDto;

import com.codesquad.sidedish08.repository.DishRepository;
import com.codesquad.sidedish08.model.dto.DetailDTO;
import java.util.NoSuchElementException;
import org.springframework.stereotype.Service;

@Service
public class DetailService {

  private final DishRepository dishRepository;

  public DetailService(
      DishRepository dishRepository) {
    this.dishRepository = dishRepository;
  }

  public DetailDTO detail(String hash) {
    return getDetailDto(dishRepository.findByHash(hash).orElseThrow(NoSuchElementException::new));
  }
}
