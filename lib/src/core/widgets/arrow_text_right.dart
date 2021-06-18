import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';

import 'widgets.dart';

class ArrowRightTextWidget extends StatelessWidget {
  final String textTitle;
  final String textSubTitle;
  final Function() onTap;
  const ArrowRightTextWidget(
      {required this.textSubTitle,
      required this.textTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  textTitle.toUpperCase(),
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontSize: 14),
                ),
                AutoSizeText(
                  textSubTitle.toUpperCase(),
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontSize: 26),
                )
              ],
            ),
          ),
          Flexible(
            child: Clickable(
                onPressed: onTap,
                child: Container(
                    margin: const EdgeInsets.only(right: 24),
                    height: 30,
                    width: 30,
                    child: Image.asset(AssetsPath.arrowForwardImage))),
          ),
        ],
      ),
    );
  }
}
