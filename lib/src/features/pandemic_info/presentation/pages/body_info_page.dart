import 'dart:async';
import 'dart:html';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/utils/image_precache.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/models/animated_particle_model.dart';
import "package:universal_html/html.dart" as html;
import 'package:rxdart/rxdart.dart';

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
  late List<BodyOnTapsModel> listCharacters;
  late BodyModel bodyModel;

  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;

  bool isImageloaded = false;
  Offset offset = const Offset(0, 0);

  String? hoveredItemIndex;

  late BehaviorSubject<AnimatedParticleModel> animatedParticlesBS;

  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();

    animatedParticlesBS = BehaviorSubject<AnimatedParticleModel>.seeded(
      AnimatedParticleModel(
        x: mouseX,
        y: mouseY,
        objWave: objWave,
      ),
    );
    AudioPlayerUtil().playSoundWithLoop(AssetsPath.storyBackgroundSound);
    AudioPlayerUtil.audioPlayerLoop.state = PlayerState.PLAYING;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImages();
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

  bool ignoringBody = true;
  Timer? timer;

  @override
  void dispose() {
    animatedParticlesBS.close();
    super.dispose();
  }

  Future<void> precacheImages() async {
    if (window.sessionStorage.containsKey('bodyImageIsCashed')) return;

    // setState(() {
    //   showLoading = true;
    // });

    await Future.wait([ImagePrecache.precacheBodyImages(context)]);

    window.sessionStorage.putIfAbsent('bodyImageIsCashed', () => 'true');
  }

  @override
  Widget build(BuildContext context) {
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

          animatedParticlesBS.sink.add(
            AnimatedParticleModel(x: mouseX, y: mouseY, objWave: objWave),
          );
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // SizedBox(
                //   child: Image.asset(
                //     bodyModel.image,
                //     fit: BoxFit.contain,
                //   ),
                // ),
                StreamBuilder<AnimatedParticleModel>(
                  stream: animatedParticlesBS.stream,
                  builder: (context, snapshot) {
                    return AnimatedParticlesThird(
                      constraints: constraints,
                      mouseX: snapshot.data!.x,
                      mouseY: snapshot.data!.y,
                      objWave: snapshot.data!.objWave,
                    );
                  },
                ),
                Align(
                  child: Container(
                    margin: EdgeInsets.only(
                      right: HW.getWidth(131, context),
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
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                MouseRegion(
                                  onExit: (_) {
                                    ignoringBody = true;
                                    print("this is worked");
                                    timer = null;
                                    setState(() {});
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          child: Image.asset(
                                            bodyModel.image,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        AnimatedSwitcher(
                                          duration: Times.medium,
                                          transitionBuilder:
                                              (child, animation) {
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
                                            onExit: () {
                                              setState(() {
                                                bodyModel = BodyModel(
                                                  title: locale.bodyIntro,
                                                  image:
                                                      AssetsPath.manIntroImage,
                                                  descriptiion:
                                                      locale.intrBodyText,
                                                );
                                              });
                                            },
                                            onTapSkin: () {
                                              setState(() {
                                                bodyModel.chandeState(
                                                  descriptiion: locale.skinText,
                                                  image:
                                                      AssetsPath.manfillImage,
                                                  title: locale.skin,
                                                );
                                              });
                                            },
                                            onTapStomach: () {
                                              setState(() {
                                                bodyModel.chandeState(
                                                  descriptiion:
                                                      locale.stomachText,
                                                  image: AssetsPath
                                                      .manstomachImage,
                                                  title: locale.bodyStomach,
                                                );
                                              });
                                            },
                                            onTapHands: () {
                                              setState(() {
                                                bodyModel.chandeState(
                                                  descriptiion:
                                                      locale.hendsText,
                                                  image:
                                                      AssetsPath.manhandsImage,
                                                  title: locale.bodyhands,
                                                );
                                              });
                                            },
                                            onTapChest: () {
                                              setState(() {
                                                bodyModel.chandeState(
                                                  descriptiion:
                                                      locale.chestText,
                                                  image:
                                                      AssetsPath.manChestImage,
                                                  title: locale.bodyCheast,
                                                );
                                              });
                                            },
                                            onTapThroat: () {
                                              setState(() {
                                                bodyModel.chandeState(
                                                  descriptiion:
                                                      locale.throatText,
                                                  image:
                                                      AssetsPath.manthroatImage,
                                                  title: locale.bodyThroat,
                                                );
                                              });
                                            },
                                            onTapHead: () {
                                              setState(() {
                                                bodyModel.chandeState(
                                                  descriptiion: locale.headText,
                                                  image:
                                                      AssetsPath.manheadImage,
                                                  title: locale.bodyHead,
                                                );
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (ignoringBody)
                                  MouseRegion(
                                    opaque: false,
                                    onExit: (_) {
                                      if (timer != null) {
                                        Timer(const Duration(milliseconds: 50),
                                            () {
                                          timer!.cancel();
                                          timer = null;
                                        });
                                      }
                                    },
                                    onHover: (_) {
                                      print("on hover");
                                      timer ??= Timer(
                                          const Duration(milliseconds: 2000),
                                          () {
                                        print("condition");
                                        ignoringBody = false;
                                        setState(() {});
                                      });
                                    },
                                    child: Container(
                                      height: HW.getHeight(750, context),
                                      width: HW.getWidth(240, context),
                                      color: Colors.transparent,
                                    ),
                                  ),
                              ],
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
                        AudioPlayerUtil()
                            .playSound(AssetsPath.screenTransitionSound);
                        LeafDetails.currentVertex = 11;
                        NavigationSharedPreferences.upDateShatedPreferences();

                        // if (kIsWeb) {
                        //   html.window.history.back();
                        //   context.router.pop();
                        // } else {
                        //   context.router.pop();
                        // }
                        context.router
                            .push(const VirusLocationSecondPageToRight());
                      }),
                ),
                SoundAndMenuWidget(
                  icons: AudioPlayerUtil.isSoundOn
                      ? AssetsPath.iconVolumeOn
                      : AssetsPath.iconVolumeOff,
                  onTapVolume: AudioPlayerUtil.isSoundOn
                      ? () {
                          setState(() {
                            AudioPlayerUtil.isSoundOn =
                                !AudioPlayerUtil.isSoundOn;
                            AudioPlayerUtil().playSoundWithLoop(
                                AssetsPath.storyBackgroundSound);
                          });
                        }
                      : () {
                          setState(() {
                            AudioPlayerUtil.isSoundOn =
                                !AudioPlayerUtil.isSoundOn;
                            AudioPlayerUtil().playSoundWithLoop(
                                AssetsPath.storyBackgroundSound);
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
                        AudioPlayerUtil()
                            .playSound(AssetsPath.screenTransitionSound);
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
            AudioPlayerUtil().playSound(AssetsPath.changeIndex);
            setState(() {
              bodyModel.chandeState(
                  title: title, image: image, descriptiion: text);
            });
          },
          child: Text(title!.toUpperCase(),
              maxLines: 1,
              // minFontSize: HW.getHeight(14, context),
              style: bodyModel.title == title || isHoverd
                  ? Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.orange)
                      .copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: HW.getHeight(17, context),
                      )
                  : Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.black.withOpacity(
                        0.6,
                      ),
                      fontSize: HW.getHeight(17, context))),
        ));
  }
}
