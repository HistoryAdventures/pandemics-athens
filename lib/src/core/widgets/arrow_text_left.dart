import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/assets_path.dart';
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Clickable(
              onPressed: onTap,
              child: Container(
                  margin: const EdgeInsets.only(right: 24),
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    AssetsPath.arrowBackImage,
                    color: color ?? Colors.black,
                  ))),
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
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontSize: 14, color: color ?? Colors.black),
                ),
              ),
              Flexible(
                child: AutoSizeText(
                  textSubTitle.toUpperCase(),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontSize: 26, color: color ?? Colors.black),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
