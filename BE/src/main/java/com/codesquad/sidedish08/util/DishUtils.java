package com.codesquad.sidedish08.util;

import static com.codesquad.sidedish08.message.DeliveryPrice.BASE;
import static com.codesquad.sidedish08.message.DeliveryPrice.EARLY_MORNING;
import static com.codesquad.sidedish08.message.DeliveryPrice.NATIONAL;
import static com.codesquad.sidedish08.message.DeliveryPrice.valueOf;

import com.codesquad.sidedish08.message.BadgePrice;
import com.codesquad.sidedish08.message.DishMessages;
import com.codesquad.sidedish08.model.Badge;
import com.codesquad.sidedish08.model.Delivery;
import java.util.List;
import java.util.stream.Collectors;

public class DishUtils {

  private static int calcDeliveryFee(List<Delivery> deliveries) {
    return deliveries.stream().map(Delivery::getType).mapToInt(type -> {
          switch (valueOf(type)) {
            case EARLY_MORNING:
              return EARLY_MORNING.getValue();
            case NATIONAL:
              return NATIONAL.getValue();
            default:
              return 0;
          }
        }
    ).sum() + BASE.getValue();
  }

  public static String getDeliveryFee(List<Delivery> deliveries) {
    return new StringBuilder()
        .append(calcDeliveryFee(deliveries))
        .append(DishMessages.DELIVERY_FEE1)
        .append(DishMessages.MINIMUM_AMOUNT_OF_DELIVERY_FREE)
        .append(DishMessages.DELIVERY_FEE2).toString();
  }

  public static String getDeliveryInfo(List<Delivery> deliveries) {
    return new StringBuilder()
        .append(DishMessages.DELIVERY_INFO1)
        .append(deliveries.stream()
            .map(delivery -> valueOf(delivery.getType()).getName())
            .collect(Collectors.joining("/")))
        .append(DishMessages.DELIVERY_INFO2)
        .append("월, 화, 수, 목, 금, 토, 일")
        .append(DishMessages.DELIVERY_INFO3).toString();
  }

  public static int getDiscountPrice(List<Badge> badges) {
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

  public static long getPoint(int price, long divisor) {
    return price / divisor;
  }

  public static int getSalePrice(int normalPrice, int discountPrice) {
    return normalPrice - discountPrice;
  }
}
