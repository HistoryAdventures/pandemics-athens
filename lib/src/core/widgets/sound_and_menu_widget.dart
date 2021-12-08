import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/clickable_widget.dart';

class SoundAndMenuWidget extends StatelessWidget {
  final Function() onTapVolume;
  final Function() onTapMenu;
  final String icons;
  final Color? color;
  final Widget? widget;
  const SoundAndMenuWidget(
      {Key? key,
      required this.onTapVolume,
      required this.icons,
      this.color,
      this.widget,
      required this.onTapMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.fromLTRB(
            HW.getWidth(60, context), 24, HW.getWidth(60, context), 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Clickable(
              onPressed: onTapVolume,
              child: SizedBox(
                height: HW.getHeight(25, context),
                width: HW.getWidth(26, context),
                child: Image.asset(
                  icons,
                  color: color ?? Colors.black,
                ),
              ),
            ),
            widget ?? const SizedBox(),
            Clickable(
              onPressed: onTapMenu,
              child: SizedBox(
                height: HW.getHeight(35, context),
                width: HW.getWidth(35, context),
                child: Image.asset(
                  AssetsPath.iconMenu,
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
