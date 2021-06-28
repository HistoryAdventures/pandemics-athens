import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/assets_path.dart';
import 'widgets.dart';

class ArrowLeftTextWidget extends StatelessWidget {
  final String textTitle;
  final String textSubTitle;
  final Function() onTap;
  const ArrowLeftTextWidget(
      {required this.textSubTitle,
      required this.textTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Clickable(
              onPressed: onTap,
              child: Container(
                  margin: const EdgeInsets.only(right: 24),
                  height: 30,
                  width: 30,
                  child: Image.asset(AssetsPath.arrowBackImage))),
        ),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: AutoSizeText(
                  textTitle.toUpperCase(),
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontSize: 14),
                ),
              ),
              Flexible(
                child: AutoSizeText(
                  textSubTitle.toUpperCase(),
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontSize: 26),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
