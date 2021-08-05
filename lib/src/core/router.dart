import 'package:auto_route/auto_route.dart';
import 'package:history_of_adventures/src/features/about_book/presentation/pages/copyright_page.dart';
import 'package:history_of_adventures/src/features/about_book/presentation/pages/further_reading_page.dart';
import 'package:history_of_adventures/src/features/about_book/presentation/pages/sources_page.dart';

import '../features/about_book/presentation/pages/about_book_page.dart';
import '../features/about_book/presentation/pages/credits_page.dart';
import '../features/character/presentation/pages/character_info_page.dart';
import '../features/character/presentation/pages/characters_page.dart';
import '../features/dead_socrates/presentation/pages/dead_of_socrates.dart';
import '../features/dead_socrates/presentation/pages/end_of_war_page.dart';
import '../features/document/presentation/pages/document_page.dart';
import '../features/glossary/presentation/pages/glossary_page.dart';
import '../features/irl_nikos/presentation/pages/irl_nikos_page.dart';
import '../features/leanding/presentation/pages/leanding_page.dart';
import '../features/map/presentation/pages/map_page.dart';
import '../features/navigation/presentation/pages/navigation_page.dart';
import '../features/panarama_left/presentation/pages/panaroma_left_page.dart';
import '../features/pandemic_info/presentation/pages/body_info_page.dart';
import '../features/pandemic_info/presentation/pages/pathogen_profile_page.dart';
import '../features/pandemic_info/presentation/pages/virus_loc_page.dart';
import '../features/pandemic_info/presentation/pages/virus_loc_second_page.dart';
import '../features/pandemic_info/presentation/pages/viruses_info_page.dart';
import '../features/panorama_right/prezentation/pages/panaroma_right_page.dart';
import '../features/paralax_history/presentation/pages/paralax_history.dart';
import '../features/practice_medicine/presentation/pages/keep_going_page.dart';
import '../features/practice_medicine/presentation/pages/practice_medicine_page.dart';
import '../features/practice_medicine/presentation/pages/quit_medicine_page.dart';
import '../features/quiz/presentation/pages/quiz_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  CustomRoute(
      page: LeandingPage,
      initial: true,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: CharacrterPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: CharacterInfoPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: VirusesInfoPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: MapPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: QuizPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: ParalaxHistoryPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: GlossaryPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: PanaromaLeftPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: PanaromaRightPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: PathogenProfilePage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: KeepGoingPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: QuitMedicinePage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: PracticeMedicine,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: BodyInfoPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: VirusLocationPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: DocumentPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: DeadOfSocratesPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: EndOfWarPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: IrlNikosPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: AboutBookPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: CreditsPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: FurtherReadingPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: CopyrightPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: SoursePage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: NavigationPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: VirusLocationSecondPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
])
class $FlutterRouter {}
