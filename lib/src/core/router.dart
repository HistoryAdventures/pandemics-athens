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

@CustomAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: LeandingPage),
  AutoRoute(page: CharacrterPage),
  AutoRoute(page: CharacterInfoPage),
  AutoRoute(page: VirusesInfoPage),
  AutoRoute(page: MapPage),
  AutoRoute(page: QuizPage),
  AutoRoute(page: ParalaxHistoryPage, initial: true),
  AutoRoute(page: GlossaryPage),
  AutoRoute(page: PanaromaPage),
  AutoRoute(page: PathogenProfilePage),
  AutoRoute(page: BodyInfoPage),
  AutoRoute(page: VirusLocationPage),
  AutoRoute(page: LearnmorePage)
])
class $FlutterRouter {}
