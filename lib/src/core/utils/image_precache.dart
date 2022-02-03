import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';

class ImagePrecache {
  static Future<void> precacheImages(
    List<String> imageAssetPaths,
    BuildContext context,
  ) async {
    final List<Future> precache = imageAssetPaths
        .map((e) => precacheImage(AssetImage(e), context))
        .toList();

    await Future.wait(precache);
  }

  static Future<void> precacheBackgroundImages(BuildContext context) async {
    await Future.wait([
      precacheImages(AssetsPath.animatedParticles1Images, context),
      precacheImages(AssetsPath.animatedParticles2Images, context),
      precacheImages(AssetsPath.animatedParticles3Images, context),
      precacheImages(AssetsPath.animatedParticles4Images, context),
      precacheImages(AssetsPath.animatedParticles5Images, context),
      precacheImages(AssetsPath.animatedParticles6Images, context),
    ]);
  }

  static Future<void> precacheBodyImages(BuildContext context) async {
    await Future.wait([
      precacheImages(AssetsPath.bodyImages, context),
    ]);
  }

  static Future<void> precacheVirusGifs(BuildContext context) async {
    await precacheImages(AssetsPath.virusesInfoPageImages, context);
  }
}
