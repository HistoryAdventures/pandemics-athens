import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/animated_widgets/background_widget.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../pandemic_info/presentation/widgets/gif_contrrol.dart';

class LeandingPage extends StatefulWidget {
  const LeandingPage({Key? key}) : super(key: key);

  @override
  _LeandingPageState createState() => _LeandingPageState();
}

class _LeandingPageState extends State<LeandingPage>
    with SingleTickerProviderStateMixin {
  late AppLocalizations locales;
  late GifController controller;

  bool isImageloaded = false;
  Offset offset = const Offset(0, 0);
  List<String> contentImages = [
    AssetsPath.gifBackground,
    AssetsPath.gifVirus,
    AssetsPath.spheresBackImage
  ];

  @override
  void didChangeDependencies() {
    locales = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  Future<void> init() async {
    controller = GifController(vsync: this);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controller.repeat(
        min: 0,
        max: 150,
        period: const Duration(seconds: 4),
        reverse: true,
      );
    });

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
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          onHover: (e) => setState(() {
            offset = e.position;
          }),
          child: Stack(
            children: [
              BackgroundWidget(
                offset: offset,
              ),
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              child: AutoSizeText(locales.spencerStrikerName,
                                  maxLines: 1,
                                  style: DefaultTheme
                                      .standard.textTheme.headline1)),
                          Flexible(
                            child: AutoSizeText(
                              locales.historyAdventures.toUpperCase(),
                              style: Theme.of(context).textTheme.overline,
                            ),
                          ),
                          Flexible(
                            child: AutoSizeText(
                              locales.worldOfCharacters.toUpperCase(),
                              style: Theme.of(context).textTheme.overline,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: AppColors.red, width: 8))),
                              child: AutoSizeText(
                                locales.globalPandemicName,
                                maxLines: 1,
                                minFontSize: 10,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        height: constraints.maxHeight * 0.35,
                        width: constraints.maxWidth * 0.35,
                        child: Transform.translate(
                          offset: Offset(offset.dx * 0.1, 0),
                          child: GifImage(
                            image: const AssetImage(AssetsPath.gifVirus),
                            controller: controller,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  color: AppColors.blackB,
                  iconSize: 40,
                  icon: const Icon(Icons.south),
                  onPressed: () {
                    context.router.push(const GlossaryPageRoute());
                  },
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 0.06,
                right: constraints.maxWidth * 0.06,
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
