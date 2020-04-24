package com.codesquad.sidedish08.controller;

import com.codesquad.sidedish08.message.AuthMessages;
import com.codesquad.sidedish08.message.SuccessMessages;
import com.codesquad.sidedish08.model.response.ApiResponse;
import com.codesquad.sidedish08.service.AuthService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "Prod")
@RequestMapping("/api/auth")
public class AuthController {

  private final AuthService authService;

  public AuthController(AuthService authService) {
    this.authService = authService;
  }

  @ApiOperation(value = "", notes = AuthMessages.LOGIN)
  @GetMapping("login")
  public ApiResponse login() {
    return ApiResponse.ok(SuccessMessages.SUCCESS, authService.login());
  }
}
