package com.codesquad.sidedish08.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Email {

  private String email;

  private String primary;

  private String verified;

  private String visibility;

  public String getEmail() {
    return email;
  }

  public Email setEmail(String email) {
    this.email = email;
    return this;
  }

  public String isPrimary() {
    return primary;
  }

  public Email setPrimary(String primary) {
    this.primary = primary;
    return this;
  }

  public String isVerified() {
    return verified;
  }

  public Email setVerified(String verified) {
    this.verified = verified;
    return this;
  }

  public String isVisibility() {
    return visibility;
  }

  public Email setVisibility(String visibility) {
    this.visibility = visibility;
    return this;
  }

  @Override
  public String toString() {
    return new ToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE)
        .append("email", email)
        .append("primary", primary)
        .append("verified", verified)
        .append("visibility", visibility)
        .toString();
  }
}
