import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../widgets/author_widget.dart';

class CreditsPage extends StatefulWidget {
  const CreditsPage({Key? key}) : super(key: key);

  @override
  _CreditsPageState createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {
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
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: constraints.maxHeight * 0.09,
                      margin: EdgeInsets.only(
                        top: constraints.maxHeight * 0.12,
                      ),
                      child: AutoSizeText(
                        locale.credits.toUpperCase(),
                        style: Theme.of(context).textTheme.headline2,
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
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: ArrowLeftTextWidget(
                              textSubTitle: locale.meetTheTeam,
                              textTitle: locale.aboutTheBook,
                              onTap: () {
                                LeafDetails.currentVertex = 19;
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
                              textSubTitle: locale.sources,
                              textTitle: locale.aboutTheBook,
                              onTap: () {
                                LeafDetails.currentVertex = 21;
                                LeafDetails.visitedVertexes.add(21);
                                NavigationSharedPreferences
                                    .upDateShatedPreferences();
                                context.router.push(const SourcePageRoute());
                              }),
                        ),
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
                                      AuthorWidget(
                                          peoples: ['Darrell Steward'],
                                          profession: 'creator'),
                                      AuthorWidget(
                                        peoples: [
                                          'Bessie Cooper',
                                          'Wade Warren',
                                          'Ralph Edwards'
                                        ],
                                        profession: 'producers',
                                      ),
                                      AuthorWidget(
                                        peoples: ['Darrell Steward'],
                                        profession: 'art director',
                                      ),
                                      AuthorWidget(
                                        peoples: [
                                          'Jerome Bell',
                                          'Kristin Watson'
                                        ],
                                        profession: 'narrators',
                                      ),
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
                                          'Darrell Steward',
                                          'Jerome Bell',
                                          'Kristin Watson',
                                          'Kathryn Murphy',
                                          'Robert Fox',
                                          'Marvin McKinney',
                                          'Leslie Alexander',
                                          'Esther Howard',
                                          'Bessie Cooper'
                                        ],
                                        profession: 'illustrators',
                                      ),
                                      AuthorWidget(
                                        peoples: [
                                          'Darrell Steward',
                                          'Jerome Bell',
                                          'Kristin Watson',
                                          'Kathryn Murphy',
                                          'Robert Fox',
                                          'Marvin McKinney',
                                          'Leslie Alexander'
                                        ],
                                        profession: 'writers',
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
                                      AuthorWidget(
                                        peoples: [
                                          'Darrell Steward',
                                          'Jerome Bell',
                                          'Kristin Watson',
                                          'Kathryn Murphy',
                                          'Robert Fox',
                                          'Marvin McKinney',
                                        ],
                                        profession: 'animators',
                                      ),
                                      AuthorWidget(
                                        peoples: [
                                          'Darrell Steward',
                                          'Jerome Bell',
                                          'Kristin Watson',
                                          'Kathryn Murphy',
                                          'Robert Fox',
                                          'Marvin McKinney',
                                        ],
                                        profession: 'developers',
                                      ),
                                      AuthorWidget(
                                        peoples: [
                                          'Kristin Watson',
                                          'Kathryn Murphy',
                                          'Robert Fox',
                                          'Marvin McKinney',
                                          'Esther Howard',
                                          'Bessie Cooper',
                                          'Wade Warren'
                                        ],
                                        profession: 'marketing & PR',
                                      ),
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
                                        'Darrell Steward',
                                        'Jerome Bell',
                                        'Kristin Watson',
                                        'Kathryn Murphy',
                                        'Robert Fox',
                                        'Marvin McKinney',
                                        'Leslie Alexander',
                                        'Esther Howard',
                                        'Bessie Cooper'
                                      ], profession: 'supported by'),
                                      AuthorWidget(
                                        peoples: [
                                          'Darrell Steward',
                                          'Jerome Bell',
                                          'Kristin Watson',
                                          'Kathryn Murphy',
                                          'Robert Fox',
                                          'Marvin McKinney',
                                          'Leslie Alexander',
                                          'Esther Howard',
                                          'Bessie Cooper',
                                          'Esther Howard',
                                          'Bessie Cooper'
                                        ],
                                        profession: 'special thanks',
                                      ),
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
