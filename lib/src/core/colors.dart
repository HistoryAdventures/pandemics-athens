import 'package:flutter/material.dart';

/// Defines the color palette for the History of Adventure's UI.
abstract class AppColors {
  /// White
  static const Color white = Color(0xffffffff);

  static const Color blackB = Color(0xff201a29);

  /// Black
  static const Color blackG = Color(0xFF202124);

  /// Black 54% opacity
  static const Color black54 = Color(0x8A000000);

  /// Black 25% opacity
  static const Color black25 = Color(0x40202124);

  /// Deep blue
  static const Color blueDeep = Color(0xff102B56);

  /// Green
  static const Color green = Color(0xff55B791);

  /// Orange
  static const Color orange = Color(0xffFF8A00);

  /// Red
  static const Color red = Color(0xffE22900);

  /// Yellow
  static const Color yellow = Color(0xffFBBF5C);

  /// Grey
  static const Color grey = Color(0xffD0CACB);

  /// Deep grey
  static const Color greyDeep = Color(0xff2E2E2E);

  // Transparent
  static const Color transpatent = Colors.transparent;
  static const Color akaroaDeep = Color(0xffD8C2AB);
  static const Color akaroa = Color(0xffdeccb8);

  static const LinearGradient linearGradient1 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xffFFE55B),
        Color(0xffFF9B25),
        Color(0xffE05E00),
        Color(0xffD13200)
      ]);
  static const LinearGradient linearGradient2 =
      LinearGradient(colors: [greyDeep, greyDeep]);

  static const LinearGradient linearGradientForBackground =
      LinearGradient(colors: [
    Color.fromRGBO(255, 255, 255, 0.1),
    Color.fromRGBO(255, 255, 255, 0.7),
    Color.fromRGBO(255, 255, 255, 0.7),
    Color.fromRGBO(255, 255, 255, 0.7),
    Color.fromRGBO(255, 255, 255, 0.7),
    Color.fromRGBO(255, 255, 255, 0.28)
  ]);

  static const LinearGradient linearGradientForBackgroundDocument =
      LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.8),
      Color.fromRGBO(255, 255, 255, 0.8),
      // Color.fromRGBO(255, 255, 255, 0.5),

      //radial-gradient(50% 50% at 50% 50%, rgba(255, 255, 255, 0.6) 0%, rgba(255, 255, 255, 0.4)
    ],
    end: Alignment.bottomLeft,
  );
}
