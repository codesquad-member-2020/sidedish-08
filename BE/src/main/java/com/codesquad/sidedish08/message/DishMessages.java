package com.codesquad.sidedish08.message;

public class DishMessages {

  public static final String BEST_DISH = "베스트반찬 : RequestParam 으로 들어오는 categoryId 의 dish 를 모두 응답합니다";

  public static final String DELIVERY_FEE1 = "원 (";
  public static final Integer MINIMUM_AMOUNT_OF_DELIVERY_FREE = 40000;
  public static final String DELIVERY_FEE2 = "원 이상 구매 시 무료)";

  public static final String DELIVERY_INFO1 = "서울 경기 ";
  public static final String DELIVERY_INFO2 = "(제주 및 도서산간 불가) [";
  public static final String DELIVERY_INFO3 = "] 수령 가능한 상품입니다.";

  public static final String MAIN_DISH = "든든한반찬 : 든든한반찬 dish 를 모두 응답합니다";
  public static final String SIDE_DISH = "밑반찬 : 밑반찬 dish 를 모두 응답합니다";
  public static final String SOUP_DISH = "국물요리 : 국물요리 dish 를 모두 응답합니다";

  public static final String MAIN_DISH_DETAIL = "든든한반찬 : PathVariable 로 들어오는 hash 값의 dish 를 응답합니다";
  public static final String SOUP_DISH_DETAIL = "국물요리 : PathVariable 로 들어오는 hash 값의 dish 를 응답합니다";
  public static final String SIDE_DISH_DETAIL = "밑반찬 : PathVariable 로 들어오는 hash 값의 dish 를 응답합니다";

  public static final String DETAIL = "상세 : PathVariable 로 들어오는 hash 값의 dish 를 응답합니다";
}
