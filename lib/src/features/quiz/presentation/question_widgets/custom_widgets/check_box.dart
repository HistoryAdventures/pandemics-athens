import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';

class CheckboxText extends StatefulWidget {
  bool value;
  final Text text;
  final String? image;
  final bool isImage;
  BoxDecoration decoration;
  final Function(bool val) onTap;

  CheckboxText({
    Key? key,
    required this.value,
    required this.text,
    required this.isImage,
    required this.image,
    required this.decoration,
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
      child: widget.isImage
          ? Container(
              decoration: widget.value
                  ? DottedDecoration(
                      color: AppColors.grey, shape: Shape.box, strokeWidth: 2)
                  : null,
              child: Container(
                decoration: widget.decoration,
                height: 200,
                width: 200,
                child: Image.asset(widget.image!),
              ),
            )
          : Row(
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
