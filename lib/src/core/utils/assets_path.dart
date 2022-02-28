import 'package:flutter/material.dart';

class AssetsPath {
  static final scaffoldkey = GlobalKey<ScaffoldState>();

  static List<String> assetsBlobList = [];

  static String med = "assets/icons/med.png";

  static String inc = "assets/icons/inc.png";
  static String dec = "assets/icons/dec.png";
  static String expand = "assets/icons/expand.png";
  static String unExpand = "assets/icons/unExpand.png";

  static const String iconVolumeOn = 'assets/icons/sound_on.png';
  static const String iconVolumeOff = 'assets/icons/sound_off.png';

  static const String iconMenu = 'assets/icons/menu.png';
  static const String iconInfo = 'assets/icons/info.png';
  static const String iconClose = 'assets/icons/close.png';

  static const String quizBackground = 'assets/images_quiz/quiz_bk.png';

  static const String mapDialogBlur = 'assets/image_back/blur_map_dialog.png';
  static const String mapTimeLineBlur =
      'assets/image_back/blur_map_timeline.png';

  // Sounds Paths //
  /////////////////

  // Change path assets/asdasd into assets/assets/asdasd before creating build

  //Parallax
  static const String parallaxVideoSound =
      'assets/assets/audios/parallax-page/mus_flythrough_r1.ogg';
  static const String windSound =
      'assets/assets/audios/parallax-page/sfx_amb_illustration1.ogg';
  static const String nikosPartSound =
      'assets/assets/audios/parallax-page/sfx_amb_illustration2.ogg';
  static const String peopleSound1 =
      'assets/assets/audios/parallax-page/sfx_amb_illustration3.ogg';
  static const String peopleSound2 =
      'assets/assets/audios/parallax-page/sfx_amb_illustration4.ogg';
  static const String footsteps =
      'assets/assets/audios/parallax-page/sfx_amb_illustration5.ogg';
  static const String cough =
      'assets/assets/audios/parallax-page/sfx_amb_illustration6.ogg';
  static const String water =
      'assets/assets/audios/parallax-page/sfx_amb_illustration7.ogg';
  static const String parallaxBgSound =
      'assets/assets/audios/parallax-page/mus_story_r1a.ogg';

  //Leanding
  static const String leandingBgSound =
      'assets/assets/audios/title-screen/mus_titlescreen_r2.ogg';
  static const String menuOntapSound =
      'assets/assets/audios/title-screen/sfx_ui_tocOpen.ogg';
  static const String menuCloseSound =
      'assets/assets/audios/title-screen/sfx_ui_infoClose.ogg';

  //Glossary
  static const String glossaryBackgoundPage =
      'assets/assets/audios/glossary/sfx_ui_glossaryOpen.ogg';
  static const String glossaryItemHover =
      'assets/assets/audios/glossary/sfx_ui_glossaryHover.ogg';
  static const String glossaryItemOnTap =
      'assets/assets/audios/glossary/sfx_ui_interact1.ogg';
  static const String glossaryPageClose =
      'assets/assets/audios/glossary/sfx_ui_glossaryClose.ogg';

  //Viruses
  static const String virusBubonic =
      'assets/assets/audios/viruses/sfx_ui_bubonic.ogg';
  static const String virusEbola =
      'assets/assets/audios/viruses/sfx_ui_ebola.ogg';
  static const String virusSmallpox =
      'assets/assets/audios/viruses/sfx_ui_smallpox.ogg';
  static const String virusTyphoid =
      'assets/assets/audios/viruses/sfx_uI_typhoid.ogg';
  static const String virusTyphus =
      'assets/assets/audios/viruses/sfx_ui_typhus.ogg';

  //Nikos chooses
  static const String nikosChooseBG =
      'assets/assets/audios/nikos-choose/mus_apollo_r0.ogg';
  static const String nikoCries =
      'assets/assets/audios/nikos-choose/sfx_amb_nikosCry.ogg';
  static const String quitMedicinePageSound =
      'assets/assets/audios/nikos-choose/sfx_amb_quitMedicine.ogg';
  static const String keepGoingSound =
      'assets/assets/audios/nikos-choose/sfx_amb_temple.ogg';

  // Panaramas
  static const String panaramaLeftSound =
      'assets/assets/audios/panaramas/sfx_amb_temple.ogg';
  static const String panaramaRightSound =
      'assets/assets/audios/panaramas/sfx_amb_hill.ogg';

