import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import "package:universal_html/html.dart" as html;
import 'dart:ui' as ui;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

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
  String viewID = "virusLocationSecondPage-view-id";

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        viewID,
        (int id) => html.IFrameElement()
          ..width = MediaQuery.of(context).size.width.toString()
          ..height = MediaQuery.of(context).size.height.toString()
          ..src = AssetsPath.virusLoc1
          ..style.border = 'none');
    super.initState();
  }

  Widget _iframeIgnorePointer({
    bool ignoring = true,
    required String viewID,
  }) {
    return Stack(
      children: [
        AbsorbPointer(
          child: RepaintBoundary(
            child: HtmlElementView(
              viewType: viewID,
            ),
          ),
        ),
        if (ignoring)
          Positioned.fill(
            child: PointerInterceptor(
              child: Container(),
            ),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            IgnorePointer(
              ignoringSemantics: true,
              ignoring: true,
              child: Container(
                color: Colors.transparent,
                child: _iframeIgnorePointer(viewID: viewID),
              ),
            ),
            // Container(
            //   width: constraints.maxWidth,
            //   height: constraints.maxHeight,
            //   decoration: const BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage(AssetsPath.virusLoc2),
            //           fit: BoxFit.cover)),
            // ),
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white, boxShadow: Shadows.universal),
                  height: constraints.maxHeight * 0.6,
                  width: constraints.maxWidth * 0.4,
                  margin: EdgeInsets.only(
                      top: constraints.maxHeight * 0.1,
                      left: constraints.maxWidth * 0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            width: constraints.maxWidth,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.grey, width: 1.2))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: AutoSizeText(
                                      "${locals.chapter1Pathogenprofile}\n",
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: constraints.maxHeight * 0.01),
                                    child: AutoSizeText(
                                      locals.whereDidItComeFrom.toUpperCase(),
                                      maxLines: 1,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
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
                                    const EdgeInsets.only(top: 16, right: 30),
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
                              LeafDetails.currentVertex = 11;
                              if (kIsWeb) {
                                html.window.history.back();
                                context.router.pop();
                              } else {
                                context.router.pop();
                              }
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
                              NavigationSharedPreferences
                                  .upDateShatedPreferences();
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
