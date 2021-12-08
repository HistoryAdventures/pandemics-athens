import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class AboutBookPage extends StatefulWidget {
  const AboutBookPage({Key? key}) : super(key: key);

  @override
  _AboutBookPageState createState() => _AboutBookPageState();
}

class _AboutBookPageState extends State<AboutBookPage> {
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
                  child: SizedBox(
                    height: HW.getHeight(98, context),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            locale.aboutTheBook.toUpperCase(),
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(
                                    fontSize:
                                        TextFontSize.getHeight(36, context)),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: HW.getHeight(15, context)),
                            child: Text(
                              locale.meetTheTeamText.toLowerCase(),
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                      fontSize:
                                          TextFontSize.getHeight(24, context)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: constraints.maxHeight * 0.2,
                    ),
                    width: constraints.maxWidth * 0.9,
                    height: constraints.maxHeight * 0.5,
                    child: Image.asset(
                      AssetsPath.aboutBookMap,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ArrowRightTextWidget(
                      textSubTitle: locale.credits,
                      textTitle: locale.aboutTheBook,
                      onTap: () {
                        LeafDetails.currentVertex = 24;
                        LeafDetails.visitedVertexes.add(24);
                        NavigationSharedPreferences.upDateShatedPreferences();
                        context.router.push(const CreditsPageRoute());
                      }),
                ),
                SoundAndMenuWidget(
                  widget: IconButtonWidget(
                      iconSize: HW.getHeight(40, context),
                      onPressed: () {
                        LeafDetails.currentVertex = 18;
                        LeafDetails.visitedVertexes.add(18);
                        NavigationSharedPreferences.upDateShatedPreferences();
                        context.router.replace(const IrlNikosPageRoute());
                      },
                      icon: const Icon(
                        Icons.arrow_upward_sharp,
                        color: AppColors.blackB,
                      )),
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
              ],
            );
          },
        ),
      ),
    );
  }
}
