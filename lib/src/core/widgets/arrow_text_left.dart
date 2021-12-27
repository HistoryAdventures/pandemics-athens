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
      this.bottom,
      this.left,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    left = left ?? HW.getWidth(52, context);
    bottom = bottom ?? HW.getHeight(55, context);

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
              margin: EdgeInsets.only(right: HW.getWidth(15, context)),
              child: Icon(
                Icons.arrow_back_rounded,
                color: color ?? Colors.black,
                size: HW.getWidth(60, context),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textTitle.toUpperCase(),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: HW.getHeight(15, context),
                        color: color ?? Colors.black),
                  ),
                  SizedBox(height: HW.getHeight(5, context)),
                  Text(
                    textSubTitle.toUpperCase(),
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontSize: HW.getHeight(25, context),
                        color: color ?? Colors.black),
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
