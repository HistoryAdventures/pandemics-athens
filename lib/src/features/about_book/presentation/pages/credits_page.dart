import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/social_media_icons.dart';
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
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: HW.getWidth(37, context)),
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
                            textSubTitle: locale.meetTheTeam,
                            textTitle: locale.aboutTheBook,
                            onTap: () {
                              LeafDetails.currentVertex = 23;
                              LeafDetails.visitedVertexes.add(23);
                              NavigationSharedPreferences
                                  .upDateShatedPreferences();
                              context.router
                                  .replace(const AboutBookPageToRight());
                            }),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SocialMediaIcons(),
                            SizedBox(
                              height: HW.getHeight(45, context),
                            ),
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
                  child: SizedBox(
                      height: HW.getHeight(675, context),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'creator, design director',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Spencer Striker, PhD')
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'ART director, producer',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Julius Krunglevičius '),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      // peoples: ['Darrell Steward'],
                                      profession: 'project manager',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Raya Harutyunyan'),
                                        UrlLuncherModel(
                                            title: 'Laiba Mubashar'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'Research assistans, QA',
                                      urlModeles: [
                                        UrlLuncherModel(title: 'Yingyin Chen'),
                                        UrlLuncherModel(title: 'Xingyu Qin'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'writer',
                                      urlModeles: [
                                        UrlLuncherModel(title: 'Olivia Frias'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'Historians',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title:
                                                'Christopher Sparshott, PhD'),
                                        UrlLuncherModel(title: 'Kieren Johns'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: HW.getWidth(128, context),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'illustrators',
                                      urlModeles: [
                                        UrlLuncherModel(title: 'Nenad Kostic'),
                                        UrlLuncherModel(
                                            title: 'Christina Koval'),
                                        UrlLuncherModel(
                                            title: 'Gustavo Arian Desimone'),
                                        UrlLuncherModel(title: 'Jason Moser'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'Designers',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Rojus Rzevuskis'),
                                        UrlLuncherModel(title: 'Anna Notovska'),
                                        UrlLuncherModel(title: 'Mats Wedin'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'Animators, 3D artists',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Vladyslav Fedchenko'),
                                        UrlLuncherModel(title: 'Nenad Kostic'),
                                        UrlLuncherModel(
                                            title: 'Dmytro Hrynchenko'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession:
                                          'Marketing & Public Relations',
                                      urlModeles: [
                                        UrlLuncherModel(title: 'Samson Mbogo'),
                                        UrlLuncherModel(
                                            title: 'Mishaal Hasan Shirazi'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: HW.getWidth(128, context)),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'developers',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'DIGITAL POMEGRANATE:'),
                                        UrlLuncherModel(
                                            title: 'Karen Ghazaryan'),
                                        UrlLuncherModel(
                                            title: 'Gohar Movsisyan'),
                                        UrlLuncherModel(
                                            title: 'Ellen Ghandilyan'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'supported by',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title:
                                                'NORTHWESTERN UNIVERSITY IN QATAR'),
                                      ],
                                    ),
                                    AuthorWidget(
                                      textDecoration: TextDecoration.none,
                                      profession: 'special thanks',
                                      urlModeles: [
                                        UrlLuncherModel(
                                            title: 'Marwan M. Kraidy, PhD'),

                                        UrlLuncherModel(
                                            title:
                                                'Kathleen Hewett-Smith, PhD'),

                                        // UrlLuncherModel(
                                        //     title: 'Everette E. Dennis, PhD'),
                                        // UrlLuncherModel(
                                        //     title: 'Hariclea Zengos, Ph'),

                                        UrlLuncherModel(
                                            title: 'Gregory Ferrell Lowe, PhD'),
                                        UrlLuncherModel(
                                            title: 'Woodman Taylor, PhD'),
                                        UrlLuncherModel(
                                            title: 'Craig Benjamin, PhD'),
                                        UrlLuncherModel(
                                            title: 'Jonathan Markley, PhD'),
                                        UrlLuncherModel(
                                            title: 'Dawnene Hassett, PhD'),
                                        UrlLuncherModel(
                                            title: 'Thom Gillespie, PhD'),
                                        UrlLuncherModel(title: 'Todd Fabacher'),
                                        UrlLuncherModel(
                                            title: 'Abir Younis Maarouf'),
                                        UrlLuncherModel(
                                            title: 'Elizabeth Lance'),
                                        UrlLuncherModel(title: 'Bianca Simon'),
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
