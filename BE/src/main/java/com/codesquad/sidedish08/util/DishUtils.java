package com.codesquad.sidedish08.util;

import com.codesquad.sidedish08.message.DishMessages;
import com.codesquad.sidedish08.model.Badge;
import java.util.List;

public class DishUtils {

  public static String getDeliveryFee() {
    return DishMessages.DELIVERY_FEE;
  }

  public static String getDeliveryInfo() {
    return DishMessages.DELIVERY_INFO;
  }

  public static Integer getSalePrice(Integer normalPrice, List<Badge> badges) {
    return normalPrice;
  }
}
