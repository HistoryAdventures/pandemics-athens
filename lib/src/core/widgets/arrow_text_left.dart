import 'package:flutter/material.dart';
import '../utils/styles.dart';

import 'widgets.dart';

class ArrowLeftTextWidget extends StatelessWidget {
  final String textTitle;
  final String textSubTitle;
  final Color? color;
  final Function() onTap;
  const ArrowLeftTextWidget(
      {required this.textSubTitle,
      required this.textTitle,
      this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(right: 24),
              height: 40,
              width: 40,
              child: Icon(
                Icons.arrow_back,
                color: color ?? Colors.black,
                size: 40,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    textTitle.toUpperCase(),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: TextFontSize.getHeight(24, context),
                        color: color ?? Colors.black),
                  ),
                ),
                Flexible(
                  child: Text(
                    textSubTitle.toUpperCase(),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontSize: TextFontSize.getHeight(30, context),
                          color: color ?? Colors.black,
                        ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
