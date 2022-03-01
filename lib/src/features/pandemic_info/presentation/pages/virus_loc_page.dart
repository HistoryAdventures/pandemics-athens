import 'dart:ui' as ui;

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';
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

class VirusLocationPage extends StatefulWidget {
  const VirusLocationPage({Key? key}) : super(key: key);

  @override
  _VirusLocationPageState createState() => _VirusLocationPageState();
}

class _VirusLocationPageState extends State<VirusLocationPage> {
  late AppLocalizations locals;
  String viewID = "virusLocationPage-view-id";
  Offset dragStartOffset = const Offset(0, 0);
  Offset dragEndOffset = const Offset(0, 0);

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  bool mapLoading = true;

  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        viewID,
        (int id) => html.IFrameElement()
          ..width = MediaQuery.of(context).size.width.toString()
          ..height = MediaQuery.of(context).size.height.toString()
          // ignore: unsafe_html
          ..src = AssetsPath.virusLoc1
          ..style.border = 'none');
    super.initState();

    html.window.onMessage.listen((event) {
      mapLoading = false;
      if (mounted) {
        setState(() {});
      }
    });

    Future.delayed(Duration(seconds: 2)).then((value) {
      mapLoading = false;
      if (mounted) {
        setState(() {});
      }
    });
    AudioPlayerUtil().playSoundWithLoop(AssetsPath.storyBackgroundSound);
    AudioPlayerUtil.audioPlayerLoop.state = PlayerState.PLAYING;
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
            //           image: AssetImage(AssetsPath.virusLoc1),
            //           fit: BoxFit.cover)),
            // ),
            Listener(
              onPointerSignal: (signal) {
                if (signal is PointerScrollEvent) {
                  print(signal);
                  if (signal.scrollDelta.dy > 0) {
                    context.router
                        .replace(const VirusLocationSecondPageRoute());
                  }
                }
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
              ),
            ),
            Positioned(
                top: HW.getHeight(192, context),
                left: HW.getWidth(128, context),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white, boxShadow: Shadows.universal),
                  height: HW.getHeight(676, context),
                  width: HW.getWidth(768, context),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: HW.getHeight(68, context),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                                32, context))),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            margin: EdgeInsets.only(
                              top: HW.getHeight(16, context),
                              bottom: HW.getHeight(16, context),
                            ),
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: AppColors.grey, width: 1.2))),
                            child: HAScrollbar(
                              isAlwaysShown: true,
                              child: ListView(shrinkWrap: true, children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 16, right: 16),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            locals.whereDidItComeFromBodyText1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    TextSpan(
                                      text:
                                          '${locals.whereDidItComeFromBodyTextItalic}\n\n',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.copyWith(fontSize: 16),
                                    ),
                                    // TextSpan(
                                    //   text: locals.whereDidItComeFromBodyText2,
                                    //   style:
                                    //       Theme.of(context).textTheme.bodyText1,
                                    // ),
                                  ])),
                                ),
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
                    child: ArrowLeftTextWidget(
                        textSubTitle: locals.pathogenProfile,
                        textTitle: locals.chapter1,
                        onTap: () {
                          AudioPlayerUtil()
                              .playSound(AssetsPath.screenTransitionSound);
                          LeafDetails.currentVertex = 10;
                          LeafDetails.visitedVertexes.add(10);
                          NavigationSharedPreferences.upDateShatedPreferences();
                          context.router
                              .replace(PathogenProfilePageRightRoute());
                        }),
                  ),
                  Flexible(
                    child: ArrowRightTextWidget(
                        textSubTitle: locals.whatDidItDo,
                        textTitle: locals.pathogenProfile,
                        onTap: () {
                          AudioPlayerUtil()
                              .playSound(AssetsPath.screenTransitionSound);
                          context.router
                              .replace(const VirusLocationSecondPageToLeft());
                        }),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.all(24),
                  child: Image.asset(AssetsPath.scrollIcon)),
            ),
            SoundAndMenuWidget(
              icons: AudioPlayerUtil.isSoundOn
                  ? AssetsPath.iconVolumeOn
                  : AssetsPath.iconVolumeOff,
              onTapVolume: AudioPlayerUtil.isSoundOn
                  ? () {
                      if (mounted) {
                        setState(() {
                          AudioPlayerUtil.isSoundOn =
                              !AudioPlayerUtil.isSoundOn;
                          AudioPlayerUtil().playSoundWithLoop(
                              AssetsPath.storyBackgroundSound);
                        });
                      }
                    }
                  : () {
                      if (mounted) {
                        setState(() {
                          AudioPlayerUtil.isSoundOn =
                              !AudioPlayerUtil.isSoundOn;
                          AudioPlayerUtil().playSoundWithLoop(
                              AssetsPath.storyBackgroundSound);
                        });
                      }
                    },
              onTapMenu: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
            if (mapLoading)
              const LoadingWidget(
                color: Colors.black,
              ),
          ],
        );
      }),
    );
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
}
