package com.codesquad.sidedish08.bean;


import java.io.Serializable;
import org.springframework.data.annotation.Id;

public class Category implements Serializable {

  @Id
  private Long id;
  private String type;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }
}
