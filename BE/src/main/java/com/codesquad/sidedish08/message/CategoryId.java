package com.codesquad.sidedish08.message;

public enum CategoryId {
  MAIN(1L),
  SOUP(2L),
  SIDE(3L);

  private long id;

  CategoryId(long id) {
    this.id = id;
  }

  public long getId() {
    return id;
  }
}
