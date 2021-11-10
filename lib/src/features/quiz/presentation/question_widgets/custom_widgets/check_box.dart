import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';

class CheckboxText extends StatefulWidget {
  bool value;
  bool? isCorrect;
  final String text;
  final Function(bool val) onTap;

  CheckboxText(
      {Key? key,
      required this.value,
      required this.text,
      required this.onTap,
      required this.isCorrect})
      : super(key: key);

  @override
  _CheckboxTextState createState() => _CheckboxTextState();
}

class _CheckboxTextState extends State<CheckboxText> {
  // // late bool value;
  // @override
  // void initState() {
  //   value = widget.value;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onPressed: () {
        widget.onTap(widget.value);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
                color: widget.value ? AppColors.orange : AppColors.transpatent,
                border: widget.value
                    ? null
                    : Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(2)),
            child: Visibility(
              visible: widget.value,
              child: const Center(
                child: Icon(
                  Icons.done,
                  color: AppColors.white,
                  size: 12,
                ),
              ),
            ),
          ),
          AutoSizeText(
            widget.text,
            style: widget.isCorrect == null
                ? Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: TextFontSize.getHeight(16, context))
                : widget.isCorrect!
                    ? Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.green,
                        fontSize: TextFontSize.getHeight(16, context))
                    : Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.red,
                        fontSize: TextFontSize.getHeight(16, context)),
          ),
        ],
      ),
    );
  }
}
