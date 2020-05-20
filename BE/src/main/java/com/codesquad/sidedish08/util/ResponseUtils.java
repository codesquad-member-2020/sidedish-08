package com.codesquad.sidedish08.util;

import java.util.HashMap;
import java.util.Map;

public class ResponseUtils {

  public static <T> Map<String, T> getResultMap(String key, T value) {
    Map<String, T> result = new HashMap<>();
    result.put(key, value);
    return result;
  }
}
