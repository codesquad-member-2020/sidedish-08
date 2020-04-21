package com.codesquad.sidedish08.controller;

import com.codesquad.sidedish08.msessage.SuccessMessages;
import com.codesquad.sidedish08.response.ApiResponse;
import com.codesquad.sidedish08.service.BasicService;
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

  private final BasicService bestDishService;

  public BestDishController(BestDishService bestDishService) {
    this.bestDishService = bestDishService;
  }

  @ApiOperation(value = "", notes = "베스트 반찬")
  @GetMapping
  public ApiResponse dish() {
    return new ApiResponse(SuccessMessages.SUCCESS, bestDishService.dish());
  }

  @ApiOperation(value = "", notes = "베스트 반찬 상세")
  @GetMapping("/{detailHash}")
  public ApiResponse detail(@PathVariable String detailHash) {
    return new ApiResponse(SuccessMessages.SUCCESS, bestDishService.detail(detailHash));
  }
}
