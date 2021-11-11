import 'package:flutter/material.dart';

/// Defines the color palette for the History of Adventure's UI.
abstract class AppColors {
  /// White
  static const Color white = Color(0xffffffff);

  static const Color underlineInputBorderColor = Color(0xffc4c4c4);

  static const Color blackB = Color(0xff201a29);
  static const Color trackColorScrollBar = Color(0xff343434);

  /// Black
  static const Color blackG = Color(0xFF202124);

  /// Black 100% opacity
  static const Color black100 = Colors.black;

  static const Color black06 = Color.fromRGBO(0, 0, 0, 0.6);

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

  static const Color grey35 = Color.fromRGBO(0, 0, 0, 0.35);
  static const Color grey10 = Color.fromRGBO(0, 0, 0, 0.1);

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

  static LinearGradient linearGradientForBackground = LinearGradient(
    colors: [
      const Color.fromRGBO(255, 255, 255, 0.3).withOpacity(0.9),
      const Color.fromRGBO(255, 255, 255, 0.7).withOpacity(0.9),
      const Color.fromRGBO(255, 255, 255, 0.9).withOpacity(0.8),
      const Color.fromRGBO(255, 255, 255, 0.9).withOpacity(0.9),
      const Color.fromRGBO(255, 255, 255, 0.6).withOpacity(0.9),
      const Color.fromRGBO(255, 255, 255, 0.3).withOpacity(0.8),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  //   static LinearGradient linearGradientBlueBox = LinearGradient(
  //   colors: [
  //     const Color.fromRGBO(255, 255, 255, 0.4).withOpacity(0.9),
  //     const Color.fromRGBO(255, 255, 255, 0.7).withOpacity(0.9),
  //     const Color.fromRGBO(255, 255, 255, 0.9).withOpacity(0.8),
  //     const Color.fromRGBO(255, 255, 255, 0.9).withOpacity(0.9),
  //     const Color.fromRGBO(255, 255, 255, 0.6).withOpacity(0.9),
  //     const Color.fromRGBO(255, 255, 255, 0.3).withOpacity(0.8),
  //   ],
  //   begin: Alignment.topLeft,
  //   end: Alignment.bottomRight,
  // );

  static const Color linearGradientBlueBoxShadow =
      Color.fromRGBO(49, 127, 242, 0.5);
  static const Color linearGradientBlueBox = Color(0xff317FF2);

  static const Color linearGradientGreenBoxShadow =
      Color.fromRGBO(15, 190, 0, 0.5);
  static const Color linearGradientGreenBox = Color(0xff0FBE00);

  static const Color linearGradientRedBoxShadow =
      Color.fromRGBO(255, 0, 0, 0.5);
  static const Color linearGradientRedBox = Color(0xffFF0000);

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

  static const LinearGradient linearGradientBlueBK = LinearGradient(
    colors: [
      Color(0xff394051),
      Color(0xff252935),
      // Color.fromRGBO(255, 255, 255, 0.5),

      //radial-gradient(50% 50% at 50% 50%, rgba(255, 255, 255, 0.6) 0%, rgba(255, 255, 255, 0.4)
    ],
    end: Alignment.bottomLeft,
  );
}
