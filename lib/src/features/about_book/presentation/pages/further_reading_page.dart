import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';
import 'package:history_of_adventures/src/features/about_book/models/url_luncher.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
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
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ArrowLeftTextWidget(
                      textSubTitle: locale.copyright,
                      textTitle: locale.aboutTheBook,
                      onTap: () {
                        LeafDetails.currentVertex = 26;
                        NavigationSharedPreferences.upDateShatedPreferences();

                        if (kIsWeb) {
                          html.window.history.back();
                          context.router.pop();
                        } else {
                          context.router.pop();
                        }
                      }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: HW.getHeight(45, context)),
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
                                            title: 'The Little Prince'),
                                        UrlLuncherModel(
                                            title: 'To Kill a Mockingbird'),
                                        UrlLuncherModel(
                                            title: 'To Kill a Mockingbird'),
                                        UrlLuncherModel(title: 'Siddhartha'),
                                        UrlLuncherModel(
                                            title: 'A Game of Thrones'),
                                        UrlLuncherModel(
                                            title: 'To Kill a Mockingbird'),
                                        UrlLuncherModel(title: 'Candide'),
                                        UrlLuncherModel(
                                            title:
                                                'The Girl with the Dragon Tattoo'),
                                        UrlLuncherModel(title: 'Candide'),
                                        UrlLuncherModel(title: 'The Alchemist'),
                                        UrlLuncherModel(
                                            title: 'The Count of Monte Cristo'),
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
                                            title: "Charlie's Angels"),
                                        UrlLuncherModel(
                                            title: 'Splitting Adam'),
                                        UrlLuncherModel(
                                            title: 'Star Trek: Nemesis'),
                                        UrlLuncherModel(title: 'Barbarella'),
                                        UrlLuncherModel(
                                            title: 'To Catch a Thief'),
                                        UrlLuncherModel(
                                            title: 'To Catch a Thief'),
                                        UrlLuncherModel(
                                            title:
                                                'Star Trek IV: The Voyage Home'),
                                        UrlLuncherModel(
                                            title: 'Changing Lanes'),
                                        UrlLuncherModel(title: 'The Score'),
                                        UrlLuncherModel(
                                            title: 'Sunset Boulevard'),
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
                                            title:
                                                "Call Of Duty: Modern Warfare"),
                                        UrlLuncherModel(
                                            title: 'Street Fighter V'),
                                        UrlLuncherModel(
                                            title: 'League of Legends'),
                                        UrlLuncherModel(title: '​Arte'),
                                        UrlLuncherModel(
                                            title: 'Ragnarok Online'),
                                        UrlLuncherModel(title: 'VALORANT​'),
                                        UrlLuncherModel(title: "Don't Starve"),
                                        UrlLuncherModel(
                                            title: '​Dragon Ball FighterZ'),
                                        UrlLuncherModel(
                                            title: '​Monster Hunter: World'),
                                        UrlLuncherModel(
                                            title:
                                                '​Counter-Strike: Global Offensive'),
                                        UrlLuncherModel(title: '​Música'),
                                        UrlLuncherModel(
                                            title: '​Comes e bebes'),
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
