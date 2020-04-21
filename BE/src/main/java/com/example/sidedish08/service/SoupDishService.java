package com.example.sidedish08.service;

import static com.example.sidedish08.util.ResponseUtils.*;

import com.example.sidedish08.util.ResponseUtils;
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
