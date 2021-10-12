import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';

class SelectImage extends StatefulWidget {
  final String image;
  int value;
  int groupValue;
  final Function(int val) onTap;
  final Decoration? decoration;
  SelectImage(
      {Key? key,
      required this.image,
      required this.value,
      required this.onTap,
      required this.decoration,
      required this.groupValue})
      : super(key: key);

  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  @override
  Widget build(BuildContext context) {
    return Clickable(
      onPressed: () {
        widget.onTap(widget.value);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: widget.decoration,
        child: Container(
          height: 200,
          width: 200,
          decoration: widget.value == widget.groupValue
              ? BoxDecoration(
                  border: Border.all(color: AppColors.blueDeep, width: 3),
                )
              : null,
          child: Image.asset(widget.image),
        ),
      ),
    );
  }
}
