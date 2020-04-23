package com.codesquad.sidedish08.model.dto;

import com.codesquad.sidedish08.model.Dish;
import com.codesquad.sidedish08.model.Image;
import com.codesquad.sidedish08.util.DishUtils;
import java.util.ArrayList;
import java.util.List;

public class Detail {

  private String hash;
  private String topImage;
  private List<String> thumbImages;
  private Integer normalPrice;
  private Integer salePrice;
  private String description;
  private Long point;
  private String deliveryInfo;
  private String deliveryFee;

  private Detail(Dish dish) {
    this.hash = dish.getHash();
    this.normalPrice = dish.getPrice();
    this.description = dish.getDescription();
    this.deliveryInfo = DishUtils.getDeliveryInfo(dish.getDeliveries());
    this.deliveryFee = DishUtils.getDeliveryFee(dish.getDeliveries());
    this.salePrice = this.normalPrice + DishUtils.getDiscountPrice(dish.getBadges());
    this.point = this.salePrice / 100L;

    List<Image> imageList = dish.getImages();

    this.topImage = imageList.get(0).getUrl();
    imageList.remove(0);

    thumbImages = new ArrayList<>();

    for (Image image : imageList) {
      thumbImages.add(image.getUrl());
    }
  }

  public static Detail getDetailDto(Dish dish) {
    return new Detail(dish);
  }

  public String getHash() {
    return hash;
  }

  public int getNormalPrice() {
    return normalPrice;
  }

  public int getSalePrice() {
    return salePrice;
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
