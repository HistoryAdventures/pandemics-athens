class IAppAssets {
  static const String _backgroundPath = 'assets/imgs/';

  List<String> getAssetPaths() {
    List<String> particlePaths = [];
    for (int i = 1; i <= 3; ++i) {
      final imagedata = '$_backgroundPath/particles_0$i.png';
      particlePaths.add(imagedata);
    }

    return particlePaths;
  }
}
