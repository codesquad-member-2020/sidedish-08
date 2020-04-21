package com.codesquad.sidedish08.controller;

import com.codesquad.sidedish08.msessage.SuccessMessages;
import com.codesquad.sidedish08.response.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "Dev")
@RequestMapping("/dev-api")
public class DevController {

  @ApiOperation(value = "", notes = "Test")
  @GetMapping("/test")
  public ApiResponse test() {
    return new ApiResponse(SuccessMessages.SUCCESS, null);
  }
}