  // Story pages
  static const String screenTransitionSound =
      'assets/assets/audios/story-pages/sfx_ui_screenTransition.ogg';
  static const String tracingAnimationSound =
      'assets/assets/audios/story-pages/sfx_ui_tracing.ogg';
  static const String infoOpen =
      'assets/assets/audios/story-pages/sfx_ui_infoOpen.ogg';
  static const String infoClose =
      'assets/assets/audios/story-pages/sfx_ui_infoClose.ogg';
  static const String changeIndex =
      'assets/assets/audios/story-pages/sfx_ui_interact2.ogg';

  // Quiz
  static const String quizQlick =
      'assets/assets/audios/quiz/sfx_ui_assessmentClick.ogg';
  static const String quizQlickErase =
      'assets/assets/audios/quiz/sfx_ui_assessmentClickErase.ogg';
  static const String quizQlickRelease =
      'assets/assets/audios/quiz/sfx_ui_assessmentRelease.ogg';

  static const List<String> virusSoundList = [
    "",
    virusBubonic,
    virusTyphus,
    virusTyphoid,
    virusSmallpox,
    virusTyphus
  ];

// Quiz Images
  static const String quizImage1 = 'assets/images_quiz/quiz1.jpg';
  static const String quizImage2 = 'assets/images_quiz/quiz2.jpg';

  static const String quizImage8 = 'assets/images_quiz/image_quiz8.jpg';

  static const String quizImage3 = 'assets/images_quiz/quiz3.jpg';
  static const String quizImage4 = 'assets/images_quiz/quiz4.jpg';

  static const String imageQuizPericles = 'assets/images_quiz/pericles.jpg';

// Question 1
  static const String democracy = 'assets/images_quiz/democracy.png';
  static const String humours = 'assets/images_quiz/humours.png';
  static const String ostracism = 'assets/images_quiz/ostracism.png';
  static const String philosophy = 'assets/images_quiz/philosophy.png';
  static const String typhus = 'assets/images_quiz/typhus.png';

//Question 2
  static const String nikos = 'assets/images_quiz/nikos.png';

// Question 3

  static const String backgorund1 = 'assets/images_quiz/backgorund1.png';
  static const String phidias = 'assets/images_quiz/phidias.png';
  static const String sophoclesAristophanes =
      'assets/images_quiz/sophocles-aristophanes.png';
  static const String socratesPlato = 'assets/images_quiz/socrates-plato.png';
  static const String thucydides = 'assets/images_quiz/thucydides.png';
  static const String pericles = 'assets/images_quiz/pericles.png';

// Question 4

  static const String map430 = 'assets/images_quiz/430.png';
  static const String map461 = 'assets/images_quiz/461.png';
  static const String map490 = 'assets/images_quiz/490.png';
  static const String map491 = 'assets/images_quiz/491.png';

// Question 5

  static const String quintaEssentia = 'assets/images_quiz/quinta_essentia.png';

// Question 7
  static const String sourceAnalysis = 'assets/images_quiz/source-analysis.png';

// Question 8
  static const String thucydides1 = 'assets/images_quiz/thucydides1.png';

// Question 9
  static const String piraeusAthens = 'assets/images_quiz/piraeus-athens.png';

// Question 10
  static const String body = 'assets/images_quiz/body.png';
  static const String bodyBG = 'assets/images_quiz/bg-body.png';

// Question 11
  static const String typhusFever = 'assets/images_quiz/typhus-fever.png';
  static const String smallpox = 'assets/images_quiz/smallpox.png';
  static const String plague = 'assets/images_quiz/plague.png';
  static const String typiod = 'assets/images_quiz/typiod.png';
  static const String ebola = 'assets/images_quiz/ebola.png';
  static const String feverBG = 'assets/images_quiz/bg-fever.png';

  // Question 12
  static const String painting = 'assets/images_quiz/painting.png';

  // Question 13
  static const String nikosChoose1 = 'assets/images_quiz/nikos-choose1.png';
  static const String nikosChoose2 = 'assets/images_quiz/nikos-choose2.png';
  static const String nikosChoose3 = 'assets/images_quiz/nikos-choose3.png';
  static const String nikosKeepGoing = 'assets/images_quiz/keep_going.png';
  static const String nikosQuitMedicine =
      'assets/images_quiz/quit_medicine.png';

  static const String gifParalaxNikosGif =
      'assets/paralax_new/character_nikos_lottie.gif';
  static const String gifBackground1 =
      'assets/assets/animated_backgrounds/1/liquid.gif';

