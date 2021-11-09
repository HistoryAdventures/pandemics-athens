import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/animated_background/animated_particles_2.dart';
import '../../../../core/widgets/animated_widgets/gif_contrrol.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class PathogenProfilePage extends StatefulWidget {
  const PathogenProfilePage({Key? key}) : super(key: key);

  @override
  _PathogenProfilePageState createState() => _PathogenProfilePageState();
}

class _PathogenProfilePageState extends State<PathogenProfilePage>
    with SingleTickerProviderStateMixin {
  int _selectedItem = 400;
  //final _scrollController = ScrollController();
  late AppLocalizations locals;
  Offset offset = const Offset(0, 0);
  late GifController controller;
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();

  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    controller = GifController(vsync: this);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controller.repeat(
        min: 0,
        max: 150,
        period: const Duration(seconds: 4),
        reverse: true,
      );
    });
    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
      body: LayoutBuilder(builder: (context, constraints) {
        return MouseRegion(
          onHover: (e) => setState(() {
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
          }),
          child: Stack(
            children: [
              AnimatedParticlesSecond(
                constraints: constraints,
                mouseX: mouseX,
                mouseY: mouseY,
                objWave: objWave,
              ),
              Positioned(
                  top: HW.getHeight(192, context),
                  left: HW.getWidth(128, context),
                  child: Container(
                    height: HW.getHeight(676, context),
                    width: HW.getWidth(768, context),
                    decoration: BoxDecoration(
                        color: AppColors.white, boxShadow: Shadows.universal),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: HW.getHeight(68, context),
                            width: constraints.maxWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: HW.getHeight(8, context)),
                                    child: Text(locals.chapter1,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                                fontSize:
                                                    TextFontSize.getHeight(
                                                        16, context))),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    locals.pathogenProfile.toUpperCase(),
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(
                                            fontSize: TextFontSize.getHeight(
                                                32, context)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              margin: EdgeInsets.only(
                                top: HW.getHeight(16, context),
                              ),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: AppColors.grey, width: 1.2),
                                ),
                              ),
                              child: HAScrollbar(
                                child: ListView(shrinkWrap: true, children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 24, top: 16),
                                    child: AutoSizeText(
                                      locals.pathogenProfileText,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: ArrowRightTextWidget(
                    textSubTitle: locals.whereDidItComeFrom,
                    textTitle: locals.pathogenProfile,
                    onTap: () {
                      LeafDetails.currentVertex = 11;
                      LeafDetails.visitedVertexes.add(11);
                      NavigationSharedPreferences.upDateShatedPreferences();
                      context.router.push(const VirusLocationPageRoute());
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Clickable(
                  onPressed: () {
                    LeafDetails.currentVertex = 14;
                    LeafDetails.visitedVertexes.add(14);
                    NavigationSharedPreferences.upDateShatedPreferences();
                    context.router.push(const PracticeMedicineRoute());
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.all(24),
                      child: Image.asset(AssetsPath.scrollIcon)),
                ),
              ),
              SoundAndMenuWidget(
                widget: IconButtonWidget(
                  iconSize: HW.getHeight(40, context),
                  icon: const Icon(Icons.arrow_upward_sharp),
                  onPressed: () {
                    LeafDetails.currentVertex = 9;
                    NavigationSharedPreferences.upDateShatedPreferences();

                    if (kIsWeb) {
                      html.window.history.back();
                      context.router.pop();
                    } else {
                      context.router.pop();
                    }
                  },
                  color: AppColors.white,
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
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  void chandeState(int? selctedItem) {
    setState(() {
      _selectedItem = selctedItem!;
    });
  }

  Widget yearsWidget({int? index, int? selected}) {
    return Container(
      //padding: const EdgeInsets.only(),
      alignment: Alignment.center,
      // color: Colors.red,
      margin: const EdgeInsets.only(
        left: 30,
      ),
      child: Clickable(
        onPressed: () {
          chandeState(selected);
        },
        child: Text(
          "${400 + index!}",
          style: _selectedItem == selected
              ? const TextStyle(
                  color: AppColors.orange,
                  fontSize: 36,
                )
              : const TextStyle(color: AppColors.blackB, fontSize: 15),
        ),
      ),
    );
  }
}
