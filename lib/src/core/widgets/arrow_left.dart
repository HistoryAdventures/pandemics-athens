import 'package:flutter/material.dart';
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
    return SizedBox(
      child: Row(
        children: [
          Flexible(
            child: Clickable(
              onPressed: onTap,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 37,
                width: 37,
                child: Icon(
                  Icons.arrow_back,
                  color: arrowColor ?? Colors.white,
                  size: 37,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(
              textSubTitle.toUpperCase(),
              textAlign: TextAlign.start,
              // minFontSize: 5,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: TextFontSize.getHeight(24, context).clamp(0, 24),
                  color: textColor ?? Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