  static const String gifBackground2 =
      'assets/assets/animated_backgrounds/2/liquid.gif';

  static const String gifBackground3 =
      'assets/assets/animated_backgrounds/3/liquid.gif';

  static const String gifBackground4 =
      'assets/assets/animated_backgrounds/4/liquid.gif';

  static const String gifBackground5 =
      'assets/assets/animated_backgrounds/5/liquid.gif';

  static const String gifBackground6 =
      'assets/assets/animated_backgrounds/6/liquid.gif';

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
  static const String animatedBack5Vbody10 =
      'assets/animated_backgrounds/5/virus/vbody_10.png';
  static const String animatedBack5Vbody11 =
      'assets/animated_backgrounds/5/virus/vbody_11.png';

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

  static const String virusLocMap = 'assets/image_back/virus_loc_map.png';
  static const String gradient = 'assets/image_back/gradient.png';

  static const String scoreimage = "assets/images_quiz/score.png";

  static const String gifVirusTyphoid =
      'assets/assets/animated_backgrounds/2/virus/typhoid.gif';

  static const String gifVirus = 'assets/assets/animated_backgrounds/virus.gif';

  static const String gifSmallpox = 'assets/assets/virus_gif/smallpox.gif';

  static const String gifTyphus = 'assets/assets/virus_gif/typhus.gif';

  static const String gifTyphoid = 'assets/assets/virus_gif/typhoid.gif';
  static const String gifEbola = 'assets/assets/virus_gif/ebola.gif';
  static const String glossaryBk = 'assets/image_back/glossary_bk.png';

  static const String gifBubonic = 'assets/assets/virus_gif/bubonic.gif';
  static const String charactersBackgroundImage =
      'assets/image_back/characters_page_back.png';
  static const String arrowBackImage = 'assets/icons/arrow_back.png';
  static const String arrowUpImage = 'assets/icons/arrow_up.png';
  static const String arrowForwardImage = "assets/icons/arrow_forward.png";
  static const String arrowDounImage = 'assets/icons/arrow_down.png';

  static const String periclesImage = "assets/characters/pericles.png";
  static const String aristophanesSophoclesImage =
      "assets/characters/aristophanes_sophocles.png";
  static const String phidiasImage = "assets/characters/phidias.png";

  static const String socratesPlatoImage =
      "assets/characters/socrates_plato.png";

  static const String thucydidesImage = "assets/characters/thucydides.png";

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

  static const String panaramaBackgroundImageLeft =
      'assets/panarama_image/choice1_left.jpg';
  static const String panaramaBackgroundImageRight =
      'assets/panarama_image/choice2_right.jpg';

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
  static const String mapImage414 = 'assets/map_images/414image.png';
  static const String mapImage415 = 'assets/map_images/415image.png';
  static const String mapImage416 = 'assets/map_images/416image.png';
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
  static const String irlGiana = 'assets/image_back/giana.png';
  static const String aboutBookMap = 'assets/image_back/about_book_map.png';
  static const String socilaIcons = 'assets/icons/social_icons.png';

  static const String paralaxBackground = 'assets/paralax_new/bk.jpg';
  static const String paralaxDeadBodies = 'assets/paralax_new/dead_bodies.png';
  static const String paralaxFireLottie = 'assets/paralax_new/fire/fire.json';
  static const String paralaxWomanLottie =
      'assets/paralax_new/woman/woman.json';

  static const String paralaxHotTubLottie =
      'assets/paralax_new/hottub/hottub.json';
  static const String paralaxCrowdLottie =
      'assets/paralax_new/crowd/crowd.json';
  static const String paralaxTube2Lottie =
      'assets/paralax_new/tube2/tube2.json';
  static const String paralaxYoungManLottie =
      'assets/paralax_new/young_man/young_man.json';
  static const String paralaxBuilding = 'assets/paralax_new/building.png';
  static const String paralaxWalker = 'assets/paralax_new/walker.png';
  static const String paralaxClouds2 = 'assets/paralax_new/clouds2.png';

  static const String gifHand = 'assets/paralax_new/hand.gif';

  static const String paralaxCharacterNikosLottie =
      'assets/paralax_new/character_nikos/character_nikos_lottie.json';
  static const String paralaxTubeCloud = 'assets/paralax_new/tube_cloud.png';
  static const String paralaxTube2Cloud = 'assets/paralax_new/tube2_cloud.png';
  static const String paralaxCrows = 'assets/paralax_new/crows.png';
  static const String paralaxClouds = 'assets/paralax_new/clouds.png';
  static const String paralaxCrowLottie = 'assets/paralax_new/crow/crow.json';
  static const String paralaxCrowsLottie =
      'assets/paralax_new/crows/crows.json';
  static const String paralaxFightersRightLottie =
      'assets/paralax_new/fighters_right/fighters_right.json';

