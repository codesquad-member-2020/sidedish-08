package com.codesquad.sidedish08.controller;

import com.codesquad.sidedish08.message.AuthMessages;
import com.codesquad.sidedish08.model.Email;
import com.codesquad.sidedish08.service.AuthService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.websocket.server.PathParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@Api(tags = "Prod")
@RequestMapping("/api/oauth")
public class AuthController {

  private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
  private static Map<String, String> login = new HashMap<>();

  private final AuthService authService;

  public AuthController(AuthService authService) {
    this.authService = authService;
  }

  @ApiOperation(value = "", notes = AuthMessages.LOGIN)
  @GetMapping("/login")
  public ResponseEntity login() {
    return getCode();
  }

  @GetMapping("/github/callback")
  public String callback(@PathParam("code") String code) {
    String token = getAccessToken(code);
    String email = enrollEmails(token);
    return login.get(email);
  }

  private ResponseEntity<String> getCode() {
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(new MediaType("application", "json", StandardCharsets.UTF_8));
    UriComponents uri = UriComponentsBuilder
        .fromHttpUrl("https://github.com/login/oauth/authorize")
        .queryParam("client_id", "38d15de6e32724a43a4d")
        .queryParam("scope", "user")
        .build(false);

    headers.setLocation(uri.toUri());

    logger.debug("URL : {}", uri);
    return new ResponseEntity<>(headers, HttpStatus.SEE_OTHER);
  }

  private String getAccessToken(String code) {
    MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
    Map<String, String> header = new HashMap<>();
    header.put("Accept", "application/json");
    headers.setAll(header);

    MultiValueMap<String, String> requestPayloads = new LinkedMultiValueMap<>();
    Map<String, String> requestPayload = new HashMap<>();
    requestPayload.put("client_id", "38d15de6e32724a43a4d");
    requestPayload.put("client_secret", "219c33b31280356acbd56f8c2750ed0ff62398ab");
    requestPayload.put("code", code);
    requestPayloads.setAll(requestPayload);

    HttpEntity<MultiValueMap> request = new HttpEntity<>(requestPayloads, headers);
    ResponseEntity<HashMap> response = new RestTemplate()
        .postForEntity("https://github.com/login/oauth/access_token", request, HashMap.class);

    Map<String, String> map = (Map<String, String>) response.getBody();
    String accessToken = map.get("access_token");
    logger.debug("access Token : {}", accessToken);
    return accessToken;
  }

  private String enrollEmails(String accessToken) {
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(
        new MediaType("application", "json", StandardCharsets.UTF_8));
    headers.add("Authorization", "bearer " + accessToken);

    ResponseEntity<List> response = new RestTemplate().exchange(
        "https://api.github.com/user/emails", HttpMethod.GET, new HttpEntity<String>(headers),
        List.class);

    ObjectMapper mapper = new ObjectMapper();
    List<Email> emails = mapper.convertValue(
        response.getBody(),
        new TypeReference<List<Email>>() {
        }
    );
    Email email = emails.get(0);
    logger.debug("Email : {}", email.getEmail());
    login.put(email.getEmail(), accessToken);
    return email.getEmail();
  }
}
