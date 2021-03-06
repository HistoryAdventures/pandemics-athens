// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

import '../../features/pandemic_info/presentation/models/virus_model.dart';
import 'animated_widgets/gif_contrrol.dart';
import 'widgets.dart';

class VirusModelWidget extends StatefulWidget {
  const VirusModelWidget({
    this.onTap,
    this.constraints,
    this.gifController,
    this.onTapEbola,
    this.onTapSmall,
    this.onTapBubonik,
    this.onTapTiphid,
    this.onTapTiphius,
    required this.virusModel,
  });

  final VoidCallback? onTap;
  final GifController? gifController;
  final VirusModel virusModel;
  final Size? constraints;
  final VoidCallback? onTapBubonik;
  final VoidCallback? onTapEbola;
  final VoidCallback? onTapSmall;
  final VoidCallback? onTapTiphid;
  final VoidCallback? onTapTiphius;

  @override
  _VirusModelWidgetState createState() => _VirusModelWidgetState();
}

class _VirusModelWidgetState extends State<VirusModelWidget> {
  @override
  void initState() {
    widget.virusModel.widgets.forEach((element) async {
      // ignore: undefined_prefixed_name
      await ui.platformViewRegistry.registerViewFactory(
        element,
        (int id) => html.ImageElement()
          // ignore: unsafe_html
          ..src = element
          ..height = (widget.constraints!.height * 0.4).toInt()
          ..width = (widget.constraints!.height * 0.4).toInt()
          ..style.border = 'none'
          ..style.objectFit = 'contain',
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: Colors.white.withOpacity(0),
        child: widget.virusModel.widgets.length == 1
            ? Container(
                padding: EdgeInsets.only(
                  right: HW.getWidth(200, context),
                ),
                height: widget.constraints!.height * 0.7,
                width: widget.constraints!.height * 0.8,
                child: IgnorePointer(
                  child: Image.asset(
                    widget.virusModel.widgets[0].substring(7),
                    height: widget.constraints!.height * 0.4,
                    width: widget.constraints!.width * 0.4,
                  ),
                ),
              )
            : Stack(
                children: [
                  Positioned(
                    top: widget.constraints!.height * 0.10,
                    left: widget.constraints!.width * 0.30,
                    child: Clickable(
                      onPressed: widget.onTapBubonik,
                      child: SizedBox(
                        width: widget.constraints!.height * 0.4,
                        child: IgnorePointer(
                          child: Image.asset(
                            widget.virusModel.widgets[0].substring(7),
                            height: widget.constraints!.height * 0.4,
                            width: widget.constraints!.width * 0.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: widget.constraints!.height * 0.23,
                    left: widget.constraints!.width * 0.05,
                    child: Clickable(
                      onPressed: widget.onTapEbola,
                      child: SizedBox(
                        width: widget.constraints!.height * 0.4,
                        child: IgnorePointer(
                          child: Image.asset(
                            widget.virusModel.widgets[4].substring(7),
                            height: widget.constraints!.height * 0.4,
                            width: widget.constraints!.width * 0.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: widget.constraints!.height * 0.33,
                    left: widget.constraints!.width * 0.23,
                    child: Clickable(
                      onPressed: widget.onTapTiphius,
                      child: SizedBox(
                        width: widget.constraints!.width * 0.24,
                        child: IgnorePointer(
                          child: Image.asset(
                            widget.virusModel.widgets[1].substring(7),
                            height: widget.constraints!.height * 0.4,
                            width: widget.constraints!.width * 0.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: widget.constraints!.height * 0.08,
                    left: widget.constraints!.width * 0.15,
                    child: Clickable(
                      onPressed: widget.onTapSmall,
                      child: SizedBox(
                        width: widget.constraints!.height * 0.3,
                        child: IgnorePointer(
                          child: Image.asset(
                            widget.virusModel.widgets[3].substring(7),
                            height: widget.constraints!.height * 0.4,
                            width: widget.constraints!.width * 0.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: widget.constraints!.height * 0.45,
                    left: widget.constraints!.width * 0.13,
                    child: Clickable(
                      onPressed: widget.onTapTiphid,
                      child: SizedBox(
                        width: widget.constraints!.height * 0.35,
                        child: IgnorePointer(
                          child: HtmlElementView(
                            viewType: widget.virusModel.widgets[2],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
