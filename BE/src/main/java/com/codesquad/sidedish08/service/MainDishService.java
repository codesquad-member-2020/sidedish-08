package com.codesquad.sidedish08.service;

import static com.codesquad.sidedish08.util.ResponseUtils.getResultMap;

import com.codesquad.sidedish08.message.MockMessages;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public class MainDishService implements BasicService {

  public Map<String, ?> dish() {
    return getResultMap("dish", MockMessages.mainDishString);
  }

  public Map<String, ?> detail(String detailHash) {
    return getResultMap("dish", null);
  }
}
