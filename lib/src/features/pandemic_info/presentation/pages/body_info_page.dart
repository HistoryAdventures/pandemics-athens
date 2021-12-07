import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/animated_background/animated_particles_3.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../models/body_model.dart';

class BodyInfoPage extends StatefulWidget {
  const BodyInfoPage({Key? key}) : super(key: key);

  @override
  _BodyInfoPageState createState() => _BodyInfoPageState();
}

class _BodyInfoPageState extends State<BodyInfoPage>
    with SingleTickerProviderStateMixin {
  late AppLocalizations locale;
  late Animation<double> animation;
  late AnimationController controller;
  late List<BodyOnTapsModel> listCharacters;
  late BodyModel bodyModel;

  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;

  List<String> contentImages = [
    AssetsPath.manIntroImage,
    AssetsPath.manheadImage,
    AssetsPath.manthroatImage,
    AssetsPath.manChestImage,
    AssetsPath.manfillImage,
    AssetsPath.manstomachImage,
    AssetsPath.manhandsImage,
    AssetsPath.gifVirus,
    AssetsPath.gifTyphus,
    AssetsPath.gifSmallpox,
    AssetsPath.gifTyphoid,
    AssetsPath.gifEbola,
    AssetsPath.gifBubonic,
  ];

  bool isImageloaded = false;
  bool isSoundOn = false;
  Offset offset = const Offset(0, 0);

  final backgroundplayer = AudioPlayer();

  String? hoveredItemIndex;

  // Future<void> init() async {
  //   final loadedAssets = await loadContent(contentImages);
  //   if (loadedAssets == true) {
  //     setState(() {
  //       isImageloaded = true;
  //     });
  //   } else {
  //     setState(() {
  //       isImageloaded = false;
  //     });
  //   }
  // }

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    bodyModel = BodyModel(
      title: locale.bodyIntro,
      image: AssetsPath.manIntroImage,
      descriptiion: locale.intrBodyText,
    );

    listCharacters = [
      BodyOnTapsModel(
        bodyModel: BodyModel(
            image: AssetsPath.manIntroImage,
            descriptiion: locale.intrBodyText,
            title: locale.bodyIntro),
      ),
      BodyOnTapsModel(
        bodyModel: BodyModel(
          image: AssetsPath.manheadImage,
          descriptiion: locale.headText,
          title: locale.bodyHead,
        ),
      ),
      BodyOnTapsModel(
        bodyModel: BodyModel(
          image: AssetsPath.manthroatImage,
          descriptiion: locale.throatText,
          title: locale.bodyThroat,
        ),
      ),
      BodyOnTapsModel(
        bodyModel: BodyModel(
          image: AssetsPath.manChestImage,
          descriptiion: locale.chestText,
          title: locale.bodyCheast,
        ),
      ),
      BodyOnTapsModel(
        bodyModel: BodyModel(
          image: AssetsPath.manfillImage,
          descriptiion: locale.skinText,
          title: locale.skin,
        ),
      ),
      BodyOnTapsModel(
        bodyModel: BodyModel(
          image: AssetsPath.manstomachImage,
          descriptiion: locale.stomachText,
          title: locale.bodyStomach,
        ),
      ),
      BodyOnTapsModel(
        bodyModel: BodyModel(
          image: AssetsPath.manhandsImage,
          descriptiion: locale.hendsText,
          title: locale.bodyhands,
        ),
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // init();
    NavigationSharedPreferences.getNavigationListFromSF();

    controller = AnimationController(duration: Times.slower, vsync: this);
    animation = Tween<double>(begin: 80, end: 50).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (isImageloaded == false) {
    //   return LoadingWidget();
    // }

    return Scaffold(
      endDrawer: const NavigationPage(),
      body: MouseRegion(
        onHover: (e) {
          if (objWave < 50 && direction == 1) {
            objWave += .2;
          } else if (objWave == 50 && direction == 1) {
            direction = 0;
          } else if (objWave > -50 && direction == 0) {
            objWave -= .2;
          } else if (objWave == -50 && direction == 0) {
            direction = 1;
          }
          mouseX = (e.position.dx - width / 2) / 20;
          mouseY = (e.position.dy - height / 2) / 20;
          setState(() {});
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                AnimatedParticlesThird(
                  constraints: constraints,
                  mouseX: mouseX,
                  mouseY: mouseY,
                  objWave: objWave,
                ),
                Align(
                  child: Container(
                    margin: EdgeInsets.only(
                      right: HW.getWidth(129, context),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: constraints.maxHeight * 0.1),
                            //  color: Colors.red,
                            height: constraints.maxHeight,
                            child: AnimatedSwitcher(
                              duration: Times.medium,
                              transitionBuilder: (child, animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              child: BodyOnTapsModel(
                                key: ValueKey(bodyModel.image),
                                bodyModel: bodyModel,
                                height: constraints.maxHeight,
                                width: constraints.maxWidth,
                                onTapStomach: () {
                                  setState(() {
                                    bodyModel.chandeState(
                                      descriptiion: locale.stomachText,
                                      image: AssetsPath.manstomachImage,
                                      title: locale.bodyStomach,
                                    );
                                  });
                                },
                                onTapHends: () {
                                  setState(() {
                                    bodyModel.chandeState(
                                      descriptiion: locale.hendsText,
                                      image: AssetsPath.manhandsImage,
                                      title: locale.bodyhands,
                                    );
                                  });
                                },
                                onTapChest: () {
                                  setState(() {
                                    bodyModel.chandeState(
                                      descriptiion: locale.chestText,
                                      image: AssetsPath.manChestImage,
                                      title: locale.bodyCheast,
                                    );
                                  });
                                },
                                onTapThroat: () {
                                  setState(() {
                                    bodyModel.chandeState(
                                      descriptiion: locale.throatText,
                                      image: AssetsPath.manthroatImage,
                                      title: locale.bodyThroat,
                                    );
                                  });
                                },
                                onTapHead: () {
                                  setState(() {
                                    bodyModel.chandeState(
                                      descriptiion: locale.headText,
                                      image: AssetsPath.manheadImage,
                                      title: locale.bodyHead,
                                    );
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: HW.getHeight(676, context),
                          width: HW.getWidth(768, context),
                          decoration: BoxDecoration(
                              boxShadow: Shadows.universal,
                              color: AppColors.white),
                          padding:
                              EdgeInsets.all(constraints.maxHeight * 0.024),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: HW.getHeight(68, context),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  bottom:
                                                      HW.getHeight(8, context)),
                                              child: Text(
                                                locale.chapter1Pathogenprofile,
                                                maxLines: 1,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1
                                                    ?.copyWith(
                                                      fontSize: TextFontSize
                                                          .getHeight(
                                                              14, context),
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                                locale.whatDidItDo
                                                    .toUpperCase(),
                                                maxLines: 1,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2
                                                    ?.copyWith(
                                                      fontSize: TextFontSize
                                                          .getHeight(
                                                              32, context),
                                                    )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        margin: EdgeInsets.only(
                                          top: HW.getHeight(16, context),
                                          bottom: HW.getHeight(16, context),
                                        ),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                                color: AppColors.grey,
                                                width: 1.2),
                                            bottom: BorderSide(
                                                color: AppColors.grey,
                                                width: 1.2),
                                          ),
                                        ),
                                        child: HAScrollbar(
                                          isAlwaysShown: true,
                                          child: ListView(
                                              shrinkWrap: true,
                                              children: [
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 24, top: 16),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 16),
                                                            child: AutoSizeText(
                                                                bodyModel.title
                                                                    .toUpperCase(),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline3),
                                                          ),
                                                          Text(
                                                            bodyModel
                                                                .descriptiion,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1,
                                                          ),
                                                        ])),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: HW.getHeight(22, context),
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: listCharacters
                                            .map((data) => MouseRegion(
                                                  onHover: (_) {
                                                    setState(() {
                                                      hoveredItemIndex =
                                                          data.bodyModel.title;
                                                    });
                                                  },
                                                  onExit: (_) {
                                                    setState(() {
                                                      hoveredItemIndex = null;
                                                    });
                                                  },
                                                  child: bodiesNameListWidget(
                                                      isHoverd:
                                                          hoveredItemIndex ==
                                                              data.bodyModel
                                                                  .title,
                                                      title:
                                                          data.bodyModel.title,
                                                      text: data.bodyModel
                                                          .descriptiion,
                                                      image:
                                                          data.bodyModel.image),
                                                ))
                                            .toList())),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ArrowLeftTextWidget(
                      textSubTitle: locale.whereDidItComeFrom,
                      textTitle: locale.pathogenProfile,
                      onTap: () {
                        LeafDetails.currentVertex = 11;
                        NavigationSharedPreferences.upDateShatedPreferences();

                        // if (kIsWeb) {
                        //   html.window.history.back();
                        //   context.router.pop();
                        // } else {
                        //   context.router.pop();
                        // }
                        context.router
                            .push(const VirusLocationSecondPageRoute());
                      }),
                ),
                SoundAndMenuWidget(
                  icons: isSoundOn
                      ? AssetsPath.iconVolumeOn
                      : AssetsPath.iconVolumeOff,
                  onTapVolume: isSoundOn
                      ? () {
                          setState(() {
                            isSoundOn = !isSoundOn;
                            backgroundplayer.pause();
                          });
                        }
                      : () {
                          setState(() {
                            isSoundOn = !isSoundOn;
                            backgroundplayer.play();
                          });
                        },
                  onTapMenu: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ArrowRightTextWidget(
                      textSubTitle: locale.whatWasIt,
                      textTitle: locale.pathogenProfile,
                      onTap: () {
                        LeafDetails.currentVertex = 13;
                        LeafDetails.visitedVertexes.add(13);
                        NavigationSharedPreferences.upDateShatedPreferences();
                        context.router.push(const VirusesInfoPageRoute());
                      }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget bodiesNameListWidget(
      {String? title, String? image, String? text, bool isHoverd = false}) {
    return Container(
        margin: const EdgeInsets.only(right: 30),
        child: Clickable(
          onPressed: () {
            setState(() {
              bodyModel.chandeState(
                  title: title, image: image, descriptiion: text);
            });
          },
          child: AutoSizeText(title!.toUpperCase(),
              maxLines: 1,
              style: bodyModel.title == title || isHoverd
                  ? Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.orange)
                  : Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.grey)),
        ));
  }
}
