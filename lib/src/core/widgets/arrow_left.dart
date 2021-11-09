import 'package:flutter/material.dart';
import '../colors.dart';
import '../utils/styles.dart';

import 'clickable_widget.dart';

class ArrowLeftWidget extends StatelessWidget {
  final String textTitle;
  final String textSubTitle;
  final Color? textColor;
  final Color? arrowColor;
  final Function() onTap;
  const ArrowLeftWidget(
      {required this.textSubTitle,
      required this.textTitle,
      this.textColor,
      this.arrowColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Clickable(
            onPressed: onTap,
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.arrow_back,
                color: arrowColor ?? Colors.white,
                size: HW.getHeight(40, context),
              ),
            ),
          ),
          Text(
            textSubTitle.toUpperCase(),
            textAlign: TextAlign.end,
            maxLines: 1,
            // minFontSize: 5,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: TextFontSize.getHeight(24, context).clamp(0, 24),
                  color: textColor ?? Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
