import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/widgets.dart';

class AboutBookPage extends StatefulWidget {
  const AboutBookPage({Key? key}) : super(key: key);

  @override
  _AboutBookPageState createState() => _AboutBookPageState();
}

class _AboutBookPageState extends State<AboutBookPage> {
  late AppLocalizations locale;

  final backgroundplayer = AudioPlayer();
  bool isSoundOn = false;

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsPath.charactersBackgroundImage),
              fit: BoxFit.cover),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                SoundAndMenuWidget(
                  widget: IconButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_upward_sharp,
                        //size: 40,
                        color: AppColors.blackB,
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
                Positioned(
                  left: 100,
                  right: 100,
                  child: Container(
                    height: constraints.maxHeight * 0.1,
                    width: constraints.maxWidth * 0.1,
                    margin: EdgeInsets.only(top: constraints.maxHeight * 0.1),
                    child: Column(
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            locale.aboutTheBook.toUpperCase(),
                            maxLines: 1,
                            style: DefaultTheme.standard.textTheme.headline2,
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            locale.meetTheTeamText.toLowerCase(),
                            maxLines: 1,
                            style: DefaultTheme.standard.textTheme.subtitle2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 24, right: 24),
                    child: ArrowRightTextWidget(
                        textSubTitle: locale.credits,
                        textTitle: locale.aboutTheBook,
                        onTap: () {
                          context.router.push(const CreditsPageRoute());
                        }),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: constraints.maxWidth * 0.1,
                        right: constraints.maxWidth * 0.1,
                        bottom: 80,
                        top: constraints.maxHeight * 0.2),
                    child: Image.asset(
                      AssetsPath.aboutBookMap,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
