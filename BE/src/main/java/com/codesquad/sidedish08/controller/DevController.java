package com.codesquad.sidedish08.controller;

import com.codesquad.sidedish08.message.DishMessages;
import com.codesquad.sidedish08.message.SuccessMessages;
import com.codesquad.sidedish08.response.ApiResponse;
import com.codesquad.sidedish08.service.DevService;
import com.codesquad.sidedish08.util.ResponseUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "Dev")
@RequestMapping("/dev-api")
public class DevController {

  private final DevService devService;

  public DevController(DevService devService) {
    this.devService = devService;
  }

  @ApiOperation(value = "", notes = "test")
  @GetMapping("/test")
  public ApiResponse test() {
    return ApiResponse.ok(SuccessMessages.SUCCESS, null);
  }

  @ApiOperation(value = "", notes = "Category 전부다 가져오기")
  @GetMapping("/category")
  public ApiResponse category() {
    return ApiResponse.ok(
        SuccessMessages.SUCCESS, ResponseUtils.getResultMap("dish", devService.category()));
  }
}
