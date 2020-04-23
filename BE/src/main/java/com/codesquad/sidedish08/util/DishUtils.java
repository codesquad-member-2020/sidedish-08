package com.codesquad.sidedish08.util;

import com.codesquad.sidedish08.message.BadgePrice;
import com.codesquad.sidedish08.message.DeliveryPrice;
import com.codesquad.sidedish08.message.DishMessages;
import com.codesquad.sidedish08.model.Badge;
import com.codesquad.sidedish08.model.Delivery;
import java.util.List;
import java.util.stream.Collectors;

public class DishUtils {

  private static Integer calcDeliveryFee(List<Delivery> deliveries) {
    return deliveries.stream().map(Delivery::getType).mapToInt(type -> {
          switch (type) {
            case "새벽배송":
              return DeliveryPrice.EARLY_MORNING;
            case "전국택배":
              return DeliveryPrice.NATIONAL;
            default:
              return 0;
          }
        }
    ).sum() + DeliveryPrice.BASE;
  }

  public static String getDeliveryFee(List<Delivery> deliveries) {
    StringBuilder sb = new StringBuilder();
    sb.append(calcDeliveryFee(deliveries));
    sb.append(DishMessages.DELIVERY_FEE1);
    sb.append(DishMessages.MINIMUM_AMOUNT_OF_DELIVERY_FREE);
    sb.append(DishMessages.DELIVERY_FEE2);
    return sb.toString();
  }

  public static String getDeliveryInfo(List<Delivery> deliveries) {
    StringBuilder sb = new StringBuilder();
    sb.append(DishMessages.DELIVERY_INFO1);
    sb.append(deliveries.stream().map(Delivery::getType).collect(Collectors.joining("/")));
    sb.append(DishMessages.DELIVERY_INFO2);
    sb.append("월, 화, 수, 목, 금, 토, 일");
    sb.append(DishMessages.DELIVERY_INFO3);
    return sb.toString();
  }

  public static Integer getDiscountPrice(List<Badge> badges) {
    return badges.stream().map(Badge::getType).mapToInt(type -> {
          switch (type) {
            case "론칭특가":
              return BadgePrice.LAUNCHING_PRICE;
            case "이벤트특가":
              return BadgePrice.EVENT_PRICE;
            default:
              return 0;
          }
        }
    ).sum();
  }
}
