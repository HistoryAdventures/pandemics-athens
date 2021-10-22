import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/colors.dart';
import '../../../../core/utils/styles.dart';

class ParalaxTextWidget extends StatelessWidget {
  final String text;
  final Alignment alignment;
  final Size size;
  final double opacity;

  const ParalaxTextWidget(
      {Key? key,
      required this.text,
      required this.alignment,
      required this.size,
      required this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Times.fast,
      opacity: opacity,
      child: Align(
        alignment: alignment,
        child: Container(
            color: AppColors.black06,
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.05,
            ),
            width: MediaQuery.of(context).size.width * 0.4,
            child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  text,
                  strutStyle: const StrutStyle(
                    height: 1.5,
                  ),
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: AppColors.white,
                        fontSize: TextFontSize.getHeight(24, context),
                      ),
                ))),
      ),
    );
  }
}
