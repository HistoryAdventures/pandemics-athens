import 'dart:math';

import 'package:flutter/material.dart';

extension Btx on BuildContext {
  double get diagonal => sqrt(width * width + height * height);

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
