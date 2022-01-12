import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../features/about_book/presentation/pages/about_book_page.dart';
import '../features/about_book/presentation/pages/copyright_page.dart';
import '../features/about_book/presentation/pages/credits_page.dart';
import '../features/about_book/presentation/pages/further_reading_page.dart';
import '../features/about_book/presentation/pages/sources_page.dart';
import '../features/character/presentation/pages/character_info_page.dart';
import '../features/character/presentation/pages/characters_page.dart';
import '../features/dead_socrates/presentation/pages/dead_of_socrates.dart';
import '../features/dead_socrates/presentation/pages/end_of_war_page.dart';
import '../features/document/presentation/pages/document_page.dart';
import '../features/glossary/presentation/pages/glossary_page.dart';
import '../features/irl_nikos/presentation/pages/giana_page.dart';
import '../features/irl_nikos/presentation/pages/irl_nikos_page.dart';
import '../features/leanding/presentation/pages/leanding_page.dart';
import '../features/map/presentation/pages/map_page.dart';
import '../features/navigation/presentation/pages/navigation_page.dart';
import '../features/panaramas/presentation/pages/panaroma_left_page.dart';
import '../features/panaramas/presentation/pages/panaroma_right_page.dart';
import '../features/pandemic_info/presentation/pages/body_info_page.dart';
import '../features/pandemic_info/presentation/pages/pathogen_profile_page.dart';
import '../features/pandemic_info/presentation/pages/virus_loc_page.dart';
import '../features/pandemic_info/presentation/pages/virus_loc_second_page.dart';
import '../features/pandemic_info/presentation/pages/viruses_info_page.dart';
import '../features/paralax_history/presentation/pages/paralax_history.dart';
import '../features/practice_medicine/presentation/pages/keep_going_page.dart';
import '../features/practice_medicine/presentation/pages/practice_medicine_page.dart';
import '../features/practice_medicine/presentation/pages/quit_medicine_page.dart';
import '../features/quiz/presentation/pages/quiz_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(
      page: LeandingPage,
    ),
    CustomRoute(
        name: "LeandingPageToLeft",
        page: LeandingPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "LeandingPageToRight",
        page: LeandingPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "LeandingPageToTop",
        page: LeandingPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "LeandingPageToBottom",
        page: LeandingPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    CustomRoute(
        page: CharacrterPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CharacterPageToLeft",
        page: CharacrterPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CharacterPageToRight",
        page: CharacrterPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CharacterPageToTop",
        page: CharacrterPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CharacterPageToBottom",
        page: CharacrterPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    CustomRoute(
        page: CharacterInfoPage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CharacterInfoPageToLeft",
        page: CharacterInfoPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CharacterInfoPageToRight",
        page: CharacterInfoPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CharacterInfoPageToTop",
        page: CharacterInfoPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CharacterInfoPageToBottom",
        page: CharacterInfoPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    ////
    CustomRoute(
        page: VirusesInfoPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "VirusesInfoPageToLeft",
        page: VirusesInfoPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "VirusesInfoPageToRight",
        page: VirusesInfoPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "VirusesInfoPageToTop",
        page: VirusesInfoPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "VirusesInfoPageToBottom",
        page: VirusesInfoPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),

    //////
    CustomRoute(
        page: MapPage,
        initial: true,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "MapPageToLeft",
        page: MapPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 1000),
    CustomRoute(
        name: "MapPageToRight",
        page: MapPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "MapPageToTop",
        page: MapPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "MapPageToBottom",
        page: MapPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    /////
    CustomRoute(
        page: QuizPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "QuizPageToLeft",
        page: QuizPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "QuizPageToRight",
        page: QuizPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "QuizPageToTop",
        page: QuizPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "QuizPageToBottom",
        page: QuizPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    ////
    CustomRoute(
        page: ParalaxHistoryPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "ParalaxHistoryPageToLeft",
        page: ParalaxHistoryPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "ParalaxHistoryPageToRight",
        page: ParalaxHistoryPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "ParalaxHistoryPageToTop",
        page: ParalaxHistoryPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "ParalaxHistoryPageToBottom",
        page: ParalaxHistoryPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    ////
    CustomRoute(
        page: GlossaryPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "GlossaryPageToLeft",
        page: GlossaryPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "GlossaryPageToRight",
        page: GlossaryPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "GlossaryPageToTop",
        page: GlossaryPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "GlossaryPageToBottom",
        page: GlossaryPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    ////
    CustomRoute(
        page: PanaromaLeftPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),

    CustomRoute(
        name: "PanaromaLeftPageToLeft",
        page: PanaromaLeftPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "PanaromaLeftPageToRight",
        page: PanaromaLeftPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "PanaromaLeftPageToTop",
        page: PanaromaLeftPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "PanaromaLeftPageToBottom",
        page: PanaromaLeftPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),

    /////
    CustomRoute(
        page: PanaromaRightPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),

    CustomRoute(
        name: "PanaromaRightPageToLeft",
        page: PanaromaRightPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "PanaromaRightPageToRight",
        page: PanaromaRightPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "PanaromaRightPageToTop",
        page: PanaromaRightPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "PanaromaRightPageToBottom",
        page: PanaromaRightPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),

    ////
    CustomRoute(
        name: "PathogenProfilePageBottomRoute",
        page: PathogenProfilePage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "PathogenProfilePageRightRoute",
        page: PathogenProfilePage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "PathogenProfilePageLeftRoute",
        page: PathogenProfilePage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "KeepGoingPageLeftRoute",
        page: KeepGoingPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "KeepGoingPageBottomRoute",
        page: KeepGoingPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    CustomRoute(
        page: QuitMedicinePage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "QuitMedicinePageToLeft",
        page: QuitMedicinePage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "QuitMedicinePageToRight",
        page: QuitMedicinePage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "QuitMedicinePageToTop",
        page: QuitMedicinePage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "QuitMedicinePageToBottom",
        page: QuitMedicinePage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    ////
    CustomRoute(
        page: PracticeMedicine,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "PracticeMedicineToLeft",
        page: PracticeMedicine,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "PracticeMedicineToRight",
        page: PracticeMedicine,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "PracticeMedicineToTop",
        page: PracticeMedicine,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "PracticeMedicineToBottom",
        page: PracticeMedicine,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),

    ///
    CustomRoute(
        page: BodyInfoPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "BodyInfoPageToLeft",
        page: BodyInfoPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "BodyInfoPageToRight",
        page: BodyInfoPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "BodyInfoPageToTop",
        page: BodyInfoPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "BodyInfoPageToBottom",
        page: BodyInfoPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    ////
    CustomRoute(
        page: VirusLocationPage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "VirusLocationPageToLeft",
        page: VirusLocationPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "VirusLocationPageToRight",
        page: VirusLocationPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "VirusLocationPageToTop",
        page: VirusLocationPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "VirusLocationPageToBottom",
        page: VirusLocationPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),

    ///
    CustomRoute(
        page: DocumentPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "DocumentPageToLeft",
        page: DocumentPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "DocumentPageToRight",
        page: DocumentPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "DocumentPageToTop",
        page: DocumentPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "DocumentPageToBottom",
        page: DocumentPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    ////
    CustomRoute(
        page: DeadOfSocratesPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "DeadOfSocratesPageToLeft",
        page: DeadOfSocratesPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "DeadOfSocratesPageToRight",
        page: DeadOfSocratesPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "DeadOfSocratesPageToTop",
        page: DeadOfSocratesPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "DeadOfSocratesPageToBottom",
        page: DeadOfSocratesPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    ////
    CustomRoute(
        page: EndOfWarPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "EndOfWarPageToLeft",
        page: EndOfWarPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "EndOfWarPageToRight",
        page: EndOfWarPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "EndOfWarPageToTop",
        page: EndOfWarPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "EndOfWarPageToBottom",
        page: EndOfWarPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    ////
    CustomRoute(
        page: IrlNikosPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "IrlNikosPageToLeft",
        page: IrlNikosPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "IrlNikosPageToRight",
        page: IrlNikosPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "IrlNikosPageToTop",
        page: IrlNikosPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "IrlNikosPageToBottom",
        page: IrlNikosPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),

    ////
    CustomRoute(
        page: GianaPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "GianaPageToLeft",
        page: GianaPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "GianaPageToRight",
        page: GianaPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "GianaPageToTop",
        page: GianaPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "GianaPageToBottom",
        page: GianaPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),

    ////
    CustomRoute(
        page: AboutBookPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "AboutBookPageToLeft",
        page: AboutBookPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "AboutBookPageToRight",
        page: AboutBookPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "AboutBookPageToTop",
        page: AboutBookPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "AboutBookPageToBottom",
        page: AboutBookPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),

    ///
    CustomRoute(
        page: CreditsPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),

    CustomRoute(
        name: "CreditsPageToLeft",
        page: CreditsPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CreditsPageToRight",
        page: CreditsPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CreditsPageToTop",
        page: CreditsPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CreditsPageToBottom",
        page: CreditsPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    ////
    CustomRoute(
        page: FurtherReadingPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "FurtherReadingPageToLeft",
        page: FurtherReadingPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "FurtherReadingPageToRight",
        page: FurtherReadingPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "FurtherReadingPageToTop",
        page: FurtherReadingPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "FurtherReadingPageToBottom",
        page: FurtherReadingPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    /////
    CustomRoute(
        page: CopyrightPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CopyrightPageToLeft",
        page: CopyrightPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CopyrightPageToRight",
        page: CopyrightPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CopyrightPageToTop",
        page: CopyrightPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "CopyrightPageToBottom",
        page: CopyrightPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    ////
    CustomRoute(
        page: SourcePage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "SourcePageToLeft",
        page: SourcePage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "SourcePageToRight",
        page: SourcePage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "SourcePageToTop",
        page: SourcePage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "SourcePageToBottom",
        page: SourcePage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),

    ///
    CustomRoute(
        page: NavigationPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),

    CustomRoute(
        page: VirusLocationSecondPage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "VirusLocationSecondPageToLeft",
        page: VirusLocationSecondPage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "VirusLocationSecondPageToRight",
        page: VirusLocationSecondPage,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "VirusLocationSecondPageToTop",
        page: VirusLocationSecondPage,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "VirusLocationSecondPageToBottom",
        page: VirusLocationSecondPage,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    ////
  ],
)
class $FlutterRouter {}

List<CustomRoute> getRoutesPack({
  required String name,
  required Type child,
}) {
  return [
    CustomRoute(
        name: "${name}ToLeft",
        page: child,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "${name}ToRight",
        page: child,
        transitionsBuilder: TransitionsBuilders.slideRight,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "${name}ToTop",
        page: child,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
    CustomRoute(
        name: "${name}ToBottom",
        page: child,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
  ];
}
