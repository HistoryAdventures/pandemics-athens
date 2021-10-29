import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../colors.dart';

class IconButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final Widget icon;
  double iconSize = 24.0;
  IconButtonWidget({
    Key? key,
    this.color,
    this.iconSize = 24.0,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        focusColor: AppColors.transpatent,
        splashColor: AppColors.transpatent,
        highlightColor: AppColors.transpatent,
        hoverColor: AppColors.transpatent,
        iconSize: iconSize,
        onPressed: onPressed,
        color: color,
        icon: icon);
  }
}
