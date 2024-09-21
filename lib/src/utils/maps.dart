import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/utils/app_colors.dart';

Color getCardColorByIndex(int colorIndex) {
  Map<int, Color> cardColor = {
    1: Colors.grey[500]!,
    2: AppColors.orangeCard,
    3: AppColors.blueCard,
    4: AppColors.pinkCard,
    5: AppColors.greenCard,
    6: AppColors.coralCard
  };
  return cardColor[colorIndex]!;
}
