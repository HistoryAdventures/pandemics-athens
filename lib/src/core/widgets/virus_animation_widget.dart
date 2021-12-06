// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

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
    widget.virusModel.widgets.forEach((element) {
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        element,
        (int id) => html.ImageElement()
          ..style.border = 'none'
          // ignore: unsafe_html
          ..src = element
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
            ? Image.asset(widget.virusModel.widgets[0])
            : Stack(
                children: [
                  Positioned(
                    top: widget.constraints!.height * 0.16,
                    left: widget.constraints!.width * 0.25,
                    child: SizedBox(
                      height: widget.constraints!.height * 0.4,
                      width: widget.constraints!.width * 0.4,
                      child: Stack(
                        children: [
                          IgnorePointer(
                            child: HtmlElementView(
                              viewType: widget.virusModel.widgets[0],
                            ),
                          ),
                          Positioned(
                            top: widget.constraints!.height * 0.15,
                            left: widget.constraints!.width * 0.05,
                            child: Clickable(
                                onPressed: widget.onTapBubonik,
                                child: SizedBox(
                                  height: widget.constraints!.height * 0.1,
                                  width: widget.constraints!.width * 0.1,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: widget.constraints!.height * 0.33,
                    left: widget.constraints!.width * 0.23,
                    child: SizedBox(
                      height: widget.constraints!.height * 0.3,
                      width: widget.constraints!.width * 0.3,
                      child: Stack(
                        children: [
                          IgnorePointer(
                            child: HtmlElementView(
                              viewType: widget.virusModel.widgets[1],
                            ),
                          ),
                          Positioned(
                            top: widget.constraints!.height * 0.12,
                            left: widget.constraints!.width * 0.05,
                            child: Clickable(
                                onPressed: widget.onTapTiphius,
                                child: SizedBox(
                                  height: widget.constraints!.height * 0.08,
                                  width: widget.constraints!.width * 0.1,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: widget.constraints!.height * 0.45,
                    left: widget.constraints!.width * 0.13,
                    child: SizedBox(
                      height: widget.constraints!.height * 0.35,
                      width: widget.constraints!.width * 0.35,
                      child: Stack(
                        children: [
                          IgnorePointer(
                            child: HtmlElementView(
                              viewType: widget.virusModel.widgets[2],
                            ),
                          ),
                          Positioned(
                            top: widget.constraints!.height * 0.13,
                            left: widget.constraints!.width * 0.05,
                            child: Clickable(
                                onPressed: widget.onTapTiphid,
                                child: SizedBox(
                                  height: widget.constraints!.height * 0.1,
                                  width: widget.constraints!.width * 0.1,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: widget.constraints!.height * 0.08,
                    left: widget.constraints!.width * 0.15,
                    child: SizedBox(
                      height: widget.constraints!.height * 0.3,
                      width: widget.constraints!.width * 0.3,
                      child: Stack(
                        children: [
                          IgnorePointer(
                            child: HtmlElementView(
                              viewType: widget.virusModel.widgets[3],
                            ),
                          ),
                          Positioned(
                            top: widget.constraints!.height * 0.13,
                            child: Clickable(
                                onPressed: widget.onTapSmall,
                                child: SizedBox(
                                  height: widget.constraints!.height * 0.1,
                                  width: widget.constraints!.width * 0.1,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: widget.constraints!.height * 0.23,
                    left: widget.constraints!.width * 0.05,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: widget.constraints!.height * 0.4,
                      width: widget.constraints!.width * 0.4,
                      child: Stack(
                        children: [
                          IgnorePointer(
                            child: HtmlElementView(
                              viewType: widget.virusModel.widgets[4],
                            ),
                          ),
                          Positioned(
                            top: widget.constraints!.height * 0.18,
                            left: widget.constraints!.width * 0.05,
                            child: Clickable(
                                onPressed: widget.onTapEbola,
                                child: SizedBox(
                                  height: widget.constraints!.height * 0.1,
                                  width: widget.constraints!.width * 0.1,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
