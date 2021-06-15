import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
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
                  child: Image.asset('assets/icons/arrow_back.png'))),
        ),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AutoSizeText(
                textTitle.toUpperCase(),
                maxLines: 1,
                style: DefaultTheme.standard.textTheme.caption
                    ?.copyWith(fontSize: 14),
              ),
              AutoSizeText(
                textSubTitle.toUpperCase(),
                maxLines: 1,
                style: DefaultTheme.standard.textTheme.headline2
                    ?.copyWith(fontSize: 26),
              )
            ],
          ),
        )
      ],
    );
  }
}
