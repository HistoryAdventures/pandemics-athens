import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/about_book/models/url_luncher.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../widgets/author_widget.dart';

class FurtherReadingPage extends StatefulWidget {
  const FurtherReadingPage({Key? key}) : super(key: key);

  @override
  _FurtherReadingPageState createState() => _FurtherReadingPageState();
}

class _FurtherReadingPageState extends State<FurtherReadingPage> {
  late AppLocalizations locale;

  final backgroundplayer = AudioPlayer();
  bool isSoundOn = false;

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
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
      endDrawer: const NavigationPage(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsPath.charactersBackgroundImage),
              fit: BoxFit.cover),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    top: HW.getHeight(128, context),
                    child: Container(
                      alignment: Alignment.center,
                      height: HW.getHeight(43, context),
                      child: Text(
                        locale.furtherReading.toUpperCase(),
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontSize: TextFontSize.getHeight(36, context)),
                      ),
                    )),
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
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: ArrowLeftTextWidget(
                            textSubTitle: locale.sources,
                            textTitle: locale.aboutTheBook,
                            onTap: () {
                              LeafDetails.currentVertex = 25;
                              NavigationSharedPreferences
                                  .upDateShatedPreferences();

                              if (kIsWeb) {
                                html.window.history.back();
                                context.router.pop();
                              } else {
                                context.router.pop();
                              }
                            }),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(AssetsPath.socilaIcons),
                            const AutoSizeText(
                              'www.historyadventures.co',
                              maxLines: 1,
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        child: ArrowRightTextWidget(
                            textSubTitle: locale.copyright,
                            textTitle: locale.aboutTheBook,
                            onTap: () {
                              LeafDetails.currentVertex = 27;
                              LeafDetails.visitedVertexes.add(27);
                              NavigationSharedPreferences
                                  .upDateShatedPreferences();
                              context.router.push(const CopyrightPageRoute());
                            }),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: constraints.maxHeight * 0.8,
                      margin: EdgeInsets.only(
                          left: constraints.maxWidth * 0.1,
                          right: constraints.maxWidth * 0.1,
                          bottom: 80,
                          top: constraints.maxHeight * 0.25),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AuthorWidget(
                                      profession: 'books',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            url:
                                                "https://www.amazon.com/dp/B002RI99EQ/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1",
                                            title:
                                                'History of Peloponnesian War, 4th cent, BCE'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      profession: 'audiobooks',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            url:
                                                "https://www.audible.com/pd/Viruses-Plagues-and-History-Audiobook/1977334695?ref=a_library_t_c5_libItem_&pf_rd_p=80765e81-b10a-4f33-b1d3-ffb87793d047&pf_rd_r=PYCGKM8QD8QDRDVCYTSX",
                                            title:
                                                'Viruses, Plagues and History, 2018'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      profession: 'podcasts',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            url:
                                                'https://podcasts.ox.ac.uk/athens-first-plague',
                                            title:
                                                'Athens: the First Plague? 2020'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AuthorWidget(
                                      profession: 'Movie & tv',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            url:
                                                'https://www.youtube.com/watch?v=GjbfS8RDoYo',
                                            title: "Athens vs Sparta, 2018"),
                                        // UrlLuncherModel(
                                        //     title: 'Splitting Adam'),
                                        // UrlLuncherModel(
                                        //     title: 'Star Trek: Nemesis'),
                                        // UrlLuncherModel(title: 'Barbarella'),
                                        // UrlLuncherModel(
                                        //     title: 'To Catch a Thief'),
                                        // UrlLuncherModel(
                                        //     title: 'To Catch a Thief'),
                                        // UrlLuncherModel(
                                        //     title:
                                        //         'Star Trek IV: The Voyage Home'),
                                        // UrlLuncherModel(
                                        //     title: 'Changing Lanes'),
                                        // UrlLuncherModel(title: 'The Score'),
                                        // UrlLuncherModel(
                                        //     title: 'Sunset Boulevard'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AuthorWidget(
                                      profession: 'video games',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            url:
                                                "https://www.ubisoft.com/en-gb/game/assassins-creed/odyssey",
                                            title:
                                                "Assassin's Creed:Odyssey, 2018"),
                                        // UrlLuncherModel(
                                        //     title: 'Street Fighter V'),
                                        // UrlLuncherModel(
                                        //     title: 'League of Legends'),
                                        // UrlLuncherModel(title: '​Arte'),
                                        // UrlLuncherModel(
                                        //     title: 'Ragnarok Online'),
                                        // UrlLuncherModel(title: 'VALORANT​'),
                                        // UrlLuncherModel(title: "Don't Starve"),
                                        // UrlLuncherModel(
                                        //     title: '​Dragon Ball FighterZ'),
                                        // UrlLuncherModel(
                                        //     title: '​Monster Hunter: World'),
                                        // UrlLuncherModel(
                                        //     title:
                                        //         '​Counter-Strike: Global Offensive'),
                                        // UrlLuncherModel(title: '​Música'),
                                        // UrlLuncherModel(
                                        //     title: '​Comes e bebes'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
