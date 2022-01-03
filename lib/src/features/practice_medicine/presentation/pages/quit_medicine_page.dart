import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:history_of_adventures/src/features/practice_medicine/presentation/pages/practice_medicine_page.dart';
import 'package:just_audio/just_audio.dart';
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
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
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
                    LeafDetails.currentVertex = 14;
                    LeafDetails.visitedVertexes.add(14);
                    NavigationSharedPreferences.upDateShatedPreferences();
                    context.router.replace(PathogenProfilePageLeftRoute(
                        needJumpToPracticeMedicinePart: true));
                  }),
            ),
            SoundAndMenuWidget(
              color: AppColors.white,
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
                    LeafDetails.visitedVertexes.add(15);
                    LeafDetails.currentVertex = 15;
                    NavigationSharedPreferences.upDateShatedPreferences();
                    context.router.push(const DeadOfSocratesPageRoute());
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
