package com.example.sidedish08.service;

import static com.example.sidedish08.util.ResponseUtils.getResultMap;

import com.example.sidedish08.msessage.MockMessages;
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
