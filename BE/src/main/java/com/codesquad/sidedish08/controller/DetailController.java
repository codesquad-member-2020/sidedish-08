package com.codesquad.sidedish08.controller;

import static com.codesquad.sidedish08.util.ResponseUtils.getResultMap;

import com.codesquad.sidedish08.message.DishMessages;
import com.codesquad.sidedish08.message.SuccessMessages;
import com.codesquad.sidedish08.model.response.ApiResponse;
import com.codesquad.sidedish08.service.DetailService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "Prod")
@RequestMapping("/api/detail")
public class DetailController {

  private final DetailService detailService;

  public DetailController(DetailService detailService) {
    this.detailService = detailService;
  }

  @ApiOperation(value = "", notes = DishMessages.DETAIL)
  @GetMapping("/{hash}")
  public ApiResponse detail(@PathVariable String hash) {
    return ApiResponse.ok(
        SuccessMessages.SUCCESS, getResultMap("data", detailService.detail(hash)));
  }
}
