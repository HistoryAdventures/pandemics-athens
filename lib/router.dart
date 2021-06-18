
import 'package:auto_route/auto_route.dart';
import 'src/features/character/presentation/pages/character_info_page.dart';
import 'src/features/character/presentation/pages/characters_page.dart';
import 'src/features/leanding/presentation/pages/leanding_page.dart';
import 'src/features/map/presentation/pages/map_page.dart';
import 'src/features/pandemic_info/presentation/pages/pandemic_info.dart';

@CustomAutoRouter(routes: <AutoRoute>[
  
  AutoRoute(page: LeandingPage, initial: true),
  AutoRoute(page: CharacrterPage),
  AutoRoute(page: CharacterInfoPage),
  AutoRoute(page: PandemicInfoPage),
  AutoRoute(page: MapPage),
])
class $FlutterRouter {}