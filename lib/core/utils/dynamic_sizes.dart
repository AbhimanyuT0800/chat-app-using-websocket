import 'package:flutter/material.dart';

// responsive height and width
extension DynamicSizes on BuildContext {
  double screenHeight(double h) {
    return MediaQuery.of(this).size.height * (h / 932);
  }

  double screenWidth(double w) {
    return MediaQuery.of(this).size.width * (w / 430);
  }
}
