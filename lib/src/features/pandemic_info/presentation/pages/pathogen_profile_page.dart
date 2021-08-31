import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/animated_background/animated_particles_2.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
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
          onHover: (e) => setState(() => offset = e.position),
          child: Stack(
            children: [
              AnimatedParticlesSecond(
                constraints: constraints,
                offset: offset,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    height: constraints.maxHeight * 0.6,
                    width: constraints.maxWidth * 0.5,
                    decoration: BoxDecoration(
                        color: AppColors.white, boxShadow: Shadows.universal),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    width: constraints.maxWidth,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: AppColors.grey,
                                                width: 1.2))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: AutoSizeText(
                                              '${locals.chapter1}\n',
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1
                                                  ?.copyWith(fontSize: 22)),
                                        ),
                                        Flexible(
                                          child: AutoSizeText(
                                            locals.pathogenProfile
                                                .toUpperCase(),
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Scrollbar(
                                    child:
                                        ListView(shrinkWrap: true, children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, right: 38),
                                        child: AutoSizeText(
                                          locals.pathogenProfileText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ArrowRightTextWidget(
                      textSubTitle: locals.whereDidItComeFrom,
                      textTitle: locals.pathogenProfile,
                      onTap: () {
                        LeafDetails.currentVertex = 11;
                        LeafDetails.visitedVertexes.add(11);
                        context.router.push(const VirusLocationPageRoute());
                      }),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Clickable(
                  onPressed: () {
                    LeafDetails.currentVertex = 14;
                    LeafDetails.visitedVertexes.add(14);
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
                widget: Clickable(
                  onPressed: () {
                    LeafDetails.currentVertex = 9;
                    if (kIsWeb) {
                      html.window.history.back();
                      context.router.pop();
                    } else {
                      context.router.pop();
                    }
                  },
                  child: const Icon(
                    Icons.arrow_upward_sharp,
                    color: Colors.black,
                  ),
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
