import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/assets_path.dart';
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
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: AutoSizeText(
              textSubTitle.toUpperCase(),
              textAlign: TextAlign.end,
              maxLines: 1,
              minFontSize: 5,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontSize: 24, color: textColor ?? Colors.black),
            ),
          ),
          Expanded(
            child: Clickable(
                onPressed: onTap,
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(AssetsPath.arrowForwardImage,
                        color: arrowColor ?? Colors.white))),
          ),
        ],
      ),
    );
  }
}