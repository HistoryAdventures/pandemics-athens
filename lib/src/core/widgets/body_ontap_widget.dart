import 'package:flutter/material.dart';

import '../colors.dart';

class BodyOnTapsModel extends StatelessWidget {
  final String photo;
  final VoidCallback? onTapHead;
  final VoidCallback? onTapThroat;
  final VoidCallback? onTapChest;
  final VoidCallback? onTapStomach;
  final VoidCallback? onTap;
  final String descriptiion;

  final String name;
  final double? height;
  final double? width;
  final VoidCallback? onTapHends;

  const BodyOnTapsModel(
      {Key? key,
      required this.photo,
      required this.name,
      this.onTapHead,
      required this.descriptiion,
      this.onTapStomach,
      this.onTapHends,
      this.onTapChest,
      this.onTap,
      this.onTapThroat,
      this.width,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.white.withOpacity(0),
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
                    photo,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 80,
                  right: 80,
                  child: InkWell(
                    splashColor: AppColors.transpatent,
                    highlightColor: AppColors.transpatent,
                    focusColor: AppColors.transpatent,
                    hoverColor: AppColors.transpatent,
                    onTap: onTapHead ?? () {},
                    child: SizedBox(
                      height: height! * 0.09,
                      width: width,
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 80,
                  right: 80,
                  child: InkWell(
                    splashColor: AppColors.transpatent,
                    highlightColor: AppColors.transpatent,
                    focusColor: AppColors.transpatent,
                    hoverColor: AppColors.transpatent,
                    onTap: onTapThroat ?? () {},
                    child: SizedBox(
                      height: height! / 20,
                      width: width,
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 60,
                  right: 50,
                  child: InkWell(
                    splashColor: AppColors.transpatent,
                    highlightColor: AppColors.transpatent,
                    focusColor: AppColors.transpatent,
                    hoverColor: AppColors.transpatent,
                    onTap: onTapChest ?? () {},
                    child: SizedBox(
                      height: height! / 14,
                      width: width,
                    ),
                  ),
                ),
                Positioned(
                  top: 210,
                  left: 60,
                  right: 50,
                  child: InkWell(
                    splashColor: AppColors.transpatent,
                    highlightColor: AppColors.transpatent,
                    focusColor: AppColors.transpatent,
                    hoverColor: AppColors.transpatent,
                    onTap: onTapStomach ?? () {},
                    child: SizedBox(
                      height: height! / 10,
                      width: width,
                    ),
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 1,
                  right: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: height! / 10,
                        child: InkWell(
                          splashColor: AppColors.transpatent,
                          highlightColor: AppColors.transpatent,
                          focusColor: AppColors.transpatent,
                          hoverColor: AppColors.transpatent,
                          onTap: onTapHends ?? () {},
                        ),
                      )),
                      Expanded(
                          flex: 6,
                          child: SizedBox(
                            height: height! / 10,
                          )),
                      Expanded(
                          child: SizedBox(
                        height: height! / 10,
                        child: InkWell(
                          splashColor: AppColors.transpatent,
                          highlightColor: AppColors.transpatent,
                          focusColor: AppColors.transpatent,
                          hoverColor: AppColors.transpatent,
                          onTap: onTapHends,
                        ),
                        //width: width,
                      ))
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
