package com.codesquad.sidedish08.repository;

import com.codesquad.sidedish08.message.ErrorMessages;
import com.codesquad.sidedish08.model.Badge;
import com.codesquad.sidedish08.model.Delivery;
import com.codesquad.sidedish08.model.Dish;
import com.codesquad.sidedish08.model.dto.Main;
import com.codesquad.sidedish08.model.dto.Main.Builder;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class JdbcCategoryRepository {

  private final Logger logger = LoggerFactory.getLogger(JdbcCategoryRepository.class);

  private final JdbcTemplate jdbcTemplate;
  private final CategoryRepository categoryRepository;

  public JdbcCategoryRepository(JdbcTemplate jdbcTemplate,
      CategoryRepository categoryRepository) {
    this.jdbcTemplate = jdbcTemplate;
    this.categoryRepository = categoryRepository;
  }

  private List<Main> getMains(List<Dish> dishes) {
    return dishes.stream().map(dish -> new Builder()
        .hash(dish.getHash())
        .image(dish.getImages().get(0).getUrl())
        .alt(dish.getTitle())
        .deliveryType(dish.getDeliveries())
        .title(dish.getTitle())
        .description(dish.getDescription())
        .normalPrice(dish.getPrice())
        .salePrice(dish.getPrice(), dish.getBadges())
        .badge(dish.getBadges())
        .build()).collect(Collectors.toList());
  }

  public List<Main> findById(Long id) {
    List<Dish> dishes = categoryRepository.findById(id)
        .orElseThrow(NoSuchElementException::new)
        .getDishes();
    return getMains(dishes);
  }

  public List<Main> findBestDishByCategoryId(Long categoryId) {
    List<Dish> dishes = categoryRepository.findBestDishByCategoryId(categoryId);
    return getMains(dishes);
  }


  public Main findByHash(Long categoryId, String hash) {
    Main main;

    try {
      main = jdbcTemplate.queryForObject(
          "SELECT d.id, d.hash, g.url, d.title, d.description, d.price "
              + "FROM DISH d "
              + "LEFT JOIN IMAGE g ON d.id = g.dish_id "
              + "WHERE g.type = 'top' AND d.category_id=? AND d.hash =?",
          new Object[]{categoryId, hash}, mainMapper);
    } catch (EmptyResultDataAccessException e) {
      throw new NoSuchElementException(ErrorMessages.NO_SUCH_ELEMENT_EXCEPTION);
    }

    Long dishId = Optional.ofNullable(main)
        .orElseThrow(NoSuchElementException::new)
        .getId();

    List<Delivery> deliveries = findDeliveryByDishId(dishId);
    List<Badge> badges = findBadgeByDishId(dishId);

    return new Main.Builder(main)
        .deliveryType(deliveries)
        .salePrice(main.getNormalPrice(), badges)
        .badge(badges)
        .build();
  }

  public List<Delivery> findDeliveryByDishId(Long id) {
    return jdbcTemplate.query(
        "SELECT d.id, d.type "
            + "FROM DELIVERY d "
            + "WHERE d.dish_id =?",
        new Object[]{id}, deliveryMapper);
  }

  public List<Badge> findBadgeByDishId(Long id) {
    return jdbcTemplate.query(
        "SELECT b.id, b.type "
            + "FROM BADGE b "
            + "WHERE b.dish_id =?",
        new Object[]{id}, badgeMapper);
  }

  static RowMapper<Main> mainMapper = (rs, rowNum) -> new Main.Builder()
      .id(rs.getLong("id"))
      .hash(rs.getString("hash"))
      .image(rs.getString("url"))
      .alt(rs.getString("title"))
      .title(rs.getString("title"))
      .description(rs.getString("description"))
      .normalPrice(rs.getInt("price"))
      .build();

  static RowMapper<Delivery> deliveryMapper = (rs, rowNum) ->
      Delivery.of(
          rs.getLong("id"),
          rs.getString("type"));

  static RowMapper<Badge> badgeMapper = (rs, rowNum) ->
      Badge.of(
          rs.getLong("id"),
          rs.getString("type"));
}
