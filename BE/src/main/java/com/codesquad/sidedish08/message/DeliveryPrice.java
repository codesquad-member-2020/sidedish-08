package com.codesquad.sidedish08.message;

public enum DeliveryPrice {

  BASE("기본가", 2000),
  EARLY_MORNING("새벽배송", 300),
  NATIONAL("전국택배", 500);

  private int value;
  private String name;

  private DeliveryPrice(String name, int value) {
    this.name = name;
    this.value = value;
  }

  public String getName() {
    return this.name;
  }

  public int getValue() {
    return this.value;
  }
}
