package com.codesquad.sidedish08.controller;

import com.codesquad.sidedish08.message.DishMessages;
import com.codesquad.sidedish08.message.SuccessMessages;
import com.codesquad.sidedish08.response.ApiResponse;
import com.codesquad.sidedish08.service.BasicService;
import com.codesquad.sidedish08.service.MainDishService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "Prod")
@RequestMapping("/api/main")
public class MainDishController {

  private final BasicService mainDishService;

  public MainDishController(MainDishService mainDishService) {
    this.mainDishService = mainDishService;
  }

  @ApiOperation(value = "", notes = DishMessages.MAIN_DISH)
  @GetMapping
  public ApiResponse dish() {
    return ApiResponse.ok(SuccessMessages.SUCCESS, mainDishService.dish());
  }

  @ApiOperation(value = "", notes = DishMessages.MAIN_DISH_DETAIL)
  @GetMapping("/{detailHash}")
  public ApiResponse detail(@PathVariable String detailHash) {
    return ApiResponse.ok(SuccessMessages.SUCCESS, mainDishService.detail(detailHash));
  }
}
