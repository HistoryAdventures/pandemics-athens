import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/app_up_button.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class IrlNikosPage extends StatefulWidget {
  const IrlNikosPage({Key? key}) : super(key: key);

  @override
  _IrlNikosPageState createState() => _IrlNikosPageState();
}

class _IrlNikosPageState extends State<IrlNikosPage> {
  late AppLocalizations locals;

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    AudioPlayerUtil().playSoundForSinglePages(AssetsPath.nikosChooseBG);
    AudioPlayerUtil.audioPlayerSinglePage.state = PlayerState.PLAYING;
    NavigationSharedPreferences.getNavigationListFromSF();
    firebaseScreenTracking();
    super.initState();
  }

  @override
  void dispose() {
    pauseSound();
    super.dispose();
  }

  Future<void> firebaseScreenTracking() async {
    await FirebaseAnalytics.instance.logEvent(name: "irl-nikos", parameters: {
      "page_url": "https://pandemics.historyadventures.app/irl-nikos"
    });
  }

  Future<void> pauseSound() async {
    AudioPlayerUtil.audioPlayerSinglePage.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            SizedBox.expand(
                child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Image.asset(
                    AssetsPath.irlNikos,
                    fit: BoxFit.cover,
                  )),
            )),
            SoundAndMenuWidget(
              color: AppColors.white,
              widget: AppUpButton(
                iconColor: Colors.white,
                onTap: () {
                  AudioPlayerUtil().playSound(AssetsPath.screenTransitionSound);
                  LeafDetails.currentVertex = 17;
                  LeafDetails.visitedVertexes.add(17);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.replace(const QuizPageToBottom());
                },
              ),
              icons: AudioPlayerUtil.isSoundOn
                  ? AssetsPath.iconVolumeOn
                  : AssetsPath.iconVolumeOff,
              onTapVolume: AudioPlayerUtil.isSoundOn
                  ? () {
                      setState(() {
                        AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                        AudioPlayerUtil.audioPlayerSinglePage.setVolume(0.0);
                      });
                    }
                  : () {
                      setState(() {
                        AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                        AudioPlayerUtil.audioPlayerSinglePage.setVolume(1.0);
                      });
                    },
              onTapMenu: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
            Positioned(
              top: HW.getHeight(192, context),
              left: HW.getWidth(360, context),
              child: SizedBox(
                width: constraints.maxWidth * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      locals.irlNikos.toUpperCase(),
                      maxLines: 1,
                      style: Theme.of(context).textTheme.overline?.copyWith(
                          color: AppColors.white,
                          fontSize: HW.getHeight(120, context)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: HW.getWidth(18, context)),
                      decoration: const BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: AppColors.orange, width: 10))),
                      child: Text(
                        ' ${locals.nikos.toLowerCase()}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            color: AppColors.white,
                            fontSize: HW.getHeight(60, context)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: ArrowLeftTextWidget(
            //     color: AppColors.white,
            //     onTap: null,
            //     //  () {
            //     //   context.router.push(const GianaPageRoute());
            //     // },
            //     textSubTitle: locals.giana,
            //     textTitle: "#IRL",
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButtonWidget(
                iconSize: HW.getHeight(37, context),
                color: AppColors.white,
                icon: const Icon(Icons.arrow_downward),
                onPressed: () {
                  AudioPlayerUtil().playSound(AssetsPath.screenTransitionSound);
                  LeafDetails.currentVertex = 24;
                  LeafDetails.visitedVertexes.add(24);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.replace(const AboutBookPageRoute());
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
