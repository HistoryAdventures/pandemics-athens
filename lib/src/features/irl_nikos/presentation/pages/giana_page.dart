import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class GianaPage extends StatefulWidget {
  const GianaPage({Key? key}) : super(key: key);

  @override
  _GianaPageState createState() => _GianaPageState();
}

class _GianaPageState extends State<GianaPage> {
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
    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Image.asset(
                  AssetsPath.irlGiana,
                  fit: BoxFit.cover,
                )),
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
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: constraints.maxWidth * 0.05,
                padding: EdgeInsets.only(top: constraints.maxWidth * 0.1),
                child: AutoSizeText(
                  locals.giana.toUpperCase(),
                  maxLines: 1,
                  minFontSize: 8,
                  style: Theme.of(context).textTheme.overline,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 24),
                child: ArrowLeftTextWidget(
                  onTap: () {},
                  textSubTitle: 'Xoquauhtli',
                  textTitle: "#IRL",
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 24, bottom: 24),
                child: ArrowRightTextWidget(
                  onTap: () {
                    if (kIsWeb) {
                      html.window.history.back();
                      context.router.pop();
                    } else {
                      context.router.pop();
                    }
                  },
                  textSubTitle: 'nikos',
                  textTitle: "#IRL",
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButtonWidget(
                color: AppColors.blackB,
                iconSize: 40,
                icon: const Icon(Icons.arrow_downward),
                onPressed: () {
                  LeafDetails.currentVertex = 19;
                  LeafDetails.visitedVertexes.add(19);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.push(const AboutBookPageRoute());
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
