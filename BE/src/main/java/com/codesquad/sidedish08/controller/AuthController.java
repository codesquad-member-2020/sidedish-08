package com.codesquad.sidedish08.controller;

import static com.codesquad.sidedish08.util.ResponseUtils.getResultMap;

import com.codesquad.sidedish08.message.AuthMessages;
import com.codesquad.sidedish08.message.SuccessMessages;
import com.codesquad.sidedish08.response.ApiResponse;
import com.codesquad.sidedish08.service.AuthService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javax.websocket.server.PathParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "Prod")
@RequestMapping("/api/oauth")
public class AuthController {

  private static final Logger log = LoggerFactory.getLogger(AuthController.class);
  private final AuthService authService;

  public AuthController(AuthService authService) {
    this.authService = authService;
  }

  @ApiOperation(value = "", notes = AuthMessages.LOGIN)
  @ResponseStatus(HttpStatus.SEE_OTHER)
  @GetMapping("/login")
  public ResponseEntity<String> login() {
    return new ResponseEntity<>(authService.login(), HttpStatus.SEE_OTHER);
  }

  @ApiOperation(value = "", notes = AuthMessages.CALLBACK)
  @GetMapping("/callback")
  public ApiResponse callback(@PathParam("code") String code) {
    return ApiResponse.ok(
        SuccessMessages.SUCCESS, getResultMap("token", authService.callback(code)));
  }
}
