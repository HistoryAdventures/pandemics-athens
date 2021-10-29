import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';

class SoundAndMenuWidget extends StatelessWidget {
  final Function() onTapVolume;
  final Function() onTapMenu;
  final IconData icons;
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
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButtonWidget(
              onPressed: onTapVolume,
              icon: Icon(
                icons,
              ),
              iconSize: 30,
              color: color ?? Colors.black,
            ),
            widget ?? const SizedBox(),
            IconButtonWidget(
                iconSize: 30,
                onPressed: onTapMenu,
                icon: Icon(
                  Icons.menu,
                  color: color ?? Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}
