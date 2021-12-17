import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

class AppUpButton extends StatelessWidget {
  final Function? onTap;
  const AppUpButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Image.asset(
        AssetsPath.med,
        fit: BoxFit.contain,
        height: HW.getHeight(36, context),
      ),
    );
  }
}
