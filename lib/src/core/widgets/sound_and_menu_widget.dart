import 'package:flutter/material.dart';

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
            IconButton(
              onPressed: onTapVolume,
              icon: Icon(icons),
              color: color ?? Colors.black,
            ),
            widget ?? const SizedBox(),
            IconButton(
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
