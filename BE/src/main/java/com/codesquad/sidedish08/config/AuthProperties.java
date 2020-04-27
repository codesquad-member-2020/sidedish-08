package com.codesquad.sidedish08.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
public class AuthProperties {

  @Value("${auth.client-id}")
  private String clientId;
  @Value("${auth.client-secret}")
  private String clientSecret;

  public String getClientId() {
    return clientId;
  }

  public String getClientSecret() {
    return clientSecret;
  }
}
