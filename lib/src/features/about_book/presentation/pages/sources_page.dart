import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/shared_preferenses.dart';
import 'package:history_of_adventures/src/features/about_book/presentation/widgets/author_widget.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class SoursePage extends StatefulWidget {
  const SoursePage({Key? key}) : super(key: key);

  @override
  _SoursePageState createState() => _SoursePageState();
}

class _SoursePageState extends State<SoursePage> {
  late AppLocalizations locale;

  final backgroundplayer = AudioPlayer();
  bool isSoundOn = false;

  String _selectedItem = "Nikos";
  // String _selectedImg = "Nikos";
  // String _selectedText = "Nikos";

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  List<String> characters = ["Nikos", 'Eduardo', "Greg", "Arlene", "Collen"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
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
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: constraints.maxHeight * 0.2,
                      margin: EdgeInsets.only(
                        top: constraints.maxHeight * 0.12,
                      ),
                      child: Column(
                        children: [
                          Flexible(
                            child: AutoSizeText(
                              locale.sources.toUpperCase(),
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          Flexible(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: characters
                                    .map((data) => charactersListWidget(
                                        name: data,
                                        text: data,
                                        image: data,
                                        selected: data))
                                    .toList()),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                        ],
                      ),
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
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: ArrowLeftTextWidget(
                              textSubTitle: locale.credits,
                              textTitle: locale.aboutTheBook,
                              onTap: () {
                                LeafDetails.currentVertex = 20;
                                NavigationSharedPreferences
                                    .upDateShatedPreferences();

                                if (kIsWeb) {
                                  html.window.history.back();
                                  context.router.pop();
                                } else {
                                  context.router.pop();
                                }
                              }),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(AssetsPath.socilaIcons),
                              const AutoSizeText(
                                'www.historyadventures.co',
                                maxLines: 1,
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          child: ArrowRightTextWidget(
                              textSubTitle: locale.furtherReading,
                              textTitle: locale.aboutTheBook,
                              onTap: () {
                                LeafDetails.currentVertex = 22;
                                LeafDetails.visitedVertexes.add(22);
                                NavigationSharedPreferences
                                    .upDateShatedPreferences();
                                context.router
                                    .push(const FurtherReadingPageRoute());
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: constraints.maxHeight * 0.8,
                      margin: EdgeInsets.only(
                          left: constraints.maxWidth * 0.1,
                          right: constraints.maxWidth * 0.1,
                          bottom: 80,
                          top: constraints.maxHeight * 0.3),
                      child: Scrollbar(
                        showTrackOnHover: false,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      AuthorWidget(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.grey, width: 1),
                                        ),
                                        peoples: [
                                          'Analysing Potential Problems'
                                        ],
                                        profession: 'bridge',
                                      ),
                                      AuthorWidget(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.grey, width: 1),
                                        ),
                                        peoples: [
                                          'Analysing Potential Problems'
                                        ],
                                        profession: 'bridge',
                                      ),
                                      AuthorWidget(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.grey, width: 1),
                                        ),
                                        peoples: [
                                          'Analysing Potential Problems'
                                        ],
                                        profession: 'bridge',
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      AuthorWidget(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.black100,
                                              width: 1),
                                        ),
                                        peoples: [
                                          'Are you ready for your big date?',
                                          'I do not know how to spell a lot of thin...',
                                          'Does he write an email?',
                                          "Don't go there!",
                                          'Is this big enough for you?',
                                          'Guess what, I am broke.',
                                          'That class was so hard!',
                                          'How big was your contribution?',
                                          "I'm hoping for a really big discount."
                                        ],
                                        profession: 'wikimedia',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void chandeState(String? selctedItem, String? image, String? text) {
    setState(() {
      _selectedItem = selctedItem!;
      // _selectedImg = image!;
      // _selectedText = text!;
    });
  }

  Widget charactersListWidget(
      {String? name, String? selected, String? image, String? text}) {
    return Clickable(
      onPressed: () {
        chandeState(selected, image, text);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 2,
                    color: _selectedItem == selected
                        ? AppColors.orange
                        : AppColors.transpatent))),
        child: AutoSizeText(name!,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.black100)),
      ),
    );
  }
}
