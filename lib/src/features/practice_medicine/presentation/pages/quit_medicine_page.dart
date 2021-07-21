import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/sound_and_menu_widget.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/arrow_text_right.dart';

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
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: ArrowRightTextWidget(
                    color: AppColors.white,
                    textSubTitle: locals.todoNoHarm,
                    textTitle: locals.chapter1,
                    onTap: () {
                      context.router.pop();
                    }),
              ),
            ),
            SoundAndMenuWidget(
              color: AppColors.white,
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
              alignment: Alignment.centerLeft,
              child: Container(
                color: AppColors.blackG.withOpacity(0.75),
                margin: EdgeInsets.only(
                  top: constraints.maxWidth * 0.01,
                  left: constraints.maxWidth * 0.01,
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Wrap(
                      children: [
                        AutoSizeText(
                          locals.quitMedicicneText,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: IconButton(
                    onPressed: () {
                      context.router.push(const DeadOfSocratesPageRoute());
                    },
                    icon: const Icon(
                      Icons.south,
                      color: AppColors.white,
                    )),
              ),
            ),
          ],
        );
      }),
    );
  }
}
