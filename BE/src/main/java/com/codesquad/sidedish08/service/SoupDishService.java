package com.codesquad.sidedish08.service;

import com.codesquad.sidedish08.util.ResponseUtils;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public class SoupDishService implements BasicService {

  public Map<String, ?> dish() {
    return ResponseUtils.getResultMap("dish", null);
  }

  public Map<String, ?> detail(String detailHash) {
    return ResponseUtils.getResultMap("dish", null);
  }
}
