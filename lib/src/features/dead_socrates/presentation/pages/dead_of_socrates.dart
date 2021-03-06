import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/widgets/app_up_button.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:history_of_adventures/src/features/practice_medicine/presentation/pages/keep_going_page.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/models/animated_particle_model.dart';
import 'package:rxdart/rxdart.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/animated_background/animated_particles_5.dart';
import '../../../../core/widgets/card_image_and_text_widget.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../modesl/socrates_info_model.dart';

class DeadOfSocratesPage extends StatefulWidget {
  final bool? fromKeepGoing;
  const DeadOfSocratesPage({
    Key? key,
    this.fromKeepGoing,
  }) : super(key: key);

  @override
  _DeadOfSocratesPageState createState() => _DeadOfSocratesPageState();
}

class _DeadOfSocratesPageState extends State<DeadOfSocratesPage> {
  late AppLocalizations locale;

  Offset offset = const Offset(0, 0);
  late List<SocratesInfoModel> socratesList;
  final scaffoldkey = GlobalKey<ScaffoldState>();
  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;

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
    await FirebaseAnalytics.instance
        .logEvent(name: "death-of-socrates", parameters: {
      "page_url": "https://pandemics.historyadventures.app/death-of-socrates"
    });

    await FirebaseAnalytics.instance
        .logScreenView(screenName: "death-of-socrates");
  }

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;

    socratesList = [
      SocratesInfoModel(
          description: locale.athenianDefeatText,
          image: AssetsPath.deadOfSocrates1,
          name: locale.athenianDefeat,
          imageText: locale.athenianDefeatImageText),
      SocratesInfoModel(
        name: locale.timeOfTyrants,
        description: locale.timeOfTyrantsText,
        imageText: locale.timeOfTyrantsImageText,
        image: AssetsPath.deadOfSocrates2,
      ),
      SocratesInfoModel(
        name: locale.deathPhilosopher,
        description: locale.deathPhilosopherText,
        imageText: locale.deathPhilosopherImageText,
        image: AssetsPath.deadOfSocrates3,
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
      key: scaffoldkey,
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
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              StreamBuilder<AnimatedParticleModel>(
                stream: animatedParticlesBS.stream,
                builder: (context, snapshot) {
                  return AnimatedParticlesFive(
                    constraints: constraints,
                    mouseX: snapshot.data!.x,
                    mouseY: snapshot.data!.y,
                    objWave: snapshot.data!.objWave,
                  );
                },
              ),
              CardTextAndImageWidget(
                usePositionedParent: true,
                constraints: constraints,
                listDialogInfo: socratesList,
                slectedInfoDialog: socratesList[0],
                subTitleText: locale.deathOfSocrates,
                titleText: locale.chapter1PlagueAndPersecution,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: IconButtonWidget(
                  iconSize: HW.getHeight(37, context),
                  onPressed: () {
                    AudioPlayerUtil.audioPlayerLoop.release();
                    AudioPlayerUtil()
                        .playSound(AssetsPath.screenTransitionSound);
                    LeafDetails.currentVertex = 17;
                    LeafDetails.visitedVertexes.add(17);
                    NavigationSharedPreferences.upDateShatedPreferences();
                    context.router.replace(const QuizPageRoute());
                  },
                  icon: const Icon(Icons.arrow_downward),
                  color: AppColors.black100,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ArrowRightTextWidget(
                    textSubTitle: locale.endOfThePeloponneseanWar,
                    textTitle: locale.plagueAndPersecution,
                    onTap: () {
                      AudioPlayerUtil()
                          .playSound(AssetsPath.screenTransitionSound);
                      LeafDetails.currentVertex = 16;
                      LeafDetails.visitedVertexes.add(16);
                      NavigationSharedPreferences.upDateShatedPreferences();
                      context.router.replace(const EndOfWarPageRoute());
                    }),
              ),
              SoundAndMenuWidget(
                widget: AppUpButton(
                  onTap: () {
                    AudioPlayerUtil()
                        .playSound(AssetsPath.screenTransitionSound);
                    AudioPlayerUtil.audioPlayerLoop.release();
                    LeafDetails.currentVertex = 14;
                    NavigationSharedPreferences.upDateShatedPreferences();
                    if (widget.fromKeepGoing!) {
                      context.router.replace(KeepGoingPageBottomRoute());
                    } else {
                      context.router.replace(QuitMedicinePageToBottom());
                    }
                  },
                ),
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
                  scaffoldkey.currentState!.openEndDrawer();
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
