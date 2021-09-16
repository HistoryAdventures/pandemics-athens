import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
        Flexible(
          flex: 3,
          child: AutoSizeText(
            textSubTitle.toUpperCase(),
            textAlign: TextAlign.end,
            maxLines: 1,
            minFontSize: 5,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 24,
                  color: textColor ?? Colors.black,
                ),
          ),
        ),
        Flexible(
          child: Clickable(
            onPressed: onTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 40,
              child: Icon(
                Icons.arrow_forward,
                color: arrowColor ?? Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
