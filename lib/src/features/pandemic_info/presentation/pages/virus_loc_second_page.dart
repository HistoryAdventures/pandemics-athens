import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/features/navigation/presentation/pages/navigation_page.dart';
import 'package:history_of_adventures/src/features/navigation/presentation/widgets/navigation_tree.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/widgets.dart';
import '../widgets/animate_arrow.dart';

class VirusLocationSecondPage extends StatefulWidget {
  const VirusLocationSecondPage({Key? key}) : super(key: key);

  @override
  _VirusLocationSecondPageState createState() =>
      _VirusLocationSecondPageState();
}

class _VirusLocationSecondPageState extends State<VirusLocationSecondPage> {
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
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetsPath.virusLocMap),
                      fit: BoxFit.cover)),
            ),
            AnimatedLine(
              constraints: constraints,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.8),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       offset: Offset(0, 1),
                    //       color: AppColors.grey,
                    //       blurRadius: 5),
                    //   BoxShadow(
                    //       offset: Offset(1, 0),
                    //       color: AppColors.grey,
                    //       blurRadius: 5),
                    //   BoxShadow(
                    //       offset: Offset(1, -1),
                    //       color: AppColors.grey,
                    //       blurRadius: 5),
                    // ],
                  ),
                  height: constraints.maxHeight * 0.4,
                  width: constraints.maxWidth * 0.4,
                  margin: EdgeInsets.only(
                      top: constraints.maxHeight * 0.1,
                      left: constraints.maxWidth * 0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: constraints.maxWidth,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.grey, width: 1.2))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: AutoSizeText(
                                      locals.chapter1Pathogenprofile,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2),
                                ),
                                Flexible(
                                  child: AutoSizeText(
                                    locals.whereDidItComeFrom.toUpperCase(),
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Scrollbar(
                            child: ListView(shrinkWrap: true, children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, right: 30),
                                child: AutoSizeText(
                                  locals.whereDidItComeFromSecondBodyText,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ArrowLeftTextWidget(
                            textSubTitle: locals.pathogenProfile,
                            textTitle: locals.chapter1,
                            onTap: () {
                              LeafDetails.currentVertex= 11;
                              context.router.pop();
                            }),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ArrowRightTextWidget(
                            textSubTitle: locals.whatDidItDo,
                            textTitle: locals.pathogenProfile,
                            onTap: () {
                              LeafDetails.currentVertex = 12;
                              LeafDetails.visitedVertexes.add(12);
                              context.router.push(const BodyInfoPageRoute());
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
          ],
        );
      }),
    );
  }
}
