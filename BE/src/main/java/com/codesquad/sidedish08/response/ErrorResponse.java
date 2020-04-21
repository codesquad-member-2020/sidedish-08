package com.codesquad.sidedish08.response;

public class ErrorResponse {

  private String message;
  private String errorTrace;

  public ErrorResponse(String message, String errorTrace) {
    this.message = message;
    this.errorTrace = errorTrace;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public String getErrorTrace() {
    return errorTrace;
  }

  public void setErrorTrace(String errorTrace) {
    this.errorTrace = errorTrace;
  }
}
