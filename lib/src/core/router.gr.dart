// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../features/character/presentation/pages/character_info_page.dart'
    as _i5;
import '../features/character/presentation/pages/characters_page.dart' as _i4;
import '../features/glossary/presentation/pages/glossary_page.dart' as _i10;
import '../features/leanding/presentation/pages/leanding_page.dart' as _i3;
import '../features/leanding/presentation/pages/moving_page.dart' as _i13;
import '../features/map/presentation/pages/map_page.dart' as _i7;
import '../features/pandemic_info/presentation/pages/body_info_page.dart'
    as _i14;
import '../features/pandemic_info/presentation/pages/pathogen_profile_page.dart'
    as _i12;
import '../features/pandemic_info/presentation/pages/virus_loc_page.dart'
    as _i15;
import '../features/pandemic_info/presentation/pages/viruses_info_page.dart'
    as _i6;
import '../features/panorama/prezentation/pages/panaroma_page.dart' as _i11;
import '../features/paralax_history/presentation/pages/learn_more_page.dart'
    as _i16;
import '../features/paralax_history/presentation/pages/paralax_history.dart'
    as _i9;
import '../features/quiz/presentation/pages/quiz_page.dart' as _i8;
import 'widgets/widgets.dart' as _i17;

class FlutterRouter extends _i1.RootStackRouter {
  FlutterRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LeandingPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.LeandingPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    CharacrterPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.CharacrterPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    CharacterInfoPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CharacterInfoPageRouteArgs>();
          return _i5.CharacterInfoPage(
              photoHero: args.photoHero, listCharacters: args.listCharacters);
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    VirusesInfoPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.VirusesInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    MapPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.MapPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    QuizPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.QuizPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    ParalaxHistoryPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.ParalaxHistoryPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    GlossaryPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.GlossaryPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    PanaromaPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.PanaromaPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    PathogenProfilePageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i12.PathogenProfilePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    MovingPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MovingPageRouteArgs>(
              orElse: () => const MovingPageRouteArgs());
          return _i13.MovingPage(key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    BodyInfoPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i14.BodyInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    VirusLocationPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i15.VirusLocationPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false),
    LearnmorePageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i16.LearnmorePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LeandingPageRoute.name, path: '/leanding-page'),
        _i1.RouteConfig(CharacrterPageRoute.name, path: '/characrter-page'),
        _i1.RouteConfig(CharacterInfoPageRoute.name,
            path: '/character-info-page'),
        _i1.RouteConfig(VirusesInfoPageRoute.name, path: '/viruses-info-page'),
        _i1.RouteConfig(MapPageRoute.name, path: '/map-page'),
        _i1.RouteConfig(QuizPageRoute.name, path: '/quiz-page'),
        _i1.RouteConfig(ParalaxHistoryPageRoute.name,
            path: '/paralax-history-page'),
        _i1.RouteConfig(GlossaryPageRoute.name, path: '/glossary-page'),
        _i1.RouteConfig(PanaromaPageRoute.name, path: '/panaroma-page'),
        _i1.RouteConfig(PathogenProfilePageRoute.name,
            path: '/pathogen-profile-page'),
        _i1.RouteConfig(MovingPageRoute.name, path: '/'),
        _i1.RouteConfig(BodyInfoPageRoute.name, path: '/body-info-page'),
        _i1.RouteConfig(VirusLocationPageRoute.name,
            path: '/virus-location-page'),
        _i1.RouteConfig(LearnmorePageRoute.name, path: '/learnmore-page')
      ];
}

class LeandingPageRoute extends _i1.PageRouteInfo {
  const LeandingPageRoute() : super(name, path: '/leanding-page');

  static const String name = 'LeandingPageRoute';
}

class CharacrterPageRoute extends _i1.PageRouteInfo {
  const CharacrterPageRoute() : super(name, path: '/characrter-page');

  static const String name = 'CharacrterPageRoute';
}

class CharacterInfoPageRoute
    extends _i1.PageRouteInfo<CharacterInfoPageRouteArgs> {
  CharacterInfoPageRoute(
      {required _i17.CharacterModel photoHero,
      required List<_i17.CharacterModel> listCharacters})
      : super(name,
            path: '/character-info-page',
            args: CharacterInfoPageRouteArgs(
                photoHero: photoHero, listCharacters: listCharacters));

  static const String name = 'CharacterInfoPageRoute';
}

class CharacterInfoPageRouteArgs {
  const CharacterInfoPageRouteArgs(
      {required this.photoHero, required this.listCharacters});

  final _i17.CharacterModel photoHero;

  final List<_i17.CharacterModel> listCharacters;
}

class VirusesInfoPageRoute extends _i1.PageRouteInfo {
  const VirusesInfoPageRoute() : super(name, path: '/viruses-info-page');

  static const String name = 'VirusesInfoPageRoute';
}

class MapPageRoute extends _i1.PageRouteInfo {
  const MapPageRoute() : super(name, path: '/map-page');

  static const String name = 'MapPageRoute';
}

class QuizPageRoute extends _i1.PageRouteInfo {
  const QuizPageRoute() : super(name, path: '/quiz-page');

  static const String name = 'QuizPageRoute';
}

class ParalaxHistoryPageRoute extends _i1.PageRouteInfo {
  const ParalaxHistoryPageRoute() : super(name, path: '/paralax-history-page');

  static const String name = 'ParalaxHistoryPageRoute';
}

class GlossaryPageRoute extends _i1.PageRouteInfo {
  const GlossaryPageRoute() : super(name, path: '/glossary-page');

  static const String name = 'GlossaryPageRoute';
}

class PanaromaPageRoute extends _i1.PageRouteInfo {
  const PanaromaPageRoute() : super(name, path: '/panaroma-page');

  static const String name = 'PanaromaPageRoute';
}

class PathogenProfilePageRoute extends _i1.PageRouteInfo {
  const PathogenProfilePageRoute()
      : super(name, path: '/pathogen-profile-page');

  static const String name = 'PathogenProfilePageRoute';
}

class MovingPageRoute extends _i1.PageRouteInfo<MovingPageRouteArgs> {
  MovingPageRoute({_i2.Key? key})
      : super(name, path: '/', args: MovingPageRouteArgs(key: key));

  static const String name = 'MovingPageRoute';
}

class MovingPageRouteArgs {
  const MovingPageRouteArgs({this.key});

  final _i2.Key? key;
}

class BodyInfoPageRoute extends _i1.PageRouteInfo {
  const BodyInfoPageRoute() : super(name, path: '/body-info-page');

  static const String name = 'BodyInfoPageRoute';
}

class VirusLocationPageRoute extends _i1.PageRouteInfo {
  const VirusLocationPageRoute() : super(name, path: '/virus-location-page');

  static const String name = 'VirusLocationPageRoute';
}

class LearnmorePageRoute extends _i1.PageRouteInfo {
  const LearnmorePageRoute() : super(name, path: '/learnmore-page');

  static const String name = 'LearnmorePageRoute';
}
