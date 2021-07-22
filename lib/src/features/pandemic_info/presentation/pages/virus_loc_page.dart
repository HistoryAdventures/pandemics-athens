import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/widgets.dart';

class VirusLocationPage extends StatefulWidget {
  const VirusLocationPage({Key? key}) : super(key: key);

  @override
  _VirusLocationPageState createState() => _VirusLocationPageState();
}

class _VirusLocationPageState extends State<VirusLocationPage> {
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
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetsPath.mapImage),
                      fit: BoxFit.cover)),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          color: AppColors.grey,
                          blurRadius: 5),
                      BoxShadow(
                          offset: Offset(1, 0),
                          color: AppColors.grey,
                          blurRadius: 5),
                      BoxShadow(
                          offset: Offset(1, -1),
                          color: AppColors.grey,
                          blurRadius: 5),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  height: constraints.maxHeight * 0.6,
                  width: constraints.maxWidth * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: AutoSizeText(
                                    locals.chapter1Pathogenprofile,
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.subtitle2),
                              ),
                              Flexible(
                                child: AutoSizeText(
                                  locals.whereDidItComeFrom.toUpperCase(),
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                            ],
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
                                  locals.whereDidItComeFromBodyText,
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
              child: SizedBox(
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
              onTapMenu: () {},
            ),
          ],
        );
      }),
    );
  }
}
