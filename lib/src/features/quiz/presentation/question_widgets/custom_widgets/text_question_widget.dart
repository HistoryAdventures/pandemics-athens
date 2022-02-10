import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class TextQuestion extends StatelessWidget {
  final String text;
  const TextQuestion({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        maxLines: 3,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(fontSize: TextFontSize.getHeight(16, context)),
      ),
    );
  }
}
