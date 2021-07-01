import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/clickable_widget.dart';

class ArrowRightWidget extends StatelessWidget {
  final String textTitle;
  final String textSubTitle;
  final Function() onTap;
  const ArrowRightWidget(
      {required this.textSubTitle,
      required this.textTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: AutoSizeText(
              textSubTitle.toUpperCase(),
              maxLines: 1,
              minFontSize: 5,
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 24),
            ),
          ),
          Expanded(
            child: Clickable(
                onPressed: onTap,
                child: Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(AssetsPath.arrowForwardImage))),
          ),
        ],
      ),
    );
  }
}