  static const String paralaxFightersLeftLottie =
      'assets/paralax_new/fighters_left/fighters_left.json';
  static const String paralaxFightersLeft =
      'assets/paralax_new/fighters_left.png';
  static const String mapIntroImage = 'assets/map_lottie/map_01/map_01.png';

  static const String mapLottie410 =
      'assets/assets/map_lottie/map_02/index.html';

  static const String mapLottie413 =
      'assets/assets/map_lottie/map_03/index.html';

  static const String mapLottie414 =
      'assets/assets/map_lottie/map_04/index.html';
  static const String mapLottie427 =
      'assets/assets/map_lottie/map_05/index.html';

  static const String mapLottie431 =
      'assets/assets/map_lottie/map_06/index.html';

  static const String mapLottie454 =
      'assets/assets/map_lottie/map_07/index.html';

  static const String mapLottie404 =
      'assets/assets/map_lottie/map_08/index.html';
  static const String mapLottie407 =
      'assets/assets/map_lottie/map_09/index.html';

  static const String mapLottie477 =
      'assets/assets/map_lottie/map_10/index.html';

  // Change
  static const String paralaxHtml = 'assets/assets/paralax/index.html';

  static const String mapLottie495 =
      'assets/assets/map_lottie/map_11/index.html';

  static const String mapLottie490 =
      'assets/assets/map_lottie/map_12/index.html';
  static const String mapLottie480 =
      'assets/assets/map_lottie/map_13/index.html';

  static const String mapLottie479 =
      'assets/assets/map_lottie/map_14/index.html';

  static const String mapLottie471 =
      'assets/assets/map_lottie/map_15/index.html';

  static const String mapLottie469 =
      'assets/assets/map_lottie/map_16/index.html';
  static const String mapLottie461 =
      'assets/assets/map_lottie/map_17/index.html';

  static const String mapLottie451 =
      'assets/assets/map_lottie/map_18/index.html';

  static const String mapLottie450 =
      'assets/assets/map_lottie/map_19/index.html';

  static const String mapLottie446 =
      'assets/assets/map_lottie/map_20/index.html';
  static const String mapLottie443 =
      'assets/assets/map_lottie/map_21/index.html';

  static const String mapLottie429 =
      'assets/assets/map_lottie/map_22/index.html';

  static const String mapLottie421 =
      'assets/assets/map_lottie/map_23/index.html';

  static const String mapQuizImage1 = 'assets/images_quiz/map1.jpg';
  static const String mapQuizImage2 = 'assets/images_quiz/map2.jpg';
  static const String mapQuizImage3 = 'assets/images_quiz/map3.jpg';
  static const String mapQuizImage4 = 'assets/images_quiz/map4.jpg';
  static const String mapQuizImage5 = 'assets/images_quiz/map5.jpg';

  static const String mapLottie416 =
      'assets/assets/map_lottie/map_24/index.html';
  static const String mapLottie415 =
      'assets/assets/map_lottie/map_25/index.html';

  static const String mapLottie508 =
      'assets/assets/map_lottie/map_26/index.html';

  static const String mapLottie462 =
      'assets/assets/map_lottie/map_27/index.html';

  static const String mapLottie458 =
      'assets/assets/map_lottie/map_28/index.html';

  static const String mapLottie457 =
      'assets/assets/map_lottie/map_29/index.html';
  static const String mapLottie447_432 =
      'assets/assets/map_lottie/map_30/index.html';

  static const String mapLottie441 =
      'assets/assets/map_lottie/map_31/index.html';

  static const String mapLottie438 =
      'assets/assets/map_lottie/map_32/index.html';

  static const String mapLottie430 =
      'assets/assets/map_lottie/map_33/index.html';
  static const String mapLottie411 =
      'assets/assets/map_lottie/map_34/index.html';

  static const String mapLottie403 =
      'assets/assets/map_lottie/map_35/index.html';

  static const String mapLottie399 =
      'assets/assets/map_lottie/map_36/index.html';

  static const String virusLoc1 = 'assets/assets/map_lottie/map_01/index.html';

  static const String virusLoc2 = 'assets/assets/map_lottie/map_37/index.html';

