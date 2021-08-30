import 'package:flutter/widgets.dart';

import '../colors.dart';
import 'font_family.dart';
import 'font_weight.dart';

/// History of Adventures Text Style Definitions
class AppTextStyle {
  static const _baseTextStyle = TextStyle(
      fontFamily: AppFontFamily.openSans,
      color: AppColors.blackB,
      fontStyle: FontStyle.normal);

  static const _titleTextStyleItalic = TextStyle(
      fontFamily: AppFontFamily.openSans,
      color: AppColors.blackB,
      fontStyle: FontStyle.italic);

  static const _titleTextStyleBold = TextStyle(
    fontFamily: AppFontFamily.bebasNeue,
    color: AppColors.blackB,
  );

  static const _titleTextStyleLoraItalic = TextStyle(
    fontFamily: AppFontFamily.lora,
    fontStyle: FontStyle.italic,
    color: AppColors.blackB,
  );
  static const _titleTextStyleLora = TextStyle(
    fontFamily: AppFontFamily.lora,
    fontStyle: FontStyle.normal,
    color: AppColors.blackB,
  );

  /// Headline 1 Text Style
  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      //fontWeight: AppFontWeight.medium,
    );
  }

  /// Headline 2 Text Style
  static TextStyle get headline2 {
    return _titleTextStyleBold.copyWith(
      fontSize: 36,
      // fontWeight: AppFontWeight.regular,
    );
  }

  /// Headline 3 Text Style
  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Headline 4 Text Style
  static TextStyle get headline4 {
    return _titleTextStyleLoraItalic.copyWith(
      fontSize: 16,
    );
  }

  /// Headline 5 Text Style
  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 36,
      //fontWeight: AppFontWeight.medium,
    );
  }

  /// Headline 6 Text Style
  static TextStyle get headline6 {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      //fontWeight: AppFontWeight.bold,
    );
  }

  /// Subtitle 1 Text Style
  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      //fontWeight: AppFontWeight.bold,
    );
  }

  /// Subtitle 2 Text Style
  static TextStyle get subtitle2 {
    return _titleTextStyleItalic.copyWith(
      fontSize: 24,
      //fontWeight: AppFontWeight.bold,
    );
  }

  /// Body Text 1 Text Style
  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      //fontWeight: AppFontWeight.medium,
    );
  }

  /// Body Text 2 Text Style (the default)
  static TextStyle get bodyText2 {
    return _titleTextStyleLora.copyWith(
      fontSize: 16,
      //fontWeight: AppFontWeight.regular,
    );
  }

  /// Caption Text Style
  static TextStyle get caption {
    return _titleTextStyleItalic.copyWith(
      fontSize: 60,
      //fontWeight: AppFontWeight.regular,
    );
  }

  /// Overline Text Style
  static TextStyle get overline {
    return _titleTextStyleBold.copyWith(
      fontSize: 120,
      //fontWeight: AppFontWeight.regular,
    );
  }

  /// Button Text Style
  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      //fontWeight: AppFontWeight.medium,
    );
  }
}
