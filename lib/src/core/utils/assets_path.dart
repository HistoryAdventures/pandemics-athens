import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetsPath {
  static final scaffoldkey = GlobalKey<ScaffoldState>();

  static List<String> assetsBlobList = [];

  //static const String gifBackground = 'assets/image_back/backgif.gif';
  static const String gifBackground1 =
      'assets/animated_backgrounds/1/liquid.gif';

  static const String gifBackground2 =
      'assets/animated_backgrounds/2/liquid.gif';

  static const String gifBackground3 =
      'assets/animated_backgrounds/3/liquid.gif';

  static const String gifBackground4 =
      'assets/animated_backgrounds/4/liquid.gif';

  static const String gifBackground5 =
      'assets/animated_backgrounds/5/liquid.gif';

  static const String gifBackground6 =
      'assets/animated_backgrounds/6/liquid.gif';

  static const String animatedBack1Vbody0 =
      'assets/animated_backgrounds/1/virus/vbody_0.png';
  static const String animatedBack1Vbody1 =
      'assets/animated_backgrounds/1/virus/vbody_1.png';
  static const String animatedBack1Vbody2 =
      'assets/animated_backgrounds/1/virus/vbody_2.png';
  static const String animatedBack1Vbody3 =
      'assets/animated_backgrounds/1/virus/vbody_3.png';
  static const String animatedBack1Vbody4 =
      'assets/animated_backgrounds/1/virus/vbody_4.png';
  static const String animatedBack1Vbody5 =
      'assets/animated_backgrounds/1/virus/vbody_5.png';
  static const String animatedBack1Vbody6 =
      'assets/animated_backgrounds/1/virus/vbody_6.png';
  static const String animatedBack1Vbody7 =
      'assets/animated_backgrounds/1/virus/vbody_7.png';
  static const String animatedBack1Vbody8 =
      'assets/animated_backgrounds/1/virus/vbody_8.png';

  static const String animatedBack2Vbody0 =
      'assets/animated_backgrounds/2/virus/vbody_0.png';
  static const String animatedBack2Vbody1 =
      'assets/animated_backgrounds/2/virus/vbody_1.png';
  static const String animatedBack2Vbody2 =
      'assets/animated_backgrounds/2/virus/vbody_2.png';
  static const String animatedBack2Vbody3 =
      'assets/animated_backgrounds/2/virus/vbody_3.png';
  static const String animatedBack2Vbody4 =
      'assets/animated_backgrounds/2/virus/vbody_4.png';
  static const String animatedBack2Vbody5 =
      'assets/animated_backgrounds/2/virus/vbody_5.png';
  static const String animatedBack2Vbody6 =
      'assets/animated_backgrounds/2/virus/vbody_6.png';
  static const String animatedBack2Vbody7 =
      'assets/animated_backgrounds/2/virus/vbody_7.png';
  static const String animatedBack2Vbody8 =
      'assets/animated_backgrounds/2/virus/vbody_8.png';

  static const String animatedBack3Vbody0 =
      'assets/animated_backgrounds/3/virus/vbody_0.png';
  static const String animatedBack3Vbody1 =
      'assets/animated_backgrounds/3/virus/vbody_1.png';
  static const String animatedBack3Vbody2 =
      'assets/animated_backgrounds/3/virus/vbody_2.png';
  static const String animatedBack3Vbody3 =
      'assets/animated_backgrounds/3/virus/vbody_3.png';
  static const String animatedBack3Vbody4 =
      'assets/animated_backgrounds/3/virus/vbody_4.png';
  static const String animatedBack3Vbody5 =
      'assets/animated_backgrounds/3/virus/vbody_5.png';
  static const String animatedBack3Vbody6 =
      'assets/animated_backgrounds/3/virus/vbody_6.png';
  static const String animatedBack3Vbody7 =
      'assets/animated_backgrounds/3/virus/vbody_7.png';
  static const String animatedBack3Vbody8 =
      'assets/animated_backgrounds/3/virus/vbody_8.png';
  static const String animatedBack3Vbody9 =
      'assets/animated_backgrounds/3/virus/vbody_9.png';
  static const String animatedBack3Vbody10 =
      'assets/animated_backgrounds/3/virus/vbody_10.png';
  static const String animatedBack3Vbody11 =
      'assets/animated_backgrounds/3/virus/vbody_11.png';
  static const String animatedBack3Vbody12 =
      'assets/animated_backgrounds/3/virus/vbody_12.png';
  static const String animatedBack3Vbody13 =
      'assets/animated_backgrounds/3/virus/vbody_13.png';

  static const String animatedBack4Vbody0 =
      'assets/animated_backgrounds/4/virus/vbody_0.png';
  static const String animatedBack4Vbody1 =
      'assets/animated_backgrounds/4/virus/vbody_1.png';
  static const String animatedBack4Vbody2 =
      'assets/animated_backgrounds/4/virus/vbody_2.png';
  static const String animatedBack4Vbody3 =
      'assets/animated_backgrounds/4/virus/vbody_3.png';
  static const String animatedBack4Vbody4 =
      'assets/animated_backgrounds/4/virus/vbody_4.png';
  static const String animatedBack4Vbody5 =
      'assets/animated_backgrounds/4/virus/vbody_5.png';
  static const String animatedBack4Vbody6 =
      'assets/animated_backgrounds/4/virus/vbody_6.png';
  static const String animatedBack4Vbody7 =
      'assets/animated_backgrounds/4/virus/vbody_7.png';
  static const String animatedBack4Vbody8 =
      'assets/animated_backgrounds/4/virus/vbody_8.png';
  static const String animatedBack4Vbody9 =
      'assets/animated_backgrounds/4/virus/vbody_9.png';
  static const String animatedBack4Vbody10 =
      'assets/animated_backgrounds/4/virus/vbody_10.png';

  static const String animatedBack5Vbody0 =
      'assets/animated_backgrounds/5/virus/vbody_0.png';
  static const String animatedBack5Vbody1 =
      'assets/animated_backgrounds/5/virus/vbody_1.png';
  static const String animatedBack5Vbody2 =
      'assets/animated_backgrounds/5/virus/vbody_2.png';
  static const String animatedBack5Vbody3 =
      'assets/animated_backgrounds/5/virus/vbody_3.png';
  static const String animatedBack5Vbody4 =
      'assets/animated_backgrounds/5/virus/vbody_4.png';
  static const String animatedBack5Vbody5 =
      'assets/animated_backgrounds/5/virus/vbody_5.png';
  static const String animatedBack5Vbody6 =
      'assets/animated_backgrounds/5/virus/vbody_6.png';
  static const String animatedBack5Vbody7 =
      'assets/animated_backgrounds/5/virus/vbody_7.png';
  static const String animatedBack5Vbody8 =
      'assets/animated_backgrounds/5/virus/vbody_8.png';
  static const String animatedBack5Vbody9 =
      'assets/animated_backgrounds/5/virus/vbody_9.png';
  static const String animatedBack5body10 =
      'assets/animated_backgrounds/5/virus/vbody_10.png';

  static const String animatedBack6Vbody0 =
      'assets/animated_backgrounds/6/virus/vbody_0.png';
  static const String animatedBack6Vbody1 =
      'assets/animated_backgrounds/6/virus/vbody_1.png';
  static const String animatedBack6Vbody2 =
      'assets/animated_backgrounds/6/virus/vbody_2.png';
  static const String animatedBack6Vbody3 =
      'assets/animated_backgrounds/6/virus/vbody_3.png';
  static const String animatedBack6Vbody4 =
      'assets/animated_backgrounds/6/virus/vbody_4.png';
  static const String animatedBack6Vbody5 =
      'assets/animated_backgrounds/6/virus/vbody_5.png';
  static const String animatedBack6Vbody6 =
      'assets/animated_backgrounds/6/virus/vbody_6.png';
  static const String animatedBack6Vbody7 =
      'assets/animated_backgrounds/6/virus/vbody_7.png';
  static const String animatedBack6Vbody8 =
      'assets/animated_backgrounds/6/virus/vbody_8.png';
  static const String animatedBack6Vbody9 =
      'assets/animated_backgrounds/6/virus/vbody_9.png';
  static const String animatedBack6Vbody10 =
      'assets/animated_backgrounds/6/virus/vbody_10.png';
  static const String animatedBack6Vbody11 =
      'assets/animated_backgrounds/6/virus/vbody_11.png';
  static const String animatedBack6Vbody12 =
      'assets/animated_backgrounds/6/virus/vbody_12.png';

  static const String virusLocMap = 'assets/image_back/virus_loc_map.png';
  static const String gradient = 'assets/image_back/gradient.png';

  static const String gifVirusTyphoid =
      'assets/animated_backgrounds/2/virus/typhoid.gif';

  static const String gifVirus = 'assets/animated_backgrounds/virus.gif';

  static const String gifSmallpox = 'assets/virus_gif/smallpox.gif';

  static const String gifTyphus = 'assets/virus_gif/typhus.gif';

  static const String gifTyphoid = 'assets/virus_gif/typhoid.gif';
  static const String gifEbola = 'assets/virus_gif/ebola.gif';
  static const String glossaryBk = 'assets/image_back/glossary_bk.png';

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
  static const String irlNikos = 'assets/image_back/irl_nikos.png';
  static const String aboutBookMap = 'assets/image_back/about_book_map.png';
  static const String socilaIcons = 'assets/icons/social_icons.png';

  static const String paralaxBackground = 'assets/paralax_new/bk.jpeg';
  static const String gifCharacterNikos_2 =
      'assets/paralax_new/character_2.gif';
  static const String gifHand = 'assets/paralax_new/hand.gif';

  static const String paralaxBuilding = 'assets/paralax_new/building.png';
  static const String paralaxCharacter_1 = 'assets/paralax_new/character_1.png';
  // static const String paralaxCharacter_2 = 'assets/paralax_new/character_2.png';
  static const String paralaxCharacter_11 =
      'assets/paralax_new/character_11.png';
  static const String paralaxCharacter_12 =
      'assets/paralax_new/character_12.png';
  static const String paralaxCharacters_2 =
      'assets/paralax_new/characters_2.png';
  static const String map508 = 'assets/map/map411image.png';
  static const String map495 = 'assets/map/map495image.png';
  static const String map490 = 'assets/map/map490image.png';
  static const String map480 = 'assets/map/map480image.png';
  static const String map479 = 'assets/map/map479image.png';
  static const String map477 = 'assets/map/map477image.png';
  static const String map471 = 'assets/map/map471image.png';
  static const String map469 = 'assets/map/map469image.png';
  static const String map462 = 'assets/map/map462image.png';
  static const String map461 = 'assets/map/map461image.png';
  static const String map458 = 'assets/map/map458image.png';
  static const String map457 = 'assets/map/map457image.png';
  static const String map454 = 'assets/map/map454image.png';
  static const String map451 = 'assets/map/map451image.png';

  static const String map450 = 'assets/map/map450image.png';
  static const String map447_432 = 'assets/map/map447_432image.png';
  static const String map446 = 'assets/map/map446image.png';
  static const String map443 = 'assets/map/map443image.png';

  static const String map441 = 'assets/map/map441image.png';
  static const String map438 = 'assets/map/map438image.png';
  static const String map431 = 'assets/map/map431image.png';
  static const String map430 = 'assets/map/map430image.png';
  static const String map429 = 'assets/map/map429image.png';
  static const String map427 = 'assets/map/map427image.png';
  static const String map421 = 'assets/map/map421image.png';
  static const String map416 = 'assets/map/map416image.png';
  static const String map415 = 'assets/map/map415image.png';

  static const String map414 = 'assets/map/map414image.png';
  static const String map413 = 'assets/map/map413image.png';
  static const String map411 = 'assets/map/map411image.png';
  static const String map410 = 'assets/map/map410image.png';

  static const String map407 = 'assets/map/map407image.png';
  static const String map404 = 'assets/map/map404image.png';
  static const String map403 = 'assets/map/map403image.png';
  static const String map399 = 'assets/map/map399image.png';
  static const String virusLoc1 = 'assets/map/virus_loc_1.png';
  static const String virusLoc2 = 'assets/map/virus_loc_2.png';
}

