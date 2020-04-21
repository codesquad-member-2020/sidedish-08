package com.codesquad.sidedish08.exception;

import com.codesquad.sidedish08.response.ErrorResponse;
import com.codesquad.sidedish08.msessage.ErrorMessages;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class CustomAdvice {

  @ExceptionHandler(Exception.class)
  @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
  public ErrorResponse handleException(Exception e) {
    return new ErrorResponse(ErrorMessages.ERROR, e.getMessage());
  }
}
