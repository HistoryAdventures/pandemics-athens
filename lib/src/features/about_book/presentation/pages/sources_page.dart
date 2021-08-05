import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import '../../../../core/router.gr.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/widgets.dart';

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
  String _selectedImg = "Nikos";
  String _selectedText = "Nikos";

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  List<String> characters = ["Nikos", 'Eduardo', "Greg", "Arlene", "Collen"];

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
                          )
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
                  onTapMenu: () {},
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
                                context.router.pop();
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
                          top: constraints.maxHeight * 0.25),
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
                                    children: [
                                      authorWidget(
                                          'bridge', ['Darrell Steward']),
                                      authorWidget(
                                          'bridge', ['Darrell Steward']),
                                      authorWidget(
                                          'bridge', ['Darrell Steward']),
                                      authorWidget(
                                          'bridge', ['Darrell Steward']),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      authorWidget('wikimedia', [
                                        'Are you ready for your big date?',
                                        'I do not know how to spell a lot of thin...',
                                        'Does he write an email?',
                                        "Don't go there!",
                                        'Is this big enough for you?',
                                        'Guess what, I am broke.',
                                        'That class was so hard!',
                                        'How big was your contribution?',
                                        "I'm hoping for a really big discount."
                                      ]),
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
      _selectedImg = image!;
      _selectedText = text!;
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
        child: AutoSizeText(name!.toUpperCase(),
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.black54)),
      ),
    );
  }

  Widget authorWidget(String profession, List<String> peoples) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: AppColors.grey, width: 1),
                  )),
                  child: AutoSizeText(
                    profession.toUpperCase(),
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: AppColors.grey, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: peoples.map((people) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: AutoSizeText(
                  people,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
