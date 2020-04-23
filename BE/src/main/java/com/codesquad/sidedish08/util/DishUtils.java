package com.codesquad.sidedish08.util;

import com.codesquad.sidedish08.message.DishMessages;
import com.codesquad.sidedish08.model.Badge;
import com.codesquad.sidedish08.model.Delivery;
import java.util.List;

public class DishUtils {

  private static Integer calcDeliveryFee(List<Delivery> deliveries) {
    Integer deliveryFee = 2500;

    for (Delivery delivery : deliveries) {
      String deliveryType = delivery.getType();

      if (deliveryType.equals("새벽배송")) {
        deliveryFee += 500;
      }
    }

    return deliveryFee;
  }

  public static String getDeliveryFee(List<Delivery> deliveries) {

    StringBuilder sb = new StringBuilder();
    sb.append(DishMessages.DELIVERY_INFO1);
    deliveries.forEach(delivery -> sb.append(delivery.getType()).append(" "));
    sb.append(DishMessages.DELIVERY_INFO2);
    sb.append("월, 화, 수, 목, 금, 토, 일");
    sb.append(DishMessages.DELIVERY_INFO3);
    return sb.toString();
  }

  public static String getDeliveryInfo(List<Delivery> deliveries) {
    StringBuilder sb = new StringBuilder();
    sb.append(calcDeliveryFee(deliveries));
    sb.append(DishMessages.DELIVERY_FEE1);
    sb.append(DishMessages.MINIMUM_AMOUNT_OF_DELIVERY_FREE);
    sb.append(DishMessages.DELIVERY_FEE2);
    return sb.toString();
  }

  public static Integer getDiscountPrice(List<Badge> badges) {
    Integer discountAmount = 0;

    for (Badge badge : badges) {
      String badgeType = badge.getType();

      if (badgeType.equals("론칭특가")) {
        discountAmount -= 500;
      }

      if (badgeType.equals("이벤트특가")) {
        discountAmount -= 300;
      }
    }

    return discountAmount;
  }
}
