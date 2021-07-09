import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/clickable_widget.dart';

class ArrowLeftWidget extends StatelessWidget {
  final String textTitle;
  final String textSubTitle;
  final Function() onTap;
  const ArrowLeftWidget(
      {required this.textSubTitle,
      required this.textTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Clickable(
                onPressed: onTap,
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(AssetsPath.arrowBackImage))),
          ),
          Expanded(
            flex: 3,
            child: AutoSizeText(
              textSubTitle.toUpperCase(),
              textAlign: TextAlign.end,
              minFontSize: 5,
              maxLines: 1,
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
