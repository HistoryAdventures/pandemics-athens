import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/widgets.dart';

class BodyInfoPage extends StatefulWidget {
  const BodyInfoPage({Key? key}) : super(key: key);

  @override
  _BodyInfoPageState createState() => _BodyInfoPageState();
}

class _BodyInfoPageState extends State<BodyInfoPage>
    with SingleTickerProviderStateMixin {
  late String _selectedItem;
  late String _selectedImg;
  late String _selectedText;
  late AppLocalizations locale;
  late Animation<double> animation;
  late AnimationController controller;
  late List<BodyOnTapsModel> listCharacters;

  List<String> contentImages = [
    AssetsPath.manIntroImage,
    AssetsPath.manheadImage,
    AssetsPath.manthroatImage,
    AssetsPath.manChestImage,
    AssetsPath.manfillImage,
    AssetsPath.manstomachImage,
    AssetsPath.manhandsImage,
    AssetsPath.gifVirus,
    AssetsPath.gifTyphus,
    AssetsPath.gifSmallpox,
    AssetsPath.gifTyphoid,
    AssetsPath.gifEbola,
    AssetsPath.gifBubonic,
  ];

  bool isImageloaded = false;
  bool isSoundOn = false;

  final backgroundplayer = AudioPlayer();

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
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    _selectedText = locale.intrBodyText;
    listCharacters = [
      BodyOnTapsModel(
        photo: AssetsPath.manIntroImage,
        name: locale.bodyIntro,
        descriptiion: locale.intrBodyText,
      ),
      BodyOnTapsModel(
        photo: AssetsPath.manheadImage,
        name: locale.bodyHead,
        descriptiion: locale.headText,
      ),
      BodyOnTapsModel(
        photo: AssetsPath.manthroatImage,
        name: locale.bodyThroat,
        descriptiion: locale.throatText,
      ),
      BodyOnTapsModel(
        photo: AssetsPath.manChestImage,
        name: locale.bodyCheast,
        descriptiion: locale.chestText,
      ),
      BodyOnTapsModel(
        photo: AssetsPath.manfillImage,
        name: locale.skin,
        descriptiion: locale.skinText,
      ),
      BodyOnTapsModel(
        photo: AssetsPath.manstomachImage,
        name: locale.bodyStomach,
        descriptiion: locale.stomachText,
      ),
      BodyOnTapsModel(
        photo: AssetsPath.manhandsImage,
        name: locale.bodyhands,
        descriptiion: locale.hendsText,
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  void initState() {
    init();
    _selectedItem = "intro";
    _selectedImg = AssetsPath.manIntroImage;
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 80, end: 50).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isImageloaded == false) {
      return const LoadingWidget();
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              const BackgroundWidget(),
              Align(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 80,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: constraints.maxHeight,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: BodyOnTapsModel(
                              key: ValueKey(_selectedItem),
                              name: _selectedItem,
                              photo: _selectedImg,
                              descriptiion: _selectedText,
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              onTapStomach: () {
                                chandeState(
                                    locale.bodyStomach,
                                    AssetsPath.manstomachImage,
                                    locale.stomachText);
                              },
                              onTapHends: () {
                                chandeState(locale.bodyhands,
                                    AssetsPath.manhandsImage, locale.hendsText);
                              },
                              onTapChest: () {
                                chandeState(locale.bodyCheast,
                                    AssetsPath.manChestImage, locale.chestText);
                              },
                              onTapThroat: () {
                                chandeState(
                                    locale.bodyThroat,
                                    AssetsPath.manthroatImage,
                                    locale.throatText);
                              },
                              onTapHead: () {
                                chandeState(locale.bodyHead,
                                    AssetsPath.manheadImage, locale.headText);
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: constraints.maxHeight * 0.1),
                          decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.5)),
                          padding:
                              EdgeInsets.all(constraints.maxHeight * 0.024),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: AutoSizeText(
                                        locale.chapter1Pathogenprofile
                                            .toUpperCase(),
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                    ),
                                    Flexible(
                                      child: AutoSizeText(_selectedItem,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: AppColors.grey,
                                              width: 1.2),
                                          bottom: BorderSide(
                                              color: AppColors.grey,
                                              width: 1.2))),
                                  child: ListView(shrinkWrap: true, children: [
                                    Container(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: '$_selectedItem\n\n'
                                              .toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        TextSpan(
                                          text: _selectedText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ])),
                                    )
                                  ]),
                                ),
                              ),
                              Flexible(
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: listCharacters
                                            .map((data) => bodiesNameListWidget(
                                                name: data.name,
                                                text: data.descriptiion,
                                                image: data.photo,
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
                      textSubTitle: locale.whereDidItComeFrom,
                      textTitle: locale.pathogenProfile,
                      onTap: () {
                        context.router.pop();
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
                onTapMenu: () {},
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ArrowRightTextWidget(
                      textSubTitle: locale.whatWasIt,
                      textTitle: locale.pathogenProfile,
                      onTap: () {
                        context.router.push(const VirusesInfoPageRoute());
                      }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void chandeState(String? selctedItem, String? image, String? text) {
    setState(() {
      _selectedItem = selctedItem!;
      _selectedImg = image!;
      _selectedText = text!;
    });
  }

  Widget bodiesNameListWidget(
      {String? name, String? selected, String? image, String? text}) {
    return Container(
        margin: const EdgeInsets.only(right: 30),
        child: Clickable(
          onPressed: () {
            chandeState(selected, image, text);
          },
          child: AutoSizeText(name!.toUpperCase(),
              maxLines: 1,
              style: _selectedItem == selected
                  ? Theme.of(context).textTheme.bodyText1
                  : Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.grey)),
        ));
  }
}
