import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../utils/styles.dart';

import 'widgets.dart';

class ArrowLeftTextWidget extends StatelessWidget {
  final String textTitle;
  final String textSubTitle;
  final Color? color;
  final Function() onTap;
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
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(right: 24),
                child: Icon(
                  Icons.arrow_back,
                  color: color ?? Colors.black,
                  size: HW.getWidth(37, context),
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
                    child: AutoSizeText(
                      textTitle.toUpperCase(),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      maxFontSize: 14,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          fontSize: 14, color: color ?? Colors.black),
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      textSubTitle.toUpperCase(),
                      textAlign: TextAlign.left,
                      maxFontSize: 24,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontSize: 24,
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
