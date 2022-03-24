import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:history_of_adventures/src/features/practice_medicine/presentation/pages/practice_medicine_page.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/widgets/arrow_text_right.dart';
import '../../../../core/widgets/sound_and_menu_widget.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class QuitMedicinePage extends StatefulWidget {
  const QuitMedicinePage({Key? key}) : super(key: key);

  @override
  _QuitMedicinePageState createState() => _QuitMedicinePageState();
}

class _QuitMedicinePageState extends State<QuitMedicinePage> {
  late AppLocalizations locals;

  @override
  void initState() {
    AudioPlayerUtil().playSoundForNikosChoose("QuitMedicine");
    firebaseScreenTracking();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    pauseSound();
    super.dispose();
  }

  Future<void> firebaseScreenTracking() async {
    await FirebaseAnalytics.instance.logEvent(
        name: "quit-medicine",
        parameters: {
          "page_url": "https://pandemics.historyadventures.app/quit-medicine"
        });

    await FirebaseAnalytics.instance.logScreenView(screenName: "quit-medicine");
  }

  Future<void> pauseSound() async {
    await AudioPlayerUtil.bgPlayer1.release();
    await AudioPlayerUtil.bgPlayer2.release();
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
                    AssetsPath.quitMedicine,
                    fit: BoxFit.cover,
                  )),
            )),
            Align(
              alignment: Alignment.bottomRight,
              child: ArrowRightTextWidget(
                  color: AppColors.white,
                  textSubTitle: locals.todoNoHarm,
                  textTitle: locals.chapter1,
                  onTap: () {
                    AudioPlayerUtil()
                        .playSound(AssetsPath.screenTransitionSound);
                    LeafDetails.currentVertex = 14;
                    LeafDetails.visitedVertexes.add(14);
                    NavigationSharedPreferences.upDateShatedPreferences();
                    context.router.replace(PathogenProfilePageLeftRoute(
                        needJumpToPracticeMedicinePart: true));
                  }),
            ),
            SoundAndMenuWidget(
              color: AppColors.white,
              icons: AudioPlayerUtil.isSoundOn
                  ? AssetsPath.iconVolumeOn
                  : AssetsPath.iconVolumeOff,
              onTapVolume: AudioPlayerUtil.isSoundOn
                  ? () {
                      setState(() {
                        AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                        AudioPlayerUtil().playSoundForNikosChoose(
                            AudioPlayerUtil().getCurrentRouteName(
                                ModalRoute.of(context)!.settings.name));
                      });
                    }
                  : () {
                      setState(() {
                        AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                        AudioPlayerUtil().playSoundForNikosChoose(
                            AudioPlayerUtil().getCurrentRouteName(
                                ModalRoute.of(context)!.settings.name));
                      });
                    },
              onTapMenu: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
            Positioned(
              top: HW.getHeight(391, context),
              left: HW.getWidth(144, context),
              child: Container(
                width: HW.getWidth(772, context),
                height: HW.getHeight(432, context),
                padding: EdgeInsets.symmetric(
                  vertical: HW.getHeight(36, context),
                  horizontal: HW.getWidth(36, context),
                ),
                color: AppColors.black06,
                child: Text(
                  locals.quitMedicicneText,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: AppColors.white,
                      fontSize: TextFontSize.getHeight(16, context)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButtonWidget(
                  iconSize: HW.getHeight(40, context),
                  onPressed: () {
                    AudioPlayerUtil()
                        .playSound(AssetsPath.screenTransitionSound);
                    LeafDetails.visitedVertexes.add(15);
                    LeafDetails.currentVertex = 15;
                    NavigationSharedPreferences.upDateShatedPreferences();
                    context.router.replace(DeadOfSocratesPageRoute(
                      fromKeepGoing: false,
                    ));
                  },
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: AppColors.white,
                  )),
            ),
          ],
        );
      }),
    );
  }
}
