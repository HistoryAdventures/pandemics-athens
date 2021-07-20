import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../../../../core/colors.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/animated_widgets/background_widget.dart';
import '../../../../core/widgets/arrow_text_left.dart';
import '../../../../core/widgets/clickable_widget.dart';
import '../../../../core/widgets/virus_animation_widget.dart';
import '../widgets/gif_contrrol.dart';

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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
                      child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    child: Container(
                      key: ValueKey(_selectedImg),
                      child: VirusModel(
                        constraints: size,
                        gifController: controller,
                        description: _selectedText,
                        name: _selectedItem,
                        widgets: _selectedImg,
                      ),
                    ),
                  )),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          right: 50,
                          top: size.height * 0.1,
                          bottom: size.height * 0.1),
                      decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.5)),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: AutoSizeText(
                                    locals.chapter1Name.toUpperCase(),
                                    maxLines: 1,
                                    style: DefaultTheme
                                        .standard.textTheme.subtitle2,
                                  ),
                                ),
                                Flexible(
                                  child: AutoSizeText(_selectedItem,
                                      style: DefaultTheme
                                          .standard.textTheme.headline2),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: AppColors.grey, width: 1.2),
                                      bottom: BorderSide(
                                          color: AppColors.grey, width: 1.2))),
                              child: Scrollbar(
                                isAlwaysShown: true,
                                child: ListView(shrinkWrap: true, children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: '$_selectedItem\n'.toUpperCase(),
                                        style: DefaultTheme
                                            .standard.textTheme.headline3,
                                      ),
                                      TextSpan(
                                        text: _selectedText,
                                        style: DefaultTheme
                                            .standard.textTheme.bodyText1,
                                      ),
                                    ])),
                                  )
                                ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: listCharacters
                                        .map((data) => virusesNameListWidget(
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
                  textSubTitle: locals.pathogenProfile,
                  textTitle: locals.whatDidItDo,
                  onTap: () {
                    context.router.pop();
                  }),
            ),
          ),
        ],
      ),
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
        margin: const EdgeInsets.only(left: 30),
        child: Clickable(
          onPressed: () {
            changeState(selected, image, text);
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
