import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/models/animated_particle_model.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/pages/body_info_page.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/animated_background/animated_particles_4.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../models/virus_model.dart';
import '../../../../core/router.gr.dart';

class VirusesInfoPage extends StatefulWidget {
  const VirusesInfoPage({Key? key}) : super(key: key);

  @override
  _VirusesInfoPageState createState() => _VirusesInfoPageState();
}

class _VirusesInfoPageState extends State<VirusesInfoPage>
    with SingleTickerProviderStateMixin {
  String? hoveredItemIndex;

  /// Localizations object
  late AppLocalizations locals;
  // late GifController controller;
  late List<VirusModelWidget> listCharacters;
  String gifVirus = AssetsPath.gifVirus;
  String gifTyphus = AssetsPath.gif4;
  String gifSmallpox = AssetsPath.gif1;
  String gifTyphoid = AssetsPath.gif5;
  String gifEbola = AssetsPath.gif3;
  String gifBubonic = AssetsPath.gif2;
  late VirusModel virusModel;

  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  final skaffoldKey = GlobalKey<ScaffoldState>();
  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;

  late BehaviorSubject<AnimatedParticleModel> animatedParticlesBS;

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;

    virusModel = VirusModel(
      description: locals.introVirusText,
      title: locals.introVirus,
      widgets: [gifBubonic, gifTyphus, gifTyphoid, gifSmallpox, gifEbola],
    );

    listCharacters = [
      VirusModelWidget(
        virusModel: VirusModel(
          title: locals.introVirus,
          widgets: [gifBubonic, gifTyphus, gifTyphoid, gifSmallpox, gifEbola],
          description: locals.introVirusText,
        ),
      ),
      VirusModelWidget(
        virusModel: VirusModel(
          widgets: [gifBubonic],
          title: locals.bubonicPlague,
          description: locals.bubonicPlagueText,
        ),
      ),
      VirusModelWidget(
        virusModel: VirusModel(
          widgets: [gifTyphus],
          title: locals.typhus,
          description: locals.typhusText,
        ),
      ),
      VirusModelWidget(
        virusModel: VirusModel(
          widgets: [gifTyphoid],
          title: locals.typhiod,
          description: locals.typhiodText,
        ),
      ),
      VirusModelWidget(
        virusModel: VirusModel(
          widgets: [gifSmallpox],
          title: locals.smallpox,
          description: locals.smallpoxText,
        ),
      ),
      VirusModelWidget(
        virusModel: VirusModel(
          widgets: [gifEbola],
          title: locals.ebola,
          description: locals.ebolaText,
        ),
      ),
    ];

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    NavigationSharedPreferences.getNavigationListFromSF();

    animatedParticlesBS = BehaviorSubject<AnimatedParticleModel>.seeded(
      AnimatedParticleModel(
        x: mouseX,
        y: mouseY,
        objWave: objWave,
      ),
    );
  }

  @override
  void dispose() {
    animatedParticlesBS.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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

          animatedParticlesBS.sink.add(
            AnimatedParticleModel(x: mouseX, y: mouseY, objWave: objWave),
          );
        },
        child: Scaffold(
          key: skaffoldKey,
          endDrawer: const NavigationPage(),
          body: GestureDetector(
            onTap: () {
              setState(() {
                virusModel.changeState(
                  description: locals.introVirusText,
                  title: locals.introVirus,
                  widgets: [
                    gifBubonic,
                    gifTyphus,
                    gifTyphoid,
                    gifSmallpox,
                    gifEbola
                  ],
                );
              });
            },
            child: Stack(
              children: [
                StreamBuilder<AnimatedParticleModel>(
                  stream: animatedParticlesBS.stream,
                  builder: (context, snapshot) {
                    return AnimatedParticlesForth(
                      constraints: constraints,
                      mouseX: snapshot.data!.x,
                      mouseY: snapshot.data!.y,
                      objWave: snapshot.data!.objWave,
                    );
                  },
                ),
                Align(
                  child: Container(
                    margin: EdgeInsets.only(right: HW.getWidth(129, context)),
                    child: Row(
                      children: [
                        _viruses(constraints),
                        _descriptionPanel(constraints)
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ArrowLeftTextWidget(
                      textSubTitle: locals.whatDidItDo,
                      textTitle: locals.pathogenProfile,
                      onTap: () {
                        // LeafDetails.currentVertex = 12;
                        // NavigationSharedPreferences.upDateShatedPreferences();

                        // if (kIsWeb) {
                        //   html.window.history.back();
                        //   context.router.pop();
                        // } else {
                        //   context.router.pop();
                        // }
                        LeafDetails.currentVertex = 12;
                        LeafDetails.visitedVertexes.add(12);

                        NavigationSharedPreferences.upDateShatedPreferences();
                        context.router.replace(BodyInfoPageRoute());
                      }),
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
                    skaffoldKey.currentState!.openEndDrawer();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _viruses(BoxConstraints constraints) => Expanded(
        child: AnimatedSwitcher(
          duration: Times.medium,
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: Container(
            key: ValueKey(virusModel.title),
            child: VirusModelWidget(
              constraints: Size(constraints.maxWidth, constraints.maxHeight),
              // gifController: controller,
              onTapBubonik: () {
                setState(() {
                  virusModel.changeState(
                    title: locals.bubonicPlague,
                    widgets: [gifBubonic],
                    description: locals.bubonicPlagueText,
                  );
                });
              },
              onTapEbola: () {
                setState(() {
                  virusModel.changeState(
                    title: locals.ebola,
                    widgets: [gifEbola],
                    description: locals.ebolaText,
                  );
                });
              },
              onTapSmall: () {
                setState(() {
                  virusModel.changeState(
                    title: locals.smallpox,
                    widgets: [gifSmallpox],
                    description: locals.smallpoxText,
                  );
                });
              },
              onTapTiphid: () {
                setState(() {
                  virusModel.changeState(
                    title: locals.typhiod,
                    widgets: [gifTyphoid],
                    description: locals.typhiodText,
                  );
                });
              },
              onTapTiphius: () {
                setState(() {
                  virusModel.changeState(
                    title: locals.typhus,
                    widgets: [gifTyphus],
                    description: locals.typhusText,
                  );
                });
              },
              virusModel: virusModel,
            ),
          ),
        ),
      );

  Widget _descriptionPanel(BoxConstraints constraints) => SizedBox(
        height: HW.getHeight(676, context),
        width: HW.getWidth(768, context),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.white, boxShadow: Shadows.universal),
          padding: EdgeInsets.all(constraints.maxHeight * 0.024),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: HW.getHeight(68, context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: HW.getHeight(8, context)),
                              child: Text(
                                locals.chapter1Pathogenprofile,
                                maxLines: 2,
                                style: DefaultTheme.standard.textTheme.headline1
                                    ?.copyWith(
                                        fontSize: TextFontSize.getHeight(
                                            14, context)),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(locals.whatWasIt.toUpperCase(),
                                maxLines: 1,
                                style: DefaultTheme.standard.textTheme.headline2
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
                            top: BorderSide(color: AppColors.grey, width: 1.2),
                            bottom:
                                BorderSide(color: AppColors.grey, width: 1.2),
                          ),
                        ),
                        child: HAScrollbar(
                          isAlwaysShown: true,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(right: 24, top: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: AutoSizeText(
                                          virusModel.title.toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    ),
                                    AutoSizeText(
                                      virusModel.description,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: HW.getHeight(22, context),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: listCharacters
                            .map((data) => MouseRegion(
                                  onHover: (_) {
                                    setState(() {
                                      hoveredItemIndex = data.virusModel.title;
                                    });
                                  },
                                  onExit: (_) {
                                    setState(() {
                                      hoveredItemIndex = null;
                                    });
                                  },
                                  child: virusesNameListWidget(
                                    isHoverd: hoveredItemIndex ==
                                        data.virusModel.title,
                                    image: data.virusModel.widgets,
                                    name: data.virusModel.title,
                                    text: data.virusModel.description,
                                  ),
                                ))
                            .toList())),
              )
            ],
          ),
        ),
      );

  Widget virusesNameListWidget(
      {String? name,
      List<String>? image,
      String? text,
      bool isHoverd = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: Clickable(
        onPressed: () {
          setState(() {
            virusModel.changeState(
                description: text, title: name, widgets: image);
          });
        },
        child: AutoSizeText(name!.toUpperCase(),
            maxLines: 1,
            style: virusModel.title == name || isHoverd
                ? Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AppColors.orange)
                : Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}
