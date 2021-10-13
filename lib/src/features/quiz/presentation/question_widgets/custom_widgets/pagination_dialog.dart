import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';

class ShowPadinationWidget extends StatefulWidget {
  void Function(int) onTap;
  ShowPadinationWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  _ShowPadinationWidgetState createState() => _ShowPadinationWidgetState();
}

class _ShowPadinationWidgetState extends State<ShowPadinationWidget> {
  List<int> list = List<int>.generate(11, (i) => i + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blue,
          margin: EdgeInsets.only(top: 120),
          child: Wrap(
            children: list.map((e) {
              return InkWell(
                onTap: () {
                  widget.onTap(e);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all(color: AppColors.blueDeep)),
                  child: Align(
                    child: Text(e == 11 ? "i" : "${e}"),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
