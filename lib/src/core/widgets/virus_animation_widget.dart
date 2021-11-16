import 'package:flutter/material.dart';

import '../../features/pandemic_info/presentation/models/virus_model.dart';
import 'animated_widgets/gif_animation.dart';
import 'animated_widgets/gif_contrrol.dart';
import 'widgets.dart';

class VirusModelWidget extends StatelessWidget {
  const VirusModelWidget(
      {this.onTap,
      this.constraints,
      this.gifController,
      this.onTapEbola,
      this.onTapSmall,
      this.onTapBubonik,
      this.onTapTiphid,
      this.onTapTiphius,
      required this.virusModel});

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
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
          color: Colors.white.withOpacity(0),
          child: virusModel.widgets.length == 1
              ? Container(
                  child: GifImage(
                    controller: gifController,
                    image: AssetImage(virusModel.widgets[0]),
                  ),
                )
              : Stack(children: [
                  Positioned(
                    top: constraints!.height * 0.16,
                    left: constraints!.width * 0.25,
                    child: SizedBox(
                      height: constraints!.height * 0.4,
                      width: constraints!.width * 0.4,
                      child: Stack(
                        children: [
                          GifImage(
                            controller: gifController,
                            image: AssetImage(virusModel.widgets[0]),
                          ),
                          Positioned(
                            top: constraints!.height * 0.15,
                            left: constraints!.width * 0.05,
                            child: Clickable(
                                onPressed: onTapBubonik,
                                child: SizedBox(
                                  height: constraints!.height * 0.1,
                                  width: constraints!.width * 0.1,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: constraints!.height * 0.33,
                    left: constraints!.width * 0.23,
                    child: SizedBox(
                      height: constraints!.height * 0.3,
                      width: constraints!.width * 0.3,
                      child: Stack(
                        children: [
                          GifImage(
                            controller: gifController,
                            image: AssetImage(virusModel.widgets[1]),
                          ),
                          Positioned(
                            top: constraints!.height * 0.12,
                            left: constraints!.width * 0.05,
                            child: Clickable(
                                onPressed: onTapTiphius,
                                child: SizedBox(
                                  height: constraints!.height * 0.08,
                                  width: constraints!.width * 0.1,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: constraints!.height * 0.45,
                    left: constraints!.width * 0.13,
                    child: SizedBox(
                      height: constraints!.height * 0.35,
                      width: constraints!.width * 0.35,
                      child: Stack(
                        children: [
                          GifImage(
                            controller: gifController,
                            image: AssetImage(virusModel.widgets[2]),
                          ),
                          Positioned(
                            top: constraints!.height * 0.13,
                            left: constraints!.width * 0.05,
                            child: Clickable(
                                onPressed: onTapTiphid,
                                child: SizedBox(
                                  height: constraints!.height * 0.1,
                                  width: constraints!.width * 0.1,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: constraints!.height * 0.08,
                    left: constraints!.width * 0.15,
                    child: SizedBox(
                      height: constraints!.height * 0.3,
                      width: constraints!.width * 0.3,
                      child: Stack(
                        children: [
                          GifImage(
                            controller: gifController,
                            image: AssetImage(virusModel.widgets[3]),
                          ),
                          Positioned(
                            top: constraints!.height * 0.13,
                            child: Clickable(
                                onPressed: onTapSmall,
                                child: SizedBox(
                                  height: constraints!.height * 0.1,
                                  width: constraints!.width * 0.1,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: constraints!.height * 0.23,
                    left: constraints!.width * 0.05,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: constraints!.height * 0.4,
                      width: constraints!.width * 0.4,
                      child: Stack(
                        children: [
                          GifImage(
                            controller: gifController,
                            image: AssetImage(virusModel.widgets[4]),
                          ),
                          Positioned(
                            top: constraints!.height * 0.18,
                            left: constraints!.width * 0.05,
                            child: Clickable(
                                onPressed: onTapEbola,
                                child: SizedBox(
                                  height: constraints!.height * 0.1,
                                  width: constraints!.width * 0.1,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ])),
    );
  }
}