Future<bool> loadContent(List<String> context) async {
  for (int i = 0; i < context.length; i++) {
    await getBytesFromAsset(context[i]);
  }

  return true;
}

Future<ui.Image> getBytesFromAsset(
  String path,
) async {
  final data = await rootBundle.load(path);

  final codec = await ui.instantiateImageCodec(
    data.buffer.asUint8List(),
  );

  final fi = await codec.getNextFrame();

  final ui.Image byteData = fi.image;
  return byteData;
}

Future<List<ImageInfo>> preloadImage({
  required ImageProvider provider,
  required BuildContext context,
  int frameCount = 1,
  Size? size,
  ImageErrorListener? onError,
}) async {
  final ImageConfiguration config =
      createLocalImageConfiguration(context, size: size);
  final Completer<List<ImageInfo>> completer = Completer<List<ImageInfo>>();
  final ImageStream stream = provider.resolve(config);
  final List<ImageInfo> ret = [];

  final ImageStreamListener imageStreamListener =
      ImageStreamListener((ImageInfo image, bool sync) {
    ret.add(image);
    if (ret.length == frameCount) {
      print("object");
      completer.complete(ret);
    }
  });

  stream.addListener(imageStreamListener);
  completer.future.then((List<ImageInfo> _) {
    stream.removeListener(imageStreamListener);
  });

  return completer.future;
}
