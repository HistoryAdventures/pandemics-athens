import 'dart:ui';

import 'package:flutter/material.dart';

import '../colors.dart';

double width = window.physicalSize.width / window.devicePixelRatio,
    height = window.physicalSize.height / window.devicePixelRatio;

class Shadows {
  static List<BoxShadow> get universal => const [
        BoxShadow(offset: Offset(0, 1), color: AppColors.grey, blurRadius: 1),
        BoxShadow(offset: Offset(1, 0), color: AppColors.grey, blurRadius: 1),
        BoxShadow(offset: Offset(1, -1), color: AppColors.grey, blurRadius: 1),
      ];
  static List<BoxShadow> get small => const [
        BoxShadow(
          color: AppColors.black100,
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 1),
        ),
      ];

  static List<BoxShadow> get allBorders => const [
        BoxShadow(offset: Offset(0, 1), color: AppColors.grey, blurRadius: 1),
        BoxShadow(offset: Offset(1, 0), color: AppColors.grey, blurRadius: 1),
        BoxShadow(offset: Offset(1, -1), color: AppColors.grey, blurRadius: 1),
        BoxShadow(offset: Offset(-1, -1), color: AppColors.grey, blurRadius: 1),
      ];

  static List<BoxShadow> get allBordersBlue => const [
        BoxShadow(
            offset: Offset(0, 1),
            color: AppColors.linearGradientBlueBoxShadow,
            blurRadius: 1),
        BoxShadow(
            offset: Offset(1, 0),
            color: AppColors.linearGradientBlueBoxShadow,
            blurRadius: 1),
        BoxShadow(
            offset: Offset(1, -1),
            color: AppColors.linearGradientBlueBoxShadow,
            blurRadius: 1),
        BoxShadow(
            offset: Offset(-1, -1),
            color: AppColors.linearGradientBlueBoxShadow,
            blurRadius: 1),
      ];
  static List<BoxShadow> get allBordersRed => const [
        BoxShadow(
            offset: Offset(0, 1),
            color: AppColors.linearGradientRedBoxShadow,
            blurRadius: 1),
        BoxShadow(
            offset: Offset(1, 0),
            color: AppColors.linearGradientRedBoxShadow,
            blurRadius: 1),
        BoxShadow(
            offset: Offset(1, -1),
            color: AppColors.linearGradientRedBoxShadow,
            blurRadius: 1),
        BoxShadow(
            offset: Offset(-1, -1),
            color: AppColors.linearGradientRedBoxShadow,
            blurRadius: 1),
      ];
  static List<BoxShadow> get allBordersGreen => const [
        BoxShadow(
            offset: Offset(0, 1),
            color: AppColors.linearGradientGreenBoxShadow,
            blurRadius: 1),
        BoxShadow(
            offset: Offset(1, 0),
            color: AppColors.linearGradientGreenBoxShadow,
            blurRadius: 1),
        BoxShadow(
            offset: Offset(1, -1),
            color: AppColors.linearGradientGreenBoxShadow,
            blurRadius: 1),
        BoxShadow(
            offset: Offset(-1, -1),
            color: AppColors.linearGradientGreenBoxShadow,
            blurRadius: 1),
      ];

  static List<BoxShadow> get smallWhite => const [
        BoxShadow(
          color: AppColors.white,
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 1),
        ),
      ];

  static List<BoxShadow> get quizShadows => const [
        BoxShadow(offset: Offset(1, 0), color: AppColors.grey, blurRadius: 1),
        BoxShadow(offset: Offset(1, 1), color: AppColors.grey, blurRadius: 1),
        BoxShadow(offset: Offset(0, 3), color: AppColors.grey, blurRadius: 2),
      ];
}

class HW {
  static double getHeight(double height, BuildContext context) {
    return height * MediaQuery.of(context).size.height / 1080;
  }

  static double getWidth(double width, BuildContext context) {
    return width * MediaQuery.of(context).size.width / 1920;
  }
}

class GetOffset {
  static Offset getOffset(Offset offset, BuildContext context) {
    final dx = offset.dx * 100 / MediaQuery.of(context).size.width;
    final dy = offset.dy * 100 / MediaQuery.of(context).size.height;
    return Offset(dx / 100 * MediaQuery.of(context).size.width,
        dy / 100 * MediaQuery.of(context).size.height);
  }
}

class TextFontSize {
  static double getHeight(double value, BuildContext context) =>
      value * MediaQuery.of(context).size.height / 1080;
}

/// Used for all animations in the  app
class Times {
  static const Duration fastest = Duration(milliseconds: 150);
  static const Duration fast = Duration(milliseconds: 250);
  static const Duration medium = Duration(milliseconds: 500);
  static const Duration slow = Duration(milliseconds: 700);
  static const Duration slower = Duration(milliseconds: 1000);
  static const Duration slowest = Duration(milliseconds: 1500);
  static const Duration backgrounAnimationDuration = Duration(seconds: 12);
}

class Corners {
  static const double sm = 3;
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);

  static const double med = 5;
  static const BorderRadius medBorder = BorderRadius.all(medRadius);
  static const Radius medRadius = Radius.circular(med);

  static const double lg = 8;
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static const Radius lgRadius = Radius.circular(lg);

  static const double big = 20;
  static const BorderRadius bigBorder = BorderRadius.all(bigRadius);
  static const Radius bigRadius = Radius.circular(big);
}

class Strokes {
  static const double thin = 1;
  static const double thick = 4;
}

class Insets {
  static double scale = 1;
  static double offsetScale = 1;
  // Regular paddings
  static double get xs => 4 * scale;
  static double get sm => 8 * scale;
  static double get med => 12 * scale;
  static double get lg => 16 * scale;
  static double get xl => 32 * scale;
  // Offset, used for the edge of the window, or to separate large sections in the app
  static double get offset => 40 * offsetScale;
}

class Offsets {
  static const begin = Offset(-1.0, -1.0);
  static const end = Offset.zero;
  static final tween = Tween(begin: begin, end: end);
}
