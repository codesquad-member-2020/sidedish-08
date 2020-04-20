package com.example.sidedish08.response;

import java.util.Map;

public class ApiResponse {

  private String message;
  private Map<String, ?> contents;

  public ApiResponse(String message, Map<String, ?> contents) {
    this.message = message;
    this.contents = contents;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public Map<String, ?> getContents() {
    return contents;
  }

  public void setContents(Map<String, ?> contents) {
    this.contents = contents;
  }
}
