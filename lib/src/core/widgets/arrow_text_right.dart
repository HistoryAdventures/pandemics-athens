import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/assets_path.dart';
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: AutoSizeText(
                  textTitle.toUpperCase(),
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontSize: 14, color: color ?? Colors.black),
                ),
              ),
              Flexible(
                child: AutoSizeText(
                  textSubTitle.toUpperCase(),
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontSize: 26, color: color ?? Colors.black),
                ),
              )
            ],
          ),
        ),
        Flexible(
          child: Clickable(
            onPressed: onTap,
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
        ),
      ],
    );
  }
}
