package com.codesquad.sidedish08.model.dto;

import com.codesquad.sidedish08.model.Badge;
import com.codesquad.sidedish08.model.Dish;
import com.codesquad.sidedish08.model.Image;
import com.codesquad.sidedish08.util.DishUtils;
import java.util.List;
import java.util.stream.Collectors;

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
  private List<String> badges;

  private Detail(Dish dish) {
    this.hash = dish.getHash();
    this.normalPrice = dish.getPrice();
    this.description = dish.getDescription();
    this.deliveryInfo = DishUtils.getDeliveryInfo(dish.getDeliveries());
    this.deliveryFee = DishUtils.getDeliveryFee(dish.getDeliveries());
    this.salePrice = DishUtils
        .getSalePrice(this.normalPrice, DishUtils.getDiscountPrice(dish.getBadges()));
    this.point = DishUtils.getPoint(this.salePrice, 100L);
    this.topImage = getTopImageUrl(dish);
    this.thumbImages = getThumbImageUrls(dish);
    this.badges = getBadgesString(dish);
  }

  public static Detail getDetailDto(Dish dish) {
    return new Detail(dish);
  }

  private String getTopImageUrl(Dish dish) {
    return dish.getImages().get(0).getUrl();
  }

  private List<String> getThumbImageUrls(Dish dish) {
    return dish.getImages().stream()
        .filter(image -> image.getType().equals("thumb"))
        .map(Image::getUrl)
        .collect(Collectors.toList());
  }

  private List<String> getBadgesString(Dish dish) {
    return dish.getBadges().stream()
        .map(Badge::getType)
//        .map(badge -> valueOf(badge.getType()).getName())
        .collect(Collectors.toList());
  }

  public String getHash() {
    return hash;
  }

  public Integer getNormalPrice() {
    return normalPrice;
  }

  public Integer getSalePrice() {
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

  public List<String> getBadges() {
    return badges;
  }
}
