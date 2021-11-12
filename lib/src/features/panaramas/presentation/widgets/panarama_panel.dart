import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

class PanelWidget extends StatelessWidget {
  final String text;
  const PanelWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.blackG.withOpacity(0.75),
        width: HW.getWidth(772, context),
        height: HW.getHeight(384, context),
        child: Padding(
            padding: const EdgeInsets.all(14),
            child: ListView(
              padding: const EdgeInsets.all(14),
              children: [
                Text(
                  text,
                  strutStyle: const StrutStyle(
                    fontSize: 16.0,
                    height: 2,
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: AppColors.white),
                )
              ],
            )));
  }
}
