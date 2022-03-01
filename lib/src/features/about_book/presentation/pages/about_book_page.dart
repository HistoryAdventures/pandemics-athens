import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/app_up_button.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:history_of_adventures/src/core/widgets/social_media_icons.dart';
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
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SocialMediaIcons(),
                      SizedBox(
                        height: HW.getHeight(45, context),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: HW.getHeight(128, context),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        locale.aboutTheBook.toUpperCase(),
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontSize: TextFontSize.getHeight(36, context)),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: HW.getHeight(15, context)),
                        child: AutoSizeText(
                          "meet the international team of History Adventures!"
                              .toLowerCase(),
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(fontSize: HW.getHeight(25, context)),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: constraints.maxHeight * 0.2,
                    ),
                    width: HW.getWidth(1265, context),
                    height: HW.getHeight(655, context),
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
                  widget: AppUpButton(
                    // iconSize: HW.getHeight(55, context),
                    onTap: () {
                      LeafDetails.currentVertex = 18;
                      LeafDetails.visitedVertexes.add(18);
                      NavigationSharedPreferences.upDateShatedPreferences();
                      context.router.replace(const IrlNikosPageToBottom());
                    },
                  ),
                  icons: AudioPlayerUtil.isSoundOn
                      ? AssetsPath.iconVolumeOn
                      : AssetsPath.iconVolumeOff,
                  onTapVolume: AudioPlayerUtil.isSoundOn
                      ? () {
                          setState(() {
                            AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                            backgroundplayer.pause();
                          });
                        }
                      : () {
                          setState(() {
                            AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
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
