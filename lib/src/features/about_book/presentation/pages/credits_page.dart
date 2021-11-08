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
                Positioned(
                    left: 0,
                    right: 0,
                    top: HW.getHeight(128, context),
                    child: Container(
                      alignment: Alignment.center,
                      height: HW.getHeight(43, context),
                      child: Text(
                        locale.credits.toUpperCase(),
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
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: ArrowLeftTextWidget(
                            textSubTitle: locale.meetTheTeam,
                            textTitle: locale.aboutTheBook,
                            onTap: () {
                              LeafDetails.currentVertex = 23;
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
                              LeafDetails.currentVertex = 25;
                              LeafDetails.visitedVertexes.add(25);
                              NavigationSharedPreferences
                                  .upDateShatedPreferences();
                              context.router.push(const SourcePageRoute());
                            }),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: HW.getHeight(235, context),
                  left: HW.getWidth(360, context),
                  right: HW.getWidth(360, context),
                  child: Container(
                      height: HW.getHeight(675, context),
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
                                      textDecoration: TextDecoration.none,
                                      profession: 'creator',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Darrell Steward')
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'producers',
                                      urlModeles: [
                                        UrlLuncherModel(title: 'Bessie Cooper'),
                                        UrlLuncherModel(title: 'Wade Warren'),
                                        UrlLuncherModel(title: 'Ralph Edwards'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      // peoples: ['Darrell Steward'],
                                      profession: 'art director',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'narrators',
                                      urlModeles: [
                                        UrlLuncherModel(title: 'Jerome Bell'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'illustrators',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(title: 'Jerome Bell'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                        UrlLuncherModel(title: 'Robert Fox'),
                                        UrlLuncherModel(title: 'Esther Howard'),
                                        UrlLuncherModel(title: 'Jerome Bell'),
                                        UrlLuncherModel(title: 'Esther Howard'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'writers',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(title: 'Jerome Bell'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
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
                                      textDecoration: TextDecoration.none,
                                      profession: 'animators',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(title: 'Jerome Bell'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'developers',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(title: 'Jerome Bell'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'marketing & PR',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(title: 'Jerome Bell'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'supported by',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(title: 'Jerome Bell'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'special thanks',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(title: 'Jerome Bell'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                        UrlLuncherModel(
                                            title: 'Darrell Steward'),
                                        UrlLuncherModel(
                                            title: 'Kristin Watson'),
                                      ],
                                    ),
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
