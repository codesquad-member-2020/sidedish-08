package com.example.sidedish08.controller;

import com.example.sidedish08.msessage.SuccessMessages;
import com.example.sidedish08.response.ApiResponse;
import com.example.sidedish08.service.BasicService;
import com.example.sidedish08.service.SideDishService;
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

  @ApiOperation(value = "", notes = "밑반찬")
  @GetMapping
  public ApiResponse dish() {
    return new ApiResponse(SuccessMessages.SUCCESS, sideDishService.dish());
  }

  @ApiOperation(value = "", notes = "밑반찬 상세")
  @GetMapping("/{detailHash}")
  public ApiResponse detail(@PathVariable String detailHash) {
    return new ApiResponse(SuccessMessages.SUCCESS, sideDishService.detail(detailHash));
  }
}