  static const String lottieAssetsTube = 'assets/paralax_new/tube2.png';

  static const String lottieAssetsCrowd =
      'assets/paralax_new/crowd/images/crowd_bg.png';

  static const String checkIcon = "assets/icons/checkIcon.png";
  static const String restartIcon = "assets/icons/restartIcon.png";

  static const String gif1 = "assets/assets/virusGifs/comp.gif";
  static const String gif2 = "assets/assets/virusGifs/comp3.gif";
  static const String gif3 = "assets/assets/virusGifs/ebola.gif";
  static const String gif4 = "assets/assets/virusGifs/typhus.gif";
  static const String gif5 = "assets/assets/virusGifs/typoid.gif";

  //social
  static const String facebook = "assets/social/facebook-f.png";
  static const String instagram = "assets/social/instagram.png";
  static const String linkedin = "assets/social/linkedin-in.png";
  static const String twitter = "assets/social/twitter.png";
  static const String youtube = "assets/social/youtube.png";

  static const List<String> charactersPageImages = [
    AssetsPath.periclesImage,
    AssetsPath.socratesPlatoImage,
    AssetsPath.aristophanesSophoclesImage,
    AssetsPath.phidiasImage,
    AssetsPath.thucydidesImage,
  ];

  static const List<String> navigationPageImages = [
    AssetsPath.gradient,
  ];

  static const List<String> mapPageImages = [
    AssetsPath.mapTimeLineBlur,
    AssetsPath.mapDialogBlur,
    AssetsPath.mapImage399,
    AssetsPath.mapImage414,
    AssetsPath.mapImage415,
    AssetsPath.mapImage416,
    AssetsPath.mapImage427,
    AssetsPath.mapImage430,
    AssetsPath.mapImage431,
    AssetsPath.mapImage438,
    AssetsPath.mapImage441,
    AssetsPath.mapImage443,
    AssetsPath.mapImage446,
    AssetsPath.mapImage447_432,
    AssetsPath.mapImage450,
    AssetsPath.mapImage451,
    AssetsPath.mapImage454,
    AssetsPath.mapImage457,
    AssetsPath.mapImage458,
    AssetsPath.mapImage461,
    AssetsPath.mapImage462,
    AssetsPath.mapImage469,
    AssetsPath.mapImage471,
    AssetsPath.mapImage477,
    AssetsPath.mapImage479,
    AssetsPath.mapImage480,
    AssetsPath.mapImage490,
    AssetsPath.mapImage495,
  ];

  static const List<String> gianaPageImages = [
    AssetsPath.irlGiana,
  ];

  static const List<String> irlNikosPageImages = [
    AssetsPath.irlNikos,
  ];

  static const List<String> aboutBookPageImages = [
    AssetsPath.aboutBookMap,
  ];

  static const List<String> animatedParticles1Images = [
    AssetsPath.gifBackground1,
    AssetsPath.animatedBack1Vbody0,
    AssetsPath.animatedBack1Vbody1,
    AssetsPath.animatedBack1Vbody2,
    AssetsPath.animatedBack1Vbody3,
    AssetsPath.animatedBack1Vbody4,
    AssetsPath.animatedBack1Vbody5,
    AssetsPath.animatedBack1Vbody6,
    AssetsPath.animatedBack1Vbody7,
    AssetsPath.animatedBack1Vbody8,
  ];

  static const List<String> bodyImages = [
    AssetsPath.manChestImage,
    AssetsPath.manhandsImage,
    AssetsPath.manfillImage,
    AssetsPath.manIntroImage,
    AssetsPath.manheadImage,
    AssetsPath.manstomachImage,
    AssetsPath.manthroatImage,
  ];

  static const List<String> animatedParticles2Images = [
    AssetsPath.gifBackground2,
    AssetsPath.gifVirusTyphoid,
    AssetsPath.animatedBack2Vbody0,
    AssetsPath.animatedBack2Vbody1,
    AssetsPath.animatedBack2Vbody2,
    AssetsPath.animatedBack2Vbody3,
    AssetsPath.animatedBack2Vbody4,
    AssetsPath.animatedBack2Vbody5,
    AssetsPath.animatedBack2Vbody6,
    AssetsPath.animatedBack2Vbody7,
    AssetsPath.animatedBack2Vbody8,
  ];

