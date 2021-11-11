import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:just_audio/just_audio.dart';
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
  const DeadOfSocratesPage({Key? key}) : super(key: key);

  @override
  _DeadOfSocratesPageState createState() => _DeadOfSocratesPageState();
}

class _DeadOfSocratesPageState extends State<DeadOfSocratesPage> {
  late AppLocalizations locale;

  Offset offset = const Offset(0, 0);
  late List<SocratesInfoModel> socratesList;
  final scaffoldkey = GlobalKey<ScaffoldState>();
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;
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
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      endDrawer: const NavigationPage(),
      body: MouseRegion(
        onHover: (e) {
          setState(() {
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
            setState(() {
              offset = e.position;
            });
          });
        },
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              AnimatedParticlesFive(
                constraints: constraints,
                mouseX: mouseX,
                mouseY: mouseY,
                objWave: objWave,
              ),
              CardTextAndImageWidget(
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
                    LeafDetails.currentVertex = 17;
                    LeafDetails.visitedVertexes.add(17);
                    NavigationSharedPreferences.upDateShatedPreferences();
                    context.router.push(const QuizPageRoute());
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
                      LeafDetails.currentVertex = 16;
                      LeafDetails.visitedVertexes.add(16);
                      NavigationSharedPreferences.upDateShatedPreferences();
                      context.router.push(const EndOfWarPageRoute());
                    }),
              ),
              SoundAndMenuWidget(
                widget: IconButtonWidget(
                  onPressed: () {
                    LeafDetails.currentVertex = 14;
                    NavigationSharedPreferences.upDateShatedPreferences();
                    if (kIsWeb) {
                      html.window.history.back();
                      context.router.pop();
                    } else {
                      context.router.pop();
                    }
                  },
                  icon: const Icon(Icons.arrow_upward),
                  iconSize: HW.getHeight(40, context),
                ),
                      icons: isSoundOn ? AssetsPath.iconVolumeOn : AssetsPath.iconVolumeOff,
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
