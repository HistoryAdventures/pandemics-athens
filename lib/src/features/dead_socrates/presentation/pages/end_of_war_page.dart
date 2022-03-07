import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/models/animated_particle_model.dart';
import 'package:rxdart/rxdart.dart';
import "package:universal_html/html.dart" as html;
import '../../../../core/router.gr.dart';

import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/animated_background/animated_particles_6.dart';
import '../../../../core/widgets/card_image_and_text_widget.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../modesl/socrates_info_model.dart';

class EndOfWarPage extends StatefulWidget {
  const EndOfWarPage({Key? key}) : super(key: key);

  @override
  _EndOfWarPageState createState() => _EndOfWarPageState();
}

class _EndOfWarPageState extends State<EndOfWarPage> {
  late AppLocalizations locale;

  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;
  Offset offset = Offset.zero;
  late List<SocratesInfoModel> socratesList;
  final skaffoldKey = GlobalKey<ScaffoldState>();

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

    firebaseScreenTracking();
    super.initState();
  }

  Future<void> firebaseScreenTracking() async {
    await FirebaseAnalytics.instance.logEvent(
        name: "views_by_url",
        parameters: {
          "page_url": "https://pandemics.historyadventures.app/end-of-war"
        });
  }

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;

    socratesList = [
      SocratesInfoModel(
        description: locale.theSicilianExpeditionText,
        image: AssetsPath.endOfWar1,
        name: locale.theSicilianExpedition,
        imageText: locale.theSicilianExpeditionTextImage,
      ),
      SocratesInfoModel(
        name: locale.theWallsCrumble,
        description: locale.theWallsCrumbleText,
        imageText: locale.theWallsCrumbleTextImage,
        image: AssetsPath.endOfWar2,
      ),
      SocratesInfoModel(
        name: locale.theAfterlifeOfClassicalAthens,
        description: locale.theAfterlifeOfClassicalAthensText,
        imageText: locale.theAfterlifeOfClassicalAthensTextImage,
        image: AssetsPath.endOfWar3,
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animatedParticlesBS.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: skaffoldKey,
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

          offset = e.position;

          animatedParticlesBS.sink.add(
            AnimatedParticleModel(x: mouseX, y: mouseY, objWave: objWave),
          );
        },
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              StreamBuilder<AnimatedParticleModel>(
                stream: animatedParticlesBS.stream,
                builder: (context, snapshot) {
                  return AnimatedParticlesSixth(
                    constraints: constraints,
                    mouseY: snapshot.data!.x,
                    mouseX: snapshot.data!.y,
                    objWave: snapshot.data!.objWave,
                    offset: offset,
                  );
                },
              ),
              CardTextAndImageWidget(
                  titleText: locale.chapter1PlagueAndPersecution,
                  slectedInfoDialog: socratesList[0],
                  listDialogInfo: socratesList,
                  constraints: constraints,
                  subTitleText: locale.endOfThePeloponneseanWar),
              Align(
                alignment: Alignment.bottomLeft,
                child: ArrowLeftTextWidget(
                    textSubTitle: locale.deathOfSocrates,
                    textTitle: locale.plagueAndPersecution,
                    onTap: () {
                      AudioPlayerUtil()
                          .playSound(AssetsPath.screenTransitionSound);
                      LeafDetails.currentVertex = 15;
                      LeafDetails.visitedVertexes.add(15);
                      NavigationSharedPreferences.upDateShatedPreferences();
                      context.router.replace(DeadOfSocratesPageToRight(
                        fromKeepGoing: false,
                      ));
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

                          //backgroundplayer.pause();
                        });
                      }
                    : () {
                        setState(() {
                          AudioPlayerUtil.isSoundOn =
                              !AudioPlayerUtil.isSoundOn;
                          AudioPlayerUtil().playSoundWithLoop(
                              AssetsPath.storyBackgroundSound);

                          //backgroundplayer.play();
                        });
                      },
                onTapMenu: () {
                  skaffoldKey.currentState?.openEndDrawer();
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
