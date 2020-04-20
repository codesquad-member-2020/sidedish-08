package com.example.sidedish08.controller;

import com.example.sidedish08.msessage.SuccessMessages;
import com.example.sidedish08.response.ApiResponse;
import com.example.sidedish08.service.BasicService;
import com.example.sidedish08.service.SoupDishService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "Prod")
@RequestMapping("/api/soup")
public class SoupDishController {

  private final BasicService soupDishService;

  public SoupDishController(SoupDishService soupDishService) {
    this.soupDishService = soupDishService;
  }

  @ApiOperation(value = "", notes = "국물 요리")
  @GetMapping
  public ApiResponse dish() {
    return new ApiResponse(SuccessMessages.SUCCESS, soupDishService.dish());
  }

  @ApiOperation(value = "", notes = "국물 요리 상세")
  @GetMapping("/{detailHash}")
  public ApiResponse detail(@PathVariable String detailHash) {
    return new ApiResponse(SuccessMessages.SUCCESS, soupDishService.detail(detailHash));
  }
}
