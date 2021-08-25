class IAppAssets {
  List<String> getAssetPaths(String path) {
    final List<String> particlePaths = [];
    for (int i = 1; i <= 2; ++i) {
      final imagedata = '$path/particles_0$i.png';
      particlePaths.add(imagedata);
    }

    return particlePaths;
  }
}

class BackgroundPaths {
  static const String backgroundPath1 =
      'assets/animated_backgrounds/1/particles';
  static const String backgroundPath2 =
      'assets/animated_backgrounds/2/particles';
}
