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
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Hero(
        tag: photo,
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
                    photo,
                    fit: BoxFit.contain,
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
                    child: SizedBox(
                      height: size.height * 0.07,
                      width: size.width * 0.05,
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
                    child: SizedBox(
                      height: size.height * 0.03,
                      width: size.width * 0.05,
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
                    child: SizedBox(
                      height: size.height * 0.07,
                      width: size.width * 0.09,
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
                    child: SizedBox(
                      height: size.height * 0.09,
                      width: size.width * 0.08,
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
                          child: Container(
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
