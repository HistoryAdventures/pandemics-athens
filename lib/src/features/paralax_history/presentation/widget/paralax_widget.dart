import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/gif_animation.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/gif_contrrol.dart';

import '../../../../core/colors.dart';
import '../../../../core/utils/styles.dart';

class ParallaxWidget extends StatelessWidget {
  final double top;
  final double? left;
  final String? paralaxText;
  final String asset;
  final BoxFit boxFit;
  final double width;
  final double? right;
  final bool isImage;
  final List<ImageInfo>? imageInfo;
  final GifAnimationController? gifController;
  final Animation<Offset>? animation;
  final double? opacity;
  const ParallaxWidget(
      {required this.top,
      required this.asset,
      required this.boxFit,
      required this.width,
      required this.isImage,
      this.gifController,
      this.imageInfo,
      this.opacity,
      this.right,
      this.left,
      this.animation,
      this.paralaxText});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left ?? 0,
      right: right,
      child: AnimatedOpacity(
        duration: Times.medium,
        opacity: opacity ?? 1,
        child: Container(
            width: width,
            color: AppColors.transpatent,
            child: isImage
                ? Image.asset(
                    asset,
                    fit: boxFit,
                  )
                : GifAnimation(
                    image: AssetImage(asset),
                    controller: gifController!,
                    imageInfo: imageInfo!)),
      ),
    );
  }
}
