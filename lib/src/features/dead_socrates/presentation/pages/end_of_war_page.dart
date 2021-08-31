import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/animated_background/animated_particles_6.dart';
import 'package:history_of_adventures/src/core/widgets/animated_background/gif_background_widget.dart';
import 'package:history_of_adventures/src/core/widgets/card_image_and_text_widget.dart';

import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/styles.dart';
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
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
        setState(() {
          offset = e.position;
        });
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          endDrawer: const NavigationPage(),
          body: Stack(
            children: [
              GifBackground(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                asset: AssetsPath.gifBackground6,
              ),
              AnimatedParticlesSixth(
                constraints: constraints,
                mouseY: mouseY,
                mouseX: mouseX,
                objWave: objWave,
                offset: offset,
              ),
              CardTextAndImageWidget(
                  titleText: locale.chapter1PlagueAndPersecution,
                  slectedInfoDialog: socratesList[0],
                  listDialogInfo: socratesList,
                  constraints: constraints,
                  subTitleText: locale.endOfThePeloponneseanWar),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 24),
                  child: ArrowLeftTextWidget(
                      textSubTitle: locale.deathOfSocrates,
                      textTitle: locale.plagueAndPersecution,
                      onTap: () {
                        LeafDetails.currentVertex = 15;
                        if (kIsWeb) {
                          html.window.history.back();
                          context.router.pop();
                        } else {
                          context.router.pop();
                        }
                      }),
                ),
              ),
              SoundAndMenuWidget(
                icons: isSoundOn ? Icons.volume_up : Icons.volume_mute,
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
            ],
          ),
        );
      }),
    );
  }

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;

    socratesList = [
      SocratesInfoModel(
          description: locale.theSicilianExpeditionText,
          image: AssetsPath.endOfWar1,
          name: locale.theSicilianExpedition,
          imageText: locale.theSicilianExpeditionTextImage),
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
}
