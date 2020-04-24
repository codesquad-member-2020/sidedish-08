package com.codesquad.sidedish08.controller;

import com.codesquad.sidedish08.message.DishMessages;
import com.codesquad.sidedish08.message.SuccessMessages;
import com.codesquad.sidedish08.model.response.ApiResponse;
import com.codesquad.sidedish08.service.BasicService;
import com.codesquad.sidedish08.service.BestDishService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "Prod")
@RequestMapping("/api/best")
public class BestDishController {

  private final BasicService bestDishService;

  public BestDishController(BestDishService bestDishService) {
    this.bestDishService = bestDishService;
  }

  @ApiOperation(value = "", notes = DishMessages.BEST_DISH)
  @GetMapping
  public ApiResponse dish() {
    return ApiResponse.ok(SuccessMessages.SUCCESS, bestDishService.dish());
  }
}
