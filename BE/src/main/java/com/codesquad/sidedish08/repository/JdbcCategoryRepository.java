package com.codesquad.sidedish08.repository;

import com.codesquad.sidedish08.model.Badge;
import com.codesquad.sidedish08.model.Delivery;
import com.codesquad.sidedish08.model.Dish;
import com.codesquad.sidedish08.model.dto.Main;
import com.codesquad.sidedish08.model.dto.Main.Builder;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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

  public Main findByHash(String hash) {
    Main main = jdbcTemplate.queryForObject(
        "SELECT d.id, d.hash, g.url, d.title, d.description, d.price "
            + "FROM DISH d "
            + "LEFT JOIN IMAGE g ON d.id = g.dish_id "
            + "WHERE g.type = 'top' AND d.hash =?",
        new Object[]{hash}, mapper);
    return main;
  }

  private List<Delivery> findDeliveryByDishId(Long id) {
    return null;
  }

  private List<Badge> findBadgeByDishId(Long id) {
    return null;
  }

  static RowMapper<Main> mapper = (rs, rowNum) -> new Main.Builder()
      .id(rs.getLong("id"))
      .hash(rs.getString("hash"))
      .image(rs.getString("url"))
      .alt(rs.getString("title"))
      .title(rs.getString("title"))
      .description(rs.getString("description"))
      .normalPrice(rs.getInt("price"))
      .build();
}
