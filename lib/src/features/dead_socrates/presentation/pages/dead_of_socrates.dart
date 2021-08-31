import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/animated_background/animated_particles_5.dart';
import 'package:history_of_adventures/src/core/widgets/card_image_and_text_widget.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
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

  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
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
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            offset = event.position;
          });
        },
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              AnimatedParticlesFive(
                constraints: constraints,
                offset: offset,
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
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Clickable(
                    onPressed: () {
                      LeafDetails.currentVertex = 17;
                      LeafDetails.visitedVertexes.add(17);
                      context.router.push(const QuizPageRoute());
                    },
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          AssetsPath.arrowDounImage,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 24),
                  child: ArrowRightTextWidget(
                      textSubTitle: locale.endOfThePeloponneseanWar,
                      textTitle: locale.plagueAndPersecution,
                      onTap: () {
                        LeafDetails.currentVertex = 16;
                        LeafDetails.visitedVertexes.add(16);
                        context.router.push(const EndOfWarPageRoute());
                      }),
                ),
              ),
              SoundAndMenuWidget(
                widget: Clickable(
                  onPressed: () {
                    LeafDetails.currentVertex = 14;
                    if (kIsWeb) {
                      html.window.history.back();
                      context.router.pop();
                    } else {
                      context.router.pop();
                    }
                  },
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        AssetsPath.arrowUpImage,
                        color: Colors.black,
                      )),
                ),
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
          );
        }),
      ),
    );
  }
}
