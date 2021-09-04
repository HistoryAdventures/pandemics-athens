import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/widgets/animated_background/animated_particles_1.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class LeandingPage extends StatefulWidget {
  const LeandingPage({Key? key}) : super(key: key);

  @override
  _LeandingPageState createState() => _LeandingPageState();
}

class _LeandingPageState extends State<LeandingPage>
    with SingleTickerProviderStateMixin {
  late AppLocalizations locales;
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  bool isImageloaded = false;
  Offset offset = const Offset(0, 0);

  List<String> contentImages = [
    AssetsPath.gifVirus,
    // AssetsPath.paralaxCharacterNikosGif,
    AssetsPath.paralaxBackground,
    AssetsPath.gifBackground1,
  ];
  // late List<ImageInfo> imageInfo;

  @override
  void didChangeDependencies() {
    locales = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  Future<void> init() async {
    final loadedAssets = await loadContent(contentImages);

    // imageInfo = await preloadImage(
    //     provider: const AssetImage(AssetsPath.gifVirus),
    //     frameCount: 180,
    //     context: context);
    if (loadedAssets == true) {
      setState(() {
        isImageloaded = true;
      });
    } else {
      setState(() {
        isImageloaded = false;
      });
    }
    NavigationSharedPreferences.clearSF();
  }

  @override
  void initState() {
    init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isImageloaded == false) {
      return const LoadingWidget();
    }
    return Scaffold(
        endDrawer: const NavigationPage(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return MouseRegion(
              onHover: (e) => setState(() {
                offset = e.position;
              }),
              child: Stack(
                children: [
                  AnimatedParticlesFirst(
                    constraints: constraints,
                    offset: offset,
                  ),
                  Align(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(constraints.maxWidth * 0.15,
                          0, constraints.maxWidth * 0.1, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: AutoSizeText(
                                        locales.spencerStrikerName
                                            .toUpperCase(),
                                        maxLines: 1,
                                        style: DefaultTheme
                                            .standard.textTheme.headline1
                                            ?.copyWith(fontSize: 24))),
                                Flexible(
                                  child: AutoSizeText(
                                    locales.historyAdventures.toUpperCase(),
                                    maxLines: 1,
                                    style: Theme.of(context).textTheme.overline,
                                  ),
                                ),
                                Flexible(
                                  child: AutoSizeText(
                                    locales.worldOfCharacters.toUpperCase(),
                                    maxLines: 1,
                                    maxFontSize: 100,
                                    style: Theme.of(context)
                                        .textTheme
                                        .overline
                                        ?.copyWith(fontSize: 100),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                                color: AppColors.red,
                                                width: 8))),
                                    child: AutoSizeText(
                                      locales.globalPandemicsName,
                                      maxLines: 1,
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      color: AppColors.blackB,
                      iconSize: 40,
                      icon: const Icon(Icons.south),
                      onPressed: () async {
                        LeafDetails.visitedVertexes.add(1);
                        LeafDetails.currentVertex = 1;
                        // print(LeafDetails.visitedVertexes);
                        NavigationSharedPreferences.upDateShatedPreferences();
                        context.router.push(const GlossaryPageRoute());
                      },
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
          },
        ));
  }
}
