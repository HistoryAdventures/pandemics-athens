import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/loading_widget.dart';
import 'package:history_of_adventures/src/core/widgets/sound_and_menu_widget.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../paralax_history/presentation/widgets/arrow_left.dart';
import '../../../paralax_history/presentation/widgets/arrow_right.dart';

class PracticeMedicine extends StatefulWidget {
  const PracticeMedicine({Key? key}) : super(key: key);

  @override
  _PracticeMedicineState createState() => _PracticeMedicineState();
}

class _PracticeMedicineState extends State<PracticeMedicine> {
  late AppLocalizations locals;

  bool isImageloaded = false;
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  Offset offset = const Offset(0, 0);
  List<String> contentImages = [
    AssetsPath.medicine,
    AssetsPath.quitMedicine,
    AssetsPath.keepGoing,
    AssetsPath.deadOfSocrates1,
    AssetsPath.deadOfSocrates2,
    AssetsPath.deadOfSocrates3,
    AssetsPath.endOfWar1,
    AssetsPath.endOfWar2,
    AssetsPath.endOfWar3,
  ];

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  Future<void> init() async {
    final loadedAssets = await loadContent(contentImages);
    if (loadedAssets == true) {
      setState(() {
        isImageloaded = true;
      });
    } else {
      setState(() {
        isImageloaded = false;
      });
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isImageloaded == false) {
      return const LoadingWidget();
    }
    return Scaffold(
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
                    AssetsPath.medicine,
                    fit: BoxFit.cover,
                  )),
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                // padding: const EdgeInsets.symmetric(horizontal: 20),
                height: constraints.maxHeight * 0.1,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: ArrowLeftWidget(
                            arrowColor: AppColors.white,
                            textSubTitle: locals.stickToTheOath,
                            textTitle: '',
                            textColor: AppColors.white,
                            onTap: () {
                              context.router
                                  .push(const QuitMedicinePageRoute());
                            }),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AutoSizeText(
                          locals.medicine,
                          maxLines: 1,
                          minFontSize: 5,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  fontSize: 38,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ArrowRightWidget(
                          textColor: AppColors.white,
                          textSubTitle: locals.helpTheSenator,
                          textTitle: '',
                          arrowColor: AppColors.white,
                          onTap: () {
                            ////????????
                            context.router.push(const KeepGoingPageRoute());
                          }),
                    ),
                  ],
                ),
              ),
            ),
            SoundAndMenuWidget(
              color: AppColors.white,
              widget: IconButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_upward_sharp,
                    size: 30,
                    color: AppColors.white,
                  )),
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
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: AppColors.blackG.withOpacity(0.75),
                margin: const EdgeInsets.only(top: 80),
                width: MediaQuery.of(context).size.width * 0.4,
                child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Wrap(
                      children: [
                        AutoSizeText(
                          locals.medicineText,
                          minFontSize: 5,
                          // maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: AppColors.white),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        );
      }),
    );
  }
}
