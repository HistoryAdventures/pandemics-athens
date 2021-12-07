// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../features/about_book/presentation/pages/about_book_page.dart' as _i24;
import '../features/about_book/presentation/pages/copyright_page.dart' as _i27;
import '../features/about_book/presentation/pages/credits_page.dart' as _i25;
import '../features/about_book/presentation/pages/further_reading_page.dart'
    as _i26;
import '../features/about_book/presentation/pages/sources_page.dart' as _i28;
import '../features/character/presentation/models/caracter_model.dart' as _i31;
import '../features/character/presentation/pages/character_info_page.dart'
    as _i5;
import '../features/character/presentation/pages/characters_page.dart' as _i4;
import '../features/dead_socrates/presentation/pages/dead_of_socrates.dart'
    as _i20;
import '../features/dead_socrates/presentation/pages/end_of_war_page.dart'
    as _i21;
import '../features/document/presentation/pages/document_page.dart' as _i19;
import '../features/glossary/presentation/pages/glossary_page.dart' as _i10;
import '../features/irl_nikos/presentation/pages/giana_page.dart' as _i23;
import '../features/irl_nikos/presentation/pages/irl_nikos_page.dart' as _i22;
import '../features/leanding/presentation/pages/leanding_page.dart' as _i3;
import '../features/map/presentation/pages/map_page.dart' as _i7;
import '../features/navigation/presentation/pages/navigation_page.dart' as _i29;
import '../features/panaramas/presentation/pages/panaroma_left_page.dart'
    as _i11;
import '../features/panaramas/presentation/pages/panaroma_right_page.dart'
    as _i12;
import '../features/pandemic_info/presentation/pages/body_info_page.dart'
    as _i17;
import '../features/pandemic_info/presentation/pages/pathogen_profile_page.dart'
    as _i13;
import '../features/pandemic_info/presentation/pages/virus_loc_page.dart'
    as _i18;
import '../features/pandemic_info/presentation/pages/virus_loc_second_page.dart'
    as _i30;
import '../features/pandemic_info/presentation/pages/viruses_info_page.dart'
    as _i6;
import '../features/paralax_history/presentation/pages/paralax_history.dart'
    as _i9;
import '../features/practice_medicine/presentation/pages/keep_going_page.dart'
    as _i14;
import '../features/practice_medicine/presentation/pages/practice_medicine_page.dart'
    as _i16;
import '../features/practice_medicine/presentation/pages/quit_medicine_page.dart'
    as _i15;
import '../features/quiz/presentation/pages/quiz_page.dart' as _i8;

