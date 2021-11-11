import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData iconData;

  const CircleButton({
    Key? key,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HW.getHeight(48, context),
      width: HW.getWidth(48, context),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.white,
            shape: const CircleBorder(),
            elevation: 5,
          ),
          onPressed: onPressed,
          child: Icon(
            iconData,
            size: HW.getHeight(21, context),
            color: AppColors.blackB,
          )),
    );
  }
}