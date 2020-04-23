package com.codesquad.sidedish08.response;

public class ErrorResponse {

  private String message;
  private String errorTrace;

  public ErrorResponse(String message, String errorTrace) {
    this.message = message;
    this.errorTrace = errorTrace;
  }

  public static ErrorResponse ok(String message, String errorTrace) {
    return new ErrorResponse(message, errorTrace);
  }

  public String getMessage() {
    return message;
  }

  public String getErrorTrace() {
    return errorTrace;
  }
}
