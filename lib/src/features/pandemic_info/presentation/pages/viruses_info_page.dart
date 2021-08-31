import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/theme.dart';
import 'package:history_of_adventures/src/features/animated_background/animated_particles_4.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/animated_widgets/gif_contrrol.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class VirusesInfoPage extends StatefulWidget {
  const VirusesInfoPage({Key? key}) : super(key: key);

  @override
  _VirusesInfoPageState createState() => _VirusesInfoPageState();
}

class _VirusesInfoPageState extends State<VirusesInfoPage>
    with SingleTickerProviderStateMixin {
  /// Localizations object
  late AppLocalizations locals;
  late GifController controller;
  late List<VirusModel> listCharacters;
  String gifVirus = AssetsPath.gifVirus;
  String gifTyphus = AssetsPath.gifTyphus;
  String gifSmallpox = AssetsPath.gifSmallpox;
  String gifTyphoid = AssetsPath.gifTyphoid;
  String gifEbola = AssetsPath.gifEbola;
  String gifBubonic = AssetsPath.gifBubonic;

  late String _selectedItem;
  late String _selectedText;
  late List<String> _selectedImg;

  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  final skaffoldKey = GlobalKey<ScaffoldState>();
  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;
  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    _selectedText = locals.introVirusText;

    listCharacters = [
      VirusModel(
        name: locals.introVirus,
        widgets: [gifBubonic, gifTyphus, gifTyphoid, gifSmallpox, gifEbola],
        description: locals.introVirusText,
      ),
      VirusModel(
        widgets: [gifBubonic],
        name: locals.bubonicPlague,
        description: locals.bubonicPlagueText,
      ),
      VirusModel(
        widgets: [gifTyphus],
        name: locals.typhus,
        description: locals.typhusText,
      ),
      VirusModel(
        widgets: [gifTyphoid],
        name: locals.typhiod,
        description: locals.typhiodText,
      ),
      VirusModel(
        widgets: [gifSmallpox],
        name: locals.smallpox,
        description: locals.smallpoxText,
      ),
      VirusModel(
        widgets: [gifEbola],
        name: locals.ebola,
        description: locals.ebolaText,
      )
    ];

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _selectedItem = 'intro';
    _selectedImg = [gifBubonic, gifTyphus, gifTyphoid, gifSmallpox, gifEbola];
    controller = GifController(vsync: this);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controller.repeat(
        min: 0,
        max: 150,
        period: const Duration(seconds: 4),
        reverse: true,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (e) {
        if (objWave < 50 && direction == 1) {
          objWave += .2;
        } else if (objWave == 50 && direction == 1) {
          direction = 0;
        } else if (objWave > -50 && direction == 0) {
          objWave -= .2;
        } else if (objWave == -50 && direction == 0) {
          direction = 1;
        }
        mouseX = (e.position.dx - width / 2) / 20;
        mouseY = (e.position.dy - height / 2) / 20;
        setState(() {});
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          key: skaffoldKey,
          endDrawer: const NavigationPage(),
          body: Stack(
            children: [
              GifBackground(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                path: AssetsPath.gifBackground4,
              ),
              AnimatedParticlesForth(
                constraints: constraints,
                mouseX: mouseX,
                mouseY: mouseY,
                objWave: objWave,
              ),
              Align(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 80),
                  child: Row(
                    children: [
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: Times.medium,
                          transitionBuilder: (child, animation) =>
                              FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                          child: Container(
                            key: ValueKey(_selectedImg),
                            child: VirusModel(
                              constraints: Size(
                                  constraints.maxWidth, constraints.maxHeight),
                              gifController: controller,
                              description: _selectedText,
                              name: _selectedItem,
                              widgets: _selectedImg,
                              onTapBubonik: () {
                                changeState(
                                  locals.bubonicPlague,
                                  [gifBubonic],
                                  locals.bubonicPlagueText,
                                );
                              },
                              onTapEbola: () {
                                changeState(
                                  locals.ebola,
                                  [gifEbola],
                                  locals.ebolaText,
                                );
                              },
                              onTapSmall: () {
                                changeState(
                                  locals.smallpox,
                                  [gifSmallpox],
                                  locals.smallpoxText,
                                );
                              },
                              onTapTiphid: () {
                                changeState(
                                  locals.typhiod,
                                  [gifTyphoid],
                                  locals.typhiodText,
                                );
                              },
                              onTapTiphius: () {
                                changeState(
                                  locals.typhus,
                                  [gifTyphus],
                                  locals.typhusText,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              right: 50,
                              top: constraints.maxHeight * 0.1,
                              bottom: constraints.maxHeight * 0.1),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              boxShadow: Shadows.universal),
                          padding:
                              EdgeInsets.all(constraints.maxHeight * 0.024),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 10,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: AppColors.grey, width: 1.2),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: AutoSizeText(
                                                "${locals.chapter1Pathogenprofile}\n",
                                                maxLines: 2,
                                                style: DefaultTheme.standard
                                                    .textTheme.headline1
                                                    ?.copyWith(
                                                        color:
                                                            AppColors.black54),
                                              ),
                                            ),
                                            Flexible(
                                              child: AutoSizeText(
                                                  locals.whatWasIt
                                                      .toUpperCase(),
                                                  maxLines: 1,
                                                  style: DefaultTheme.standard
                                                      .textTheme.headline2),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                            top: BorderSide(
                                                color: AppColors.grey,
                                                width: 1.2),
                                          )),
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 38, top: 16),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: '$_selectedItem\n'
                                                            .toUpperCase(),
                                                        style: DefaultTheme
                                                            .standard
                                                            .textTheme
                                                            .headline3,
                                                      ),
                                                      TextSpan(
                                                        text: _selectedText,
                                                        style: DefaultTheme
                                                            .standard
                                                            .textTheme
                                                            .bodyText1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: listCharacters
                                            .map((data) =>
                                                virusesNameListWidget(
                                                    image: data.widgets,
                                                    name: data.name,
                                                    text: data.description,
                                                    selected: data.name))
                                            .toList())),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ArrowLeftTextWidget(
                      textSubTitle: locals.whatDidItDo,
                      textTitle: locals.pathogenProfile,
                      onTap: () {
                        LeafDetails.currentVertex = 12;
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
                  skaffoldKey.currentState!.openEndDrawer();
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  void changeState(
      String? selctedItem, List<String>? slectedImg, String? text) {
    setState(() {
      _selectedItem = selctedItem!;
      _selectedImg = slectedImg!;
      _selectedText = text!;
      //  print(_selectedImg);
    });
  }

  Widget virusesNameListWidget(
      {String? name, String? selected, List<String>? image, String? text}) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: Clickable(
        onPressed: () {
          changeState(selected, image, text);
        },
        child: AutoSizeText(name!.toUpperCase(),
            maxLines: 1,
            style: _selectedItem == selected
                ? Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AppColors.orange)
                : Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}
