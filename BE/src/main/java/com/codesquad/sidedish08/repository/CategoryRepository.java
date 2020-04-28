package com.codesquad.sidedish08.repository;


import com.codesquad.sidedish08.model.Category;
import com.codesquad.sidedish08.model.Dish;
import java.util.List;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

public interface CategoryRepository extends CrudRepository<Category, Long> {

  List<Category> findAll();
  
  @Query("SELECT d.id, d.hash, g.url, d.title, d.description, d.price "
      + "FROM DISH d "
      + "LEFT JOIN IMAGE g ON d.id = g.dish_id "
      + "WHERE g.type = 'top' AND d.category_id=:id "
      + "ORDER BY RAND() LIMIT 3")
  List<Dish> findBestDishByCategoryId(Long id);
}
