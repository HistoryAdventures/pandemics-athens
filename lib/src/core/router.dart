import 'package:auto_route/auto_route.dart';
import 'package:history_of_adventures/src/features/glossary/presentation/pages/glossary_page.dart';
import 'package:history_of_adventures/src/features/paralax_history/presentation/pages/paralax_history.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/pages/quiz_page.dart';
import '../features/character/presentation/pages/character_info_page.dart';
import '../features/character/presentation/pages/characters_page.dart';
import '../features/leanding/presentation/pages/leanding_page.dart';
import '../features/map/presentation/pages/map_page.dart';
import '../features/pandemic_info/presentation/pages/pandemic_info.dart';

@CustomAutoRouter(
    transitionsBuilder: TransitionsBuilders.slideBottom,
    durationInMilliseconds: 800,
    routes: <AutoRoute>[
      AutoRoute(page: LeandingPage, initial: true),
      AutoRoute(page: CharacrterPage),
      AutoRoute(page: CharacterInfoPage),
      AutoRoute(page: PandemicInfoPage),
      AutoRoute(page: MapPage),
      AutoRoute(page: QuizPage),
      AutoRoute(page: ParalaxHistoryPage),
      AutoRoute(page: GlossaryPage)
    ])
class $FlutterRouter {}
