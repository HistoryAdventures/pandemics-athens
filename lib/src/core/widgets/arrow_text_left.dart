import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../utils/styles.dart';

import 'widgets.dart';

class ArrowLeftTextWidget extends StatelessWidget {
  final String textTitle;
  final String textSubTitle;
  final Color? color;
  final VoidCallback? onTap;
  double? left;
  double? bottom;
  ArrowLeftTextWidget(
      {required this.textSubTitle,
      required this.textTitle,
      this.color,
      this.left = 64,
      this.bottom = 48,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: HW.getWidth(left!, context),
          bottom: HW.getHeight(bottom!, context)),
      child: Clickable(
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: Icon(
                Icons.arrow_back,
                color: color ?? Colors.black,
                size: HW.getWidth(60, context),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      textTitle.toUpperCase(),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      maxFontSize: 13,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          fontSize: 13, color: color ?? Colors.black),
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      textSubTitle.toUpperCase(),
                      textAlign: TextAlign.left,
                      maxFontSize: 23,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontSize: 23,
                            color: color ?? Colors.black,
                          ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
