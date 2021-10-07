import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';

class CheckboxText extends StatefulWidget {
  bool value;
  final String text;
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
          SizedBox(
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}