  static const List<String> animatedParticles3Images = [
    AssetsPath.gifBackground3,
    AssetsPath.animatedBack3Vbody0,
    AssetsPath.animatedBack3Vbody1,
    AssetsPath.animatedBack3Vbody2,
    AssetsPath.animatedBack3Vbody3,
    AssetsPath.animatedBack3Vbody4,
    AssetsPath.animatedBack3Vbody5,
    AssetsPath.animatedBack3Vbody6,
    AssetsPath.animatedBack3Vbody7,
    AssetsPath.animatedBack3Vbody8,
    AssetsPath.animatedBack3Vbody9,
    AssetsPath.animatedBack3Vbody10,
    AssetsPath.animatedBack3Vbody11,
    AssetsPath.animatedBack3Vbody12,
    AssetsPath.animatedBack3Vbody13,
  ];

  static const List<String> animatedParticles4Images = [
    AssetsPath.gifBackground4,
    AssetsPath.animatedBack4Vbody0,
    AssetsPath.animatedBack4Vbody1,
    AssetsPath.animatedBack4Vbody2,
    AssetsPath.animatedBack4Vbody3,
    AssetsPath.animatedBack4Vbody4,
    AssetsPath.animatedBack4Vbody5,
    AssetsPath.animatedBack4Vbody6,
    AssetsPath.animatedBack4Vbody7,
    AssetsPath.animatedBack4Vbody8,
    AssetsPath.animatedBack4Vbody9,
    AssetsPath.animatedBack4Vbody10,
  ];

  static const List<String> animatedParticles5Images = [
    AssetsPath.gifBackground5,
    AssetsPath.animatedBack5Vbody0,
    AssetsPath.animatedBack5Vbody1,
    AssetsPath.animatedBack5Vbody2,
    AssetsPath.animatedBack5Vbody3,
    AssetsPath.animatedBack5Vbody4,
    AssetsPath.animatedBack5Vbody5,
    AssetsPath.animatedBack5Vbody6,
    AssetsPath.animatedBack5Vbody7,
    AssetsPath.animatedBack5Vbody8,
    AssetsPath.animatedBack5Vbody9,
    AssetsPath.animatedBack5Vbody10,
    AssetsPath.animatedBack5Vbody11,
  ];

  static const List<String> animatedParticles6Images = [
    AssetsPath.gifBackground6,
    AssetsPath.animatedBack6Vbody0,
    AssetsPath.animatedBack6Vbody1,
    AssetsPath.animatedBack6Vbody2,
    AssetsPath.animatedBack6Vbody3,
    AssetsPath.animatedBack6Vbody4,
    AssetsPath.animatedBack6Vbody5,
    AssetsPath.animatedBack6Vbody6,
    AssetsPath.animatedBack6Vbody7,
    AssetsPath.animatedBack6Vbody8,
    AssetsPath.animatedBack6Vbody9,
    AssetsPath.animatedBack6Vbody10,
  ];

  static const List<String> virusesInfoPageImages = [
    AssetsPath.gif1,
    AssetsPath.gif2,
    AssetsPath.gif3,
    AssetsPath.gif4,
    AssetsPath.gif5
  ];

  static const List<String> bodyInfoPageImages = [
    AssetsPath.manChestImage,
    AssetsPath.manhandsImage,
    AssetsPath.manfillImage,
    AssetsPath.manIntroImage,
    AssetsPath.manheadImage,
    AssetsPath.manstomachImage,
    AssetsPath.manthroatImage,
  ];

  static const List<String> panoramaImages = [
    AssetsPath.panaramaImage1,
    AssetsPath.panaramaImage2,
    AssetsPath.panaramaImage3,
    AssetsPath.panaramaImage4,
    AssetsPath.panaramaImage5,
    AssetsPath.panaramaImage6,
    AssetsPath.panaramaImage7,
    AssetsPath.panaramaImage8,
    AssetsPath.panaramaImage9,
    AssetsPath.panaramaImage10,
  ];

  static const List<String> paralaxImages = [
    AssetsPath.gifParalaxNikosGif,
    AssetsPath.paralaxBackground,
    AssetsPath.paralaxBuilding,
    AssetsPath.paralaxWalker,
    AssetsPath.paralaxTube2Cloud,
    AssetsPath.paralaxTubeCloud,
    AssetsPath.paralaxClouds,
  ];

