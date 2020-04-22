package com.codesquad.sidedish08.exception;

import com.codesquad.sidedish08.message.ErrorMessages;
import com.codesquad.sidedish08.response.ErrorResponse;
import java.util.NoSuchElementException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class CustomAdvice {

  @ExceptionHandler(Exception.class)
  @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
  public ErrorResponse handleException(Exception e) {
    return ErrorResponse.ok(ErrorMessages.ERROR, e.getMessage());
  }

  @ExceptionHandler(NullPointerException.class)
  @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
  public ErrorResponse handleNullPointerException(NullPointerException e) {
    return ErrorResponse.ok(ErrorMessages.NULL_POINTER_EXCEPTION, e.getMessage());
  }

  @ExceptionHandler(NoSuchElementException.class)
  @ResponseStatus(HttpStatus.FORBIDDEN)
  public ErrorResponse handleNoSuchElementException(NoSuchElementException e) {
    return ErrorResponse.ok(ErrorMessages.NO_SUCH_ELEMENT_EXCEPTION, e.getMessage());
  }
}
