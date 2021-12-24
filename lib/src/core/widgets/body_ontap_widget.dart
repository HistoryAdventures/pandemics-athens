import 'package:flutter/material.dart';
import '../../features/pandemic_info/presentation/models/body_model.dart';

import '../colors.dart';

class BodyOnTapsModel extends StatelessWidget {
  final VoidCallback? onTapHead;
  final VoidCallback? onTapThroat;
  final VoidCallback? onTapChest;
  final VoidCallback? onTapStomach;
  final VoidCallback? onTap;
  final VoidCallback? onTapSkin;
  final VoidCallback? onExit;
  final BodyModel bodyModel;

  final double? height;
  final double? width;
  final VoidCallback? onTapHends;

  const BodyOnTapsModel({
    Key? key,
    this.onTapHead,
    required this.bodyModel,
    this.onTapStomach,
    this.onTapHends,
    this.onTapChest,
    this.onTap,
    this.onTapThroat,
    this.onTapSkin,
    this.width,
    this.height,
    this.onExit,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Hero(
        tag: bodyModel.image,
        child: Material(
          color: AppColors.transpatent,
          child: InkWell(
            splashColor: AppColors.transpatent,
            highlightColor: AppColors.transpatent,
            focusColor: AppColors.transpatent,
            hoverColor: AppColors.transpatent,
            onTap: onTap,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                SizedBox(
                  child: Image.asset(
                    bodyModel.image,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: size.height * 0.34,
                  left: size.width * 0.03,
                  child: Transform.rotate(
                    angle: 0.1,
                    child: InkWell(
                      splashColor: AppColors.transpatent,
                      highlightColor: AppColors.transpatent,
                      focusColor: AppColors.transpatent,
                      hoverColor: AppColors.transpatent,
                      onTap: onTapSkin ?? () {},
                      child: MouseRegion(
                        onExit: (_) {
                          if (onExit != null) {
                            onExit!();
                          }
                        },
                        onEnter: (d) {
                          if (onTapSkin != null) {
                            onTapSkin!();
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: size.height * 0.27,
                          width: size.width * 0.017,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.36,
                  left: size.width * 0.075,
                  child: Transform.rotate(
                    angle: -0.02,
                    child: InkWell(
                      splashColor: AppColors.transpatent,
                      highlightColor: AppColors.transpatent,
                      focusColor: AppColors.transpatent,
                      hoverColor: AppColors.transpatent,
                      onTap: onTapSkin ?? () {},
                      child: MouseRegion(
                        onExit: (_) {
                          if (onExit != null) {
                            onExit!();
                          }
                        },
                        onEnter: (d) {
                          if (onTapSkin != null) {
                            onTapSkin!();
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: size.height * 0.27,
                          width: size.width * 0.017,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.14,
                  left: size.width * 0.1,
                  child: Transform.rotate(
                    angle: -0.2,
                    child: InkWell(
                      splashColor: AppColors.transpatent,
                      highlightColor: AppColors.transpatent,
                      focusColor: AppColors.transpatent,
                      hoverColor: AppColors.transpatent,
                      onTap: onTapSkin ?? () {},
                      child: MouseRegion(
                        onExit: (_) {
                          if (onExit != null) {
                            onExit!();
                          }
                        },
                        onEnter: (d) {
                          if (onTapSkin != null) {
                            onTapSkin!();
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: size.height * 0.2,
                          width: size.width * 0.017,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.14,
                  left: size.width * 0.01,
                  child: Transform.rotate(
                    angle: 0.3,
                    child: InkWell(
                      splashColor: AppColors.transpatent,
                      highlightColor: AppColors.transpatent,
                      focusColor: AppColors.transpatent,
                      hoverColor: AppColors.transpatent,
                      onTap: onTapSkin ?? () {},
                      child: MouseRegion(
                        onExit: (_) {
                          if (onExit != null) {
                            onExit!();
                          }
                        },
                        onEnter: (_) {
                          if (onTapSkin != null) {
                            onTapSkin!();
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: size.height * 0.2,
                          width: size.width * 0.017,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.01,
                  left: size.width * 0.05,
                  child: InkWell(
                    splashColor: AppColors.transpatent,
                    highlightColor: AppColors.transpatent,
                    focusColor: AppColors.transpatent,
                    hoverColor: AppColors.transpatent,
                    onTap: onTapHead ?? () {},
                    child: MouseRegion(
                      onExit: (_) {
                        if (onExit != null) {
                          onExit!();
                        }
                      },
                      onEnter: (d) {
                        if (onTapHead != null) {
                          onTapHead!();
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: size.height * 0.07,
                        width: size.width * 0.05,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.09,
                  left: size.width * 0.05,
                  child: InkWell(
                    splashColor: AppColors.transpatent,
                    highlightColor: AppColors.transpatent,
                    focusColor: AppColors.transpatent,
                    hoverColor: AppColors.transpatent,
                    onTap: onTapThroat ?? () {},
                    child: MouseRegion(
                      onExit: (_) {
                        if (onExit != null) {
                          onExit!();
                        }
                      },
                      onEnter: (d) {
                        if (onTapThroat != null) {
                          onTapThroat!();
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: size.height * 0.03,
                        width: size.width * 0.05,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.12,
                  left: size.width * 0.03,
                  child: InkWell(
                    splashColor: AppColors.transpatent,
                    highlightColor: AppColors.transpatent,
                    focusColor: AppColors.transpatent,
                    hoverColor: AppColors.transpatent,
                    onTap: onTapChest ?? () {},
                    child: MouseRegion(
                      onExit: (_) {
                        if (onExit != null) {
                          onExit!();
                        }
                      },
                      onEnter: (d) {
                        if (onTapChest != null) {
                          onTapChest!();
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: size.height * 0.07,
                        width: size.width * 0.09,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.22,
                  left: size.width * 0.03,
                  child: InkWell(
                    splashColor: AppColors.transpatent,
                    highlightColor: AppColors.transpatent,
                    focusColor: AppColors.transpatent,
                    hoverColor: AppColors.transpatent,
                    onTap: onTapStomach ?? () {},
                    child: MouseRegion(
                      onExit: (_) {
                        if (onExit != null) {
                          onExit!();
                        }
                      },
                      onEnter: (d) {
                        if (onTapStomach != null) {
                          onTapStomach!();
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: size.height * 0.09,
                        width: size.width * 0.08,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.3,
                  left: 1,
                  right: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: MouseRegion(
                        onExit: (_) {
                          if (onExit != null) {
                            onExit!();
                          }
                        },
                        onEnter: (d) {
                          if (onTapHends != null) {
                            onTapHends!();
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: height! / 10,
                          child: InkWell(
                            splashColor: AppColors.transpatent,
                            highlightColor: AppColors.transpatent,
                            focusColor: AppColors.transpatent,
                            hoverColor: AppColors.transpatent,
                            onTap: onTapHends ?? () {},
                          ),
                        ),
                      )),
                      Expanded(
                          flex: 6,
                          child: SizedBox(
                            height: height! / 10,
                          )),
                      Expanded(
                          child: MouseRegion(
                        onExit: (_) {
                          if (onExit != null) {
                            onExit!();
                          }
                        },
                        onEnter: (d) {
                          if (onTapHends != null) {
                            onTapHends!();
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: height! / 10,
                          child: InkWell(
                            splashColor: AppColors.transpatent,
                            highlightColor: AppColors.transpatent,
                            focusColor: AppColors.transpatent,
                            hoverColor: AppColors.transpatent,
                            onTap: onTapHends,
                          ),
                          //width: width,
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
