package com.codesquad.sidedish08.repository;

import com.codesquad.sidedish08.model.Dish;
import java.util.Optional;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

public interface DishRepository extends CrudRepository<Dish, Long> {

  @Query("SELECT d.id, d.hash, d.title, d.description, d.price, d.category_id, d.category_id "
      + "FROM dish d "
      + "WHERE d.hash = :hash")
  Optional<Dish> findByHash(String hash);
}