  static const List<String> contentImages = [
    AssetsPath.gifVirus,
    AssetsPath.deadOfSocrates1,
    AssetsPath.deadOfSocrates2,
    AssetsPath.deadOfSocrates3,
    AssetsPath.endOfWar1,
    AssetsPath.endOfWar2,
    AssetsPath.endOfWar3,
    AssetsPath.poitButtonArrowRight,
    AssetsPath.socilaIcons,
    AssetsPath.glossaryBk,
    AssetsPath.keepGoing,
    AssetsPath.medicine,
    AssetsPath.quitMedicine,
    AssetsPath.document,
  ];

  static const List<String> allImages = [
    AssetsPath.periclesImage,
    AssetsPath.gradient,
    AssetsPath.mapTimeLineBlur,
    AssetsPath.mapDialogBlur,
    AssetsPath.irlGiana,
    AssetsPath.gifParalaxNikosGif,
    AssetsPath.irlNikos,
    AssetsPath.socratesPlatoImage,
    AssetsPath.aristophanesSophoclesImage,
    AssetsPath.phidiasImage,
    AssetsPath.thucydidesImage,
    AssetsPath.paralaxBackground,
    AssetsPath.gifBackground1,
    AssetsPath.aboutBookMap,
    AssetsPath.animatedBack1Vbody0,
    AssetsPath.animatedBack1Vbody1,
    AssetsPath.animatedBack1Vbody2,
    AssetsPath.animatedBack1Vbody3,
    AssetsPath.animatedBack1Vbody4,
    AssetsPath.animatedBack1Vbody5,
    AssetsPath.animatedBack1Vbody6,
    AssetsPath.animatedBack1Vbody7,
    AssetsPath.animatedBack1Vbody8,
    AssetsPath.animatedBack2Vbody0,
    AssetsPath.animatedBack2Vbody1,
    AssetsPath.animatedBack2Vbody2,
    AssetsPath.animatedBack2Vbody3,
    AssetsPath.animatedBack2Vbody4,
    AssetsPath.animatedBack2Vbody5,
    AssetsPath.animatedBack2Vbody6,
    AssetsPath.animatedBack2Vbody7,
    AssetsPath.animatedBack2Vbody8,
    AssetsPath.animatedBack3Vbody0,
    AssetsPath.animatedBack3Vbody1,
    AssetsPath.animatedBack3Vbody2,
    AssetsPath.animatedBack3Vbody3,
    AssetsPath.animatedBack3Vbody4,
    AssetsPath.animatedBack3Vbody5,
    AssetsPath.animatedBack3Vbody6,
    AssetsPath.animatedBack3Vbody7,
    AssetsPath.animatedBack3Vbody8,
    AssetsPath.animatedBack3Vbody9,
    AssetsPath.animatedBack3Vbody10,
    AssetsPath.animatedBack3Vbody11,
    AssetsPath.animatedBack3Vbody12,
    AssetsPath.animatedBack3Vbody13,
    AssetsPath.animatedBack4Vbody0,
    AssetsPath.animatedBack4Vbody1,
    AssetsPath.animatedBack4Vbody2,
    AssetsPath.animatedBack4Vbody3,
    AssetsPath.animatedBack4Vbody4,
    AssetsPath.animatedBack4Vbody5,
    AssetsPath.animatedBack4Vbody6,
    AssetsPath.animatedBack4Vbody7,
    AssetsPath.animatedBack4Vbody8,
    AssetsPath.animatedBack4Vbody9,
    AssetsPath.animatedBack4Vbody10,
    AssetsPath.animatedBack5Vbody0,
    AssetsPath.animatedBack5Vbody1,
    AssetsPath.animatedBack5Vbody2,
    AssetsPath.animatedBack5Vbody3,
    AssetsPath.animatedBack5Vbody4,
    AssetsPath.animatedBack5Vbody5,
    AssetsPath.animatedBack5Vbody6,
    AssetsPath.animatedBack5Vbody7,
    AssetsPath.animatedBack5Vbody8,
    AssetsPath.animatedBack5Vbody9,
    AssetsPath.animatedBack5Vbody10,
    AssetsPath.animatedBack5Vbody11,
    AssetsPath.animatedBack6Vbody0,
    AssetsPath.animatedBack6Vbody1,
    AssetsPath.animatedBack6Vbody2,
    AssetsPath.animatedBack6Vbody3,
    AssetsPath.animatedBack6Vbody4,
    AssetsPath.animatedBack6Vbody5,
    AssetsPath.animatedBack6Vbody6,
    AssetsPath.animatedBack6Vbody7,
    AssetsPath.gifVirus,
    AssetsPath.animatedBack6Vbody8,
    AssetsPath.animatedBack6Vbody9,
    AssetsPath.animatedBack6Vbody10,
    AssetsPath.panaramaImage1,
    AssetsPath.panaramaImage2,
    AssetsPath.panaramaImage3,
    AssetsPath.panaramaImage4,
    AssetsPath.panaramaImage5,
    AssetsPath.panaramaImage6,
    AssetsPath.panaramaImage7,
    AssetsPath.panaramaImage8,
    AssetsPath.panaramaImage9,
    AssetsPath.panaramaImage10,
    AssetsPath.mapImage399,
    AssetsPath.mapImage414,
    AssetsPath.mapImage415,
    AssetsPath.mapImage416,
    AssetsPath.mapImage427,
    AssetsPath.mapImage430,
    AssetsPath.mapImage431,
    AssetsPath.mapImage438,
    AssetsPath.mapImage441,
    AssetsPath.mapImage443,
    AssetsPath.mapImage446,
    AssetsPath.mapImage447_432,
    AssetsPath.mapImage450,
    AssetsPath.mapImage451,
    AssetsPath.mapImage454,
    AssetsPath.mapImage457,
    AssetsPath.mapImage458,
    AssetsPath.mapImage461,
    AssetsPath.mapImage462,
    AssetsPath.mapImage469,
    AssetsPath.mapImage471,
    AssetsPath.mapImage477,
    AssetsPath.mapImage479,
    AssetsPath.mapImage480,
    AssetsPath.mapImage490,
    AssetsPath.mapImage495,
    AssetsPath.deadOfSocrates1,
    AssetsPath.deadOfSocrates2,
    AssetsPath.deadOfSocrates3,
    AssetsPath.endOfWar1,
    AssetsPath.endOfWar2,
    AssetsPath.endOfWar3,
    AssetsPath.poitButtonArrowRight,
    AssetsPath.socilaIcons,
    AssetsPath.paralaxBuilding,
    AssetsPath.gifBackground1,
    AssetsPath.gifBackground2,
    AssetsPath.gifBackground3,
    AssetsPath.gifBackground4,
    AssetsPath.gifBackground5,
    AssetsPath.gifBackground6,
    AssetsPath.paralaxWalker,
    AssetsPath.paralaxTube2Cloud,
    AssetsPath.paralaxTubeCloud,
    AssetsPath.paralaxClouds,
    AssetsPath.gifVirusTyphoid,
    AssetsPath.gifSmallpox,
    AssetsPath.gifTyphus,
    AssetsPath.gifTyphoid,
    AssetsPath.gifEbola,
    AssetsPath.glossaryBk,
    AssetsPath.gifBubonic,
    AssetsPath.keepGoing,
    AssetsPath.medicine,
    AssetsPath.quitMedicine,
    AssetsPath.manChestImage,
    AssetsPath.manhandsImage,
    AssetsPath.manfillImage,
    AssetsPath.manIntroImage,
    AssetsPath.manheadImage,
    AssetsPath.manstomachImage,
    AssetsPath.manthroatImage,
    AssetsPath.document,
  ];
}

