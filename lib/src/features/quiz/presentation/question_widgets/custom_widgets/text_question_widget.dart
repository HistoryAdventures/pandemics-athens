import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import '../../../../../core/utils/styles.dart';

class TextQuestion extends StatelessWidget {
  final String text;
  const TextQuestion({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(fontSize: TextFontSize.getHeight(16, context)),
      ),
    );
  }
}
