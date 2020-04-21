package com.codesquad.sidedish08.service;

import com.codesquad.sidedish08.msessage.MockMessages;
import com.codesquad.sidedish08.util.ResponseUtils;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public class MainDishService implements BasicService {

  public Map<String, ?> dish() {
    return ResponseUtils.getResultMap("dish", MockMessages.mainDishString);
  }

  public Map<String, ?> detail(String detailHash) {
    return ResponseUtils.getResultMap("dish", null);
  }
}
