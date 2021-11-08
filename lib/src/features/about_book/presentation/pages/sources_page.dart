import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../widgets/author_widget.dart';

class SourcePage extends StatefulWidget {
  const SourcePage({Key? key}) : super(key: key);

  @override
  _SourcePageState createState() => _SourcePageState();
}

class _SourcePageState extends State<SourcePage> {
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

  List<String> characters = ["Nikos", 'Giana', "Xoquauhtli", "Achraj", "Brian"];

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
                Positioned(
                    left: 0,
                    right: 0,
                    top: HW.getHeight(128, context),
                    child: SizedBox(
                      height: HW.getHeight(97, context),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: HW.getHeight(43, context),
                            child: Text(
                              locale.sources.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      fontSize:
                                          TextFontSize.getHeight(36, context)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: HW.getHeight(24, context),
                            ),
                            height: HW.getHeight(30, context),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: ArrowLeftTextWidget(
                            textSubTitle: locale.credits,
                            textTitle: locale.aboutTheBook,
                            onTap: () {
                              LeafDetails.currentVertex = 24;
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
                            textSubTitle: locale.copyright,
                            textTitle: locale.aboutTheBook,
                            onTap: () {
                              LeafDetails.currentVertex = 26;
                              LeafDetails.visitedVertexes.add(26);
                              NavigationSharedPreferences
                                  .upDateShatedPreferences();
                              context.router.push(const CopyrightPageRoute());
                            }),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: HW.getHeight(289, context),
                  left: HW.getWidth(160, context),
                  right: HW.getWidth(160, context),
                  bottom: 80,
                  child: Container(
                      height: HW.getHeight(597, context),
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
                                      peoples: [
                                        "The Soldier of Marathon",
                                        "Leonidas at Thermopylae",
                                        "Temple of the Delians",
                                        "Decree of Themistocles",
                                        "Mask of Agamemnon",
                                        "Socrates Tears Alcibiades from the  Embrace of Sensual Pleasure",
                                        "A silver tetradrachm from Athens",
                                        "Pericles Funeral Oration",
                                        "Athena Parthenos",
                                        "The Trojan Women",
                                        "Meeting between Cyrus the Younger  and Lysander",
                                        "An engraving of Hippocrates",
                                        "Patients sleeping in the temple of  Aesculapius at Epidaurus",
                                        "A fragment of the Hippocratic oath",
                                        "Alcibades being taught by Socrates",
                                        "Lysander outside the walls of Athens",
                                      ],
                                      profession: 'wikimedia',
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
                                      peoples: [
                                        "Pnyx hill, Athens.",
                                        "The Lenormant Trireme Relief",
                                        "Grave relief of Dexileos, son of Lysanias,  of Thorikos",
                                        "Medea about to kill her children",
                                        "The plague of Ashdod",
                                        "Death of Socrates, Giambettino Cignaroli",
                                        "A marble portrait of Plato",
                                        "The Death of Socrates",
                                        "Peytel aryballos",
                                        "Medicine in the Middle Ages",
                                        "A pinax, or decorated plaque",
                                        "A Roman-era mosaic depicting a trireme",
                                      ],
                                      profession: 'wikimedia',
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
                                      peoples: [
                                        "Grave stele with Hoplite Battle Scene",
                                        "Athenian tribute list",
                                        "A Marble bust of Herodotos",
                                        "A terracotta lekythos (oil flask) from the  late 6th century",
                                        "A marble grave stele of a young girl",
                                        "The Parthenon’",
                                      ],
                                      profession: 'the met museum',
                                    ),
                                    AuthorWidget(
                                      peoples: [
                                        "Marble portrait bust: Pericles wearing a  helmet pushed back on his head. ",
                                        "Marble statuette of Socrates."
                                      ],
                                      profession: 'British museum',
                                    ),
                                    AuthorWidget(
                                      peoples: [
                                        "Parthenon on the Acropolis in Athens",
                                        "A marble relief from Italy in the second century AD"
                                      ],
                                      profession: 'Rijks Museum',
                                    ),
                                    AuthorWidget(
                                      peoples: [
                                        "The Plague Athens",
                                        "Plato, Apology"
                                      ],
                                      profession: 'Perseus Digital Library',
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
                                      peoples: [
                                        "Temple of Apollo Epicurius at Bassae",
                                      ],
                                      profession: 'UNESCO',
                                    ),
                                    AuthorWidget(
                                      peoples: [
                                        "An ostrakon inscribed with the name of Pericles",
                                      ],
                                      profession:
                                          'World History Encyclopedia',
                                    ),
                                    AuthorWidget(
                                      peoples: ["Portrait of Plato"],
                                      profession:
                                          'Neues Museum, Staatliche Museen zu Berlin',
                                    ),
                                    AuthorWidget(
                                      peoples: [
                                        "A red-figure kylix ",
                                      ],
                                      profession: 'National Museums Scotland',
                                    ),
                                    AuthorWidget(
                                      peoples: [
                                        "Oedipus and Antigone",
                                      ],
                                      profession:
                                          'Digital National Museum in Warsaw',
                                    ),
                                  ],
                                ),
                              ),
                            ],
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

