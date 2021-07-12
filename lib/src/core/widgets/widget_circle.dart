import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';

class CircleWidgets extends StatelessWidget {
  final double top;
  final double left;
  final double right;
  final double bottom;
  final Animation<double> animation;
  final Color color;
  final double height;
  final double width;

  const CircleWidgets(
      {Key? key,
      required this.top,
      required this.left,
      required this.right,
      required this.height,
      required this.width,
      required this.animation,
      required this.bottom,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(animation.value, animation.value),
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(15),
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.5,
                spreadRadius: 4.5,
                color: AppColors.grey.withOpacity(0.4),
              ),
            ],
          ),
          height: height,
          width: width,
        ),
      ),
    );
  }
}
