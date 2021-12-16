import 'package:flutter/material.dart';

import '../utils/styles.dart';
import 'clickable_widget.dart';

class ArrowRightWidget extends StatelessWidget {
  final String textTitle;
  final String textSubTitle;
  final Color? textColor;
  final Color? arrowColor;
  final Function() onTap;
  const ArrowRightWidget(
      {required this.textSubTitle,
      required this.textTitle,
      this.textColor,
      this.arrowColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          textSubTitle.toUpperCase(),
          textAlign: TextAlign.start,
          // minFontSize: 5,
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: TextFontSize.getHeight(24, context).clamp(0, 24),
              color: textColor ?? Colors.black),
        ),
        Clickable(
          onPressed: onTap,
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            child: Icon(Icons.arrow_forward_rounded,
                color: arrowColor ?? Colors.white,
                size: HW.getHeight(65, context)),
          ),
        ),
      ],
    );
  }
}
