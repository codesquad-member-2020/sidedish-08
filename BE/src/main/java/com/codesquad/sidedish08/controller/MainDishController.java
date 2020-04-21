package com.codesquad.sidedish08.controller;

import com.codesquad.sidedish08.msessage.DishMessages;
import com.codesquad.sidedish08.msessage.SuccessMessages;
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
    return new ApiResponse(SuccessMessages.SUCCESS, mainDishService.dish());
  }

  @ApiOperation(value = "", notes = DishMessages.MAIN_DISH_DETAIL)
  @GetMapping("/{hash}")
  public ApiResponse detail(@PathVariable String hash) {
    return new ApiResponse(SuccessMessages.SUCCESS, mainDishService.detail(hash));
  }
}
