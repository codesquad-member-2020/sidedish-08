package com.codesquad.sidedish08.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
public class JwtProperties {

  @Value("${jwt.salt}")
  private String salt;

  public String getSalt() {
    return salt;
  }
}
