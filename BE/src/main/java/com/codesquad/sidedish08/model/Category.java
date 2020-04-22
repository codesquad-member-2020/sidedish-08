package com.codesquad.sidedish08.model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.ArrayList;
import java.util.List;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.MappedCollection;
import org.springframework.data.relational.core.mapping.Table;

@Table
public class Category {

  @Id
  @JsonIgnore
  private Long id;
  private String type;

  @MappedCollection(idColumn = "category_id", keyColumn = "category_key")
  private List<Dish> dishes = new ArrayList<>();

  public Long getId() {
    return id;
  }

  public String getType() {
    return type;
  }

  public List<Dish> getDishes() {
    return dishes;
  }
}
