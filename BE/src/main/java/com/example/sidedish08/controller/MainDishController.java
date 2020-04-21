package com.example.sidedish08.controller;

import com.example.sidedish08.msessage.SuccessMessages;
import com.example.sidedish08.response.ApiResponse;
import com.example.sidedish08.service.BasicService;
import com.example.sidedish08.service.MainDishService;
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

  @ApiOperation(value = "", notes = "든든한 반찬")
  @GetMapping
  public ApiResponse dish() {
    return new ApiResponse(SuccessMessages.SUCCESS, mainDishService.dish());
  }

  @ApiOperation(value = "", notes = "든든한 반찬 상세")
  @GetMapping("/{detailHash}")
  public ApiResponse detail(@PathVariable String detailHash) {
    return new ApiResponse(SuccessMessages.SUCCESS, mainDishService.detail(detailHash));
  }
}
