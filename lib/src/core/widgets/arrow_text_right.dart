import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../utils/styles.dart';

import 'widgets.dart';

class ArrowRightTextWidget extends StatelessWidget {
  final String textTitle;
  final String textSubTitle;
  final Color? color;
 final VoidCallback? onTap;
  double? right;
  double? bottom;
  ArrowRightTextWidget(
      {required this.textSubTitle,
      required this.textTitle,
      this.color,
      this.right = 64,
      this.bottom = 48,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: HW.getWidth(right!, context),
          bottom: HW.getHeight(bottom!, context)),
      child: Clickable(
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      textTitle.toUpperCase(),
                      maxFontSize: 14,
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          fontSize: 14, color: color ?? Colors.black),
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      textSubTitle.toUpperCase(),
                      maxFontSize: 24,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontSize: 24, color: color ?? Colors.black),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 24),
                child: Icon(
                  Icons.arrow_forward,
                  color: color ?? Colors.black,
                  size: HW.getHeight(37, context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
