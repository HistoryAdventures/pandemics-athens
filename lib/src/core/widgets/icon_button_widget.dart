import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

import '../colors.dart';

class IconButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final Widget icon;
  double paddingBottom = 48;
  double iconSize = 24.0;
  IconButtonWidget({
    Key? key,
    this.color,
    this.paddingBottom = 48,
    this.iconSize = 24.0,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: HW.getHeight(paddingBottom, context)),
      child: IconButton(
          padding: EdgeInsets.zero,
          focusColor: AppColors.transpatent,
          splashColor: AppColors.transpatent,
          highlightColor: AppColors.transpatent,
          hoverColor: AppColors.transpatent,
          iconSize: iconSize,
          onPressed: onPressed,
          color: color,
          icon: icon),
    );
  }
}
