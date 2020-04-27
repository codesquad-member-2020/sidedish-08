package com.codesquad.sidedish08.controller;

import com.codesquad.sidedish08.message.DishMessages;
import com.codesquad.sidedish08.message.SuccessMessages;
import com.codesquad.sidedish08.model.response.ApiResponse;
import com.codesquad.sidedish08.service.BasicService;
import com.codesquad.sidedish08.service.SoupDishService;
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

  private final BasicService soupDishService;

  public SideDishController(SoupDishService soupDishService) {
    this.soupDishService = soupDishService;
  }

  @ApiOperation(value = "", notes = DishMessages.SIDE_DISH)
  @GetMapping
  public ApiResponse dish() {
    return ApiResponse.ok(SuccessMessages.SUCCESS, soupDishService.dish());
  }

  @ApiOperation(value = "", notes = DishMessages.SIDE_DISH_DETAIL)
  @GetMapping("/{detailHash}")
  public ApiResponse detail(@PathVariable String detailHash) {
    return ApiResponse.ok(SuccessMessages.SUCCESS, soupDishService.detail(detailHash));
  }
}
