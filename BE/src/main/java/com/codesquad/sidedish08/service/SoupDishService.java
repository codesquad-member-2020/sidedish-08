package com.codesquad.sidedish08.service;

import static com.codesquad.sidedish08.util.ResponseUtils.getResultMap;

import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public class SoupDishService implements BasicService {

  public Map<String, ?> dish() {
    return getResultMap("dish", null);
  }

  public Map<String, ?> detail(String detailHash) {
    return getResultMap("dish", null);
  }
}
