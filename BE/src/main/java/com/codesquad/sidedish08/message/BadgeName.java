package com.codesquad.sidedish08.message;

public enum BadgeName {

  EVENT("이벤트특가"),
  LAUNCHING("론칭특가");

  private String name;

  private BadgeName(String name) {
    this.name = name;
  }

  public String getName() {
    return this.name;
  }

}
