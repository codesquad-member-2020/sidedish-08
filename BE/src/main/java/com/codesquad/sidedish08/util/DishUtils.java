package com.codesquad.sidedish08.util;

import static com.codesquad.sidedish08.message.BadgePrice.EVENT;
import static com.codesquad.sidedish08.message.BadgePrice.LAUNCHING;
import static com.codesquad.sidedish08.message.DeliveryPrice.BASE;
import static com.codesquad.sidedish08.message.DeliveryPrice.EARLY_MORNING;
import static com.codesquad.sidedish08.message.DeliveryPrice.NATIONAL;

import com.codesquad.sidedish08.message.BadgePrice;
import com.codesquad.sidedish08.message.DeliveryPrice;
import com.codesquad.sidedish08.message.DishMessages;
import com.codesquad.sidedish08.model.Badge;
import com.codesquad.sidedish08.model.Delivery;
import com.codesquad.sidedish08.model.Image;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DishUtils {

  private static final Logger logger = LoggerFactory.getLogger(DishUtils.class);

  private static int calcDeliveryFee(List<Delivery> deliveries) {
    return deliveries.stream().map(Delivery::getType).mapToInt(type -> {
          switch (DeliveryPrice.valueOf(type)) {
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

  public static String calcDeliveryInfo(List<Delivery> deliveries) {
    return new StringBuilder()
        .append(DishMessages.DELIVERY_INFO1)
        .append(deliveries.stream()
            .map(delivery -> DeliveryPrice.valueOf(delivery.getType()).getName())
            .collect(Collectors.joining("/")))
        .append(DishMessages.DELIVERY_INFO2)
        .append("월, 화, 수, 목, 금, 토, 일")
        .append(DishMessages.DELIVERY_INFO3).toString();
  }

  private static int calcDiscountPrice(List<Badge> badges) {
    return badges.stream().map(Badge::getType).mapToInt(type -> {
          switch (BadgePrice.valueOf(type)) {
            case LAUNCHING:
              return LAUNCHING.getValue();
            case EVENT:
              return EVENT.getValue();
            default:
              return 0;
          }
        }
    ).sum();
  }

  public static long calcPoint(int price, long divisor) {
    return price / divisor;
  }

  public static int getSalePrice(int normalPrice, List<Badge> badges) {
    return normalPrice - calcDiscountPrice(badges);
  }

  public static Stream<String> getImageUrlStream(List<Image> images, String imageType) {
    return images.stream()
        .filter(image -> image.getType().equals(imageType))
        .map(Image::getUrl);
  }
}
