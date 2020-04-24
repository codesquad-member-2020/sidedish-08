package com.codesquad.sidedish08.message;

public enum BadgePrice {

  EVENT("이벤트특가", 700),
  LAUNCHING("론칭특가", 400);

  private String name;
  private int value;

  private BadgePrice(String name, int value) {
    this.value = value;
    this.name = name;
  }

  public String getName() {
    return this.name;
  }

  public int getValue() {
    return value;
  }
}
