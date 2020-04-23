package com.codesquad.sidedish08.model;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MainResponse {

  private final String hash;
  private final String image;
  private final String alt;
  private final List<String> deliveryType;
  private final String title;
  private final String description;
  private final String normalPrice;
  private final String specialPrice;
  private final List<String> badge;

  private MainResponse(String hash, String image, String alt,
      List<String> deliveryType, String title, String description, String normalPrice,
      String specialPrice, List<String> badge) {
    this.hash = hash;
    this.image = image;
    this.alt = alt;
    this.deliveryType = deliveryType;
    this.title = title;
    this.description = description;
    this.normalPrice = normalPrice;
    this.specialPrice = specialPrice;
    this.badge = badge;
  }

  public String getHash() {
    return hash;
  }

  public String getImage() {
    return image;
  }

  public String getAlt() {
    return alt;
  }

  public List<String> getDeliveryType() {
    return deliveryType;
  }

  public String getTitle() {
    return title;
  }

  public String getDescription() {
    return description;
  }

  public String getNormalPrice() {
    return normalPrice;
  }

  public String getSpecialPrice() {
    return specialPrice;
  }

  public List<String> getBadge() {
    return badge;
  }

  @Override
  public String toString() {
    return new ToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE)
        .append("hash", hash)
        .append("image", image)
        .append("alt", alt)
        .append("deliveryType", deliveryType)
        .append("title", title)
        .append("description", description)
        .append("normalPrice", normalPrice)
        .append("specialPrice", specialPrice)
        .append("badge", badge)
        .toString();
  }

  public static class Builder {

    private String hash;
    private String image;
    private String alt;
    private List<String> deliveryType = new ArrayList<>();
    private String title;
    private String description;
    private String normalPrice;
    private String specialPrice;
    private List<String> badge = new ArrayList<>();

    public Builder() {
    }

    public Builder(MainResponse response) {
      this.hash = response.hash;
      this.image = response.image;
      this.alt = response.alt;
      this.deliveryType = response.deliveryType;
      this.title = response.title;
      this.description = response.description;
      this.normalPrice = response.normalPrice;
      this.specialPrice = response.specialPrice;
      this.badge = response.badge;
    }

    public Builder hash(String hash) {
      this.hash = hash;
      return this;
    }

    public Builder image(String image) {
      this.image = image;
      return this;
    }

    public Builder alt(String alt) {
      this.alt = alt;
      return this;
    }

    public Builder deliveryType(List<Delivery> deliveryType) {
      this.deliveryType = deliveryType.stream()
          .map(Delivery -> Delivery.getType())
          .collect(Collectors.toList());
      return this;
    }

    public Builder title(String title) {
      this.title = title;
      return this;
    }

    public Builder description(String description) {
      this.description = description;
      return this;
    }

    public Builder normalPrice(String normalPrice) {
      this.normalPrice = normalPrice;
      return this;
    }

    public Builder specialPrice(String specialPrice) {
      this.specialPrice = specialPrice;
      return this;
    }

    public Builder badge(List<Badge> badge) {
      this.badge = badge.stream()
          .map(badgeObject -> badgeObject.getType())
          .collect(Collectors.toList());
      return this;
    }

    public MainResponse build() {
      return new MainResponse(hash, image, alt, deliveryType, title, description, normalPrice,
          specialPrice, badge);
    }
  }
}