class FlutterRouter extends _i1.RootStackRouter {
  FlutterRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LeandingPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LeandingPageRouteArgs>(
              orElse: () => const LeandingPageRouteArgs());
          return _i3.LeandingPage(
              navigateFromNavigatorPage: args.navigateFromNavigatorPage);
        },
        opaque: true,
        barrierDismissible: false),
    CharacrterPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.CharacrterPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
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
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusesInfoPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.VirusesInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    MapPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.MapPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    QuizPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.QuizPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    ParalaxHistoryPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.ParalaxHistoryPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    GlossaryPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.GlossaryPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PanaromaLeftPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.PanaromaLeftPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PanaromaRightPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.PanaromaRightPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PathogenProfilePageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i13.PathogenProfilePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    KeepGoingPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i14.KeepGoingPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    QuitMedicinePageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i15.QuitMedicinePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PracticeMedicineRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i16.PracticeMedicine();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    BodyInfoPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i17.BodyInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusLocationPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i18.VirusLocationPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    DocumentPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i19.DocumentPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    DeadOfSocratesPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i20.DeadOfSocratesPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    EndOfWarPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i21.EndOfWarPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    IrlNikosPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i22.IrlNikosPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    GianaPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i23.GianaPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    AboutBookPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i24.AboutBookPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CreditsPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i25.CreditsPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    FurtherReadingPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i26.FurtherReadingPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CopyrightPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i27.CopyrightPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    SourcePageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i28.SourcePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    NavigationPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i29.NavigationPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusLocationSecondPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i30.VirusLocationSecondPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 500,
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
        _i1.RouteConfig(PanaromaLeftPageRoute.name,
            path: '/panaroma-left-page'),
        _i1.RouteConfig(PanaromaRightPageRoute.name,
            path: '/panaroma-right-page'),
        _i1.RouteConfig(PathogenProfilePageRoute.name,
            path: '/pathogen-profile-page'),
        _i1.RouteConfig(KeepGoingPageRoute.name, path: '/keep-going-page'),
        _i1.RouteConfig(QuitMedicinePageRoute.name,
            path: '/quit-medicine-page'),
        _i1.RouteConfig(PracticeMedicineRoute.name, path: '/practice-medicine'),
        _i1.RouteConfig(BodyInfoPageRoute.name, path: '/body-info-page'),
        _i1.RouteConfig(VirusLocationPageRoute.name,
            path: '/virus-location-page'),
        _i1.RouteConfig(DocumentPageRoute.name, path: '/document-page'),
        _i1.RouteConfig(DeadOfSocratesPageRoute.name,
            path: '/dead-of-socrates-page'),
        _i1.RouteConfig(EndOfWarPageRoute.name, path: '/end-of-war-page'),
        _i1.RouteConfig(IrlNikosPageRoute.name, path: '/irl-nikos-page'),
        _i1.RouteConfig(GianaPageRoute.name, path: '/giana-page'),
        _i1.RouteConfig(AboutBookPageRoute.name, path: '/about-book-page'),
        _i1.RouteConfig(CreditsPageRoute.name, path: '/credits-page'),
        _i1.RouteConfig(FurtherReadingPageRoute.name,
            path: '/further-reading-page'),
        _i1.RouteConfig(CopyrightPageRoute.name, path: '/copyright-page'),
        _i1.RouteConfig(SourcePageRoute.name, path: '/source-page'),
        _i1.RouteConfig(NavigationPageRoute.name, path: '/'),
        _i1.RouteConfig(VirusLocationSecondPageRoute.name,
            path: '/virus-location-second-page')
      ];
}

class LeandingPageRoute extends _i1.PageRouteInfo<LeandingPageRouteArgs> {
  LeandingPageRoute({bool? navigateFromNavigatorPage})
      : super(name,
            path: '/leanding-page',
            args: LeandingPageRouteArgs(
                navigateFromNavigatorPage: navigateFromNavigatorPage));

  static const String name = 'LeandingPageRoute';
}

class LeandingPageRouteArgs {
  const LeandingPageRouteArgs({this.navigateFromNavigatorPage});

  final bool? navigateFromNavigatorPage;
}

class CharacrterPageRoute extends _i1.PageRouteInfo {
  const CharacrterPageRoute() : super(name, path: '/characrter-page');

  static const String name = 'CharacrterPageRoute';
}

class CharacterInfoPageRoute
    extends _i1.PageRouteInfo<CharacterInfoPageRouteArgs> {
  CharacterInfoPageRoute(
      {required _i31.CharacterModelNotifier photoHero,
      required List<_i31.CharacterModelNotifier> listCharacters})
      : super(name,
            path: '/character-info-page',
            args: CharacterInfoPageRouteArgs(
                photoHero: photoHero, listCharacters: listCharacters));

  static const String name = 'CharacterInfoPageRoute';
}

class CharacterInfoPageRouteArgs {
  const CharacterInfoPageRouteArgs(
      {required this.photoHero, required this.listCharacters});

  final _i31.CharacterModelNotifier photoHero;

  final List<_i31.CharacterModelNotifier> listCharacters;
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

class PanaromaLeftPageRoute extends _i1.PageRouteInfo {
  const PanaromaLeftPageRoute() : super(name, path: '/panaroma-left-page');

