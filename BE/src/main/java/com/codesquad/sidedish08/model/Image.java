package com.codesquad.sidedish08.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.Id;

public class Image {

  @Id
  @JsonIgnore
  private Long id;

  private String url;

  private String type;

  public Long getId() {
    return id;
  }

  public String getUrl() {
    return url;
  }

  public String getType() {
    return type;
  }
}
