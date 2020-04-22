package com.codesquad.sidedish08.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.ArrayList;
import java.util.List;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.MappedCollection;
import org.springframework.data.relational.core.mapping.Table;

@Table
public class Dish {

  @Id
  @JsonIgnore
  private Long id;

  private String hash;

  private String image;

  @MappedCollection(idColumn = "dish_id", keyColumn = "dish_key")
  private List<Delivery> deliveries = new ArrayList<>();

  private String title;

  private String description;

  private int price;

  @MappedCollection(idColumn = "dish_id", keyColumn = "dish_key")
  private List<Badge> badges = new ArrayList<>();


  public Long getId() {
    return id;
  }

  public String getHash() {
    return hash;
  }

  public String getImage() {
    return image;
  }

  public List<Delivery> getDeliveries() {
    return deliveries;
  }

  public String getTitle() {
    return title;
  }

  public String getDescription() {
    return description;
  }

  public int getPrice() {
    return price;
  }

  public List<Badge> getBadges() {
    return badges;
  }
}
