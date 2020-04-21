package com.codesquad.sidedish08.repository;


import com.codesquad.sidedish08.bean.Category;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

public interface CategoryRepository extends CrudRepository<Category, Long> {

  List<Category> findAll();
}
