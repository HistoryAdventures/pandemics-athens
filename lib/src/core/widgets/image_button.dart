import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

class ImageButton extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;
  final Function onTap;
  const ImageButton({
    Key? key,
    required this.asset,
    this.height,
    this.width,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Image.asset(
            asset,
            fit: BoxFit.contain,
            width: HW.getWidth(30, context),
            alignment: Alignment.center,
            height: HW.getWidth(30, context),
          ),
        ),
      ),
    );
  }
}
