package com.codesquad.sidedish08.controller;

import static com.codesquad.sidedish08.util.ResponseUtils.getResultMap;

import com.codesquad.sidedish08.message.DishMessages;
import com.codesquad.sidedish08.message.SuccessMessages;
import com.codesquad.sidedish08.model.response.ApiResponse;
import com.codesquad.sidedish08.service.BestDishService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "Prod")
@RequestMapping("/api/best")
public class BestDishController {

  private final BestDishService dishService;

  public BestDishController(BestDishService dishService) {
    this.dishService = dishService;
  }

  @ApiOperation(value = "", notes = DishMessages.BEST_DISH)
  @GetMapping("/{categoryId}")
  public ApiResponse dish(@PathVariable Long categoryId) {
    return ApiResponse.ok(
        SuccessMessages.SUCCESS, getResultMap("data", dishService.dish(categoryId)));
  }
}