// Future<bool> loadContent(List<String> context) async {
//   for (int i = 0; i < context.length; i++) {
//     await getBytesFromAsset(context[i]);
//   }

//   return true;
// }

// Future<ui.Image> getBytesFromAsset(
//   String path,
// ) async {
//   final data = await rootBundle.load(path);

//   final codec = await ui.instantiateImageCodec(
//     data.buffer.asUint8List(),
//   );

//   final fi = await codec.getNextFrame();

//   final ui.Image byteData = fi.image;
//   return byteData;
// }

// Future<List<ImageInfo>> preloadImage({
//   required ImageProvider provider,
//   required BuildContext context,
//   int frameCount = 1,
//   Size? size,
//   ImageErrorListener? onError,
// }) async {
//   final ImageConfiguration config =
//       createLocalImageConfiguration(context, size: size);
//   final Completer<List<ImageInfo>> completer = Completer<List<ImageInfo>>();
//   final ImageStream stream = provider.resolve(config);
//   final List<ImageInfo> ret = [];

//   final ImageStreamListener imageStreamListener =
//       ImageStreamListener((ImageInfo image, bool sync) {
//     ret.add(image);
//     if (ret.length == frameCount) {
//       completer.complete(ret);
//     }
//   });

//   stream.addListener(imageStreamListener);
//   completer.future.then((List<ImageInfo> _) {
//     stream.removeListener(imageStreamListener);
//   });

//   return completer.future;
// }
