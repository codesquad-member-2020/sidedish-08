package com.codesquad.sidedish08.model.dto;

import static com.codesquad.sidedish08.message.BadgePrice.valueOf;
import static com.codesquad.sidedish08.util.DishUtils.calcDeliveryInfo;
import static com.codesquad.sidedish08.util.DishUtils.calcPoint;

import com.codesquad.sidedish08.model.Badge;
import com.codesquad.sidedish08.model.Dish;
import com.codesquad.sidedish08.model.Image;
import com.codesquad.sidedish08.util.DishUtils;
import java.util.List;
import java.util.stream.Collectors;

public class Detail {

  private final String hash;
  private final String topImage;
  private final List<String> thumbImages;
  private final List<String> detailImages;
  private final Integer normalPrice;
  private final Integer salePrice;
  private final String description;
  private final Long point;
  private final String deliveryInfo;
  private final String deliveryFee;
  private final List<String> badges;

  private Detail(Dish dish) {
    this.hash = dish.getHash();
    this.normalPrice = dish.getPrice();
    this.description = dish.getDescription();
    this.deliveryInfo = calcDeliveryInfo(dish.getDeliveries());
    this.deliveryFee = DishUtils.getDeliveryFee(dish.getDeliveries());
    this.salePrice = DishUtils.getSalePrice(this.normalPrice, dish.getBadges());
    this.point = calcPoint(this.salePrice, 100L);
    this.topImage = getTopImageUrl(dish);
    this.thumbImages = getThumbImageUrls(dish);
    this.detailImages = getDetailImageUrls(dish);
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

  private List<String> getDetailImageUrls(Dish dish) {
    return dish.getImages().stream()
        .filter(image -> image.getType().equals("detail"))
        .map(Image::getUrl)
        .collect(Collectors.toList());
  }

  private List<String> getBadgesString(Dish dish) {
    return dish.getBadges().stream()
        .map(Badge::getType)
        .map(badge -> valueOf(badge).getName())
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

  public List<String> getDetailImages() {
    return detailImages;
  }

  public List<String> getBadges() {
    return badges;
  }
}
