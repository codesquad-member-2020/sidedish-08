package com.codesquad.sidedish08.service;

import static com.codesquad.sidedish08.message.AuthMessages.ACCESS_TOKEN_URL;
import static com.codesquad.sidedish08.message.AuthMessages.AUTHORIZE_URL;
import static com.codesquad.sidedish08.message.AuthMessages.CLIENT_ID;
import static com.codesquad.sidedish08.message.AuthMessages.CLIENT_SECRET;
import static com.codesquad.sidedish08.message.AuthMessages.USER_EMAIL;

import com.codesquad.sidedish08.util.TokenUtil;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class AuthService {

  private static final Logger log = LoggerFactory.getLogger(AuthService.class);

  public ResponseEntity<String> login() {
    RestTemplate restTemplate = new RestTemplate();

    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(
        new MediaType("application", "json", StandardCharsets.UTF_8));

    UriComponents builder = UriComponentsBuilder
        .fromHttpUrl(AUTHORIZE_URL)
        .queryParam("client_id", CLIENT_ID)
        .queryParam("scope", "user")
        .build(false);

    return restTemplate.exchange(
        builder.toUriString(), HttpMethod.GET, new HttpEntity<String>(headers), String.class);
  }

  public String callback(String code) {
    MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
    Map<String, String> header = new HashMap<>();
    header.put("Accept", "application/json");
    headers.setAll(header);

    MultiValueMap<String, String> requestPayloads = new LinkedMultiValueMap<>();
    Map<String, String> requestPayload = new HashMap<>();
    requestPayload.put("client_id", CLIENT_ID);
    requestPayload.put("client_secret", CLIENT_SECRET);
    requestPayload.put("code", code);
    requestPayloads.setAll(requestPayload);

    HttpEntity<?> request = new HttpEntity<>(requestPayloads, headers);
    ResponseEntity<?> response = new RestTemplate()
        .postForEntity(ACCESS_TOKEN_URL, request, HashMap.class);

    Map<String, String> map = (Map<String, String>) response.getBody();
    String accessToken = map.get("access_token");

    Map<String, String> claims = new HashMap<>();
//    claims.put("email", getEmails(accessToken));

    log.debug("##### email : {}", getEmails(accessToken));

    List<LinkedHashMap<String, String>> emails = getEmails(accessToken);

    String token = TokenUtil.create(emails.get(0));
    return token;
  }

  private List<LinkedHashMap<String, String>> getEmails(String accessToken) {
    RestTemplate restTemplate = new RestTemplate();

    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(
        new MediaType("application", "json", StandardCharsets.UTF_8));
    headers.add("Authorization", "bearer " + accessToken);

    UriComponents builder = UriComponentsBuilder
        .fromHttpUrl(USER_EMAIL)
        .build(false);

    ResponseEntity<List> response = restTemplate.exchange(
        builder.toUriString(), HttpMethod.GET, new HttpEntity<String>(headers), List.class);

    return response.getBody();
  }
}
