package com.codesquad.sidedish08.controller;

import static com.codesquad.sidedish08.util.ResponseUtils.getResultMap;

import com.codesquad.sidedish08.message.DishMessages;
import com.codesquad.sidedish08.message.SuccessMessages;
import com.codesquad.sidedish08.model.response.ApiResponse;
import com.codesquad.sidedish08.service.MainDishService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "Prod")
@RequestMapping("/api/soup")
public class SoupDishController {

  private final MainDishService service;

  public SoupDishController(MainDishService mainDishService) {
    this.service = mainDishService;
  }

  @ApiOperation(value = "", notes = DishMessages.SOUP_DISH)
  @GetMapping
  public ApiResponse dish() {
    return ApiResponse.ok(SuccessMessages.SUCCESS, getResultMap("data", service.soupDish()));
  }

  @ApiOperation(value = "", notes = DishMessages.SOUP_DISH_DETAIL)
  @GetMapping("/{hash}")
  public ApiResponse detail(
      @PathVariable @ApiParam(value = "example : H72C3") String hash) {
    return ApiResponse.ok(
        SuccessMessages.SUCCESS, getResultMap("data", service.detail(hash)));
  }
}
