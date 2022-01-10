import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/social_media_icons.dart';
import 'package:history_of_adventures/src/features/about_book/models/url_luncher.dart';
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

  List<String> characters = [
    "Nikos",
  ];

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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              LeafDetails.visitedVertexes.add(24);
                              NavigationSharedPreferences
                                  .upDateShatedPreferences();
                              context.router
                                  .replace(const CreditsPageToRight());
                            }),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SocialMediaIcons(),
                            SizedBox(
                              height: HW.getHeight(45, context),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: ArrowRightTextWidget(
                            textSubTitle: locale.furtherReading,
                            textTitle: locale.aboutTheBook,
                            onTap: () {
                              LeafDetails.currentVertex = 26;
                              LeafDetails.visitedVertexes.add(26);
                              NavigationSharedPreferences
                                  .upDateShatedPreferences();
                              context.router
                                  .push(const FurtherReadingPageRoute());
                            }),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: HW.getHeight(289, context),
                  left: HW.getWidth(160, context),
                  right: HW.getWidth(160, context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthorWidget(
                              profession: 'wikimedia',
                              urlModeles: [
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/File:Phidippides.jpg',
                                    title: 'The Soldier of Marathon'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/Battle_of_Thermopylae#/media/File:Le%C3%B3nidas_en_las_Term%C3%B3pilas,_por_Jacques-Louis_David.jpg',
                                    title: 'Leonidas at Thermopylae'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/File:TempleDelos.jpg',
                                    title: 'Temple of the Delians'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/Decree_of_Themistocles#/media/File:EPMA-13330-Themistocle_decree-2.JPG',
                                    title: 'Decree of Themistocles'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/File:MaskOfAgamemnon.jpg',
                                    title: 'Mask of Agamemnon'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/Cultural_depictions_of_Alcibiades#/media/File:Socrates-Alcibiades.jpg',
                                    title:
                                        'Socrates Tears Alcibiades from the Embrace of Sensual Pleasure'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/Ancient_Greek_coinage#/media/File:SNGCop_039.jpg',
                                    title: 'A silver tetradrachm from Athens'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/Pericles#/media/File:Discurso_funebre_pericles.PNG',
                                    title: 'Pericles Funeral Oration'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/Athena_Parthenos#/media/File:Athena_Parthenos_LeQuire.jpg',
                                    title: 'Athena Parthenos'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/The_Trojan_Women#/media/File:Astianax.jpg',
                                    title: 'The Trojan Women'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/Peloponnesian_War#/media/File:Meeting_between_Cyrus_the_Younger_and_Lysander,_by_Francesco_Antonio_Grue_(1618-1673),_maiolica_with_a_dusting_technique,_Castelli_manufacture,_Abruzzo._Italy,_17th_century.jpg',
                                    title:
                                        'Meeting between Cyrus the Younger and Lysander'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/File:Hippocrates_rubens.jpg',
                                    title:
                                        'An engraving of Hippocrates as imagined'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/Asclepeion#/media/File:Patients_sleeping_in_the_temple_of_Aesculapius_at_Epidaurus._Wellcome_V0018154.jpg',
                                    title:
                                        'Patients sleeping in the temple of Aesculapius at Epidaurus'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/Hippocratic_Oath#/media/File:Papyrus_text;_fragment_of_Hippocratic_oath._Wellcome_L0034090.jpg',
                                    title:
                                        'A fragment of the Hippocratic oath'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/File:Alcibades_being_taught_by_Socrates,_Fran%C3%A7ois-Andr%C3%A9_Vincent.jpg',
                                    title:
                                        'Alcibiades receiving the lessons of Socrates'),
                                UrlLuncherModel(
                                    url:
                                        'https://en.wikipedia.org/wiki/File:Lysander_outside_the_walls_of_Athens_19th_century_lithograph.jpg',
                                    title:
                                        'Lysander overseeing the demolition of Athens’ defensive walls'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: HW.getWidth(124, context)),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthorWidget(
                              urlModeles: [
                                UrlLuncherModel(
                                    url:
                                        "https://commons.wikimedia.org/wiki/File:Pnyx-berg2.png",
                                    title: "Pnyx hill, Athens."),
                                UrlLuncherModel(
                                    url:
                                        "https://commons.wikimedia.org/wiki/File:ACMA_Relief_Lenormant.jpg",
                                    title: "The Lenormant Trireme Relief"),
                                UrlLuncherModel(
                                    url:
                                        "https://commons.wikimedia.org/wiki/File:Grave_relief_of_Dexileos,_son_of_Lysanias,_of_Thorikos_(Ca._390_BC)_(4454389225).jpg",
                                    title:
                                        "Grave relief of Dexileos, son of Lysanias,  of Thorikos"),
                                UrlLuncherModel(
                                    url:
                                        "https://commons.wikimedia.org/wiki/File:Eug%C3%A8ne_Ferdinand_Victor_Delacroix_031.jpg",
                                    title: "Medea about to kill her children"),
                                UrlLuncherModel(
                                    url:
                                        "https://en.wikipedia.org/wiki/Plague_of_Ashdod_(Poussin)#/media/File:Nicolas_Poussin_-_The_Plague_at_Ashdod_-_WGA18274.jpg",
                                    title: "The plague of Ashdod"),
                                UrlLuncherModel(
                                    url:
                                        "https://upload.wikimedia.org/wikipedia/commons/9/96/Giambettino_Cignaroli_-_The_Death_of_Socrates_-_WGA04876.jpg",
                                    title:
                                        "Death of Socrates, Giambettino Cignaroli"),
                                UrlLuncherModel(
                                    url:
                                        "https://commons.wikimedia.org/wiki/File:Plato_Silanion_Musei_Capitolini_MC1377.jpg",
                                    title:
                                        "A marble portrait of Plato, identified as the copy of a portrait made by Silanion (Plato Silanion Musei Capitolini MC1377)"),
                                UrlLuncherModel(
                                    url:
                                        "https://commons.wikimedia.org/wiki/File:David_-_The_Death_of_Socrates.jpg",
                                    title: "The Death of Socrates"),
                                UrlLuncherModel(
                                    url:
                                        "https://commons.wikimedia.org/wiki/File:Medicine_aryballos_Louvre_CA1989-2183.jpg",
                                    title:
                                        "Peytel aryballos (Medicine aryballos Louvre CA1989-2183)"),
                                UrlLuncherModel(
                                    url:
                                        "https://commons.wikimedia.org/wiki/File:Medicina_na_Idade_M%C3%A9dia_(1906)_-_Veloso_Salgado_(Sala_dos_Actos,_FCM-UNL).png",
                                    title:
                                        "Medicine in the Middle Ages (Medicina na Idade Média)"),
                                UrlLuncherModel(
                                    url:
                                        "https://commons.wikimedia.org/wiki/File:Gela_Painter_-_Black-Figure_%22Pinax%22_(Plaque)_-_Walters_48225.jpg",
                                    title:
                                        "A pinax, or decorated plaque (Gela Painter - Black-Figure 'Pinax')"),
                                UrlLuncherModel(
                                    url:
                                        "https://commons.wikimedia.org/wiki/File:Romtrireme.jpg",
                                    title:
                                        "A Roman-era mosaic depicting a trireme (Romtrireme) "),
                              ],
                              profession: 'wikimedia',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: HW.getWidth(96, context)),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthorWidget(
                              urlModeles: [
                                UrlLuncherModel(
                                    url:
                                        'https://www.metmuseum.org/art/collection/search/253611',
                                    title:
                                        'Grave stele with Hoplite Battle Scene'),
                                UrlLuncherModel(
                                    url:
                                        'https://www.metmuseum.org/art/collection/search/252472',
                                    title: 'Athenian tribute list'),
                                UrlLuncherModel(
                                    url:
                                        'https://www.metmuseum.org/art/collection/search/245829',
                                    title: 'A Marble bust of Herodotos'),
                                UrlLuncherModel(
                                    url:
                                        'https://www.metmuseum.org/art/collection/search/253348',
                                    title:
                                        'A terracotta lekythos (oil flask) from the  late 6th century'),
                                UrlLuncherModel(
                                    url:
                                        'https://www.metmuseum.org/art/collection/search/252890?searchField=All&amp;sortBy=Relevance&amp;when=1000+B.C.-A.D.+1&amp;ft=democracy&amp;offset=0&amp;rpp=20&amp;pos=4',
                                    title:
                                        'A marble grave stele of a young girl'),
                                UrlLuncherModel(
                                    url:
                                        'https://www.metmuseum.org/art/collection/search/10482',
                                    title: 'The Parthenon'),
                              ],
                              profession: 'the met museum',
                            ),
                            AuthorWidget(
                              urlModeles: [
                                UrlLuncherModel(
                                    url:
                                        'https://www.britishmuseum.org/collection/object/G_1805-0703-91',
                                    title:
                                        "Marble portrait bust: Pericles wearing a helmet pushed back on his head."),
                                UrlLuncherModel(
                                    url:
                                        'https://www.britishmuseum.org/collection/object/G_1925-1118-1',
                                    title: "Marble statuette of Socrates."),
                              ],
                              profession: 'British museum',
                            ),
                            AuthorWidget(
                              urlModeles: [
                                UrlLuncherModel(
                                    url:
                                        'https://www.rijksmuseum.nl/nl/collectie/RP-F-1997-31-7',
                                    title:
                                        "Parthenon on the Acropolis in Athens"),
                                UrlLuncherModel(
                                    url:
                                        'https://www.rmo.nl/collectie/topstukken/relief-8/',
                                    title:
                                        "A marble relief from Italy in the second century AD"),
                              ],
                              profession: 'Rijks Museum',
                            ),
                            AuthorWidget(
                              urlModeles: [
                                UrlLuncherModel(
                                    url:
                                        'http://www.perseus.tufts.edu/hopper/text?doc=Lucr.+6.1146&fromdoc=Perseus%3Atext%3A1999.02.0131',
                                    title: 'The Plague Athens'),
                                UrlLuncherModel(
                                    url:
                                        'http://www.perseus.tufts.edu/hopper/text?doc=Perseus%3Atext%3A1999.01.0170%3Atext%3DApol.%3Asection%3D32b',
                                    title: 'Plato, Apology')
                              ],
                              profession: 'Perseus Digital Library',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: HW.getWidth(101, context)),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthorWidget(
                              urlModeles: [
                                UrlLuncherModel(
                                    url:
                                        'https://whc.unesco.org/en/documents/111174',
                                    title:
                                        'Temple of Apollo Epicurius at Bassae')
                              ],
                              profession: 'UNESCO',
                            ),
                            AuthorWidget(
                              urlModeles: [
                                UrlLuncherModel(
                                    url:
                                        'https://www.worldhistory.org/uploads/images/4522.jpg?v=1617625809',
                                    title:
                                        'An ostrakon inscribed with the name of Pericles')
                              ],
                              profession: 'World History Encyclopedia',
                            ),
                            AuthorWidget(
                              urlModeles: [
                                UrlLuncherModel(
                                    url:
                                        'https://artsandculture.google.com/asset/portrait-of-plato-unknown/4QF7mpA3D8m6Pw',
                                    title: 'Portrait of Plato')
                              ],
                              profession:
                                  'Neues Museum, Staatliche Museen zu Berlin',
                            ),
                            AuthorWidget(
                              urlModeles: [
                                UrlLuncherModel(
                                    url:
                                        'https://www.nms.ac.uk/explore-our-collections/collection-search-results/?item_id=408385',
                                    title: 'A red-figure kylix')
                              ],
                              profession: 'National Museums Scotland',
                            ),
                            AuthorWidget(
                              urlModeles: [
                                UrlLuncherModel(
                                    url:
                                        'https://artsandculture.google.com/asset/oedipus-and-antigone-antoni-brodowski/tgE-pCozfBqZsQ',
                                    title: 'Oedipus and Antigone')
                              ],
                              profession: 'Digital National Museum in Warsaw',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
        //margin: const EdgeInsets.only(right: 30),
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
                .headline2
                ?.copyWith(color: AppColors.black100, fontSize: 24)),
      ),
    );
  }
}
