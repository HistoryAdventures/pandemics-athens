import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

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
                                context.router.push(const SoursePageRoute());
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
                          top: constraints.maxHeight * 0.2),
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
                                    children: [
                                      authorWidget(
                                          'creator', ['Darrell Steward']),
                                      authorWidget('producers', [
                                        'Bessie Cooper',
                                        'Wade Warren',
                                        'Ralph Edwards'
                                      ]),
                                      authorWidget(
                                          'art director', ['Darrell Steward']),
                                      authorWidget('narrators',
                                          ['Jerome Bell', 'Kristin Watson']),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      authorWidget('illustrators', [
                                        'Darrell Steward',
                                        'Jerome Bell',
                                        'Kristin Watson',
                                        'Kathryn Murphy',
                                        'Robert Fox',
                                        'Marvin McKinney',
                                        'Leslie Alexander',
                                        'Esther Howard',
                                        'Bessie Cooper'
                                      ]),
                                      authorWidget('writers', [
                                        'Darrell Steward',
                                        'Jerome Bell',
                                        'Kristin Watson',
                                        'Kathryn Murphy',
                                        'Robert Fox',
                                        'Marvin McKinney',
                                        'Leslie Alexander'
                                      ]),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      authorWidget('animators', [
                                        'Darrell Steward',
                                        'Jerome Bell',
                                        'Kristin Watson',
                                        'Kathryn Murphy',
                                        'Robert Fox',
                                        'Marvin McKinney',
                                      ]),
                                      authorWidget('developers', [
                                        'Darrell Steward',
                                        'Jerome Bell',
                                        'Kristin Watson',
                                        'Kathryn Murphy',
                                        'Robert Fox',
                                        'Marvin McKinney',
                                      ]),
                                      authorWidget('marketing & PR', [
                                        'Kristin Watson',
                                        'Kathryn Murphy',
                                        'Robert Fox',
                                        'Marvin McKinney',
                                        'Esther Howard',
                                        'Bessie Cooper',
                                        'Wade Warren'
                                      ]),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      authorWidget('supported by', [
                                        'Darrell Steward',
                                        'Jerome Bell',
                                        'Kristin Watson',
                                        'Kathryn Murphy',
                                        'Robert Fox',
                                        'Marvin McKinney',
                                        'Leslie Alexander',
                                        'Esther Howard',
                                        'Bessie Cooper'
                                      ]),
                                      authorWidget('special thanks', [
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
                                      ]),
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

  Widget authorWidget(String profession, List<String> peoples) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 128, bottom: 31),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: AppColors.grey, width: 1),
                  )),
                  child: AutoSizeText(
                    profession.toUpperCase(),
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: AppColors.grey, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: peoples.map((people) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: AutoSizeText(
                  people,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: 22),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
