import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/pages/virus_loc_page.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../../../../core/router.gr.dart';

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
  Offset dragStartOffset = const Offset(0, 0);
  Offset dragEndOffset = const Offset(0, 0);
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
          ..src = AssetsPath.virusLoc2
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
          child: HtmlElementView(
            viewType: viewID,
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
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
            ),
            Positioned(
                top: HW.getHeight(192, context),
                left: HW.getWidth(128, context),
                child: Container(
                  height: HW.getHeight(676, context),
                  width: HW.getWidth(768, context),
                  decoration: BoxDecoration(
                      color: AppColors.white, boxShadow: Shadows.universal),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: HW.getHeight(68, context),
                          width: constraints.maxWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: HW.getHeight(8, context)),
                                  child: Text(locals.chapter1Pathogenprofile,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                              fontSize: TextFontSize.getHeight(
                                                  14, context))),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  locals.whereDidItComeFrom.toUpperCase(),
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(
                                          fontSize: TextFontSize.getHeight(
                                              32, context)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: HW.getHeight(16, context),
                              bottom: HW.getHeight(16, context),
                            ),
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: AppColors.grey, width: 1.2))),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: HAScrollbar(
                              isAlwaysShown: true,
                              child: ListView(shrinkWrap: true, children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 16, right: 16),
                                  child: AutoSizeText(
                                    locals.whereDidItComeFromSecondBodyText,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
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
                            // if (kIsWeb) {
                            //   html.window.history.back();
                            //   context.router.pop();
                            // } else {
                            //   context.router.pop();
                            // }
                            LeafDetails.currentVertex = 11;
                            LeafDetails.visitedVertexes.add(11);
                            NavigationSharedPreferences
                                .upDateShatedPreferences();
                            context.router
                                .replace(const VirusLocationPageRoute());
                          }),
                    ),
                  ),
                  Flexible(
                    child: ArrowRightTextWidget(
                        textSubTitle: locals.whatDidItDo,
                        textTitle: locals.pathogenProfile,
                        onTap: () {
                          LeafDetails.currentVertex = 12;
                          LeafDetails.visitedVertexes.add(12);
                          NavigationSharedPreferences.upDateShatedPreferences();
                          context.router.push(const BodyInfoPageRoute());
                        }),
                  ),
                ],
              ),
            ),
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
          ],
        );
      }),
    );
  }
}
