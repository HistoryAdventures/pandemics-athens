import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';

class ArrowTextBottomWidget extends StatelessWidget {
  final String textChapter;
  final String textChapterName;
  final Function() onPressed;

  const ArrowTextBottomWidget(
      {Key? key,
      required this.textChapter,
      required this.textChapterName,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Clickable(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      textChapter.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(fontSize: 14),
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      textChapterName,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 45,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
