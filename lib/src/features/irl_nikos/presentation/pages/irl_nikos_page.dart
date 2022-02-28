import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
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
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  late AppLocalizations locals;

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    playSound();
    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  @override
  void dispose() {
    pauseSound();
    super.dispose();
  }

  AudioPlayer bgPlayer1 = AudioPlayer();
  Future<void> playSound() async {
    int result1 = await bgPlayer1.play(AssetsPath.nikosChooseBG, volume: 0.7);
    await bgPlayer1.setReleaseMode(ReleaseMode.LOOP);
  }

  Future<void> pauseSound() async {
    bgPlayer1.dispose();
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
                  LeafDetails.currentVertex = 17;
                  LeafDetails.visitedVertexes.add(17);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.replace(const QuizPageToBottom());
                },
              ),
              icons: isSoundOn
                  ? AssetsPath.iconVolumeOn
                  : AssetsPath.iconVolumeOff,
              onTapVolume: isSoundOn
                  ? () {
                      setState(() {
                        isSoundOn = !isSoundOn;
                      });
                    }
                  : () {
                      setState(() {
                        isSoundOn = !isSoundOn;
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
