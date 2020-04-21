package com.codesquad.sidedish08.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table
public class Dish {

  @Id
  @JsonIgnore
  private Long id;

  @Column(value = "detail_hash")
  private String hash;

  private String title;

  private String description;

  private int price;

  public Long getId() {
    return id;
  }

  public String getHash() {
    return hash;
  }

  public String getTitle() {
    return title;
  }

  public String getDescription() {
    return description;
  }

  public int getPrice() {
    return price;
  }
}
