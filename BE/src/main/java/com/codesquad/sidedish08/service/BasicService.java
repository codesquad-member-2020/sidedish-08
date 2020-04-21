package com.codesquad.sidedish08.service;

import java.util.Map;

public interface BasicService {

  Map<String, ?> dish();

  Map<String, ?> detail(String detailHash);
}
