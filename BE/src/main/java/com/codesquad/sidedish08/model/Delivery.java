package com.codesquad.sidedish08.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table
public class Delivery {

  @Id
  @JsonIgnore
  private Long id;

  private String type;

  public Long getId() {
    return id;
  }

  public String getType() {
    return type;
  }
}
