import 'package:auto_route/auto_route.dart';
import 'package:history_of_adventures/src/features/glossary/presentation/pages/glossary_page.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/pages/body_info_page.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/pages/pathogen_profile_page.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/pages/virus_loc_page.dart';
import 'package:history_of_adventures/src/features/panorama/prezentation/pages/panaroma_page.dart';
import 'package:history_of_adventures/src/features/paralax_history/presentation/pages/learn_more_page.dart';
import 'package:history_of_adventures/src/features/paralax_history/presentation/pages/paralax_history.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/pages/quiz_page.dart';
import '../features/character/presentation/pages/character_info_page.dart';
import '../features/character/presentation/pages/characters_page.dart';
import '../features/leanding/presentation/pages/leanding_page.dart';
import '../features/map/presentation/pages/map_page.dart';
import '../features/pandemic_info/presentation/pages/viruses_info_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  CustomRoute(
      page: LeandingPage,
      initial: true,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: CharacrterPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: CharacterInfoPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: VirusesInfoPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: MapPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: QuizPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
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
      page: PanaromaPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: PathogenProfilePage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: BodyInfoPage, transitionsBuilder: TransitionsBuilders.slideLeft),
  CustomRoute(
      page: VirusLocationPage,
      transitionsBuilder: TransitionsBuilders.slideBottom),
  CustomRoute(
      page: LearnmorePage, transitionsBuilder: TransitionsBuilders.slideLeft)
])
class $FlutterRouter {}
