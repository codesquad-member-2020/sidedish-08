package com.codesquad.sidedish08.exception;

import com.codesquad.sidedish08.message.ErrorMessages;
import com.codesquad.sidedish08.model.response.ApiResponse;
import java.util.NoSuchElementException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class CustomAdvice {

  @ExceptionHandler(Exception.class)
  @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
  public ApiResponse handleException(Exception e) {
    return ApiResponse.error(ErrorMessages.ERROR, e.getMessage());
  }

  @ExceptionHandler(NoSuchElementException.class)
  @ResponseStatus(HttpStatus.FORBIDDEN)
  public ApiResponse handleNoSuchElementException(NoSuchElementException e) {
    return ApiResponse.error(ErrorMessages.NO_SUCH_ELEMENT_EXCEPTION, e.getMessage());
  }
}