  static const String name = 'PanaromaLeftPageRoute';
}

class PanaromaRightPageRoute extends _i1.PageRouteInfo {
  const PanaromaRightPageRoute() : super(name, path: '/panaroma-right-page');

  static const String name = 'PanaromaRightPageRoute';
}

class PathogenProfilePageRoute extends _i1.PageRouteInfo {
  const PathogenProfilePageRoute()
      : super(name, path: '/pathogen-profile-page');

  static const String name = 'PathogenProfilePageRoute';
}

class KeepGoingPageRoute extends _i1.PageRouteInfo {
  const KeepGoingPageRoute() : super(name, path: '/keep-going-page');

  static const String name = 'KeepGoingPageRoute';
}

class QuitMedicinePageRoute extends _i1.PageRouteInfo {
  const QuitMedicinePageRoute() : super(name, path: '/quit-medicine-page');

  static const String name = 'QuitMedicinePageRoute';
}

class PracticeMedicineRoute extends _i1.PageRouteInfo {
  const PracticeMedicineRoute() : super(name, path: '/practice-medicine');

  static const String name = 'PracticeMedicineRoute';
}

class BodyInfoPageRoute extends _i1.PageRouteInfo {
  const BodyInfoPageRoute() : super(name, path: '/body-info-page');

  static const String name = 'BodyInfoPageRoute';
}

class VirusLocationPageRoute extends _i1.PageRouteInfo {
  const VirusLocationPageRoute() : super(name, path: '/virus-location-page');

  static const String name = 'VirusLocationPageRoute';
}

class DocumentPageRoute extends _i1.PageRouteInfo {
  const DocumentPageRoute() : super(name, path: '/document-page');

  static const String name = 'DocumentPageRoute';
}

class DeadOfSocratesPageRoute extends _i1.PageRouteInfo {
  const DeadOfSocratesPageRoute() : super(name, path: '/dead-of-socrates-page');

  static const String name = 'DeadOfSocratesPageRoute';
}

class EndOfWarPageRoute extends _i1.PageRouteInfo {
  const EndOfWarPageRoute() : super(name, path: '/end-of-war-page');

  static const String name = 'EndOfWarPageRoute';
}

class IrlNikosPageRoute extends _i1.PageRouteInfo {
  const IrlNikosPageRoute() : super(name, path: '/irl-nikos-page');

  static const String name = 'IrlNikosPageRoute';
}

class GianaPageRoute extends _i1.PageRouteInfo {
  const GianaPageRoute() : super(name, path: '/giana-page');

  static const String name = 'GianaPageRoute';
}

class AboutBookPageRoute extends _i1.PageRouteInfo {
  const AboutBookPageRoute() : super(name, path: '/about-book-page');

  static const String name = 'AboutBookPageRoute';
}

class CreditsPageRoute extends _i1.PageRouteInfo {
  const CreditsPageRoute() : super(name, path: '/credits-page');

  static const String name = 'CreditsPageRoute';
}

class FurtherReadingPageRoute extends _i1.PageRouteInfo {
  const FurtherReadingPageRoute() : super(name, path: '/further-reading-page');

  static const String name = 'FurtherReadingPageRoute';
}

class CopyrightPageRoute extends _i1.PageRouteInfo {
  const CopyrightPageRoute() : super(name, path: '/copyright-page');

  static const String name = 'CopyrightPageRoute';
}

class SourcePageRoute extends _i1.PageRouteInfo {
  const SourcePageRoute() : super(name, path: '/source-page');

  static const String name = 'SourcePageRoute';
}

class NavigationPageRoute extends _i1.PageRouteInfo {
  const NavigationPageRoute() : super(name, path: '/');

  static const String name = 'NavigationPageRoute';
}

class VirusLocationSecondPageRoute extends _i1.PageRouteInfo {
  const VirusLocationSecondPageRoute()
      : super(name, path: '/virus-location-second-page');

  static const String name = 'VirusLocationSecondPageRoute';
}
