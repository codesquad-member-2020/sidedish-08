package com.codesquad.sidedish08.controller;

import com.codesquad.sidedish08.msessage.DishMessages;
import com.codesquad.sidedish08.msessage.SuccessMessages;
import com.codesquad.sidedish08.response.ApiResponse;
import com.codesquad.sidedish08.service.BasicService;
import com.codesquad.sidedish08.service.SideDishService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "Prod")
@RequestMapping("/api/side")
public class SideDishController {

  private final BasicService sideDishService;

  public SideDishController(SideDishService sideDishService) {
    this.sideDishService = sideDishService;
  }

  @ApiOperation(value = "", notes = DishMessages.SIDE_DISH)
  @GetMapping
  public ApiResponse dish() {
    return new ApiResponse(SuccessMessages.SUCCESS, sideDishService.dish());
  }

  @ApiOperation(value = "", notes = DishMessages.SIDE_DISH_DETAIL)
  @GetMapping("/{hash}")
  public ApiResponse detail(@PathVariable String hash) {
    return new ApiResponse(SuccessMessages.SUCCESS, sideDishService.detail(hash));
  }
}
