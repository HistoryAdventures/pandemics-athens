import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class TextQuestion extends StatelessWidget {
  final String text;
  const TextQuestion({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontSize: TextFontSize.getHeight(30, context)),
      ),
    );
  }
}
