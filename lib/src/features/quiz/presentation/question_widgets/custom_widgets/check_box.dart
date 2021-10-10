import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';

class CheckboxText extends StatefulWidget {
  bool value;
  final Text text;
  final Function(bool val) onTap;

  CheckboxText({
    Key? key,
    required this.value,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  _CheckboxTextState createState() => _CheckboxTextState();
}

class _CheckboxTextState extends State<CheckboxText> {
  // late bool value;
  @override
  // void initState() {
  //   value = widget.value;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onPressed: () {
        widget.onTap(widget.value);
        // setState(() {
        //   widget.value = !widget.value;
        // });
      },
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: Visibility(
              visible: widget.value,
              child: const Icon(Icons.done),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Flexible(
            child: widget.text,
          )
        ],
      ),
    );
  }
}
