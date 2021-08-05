import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';

class AssetsPath {
  static List<String> assetsBlobList = [];

  static const String gifBackground = 'assets/image_back/backgif.gif';
  static const String virusLocMap = 'assets/image_back/virus_loc_map.png';
  static const String gradient = 'assets/image_back/gradient.png';

  static const String gifVirus = 'assets/virus_gif/virus_01.gif';
  static const String gifSmallpox = 'assets/virus_gif/smallpox.gif';

  static const String gifTyphus = 'assets/virus_gif/typhus.gif';

  static const String gifTyphoid = 'assets/virus_gif/typhoid.gif';
  static const String gifEbola = 'assets/virus_gif/ebola.gif';

  static const String gifBubonic = 'assets/virus_gif/bubonic.gif';
  static const String charactersBackgroundImage =
      'assets/image_back/characters_page_back.png';
  static const String arrowBackImage = 'assets/icons/arrow_back.png';
  static const String arrowUpImage = 'assets/icons/arrow_up.png';
  static const String arrowForwardImage = "assets/icons/arrow_forward.png";
  static const String arrowDounImage = 'assets/icons/arrow_down.png';

  static const String periclesImage = "assets/characters/character_1.png";
  static const String thucididesImage = "assets/characters/character_2.png";
  static const String socratesImage = "assets/characters/character_3.png";

  static const String aristophanesImage = "assets/characters/character_4.png";
  static const String mapImage = 'assets/image_back/map.png';

  static const String spheresBackImage = 'assets/image_back/spheres.png';
  static const String scrollIcon = 'assets/icons/scroll.png';
  static const String manChestImage = 'assets/man_body/chest.png';
  static const String manhandsImage = 'assets/man_body/hands.png';

  static const String manfillImage = 'assets/man_body/fill.png';
  static const String manIntroImage = 'assets/man_body/intro.png';

  static const String manheadImage = 'assets/man_body/head.png';

  static const String manstomachImage = 'assets/man_body/stomach.png';

  static const String manthroatImage = 'assets/man_body/throat.png';
  static const String document = 'assets/document_view/document.png';

  static const String panaramaBackgroundImage = 'assets/panorama_image2.png';

  static const String panaramaImage1 =
      'assets/panarama_image/panaram_image_1.png';
  static const String panaramaImage2 =
      'assets/panarama_image/panaram_image_2.png';
  static const String panaramaImage3 =
      'assets/panarama_image/panaram_image_3.png';
  static const String panaramaImage4 =
      'assets/panarama_image/panaram_image_4.png';
  static const String panaramaImage5 =
      'assets/panarama_image/panaram_image_5.png';
  static const String panaramaImage6 =
      'assets/panarama_image/panarama_image_6.png';
  static const String panaramaImage7 =
      'assets/panarama_image/panarama_image_7.png';
  static const String panaramaImage8 =
      'assets/panarama_image/panarama_image_8.png';
  static const String panaramaImage9 =
      'assets/panarama_image/panarama_image_9.png';
  static const String panaramaImage10 =
      'assets/panarama_image/panarama_image_10.png';
  static const String keepGoing = 'assets/practice_medicine/keep_going.png';
  static const String medicine = 'assets/practice_medicine/medicine.png';
  static const String quitMedicine =
      'assets/practice_medicine/quit_medicine.png';

  static const String mapImage399 = 'assets/map_images/399image.png';
  static const String mapImage413 = 'assets/map_images/413image.png';
  static const String mapImage414 = 'assets/map_images/414image.png';
  static const String mapImage415 = 'assets/map_images/415image.png';
  static const String mapImage416 = 'assets/map_images/416image.png';
  static const String mapImage421 = 'assets/map_images/421image.png';
  static const String mapImage427 = 'assets/map_images/427image.png';
  static const String mapImage430 = 'assets/map_images/430image.png';
  static const String mapImage431 = 'assets/map_images/431image.png';
  static const String mapImage438 = 'assets/map_images/438image.png';
  static const String mapImage441 = 'assets/map_images/441image.png';

  static const String mapImage443 = 'assets/map_images/443image.png';

  static const String mapImage446 = 'assets/map_images/446image.png';

  static const String mapImage447_432 = 'assets/map_images/447_432image.png';
  static const String mapImage450 = 'assets/map_images/450image.png';
  static const String mapImage451 = 'assets/map_images/451image.png';
  static const String mapImage454 = 'assets/map_images/454image.png';
  static const String mapImage457 = 'assets/map_images/457image.png';
  static const String mapImage458 = 'assets/map_images/458image.png';

  static const String mapImage461 = 'assets/map_images/461image.png';
  static const String mapImage462 = 'assets/map_images/462image.png';
  static const String mapImage469 = 'assets/map_images/469image.png';
  static const String mapImage471 = 'assets/map_images/471image.png';
  static const String mapImage477 = 'assets/map_images/477image.png';

  static const String mapImage479 = 'assets/map_images/479image.png';
  static const String mapImage480 = 'assets/map_images/480image.png';
  static const String mapImage490 = 'assets/map_images/490image.png';
  static const String mapImage495 = 'assets/map_images/495image.png';

  static const String deadOfSocrates1 =
      'assets/dead_socrates/death_of_Socrates1.png';

  static const String deadOfSocrates2 =
      'assets/dead_socrates/death_of_Socrates2.png';

  static const String deadOfSocrates3 =
      'assets/dead_socrates/death_of_Socrates3.png';
  static const String endOfWar1 = 'assets/end_war/end_of_war1.png';
  static const String endOfWar2 = 'assets/end_war/end_of_war2.png';
  static const String endOfWar3 = 'assets/end_war/end_of_war3.png';
  static const String poitButtonArrowRight =
      'assets/document_view/pointer_button_icon.png';
  static const String irlNikos = 'assets/image_back/irl_Nikos.png';
  static const String aboutBookMap = 'assets/image_back/about_book_map.png';
  static const String socilaIcons = 'assets/icons/social_icons.png';

  static const String paralaxBackground = 'assets/paralax_images/bk.png';
}

Future<bool> loadContent(List<String> context) async {
  for (int i = 0; i < context.length; i++) {
    await getBytesFromAsset(context[i]);
  }

  return true;
}

Future<Image> getBytesFromAsset(
  String path,
) async {
  final data = await rootBundle.load(path);

  final codec = await instantiateImageCodec(
    data.buffer.asUint8List(),
  );

  final fi = await codec.getNextFrame();

  final byteData = fi.image;
  return byteData;
}
