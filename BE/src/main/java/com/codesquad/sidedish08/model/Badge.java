package com.codesquad.sidedish08.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table
public class Badge {

  @Id
  @JsonIgnore
  private Long id;

  private String type;

  private Badge(Long id, String type) {
    this.id = id;
    this.type = type;
  }

  public static Badge of(Long id, String type) {
    return new Badge(id, type);
  }

  public Long getId() {
    return id;
  }

  public String getType() {
    return type;
  }

  @Override
  public String toString() {
    return new ToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE)
        .append("id", id)
        .append("type", type)
        .toString();
  }
}
