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
import '../features/map/presentation/pages/map_page.dart' as _i7;
import '../features/pandemic_info/presentation/pages/pandemic_info.dart' as _i6;
import '../features/paralax_history/presentation/pages/paralax_history.dart'
    as _i9;
import '../features/quiz/presentation/pages/quiz_page.dart' as _i8;
import 'widgets/hero_photo_widget.dart' as _i11;

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
        durationInMilliseconds: 800,
        opaque: true,
        barrierDismissible: false),
    CharacrterPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.CharacrterPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 800,
        opaque: true,
        barrierDismissible: false),
    CharacterInfoPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CharacterInfoPageRouteArgs>();
          return _i5.CharacterInfoPage(
              photoHero: args.photoHero, listCharacters: args.listCharacters);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 800,
        opaque: true,
        barrierDismissible: false),
    PandemicInfoPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.PandemicInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 800,
        opaque: true,
        barrierDismissible: false),
    MapPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.MapPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 800,
        opaque: true,
        barrierDismissible: false),
    QuizPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.QuizPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 800,
        opaque: true,
        barrierDismissible: false),
    ParalaxHistoryPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.ParalaxHistoryPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 800,
        opaque: true,
        barrierDismissible: false),
    GlossaryPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.GlossaryPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 800,
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LeandingPageRoute.name, path: '/'),
        _i1.RouteConfig(CharacrterPageRoute.name, path: '/characrter-page'),
        _i1.RouteConfig(CharacterInfoPageRoute.name,
            path: '/character-info-page'),
        _i1.RouteConfig(PandemicInfoPageRoute.name,
            path: '/pandemic-info-page'),
        _i1.RouteConfig(MapPageRoute.name, path: '/map-page'),
        _i1.RouteConfig(QuizPageRoute.name, path: '/quiz-page'),
        _i1.RouteConfig(ParalaxHistoryPageRoute.name,
            path: '/paralax-history-page'),
        _i1.RouteConfig(GlossaryPageRoute.name, path: '/glossary-page')
      ];
}

class LeandingPageRoute extends _i1.PageRouteInfo {
  const LeandingPageRoute() : super(name, path: '/');

  static const String name = 'LeandingPageRoute';
}

class CharacrterPageRoute extends _i1.PageRouteInfo {
  const CharacrterPageRoute() : super(name, path: '/characrter-page');

  static const String name = 'CharacrterPageRoute';
}

class CharacterInfoPageRoute
    extends _i1.PageRouteInfo<CharacterInfoPageRouteArgs> {
  CharacterInfoPageRoute(
      {required _i11.CharacterModel photoHero,
      required List<_i11.CharacterModel> listCharacters})
      : super(name,
            path: '/character-info-page',
            args: CharacterInfoPageRouteArgs(
                photoHero: photoHero, listCharacters: listCharacters));

  static const String name = 'CharacterInfoPageRoute';
}

class CharacterInfoPageRouteArgs {
  const CharacterInfoPageRouteArgs(
      {required this.photoHero, required this.listCharacters});

  final _i11.CharacterModel photoHero;

  final List<_i11.CharacterModel> listCharacters;
}

class PandemicInfoPageRoute extends _i1.PageRouteInfo {
  const PandemicInfoPageRoute() : super(name, path: '/pandemic-info-page');

  static const String name = 'PandemicInfoPageRoute';
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
