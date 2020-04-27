package com.codesquad.sidedish08.message;

public enum CategoryId {
  MAIN(1L),
  SOUP(2L),
  SIDE(3L);

  private Long id;

  CategoryId(Long id) {
    this.id = id;
  }

  public Long getId() {
    return id;
  }
}
