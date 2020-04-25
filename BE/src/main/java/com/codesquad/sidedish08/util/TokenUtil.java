package com.codesquad.sidedish08.util;


import static com.codesquad.sidedish08.message.AuthMessages.EXPIRED_TIME;

import com.codesquad.sidedish08.message.AuthMessages;
import com.codesquad.sidedish08.message.ErrorMessages;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Map;

public class TokenUtil {

  public static String create(Map<String, String> claims) {
    try {
      JwtBuilder jwt = Jwts.builder()
          .setHeaderParam("typ", "JWT")
          .setIssuer("Dan")
          .setIssuedAt(new Date(System.currentTimeMillis()))
          .setExpiration(new Date(System.currentTimeMillis() + EXPIRED_TIME))
          .setSubject("loginToken");
      for (String key : claims.keySet()) {
        jwt.claim(key, claims.get(key));
      }

      return jwt.signWith(SignatureAlgorithm.HS256, generateKey()).compact();
    } catch (Exception e) {
      throw new RuntimeException(ErrorMessages.FAILED_MAKE_JWT);
    }
  }

  private static byte[] generateKey() {
    return AuthMessages.SALT.getBytes(StandardCharsets.UTF_8);
  }
}
