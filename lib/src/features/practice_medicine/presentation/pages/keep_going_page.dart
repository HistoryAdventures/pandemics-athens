import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/shared_preferenses.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/arrow_text_left.dart';
import '../../../../core/widgets/sound_and_menu_widget.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class KeepGoingPage extends StatefulWidget {
  const KeepGoingPage({Key? key}) : super(key: key);

  @override
  _KeepGoingPageState createState() => _KeepGoingPageState();
}

class _KeepGoingPageState extends State<KeepGoingPage> {
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
                    AssetsPath.keepGoing,
                    fit: BoxFit.cover,
                  )),
            )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: ArrowLeftTextWidget(
                    color: AppColors.white,
                    textSubTitle: locals.todoNoHarm,
                    textTitle: locals.chapter1,
                    onTap: () {
                      if (kIsWeb) {
                        html.window.history.back();
                        context.router.pop();
                      } else {
                        context.router.pop();
                      }
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
              onTapMenu: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                color: AppColors.black06,
                margin: EdgeInsets.only(
                    top: constraints.maxHeight * 0.05,
                    left: constraints.maxWidth * 0.05),
                width: MediaQuery.of(context).size.width * 0.4,
                child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Wrap(
                      children: [
                        AutoSizeText(
                          locals.keepGoingText,
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
                      LeafDetails.currentVertex = 15;
                      LeafDetails.visitedVertexes.add(15);
                      NavigationSharedPreferences.upDateShatedPreferences();
                      context.router.push(const DeadOfSocratesPageRoute());
                    },
                    icon: const Icon(
                      Icons.south,
                      size: 30,
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
