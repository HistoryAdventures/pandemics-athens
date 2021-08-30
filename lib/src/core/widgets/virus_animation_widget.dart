import 'package:flutter/material.dart';

import 'animated_widgets/gif_contrrol.dart';

class VirusModel extends StatelessWidget {
  const VirusModel(
      {required this.widgets,
      this.onTap,
      this.constraints,
      this.gifController,
      required this.name,
      required this.description});
  //final String widget;
  //final Key key;
  final List<String> widgets;
  final String description;
  final VoidCallback? onTap;
  final GifController? gifController;
  final String name;
  final Size? constraints;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
          color: Colors.white.withOpacity(0),
          child: widgets.length == 1
              ? Image.asset(widgets[0])
              : Stack(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: constraints!.height * 0.35,
                      width: constraints!.width * 0.35,
                      child: GifImage(
                        controller: gifController!,
                        image: AssetImage(widgets[0]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: constraints!.height * 0.35,
                      width: constraints!.width * 0.35,
                      child: GifImage(
                        controller: gifController!,
                        image: AssetImage(widgets[1]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: constraints!.height * 0.35,
                      width: constraints!.width * 0.35,
                      child: GifImage(
                        controller: gifController!,
                        image: AssetImage(widgets[2]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      height: constraints!.height * 0.35,
                      width: constraints!.width * 0.35,
                      child: GifImage(
                        controller: gifController!,
                        image: AssetImage(widgets[3]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: constraints!.height * 0.35,
                      width: constraints!.width * 0.35,
                      child: GifImage(
                        controller: gifController!,
                        image: AssetImage(widgets[4]),
                      ),
                    ),
                  ),
                ])),
    );
  }
}
