import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

class ZoomInNotesWidget extends StatelessWidget {
  const ZoomInNotesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: HW.getHeight(48, context),
        width: HW.getWidth(85, context),
        child: Image.asset(
          AssetsPath.iconInfo,
          fit: BoxFit.contain,
        ));
  }
}
