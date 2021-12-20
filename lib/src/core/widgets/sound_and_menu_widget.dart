import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/clickable_widget.dart';

class SoundAndMenuWidget extends StatelessWidget {
  final Function() onTapVolume;
  final Function() onTapMenu;
  final double? soundIconWidth;
  final double? soundIconHeight;
  final double? menuButtonWidth;
  final double? menuButtonHeight;
  final String icons;
  final Color? color;
  final Widget? widget;
  const SoundAndMenuWidget({
    Key? key,
    required this.onTapVolume,
    required this.icons,
    this.color,
    this.widget,
    required this.onTapMenu,
    this.menuButtonHeight,
    this.menuButtonWidth,
    this.soundIconHeight,
    this.soundIconWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(
            left: HW.getWidth(60, context),
            right: HW.getWidth(60, context),
            top: HW.getHeight(52, context),
            bottom: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Clickable(
              onPressed: onTapVolume,
              child: SizedBox(
                height: soundIconHeight ?? HW.getWidth(32, context),
                width: soundIconWidth ?? HW.getWidth(32, context),
                child: Image.asset(
                  icons,
                  fit: BoxFit.contain,
                  color: color ?? Colors.black,
                ),
              ),
            ),
            widget ?? const SizedBox(),
            Clickable(
              onPressed: onTapMenu,
              child: SizedBox(
                height: menuButtonHeight ?? HW.getHeight(30, context),
                width: menuButtonWidth ?? HW.getWidth(40, context),
                child: Image.asset(
                  AssetsPath.iconMenu,
                  fit: BoxFit.contain,
                  color: color ?? Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
