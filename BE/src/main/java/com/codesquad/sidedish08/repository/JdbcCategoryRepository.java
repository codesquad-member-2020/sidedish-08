package com.codesquad.sidedish08.repository;

import com.codesquad.sidedish08.model.Dish;
import com.codesquad.sidedish08.model.dto.Main;
import com.codesquad.sidedish08.model.dto.Main.Builder;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JdbcCategoryRepository {

  private final JdbcTemplate jdbcTemplate;
  private final CategoryRepository categoryRepository;

  public JdbcCategoryRepository(JdbcTemplate jdbcTemplate,
      CategoryRepository categoryRepository) {
    this.jdbcTemplate = jdbcTemplate;
    this.categoryRepository = categoryRepository;
  }

  public List<Main> findById(Long id) {
    List<Dish> dishes = categoryRepository.findById(id).get().getDishes();
    List<Main> main = dishes.stream().map(dish -> new Builder()
        .hash(dish.getHash())
        .image(dish.getImages().get(0).getUrl())
        .alt(dish.getTitle())
        .deliveryType(dish.getDeliveries())
        .title(dish.getTitle())
        .description(dish.getDescription())
        .normalPrice(dish.getPrice())
        .specialPrice(dish.getPrice())
        .badge(dish.getBadges())
        .build()).collect(Collectors.toList());
    return main;
  }
}
