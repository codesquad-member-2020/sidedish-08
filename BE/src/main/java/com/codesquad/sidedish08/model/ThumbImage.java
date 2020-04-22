package com.codesquad.sidedish08.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.Id;

public class ThumbImage {

  @Id
  @JsonIgnore
  private Long id;

  private String imageUrl;

  public Long getId() {
    return id;
  }

  public String getImageUrl() {
    return imageUrl;
  }
}
