package com.codesquad.sidedish08.util;


import com.codesquad.sidedish08.message.AuthMessages;
import com.codesquad.sidedish08.message.ErrorMessages;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Map;

public class TokenUtil {

  public static final Long EXPIRED_TIME = 1000L * 60L * 30L;

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

      return jwt.signWith(SignatureAlgorithm.HS256, generateKey())
          .compact();
    } catch (Exception e) {
      throw new RuntimeException(ErrorMessages.FAILED_MAKE_JWT);
    }
  }

  public static boolean verify(String token) {
    try {
      Jws<Claims> claims = Jwts.parser()
          .setSigningKey(generateKey())
          .parseClaimsJws(token);
      return true;
    } catch (Exception e) {
      return false;
    }
  }

  public static String getUserId(String token) {
    try {
      return Jwts.parser()
          .setSigningKey(generateKey())
          .parseClaimsJws(token)
          .getBody().get("userId")
          .toString();
    } catch (Exception e) {
      //      throw new UnauthorizedException();
      return "anonymous";
    }
  }

  private static byte[] generateKey() {
    return AuthMessages.SALT.getBytes(StandardCharsets.UTF_8);
  }
}
