package com.codesquad.sidedish08.message;

public class DishMessages {

  public static final String BEST_DISH = "베스트반찬 : RequestParam 으로 들어오는 categoryId 의 dish 를 모두 응답합니다";

  private static final String RESPONSE_ALL = " dish 를 모두 응답합니다";

  public static final String MAIN_DISH = "든든한반찬 : 든든한반찬" + DishMessages.RESPONSE_ALL;
  public static final String SIDE_DISH = "밑반찬 : 밑반찬" + DishMessages.RESPONSE_ALL;
  public static final String SOUP_DISH = "국물요리 : 국물요리" + DishMessages.RESPONSE_ALL;

  private static final String RESPONSE_ONE = " PathVariable 로 들어오는 hash 값의 dish 를 응답합니다";

  public static final String MAIN_DISH_DETAIL = "든든한반찬 :" + DishMessages.RESPONSE_ONE;
  public static final String SOUP_DISH_DETAIL = "국물요리 :" + DishMessages.RESPONSE_ONE;
  public static final String SIDE_DISH_DETAIL = "밑반찬 :" + DishMessages.RESPONSE_ONE;
}