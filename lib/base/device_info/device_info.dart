import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//Override default method, to provide .io access
import 'dart:io';


enum FormFactorType { Monitor, SmallPhone, LargePhone, Tablet }

class DeviceOS {
  // Syntax sugar, proxy the CurrentPlatform methods so our views can reference a single class
  static bool isIOS = CurrentPlatform.isIOS;
  static bool isAndroid = CurrentPlatform.isAndroid;
  static bool isMacOS = CurrentPlatform.isMacOS;
  static bool isLinux = CurrentPlatform.isLinux;
  static bool isWindows = CurrentPlatform.isWindows;

  // Higher level device class abstractions (more syntax sugar for the views)
  static bool isWeb = kIsWeb;
  static bool get isDesktop => isWindows || isMacOS || isLinux;
  static bool get isMobile => isAndroid || isIOS;
  static bool get isDesktopOrWeb => isDesktop || isWeb;
  static bool get isMobileOrWeb => isMobile || isWeb;
}

class DeviceScreen {
  // Get the device form factor as best we can.
  // Otherwise we will use the screen size to determine which class we fall into.
  static FormFactorType get(BuildContext context) {
    if (context.diagonalPx <= 550) return FormFactorType.SmallPhone;
    if (context.diagonalPx <= 900) return FormFactorType.LargePhone;
    if (context.diagonalPx <= 1500) return FormFactorType.Tablet;
    return FormFactorType.Monitor;
  }

  // Shortcuts for various mobile device types
  static bool isPhone(BuildContext context) =>
      isSmallPhone(context) || isLargePhone(context);
  static bool isTablet(BuildContext context) =>
      get(context) == FormFactorType.Tablet;
  static bool isMonitor(BuildContext context) =>
      get(context) == FormFactorType.Monitor;
  static bool isSmallPhone(BuildContext context) =>
      get(context) == FormFactorType.SmallPhone;
  static bool isLargePhone(BuildContext context) =>
      get(context) == FormFactorType.LargePhone;
}

enum PlatformType { Web, Windows, Linux, MacOS, Android, Fuchsia, IOS }

PlatformType get currentPlatform {
  if (Platform.isWindows) return PlatformType.Windows;
  if (Platform.isFuchsia) return PlatformType.Fuchsia;
  if (Platform.isMacOS) return PlatformType.MacOS;
  if (Platform.isLinux) return PlatformType.Linux;
  if (Platform.isIOS) return PlatformType.IOS;
  return PlatformType.Android;
}

abstract class CurrentPlatform {
  static bool get isWeb => currentPlatform == PlatformType.Web;
  static bool get isMacOS => currentPlatform == PlatformType.MacOS;
  static bool get isWindows => currentPlatform == PlatformType.Windows;
  static bool get isLinux => currentPlatform == PlatformType.Linux;
  static bool get isAndroid => currentPlatform == PlatformType.Android;
  static bool get isIOS => currentPlatform == PlatformType.IOS;
  static bool get isFuchsia => currentPlatform == PlatformType.Fuchsia;
}
extension SizedContext on BuildContext {
  
  double get pixelsPerInch => CurrentPlatform.isAndroid || CurrentPlatform.isIOS? 150 : 96;
  
  /// Returns same as MediaQuery.of(context)
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Returns same as MediaQuery.of(context).size
  Size get sizePx => mq.size;
  
  /// Returns same as MediaQuery.of(context).size.width
  double get widthPx => sizePx.width;
  
  /// Returns same as MediaQuery.of(context).height
  double get heightPx => sizePx.height;

  /// Returns diagonal screen pixels
  double get diagonalPx {
    final Size s = sizePx;
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  /// Returns pixel size in Inches
  Size get sizeInches {
    final Size pxSize = sizePx;
    return Size(pxSize.width / pixelsPerInch, pxSize.height / pixelsPerInch);
  }

  /// Returns screen width in Inches
  double get widthInches => sizeInches.width;

  /// Returns screen height in Inches
  double get heightInches => sizeInches.height;

  /// Returns screen diagonal in Inches
  double get diagonalInches => diagonalPx / pixelsPerInch;

  /// Returns fraction (0-1) of screen width in pixels
  double widthPct(double fraction) => fraction * widthPx;
  
  /// Returns fraction (0-1) of screen height in pixels
  double heightPct(double fraction) => fraction * heightPx;

}
