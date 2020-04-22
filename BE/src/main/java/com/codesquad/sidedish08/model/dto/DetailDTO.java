package com.codesquad.sidedish08.model.dto;

import com.codesquad.sidedish08.model.Dish;
import com.codesquad.sidedish08.model.Image;
import java.util.ArrayList;
import java.util.List;

public class DetailDTO {

  private String hash;
  private String topImage;
  private List<String> thumbImages;
  private int nPrice;
  private int sPrice;
  private String description;
  private Long point;
  private String deliveryInfo;
  private String deliveryFee;

  private DetailDTO(Dish dish) {
    this.hash = dish.getHash();
    this.nPrice = dish.getPrice();
    this.description = dish.getDescription();
    this.point = this.nPrice / 100L;
    this.deliveryInfo = "서울 경기 새벽배송 / 전국택배 (제주 및 도서산간 불가) [월 · 화 · 수 · 목 · 금 · 토] 수령 가능한 상품입니다.";
    this.deliveryFee = "2,500원 (40,000원 이상 구매 시 무료)";
    this.sPrice = this.nPrice;

    List<Image> imageList = dish.getImages();

    this.topImage = imageList.get(0).getUrl();
    imageList.remove(0);

    thumbImages = new ArrayList<>();

    for (Image image : imageList) {
      thumbImages.add(image.getUrl());
    }
  }

  public static DetailDTO getDetailDto(Dish dish) {
    return new DetailDTO(dish);
  }

  public String getHash() {
    return hash;
  }

  public int getnPrice() {
    return nPrice;
  }

  public int getsPrice() {
    return sPrice;
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

  public String getTopImage() {
    return topImage;
  }

  public List<String> getThumbImages() {
    return thumbImages;
  }
}
