package com.codesquad.sidedish08.model.response;

import static com.codesquad.sidedish08.util.ResponseUtils.getResultMap;

import java.util.Map;

public class ApiResponse {

  private String message;
  private Map<String, ?> contents;

  public ApiResponse(String message, Map<String, ?> contents) {
    this.message = message;
    this.contents = contents;
  }

  public static ApiResponse ok(String message, Map<String, ?> contents) {
    return new ApiResponse(message, contents);
  }

  public static ApiResponse error(String message, String errorTrace) {
    return new ApiResponse(message, getResultMap("errorTrace", errorTrace));
  }

  public String getMessage() {
    return message;
  }

  public Map<String, ?> getContents() {
    return contents;
  }
}
