import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData iconData;
  final Widget? child;
  final EdgeInsets? padding;

  const CircleButton({
    Key? key,
    required this.onPressed,
    required this.iconData,
    this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HW.getHeight(50, context),
      width: HW.getWidth(50, context),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.white,
            shape: const CircleBorder(),
            elevation: 5,
          ),
          onPressed: onPressed,
          child: Container(
            padding: padding,
            child: child ??
                Icon(
                  iconData,
                  size: HW.getHeight(30, context),
                  color: AppColors.blackB,
                ),
          )),
    );
  }
}
