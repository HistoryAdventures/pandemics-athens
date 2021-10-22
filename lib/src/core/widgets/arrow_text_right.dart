import 'package:flutter/material.dart';
import '../utils/styles.dart';

import 'widgets.dart';

class ArrowRightTextWidget extends StatelessWidget {
  final String textTitle;
  final String textSubTitle;
  final Color? color;
  final Function() onTap;
  const ArrowRightTextWidget(
      {required this.textSubTitle,
      required this.textTitle,
      this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    textTitle.toUpperCase(),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: TextFontSize.getHeight(24, context),
                        color: color ?? Colors.black),
                  ),
                ),
                Flexible(
                  child: Text(
                    textSubTitle.toUpperCase(),
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontSize: TextFontSize.getHeight(30, context),
                        color: color ?? Colors.black),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 24),
              height: 40,
              width: 40,
              child: Icon(
                Icons.arrow_forward,
                color: color ?? Colors.black,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
