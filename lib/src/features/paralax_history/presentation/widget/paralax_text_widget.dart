import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/colors.dart';
import '../../../../core/utils/styles.dart';

class ParalaxTextWidget extends StatelessWidget {
  final String text;
  final Size size;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const ParalaxTextWidget(
      {Key? key,
      required this.text,
      required this.size,
      this.top,
      this.bottom,
      this.left,
      this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
          color: AppColors.black06,
          width: size.width,
          height: size.height,
          child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                text,
                strutStyle: const StrutStyle(
                  height: 1.5,
                ),
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: AppColors.white,
                      fontSize: TextFontSize.getHeight(16, context),
                    ),
              ))),
    );
  }
}
