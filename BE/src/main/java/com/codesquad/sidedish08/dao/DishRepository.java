package com.codesquad.sidedish08.dao;

import com.codesquad.sidedish08.model.Dish;
import java.util.List;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

public interface DishRepository extends CrudRepository<Dish, Long> {

  @Query("SELECT d.id, d.hash, d.title, d.description, d.price, d.category_id, d.category_id "
      + "FROM dish d "
      + "WHERE d.hash = :hash")
  List<Dish> findByHash(String hash);
}
