package com.codesquad.sidedish08.dao;


import com.codesquad.sidedish08.model.Category;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

public interface CategoryRepository extends CrudRepository<Category, Long> {

  List<Category> findAll();
}
