package com.codesquad.sidedish08.model.dto;

import com.codesquad.sidedish08.model.Dish;

public class DetailDto {

  private String hash;
  private int n_price;
  private int s_price;
  private String description;
  private Long point;
  private String deliveryInfo;
  private String deliveryFee;

  private DetailDto(Dish dish) {
    this.hash = dish.getHash();
    this.n_price = dish.getPrice();
    this.description = dish.getDescription();
    this.point = this.n_price / 100L;
    this.deliveryInfo = "서울 경기 새벽배송 / 전국택배 (제주 및 도서산간 불가) [월 · 화 · 수 · 목 · 금 · 토] 수령 가능한 상품입니다.";
    this.deliveryFee = "2,500원 (40,000원 이상 구매 시 무료)";
    this.s_price = this.n_price;
  }

  public static DetailDto getDetailDto(Dish dish) {
    return new DetailDto(dish);
  }

  public String getHash() {
    return hash;
  }

  public int getN_price() {
    return n_price;
  }

  public int getS_price() {
    return s_price;
  }

  public String getDescription() {
    return description;
  }

  public Long getPoint() {
    return point;
  }

  public String getDeliveryInfo() {
    return deliveryInfo;
  }

  public String getDeliveryFee() {
    return deliveryFee;
  }
}
