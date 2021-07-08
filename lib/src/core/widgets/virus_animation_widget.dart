import 'package:flutter/material.dart';

import '../colors.dart';

class VirusModel extends StatelessWidget {
  const VirusModel({required this.widget, this.onTap, required this.name});
  final String widget;
  final VoidCallback? onTap;
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
          color: Colors.white.withOpacity(0),
          child: InkWell(
              splashColor: AppColors.transpatent,
              highlightColor: AppColors.transpatent,
              focusColor: AppColors.transpatent,
              hoverColor: AppColors.transpatent,
              onTap: onTap,
              child: Image.asset(widget))),
    );
  }
}
