package com.codesquad.sidedish08.response;

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

  public String getMessage() {
    return message;
  }

  public Map<String, ?> getContents() {
    return contents;
  }

//  public static <T> ApiResult<T> OK(T response) {
//    return new ApiResult<>(true, response, null);
//  }
}
