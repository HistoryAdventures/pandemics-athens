import 'package:auto_route/auto_route.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/pages/quiz_page.dart';
import '../features/character/presentation/pages/character_info_page.dart';
import '../features/character/presentation/pages/characters_page.dart';
import '../features/leanding/presentation/pages/leanding_page.dart';
import '../features/map/presentation/pages/map_page.dart';
import '../features/pandemic_info/presentation/pages/pandemic_info.dart';

@CustomAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: LeandingPage, initial: true),
  AutoRoute(page: CharacrterPage),
  AutoRoute(page: CharacterInfoPage),
  AutoRoute(page: PandemicInfoPage),
  AutoRoute(page: MapPage),
  AutoRoute(page: QuizPage),
])
class $FlutterRouter {}
