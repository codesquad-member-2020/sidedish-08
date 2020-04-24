package com.codesquad.sidedish08.model.dto;

import com.codesquad.sidedish08.message.BadgeName;
import com.codesquad.sidedish08.message.DeliveryPrice;
import com.codesquad.sidedish08.model.Badge;
import com.codesquad.sidedish08.model.Delivery;
import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Main {

  @JsonIgnore
  private final Long id;
  private final String hash;
  private final String image;
  private final String alt;
  private final List<String> deliveryType;
  private final String title;
  private final String description;
  private final Integer normalPrice;
  private final Integer salePrice;
  private final List<String> badge;

  private Main(Long id, String hash, String image, String alt,
      List<String> deliveryType, String title, String description, Integer normalPrice,
      Integer salePrice, List<String> badge) {
    this.id = id;
    this.hash = hash;
    this.image = image;
    this.alt = alt;
    this.deliveryType = deliveryType;
    this.title = title;
    this.description = description;
    this.normalPrice = normalPrice;
    this.salePrice = salePrice;
    this.badge = badge;
  }

  public Long getId() {
    return id;
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

  public Integer getNormalPrice() {
    return normalPrice;
  }

  public Integer getSalePrice() {
    return salePrice;
  }

  public List<String> getBadge() {
    return badge;
  }

  @Override
  public String toString() {
    return new ToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE)
        .append("id", id)
        .append("hash", hash)
        .append("image", image)
        .append("alt", alt)
        .append("deliveryType", deliveryType)
        .append("title", title)
        .append("description", description)
        .append("normalPrice", normalPrice)
        .append("specialPrice", salePrice)
        .append("badge", badge)
        .toString();
  }

  public static class Builder {

    private Long id;
    private String hash;
    private String image;
    private String alt;
    private List<String> deliveryType = new ArrayList<>();
    private String title;
    private String description;
    private Integer normalPrice;
    private Integer specialPrice;
    private List<String> badge = new ArrayList<>();

    public Builder() {
    }

    public Builder(Main response) {
      this.id = response.id;
      this.hash = response.hash;
      this.image = response.image;
      this.alt = response.alt;
      this.deliveryType = response.deliveryType;
      this.title = response.title;
      this.description = response.description;
      this.normalPrice = response.normalPrice;
      this.specialPrice = response.salePrice;
      this.badge = response.badge;
    }

    public Builder id(Long id) {
      this.id = id;
      return this;
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
          .map(Delivery -> DeliveryPrice.valueOf(Delivery.getType()).getName())
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

    public Builder normalPrice(int normalPrice) {
      this.normalPrice = Integer.valueOf(normalPrice);
      return this;
    }

    public Builder specialPrice(int specialPrice) {
      this.specialPrice = Integer.valueOf(specialPrice);
      return this;
    }

    public Builder badge(List<Badge> badges) {
      this.badge = badges.stream()
          .map(badge -> BadgeName.valueOf(badge.getType()).getName())
          .collect(Collectors.toList());
      return this;
    }

    public Main build() {
      return new Main(id, hash, image, alt, deliveryType, title, description, normalPrice,
          specialPrice, badge);
    }
  }
}
