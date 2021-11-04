import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
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
                      child: Scrollbar(
                        showTrackOnHover: false,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      AuthorWidget(peoples: [
                                        'The Little Prince',
                                        'To Kill a Mockingbird',
                                        'A Game of Thrones',
                                        'Siddhartha',
                                        'A Game of Thrones',
                                        'To Kill a Mockingbird',
                                        'Candide',
                                        'The Girl with the Dragon Tattoo',
                                        'Candide',
                                        'The Alchemist',
                                        'The Count of Monte Cristo',
                                      ], profession: 'books')
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      AuthorWidget(
                                        peoples: [
                                          "Charlie's Angels",
                                          'Splitting Adam',
                                          'Star Trek: Nemesis',
                                          'Barbarella',
                                          'To Catch a Thief',
                                          'Star Trek IV: The Voyage Home',
                                          'Changing Lanes',
                                          'The Score',
                                          'Sunset Boulevard',
                                        ],
                                        profession: 'Movie & tv',
                                      )
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      AuthorWidget(peoples: [
                                        "​Call Of Duty: Modern Warfare",
                                        '​Street Fighter V',
                                        'League of Legends',
                                        '​Arte',
                                        'Ragnarok Online',
                                        'VALORANT​',
                                        "Don't Starve",
                                        '​Dragon Ball FighterZ',
                                        '​Monster Hunter: World',
                                        '​Counter-Strike: Global Offensive',
                                        '​Música',
                                        '​Comes e bebes',
                                      ], profession: 'video games')
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
