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
    LeandingPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LeandingPageToLeftArgs>(
              orElse: () => const LeandingPageToLeftArgs());
          return _i3.LeandingPage(
              navigateFromNavigatorPage: args.navigateFromNavigatorPage);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    LeandingPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LeandingPageToRightArgs>(
              orElse: () => const LeandingPageToRightArgs());
          return _i3.LeandingPage(
              navigateFromNavigatorPage: args.navigateFromNavigatorPage);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    LeandingPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LeandingPageToTopArgs>(
              orElse: () => const LeandingPageToTopArgs());
          return _i3.LeandingPage(
              navigateFromNavigatorPage: args.navigateFromNavigatorPage);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    LeandingPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LeandingPageToBottomArgs>(
              orElse: () => const LeandingPageToBottomArgs());
          return _i3.LeandingPage(
              navigateFromNavigatorPage: args.navigateFromNavigatorPage);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
        durationInMilliseconds: 500,
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
    CharacterPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.CharacrterPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CharacterPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.CharacrterPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CharacterPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.CharacrterPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CharacterPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.CharacrterPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    CharacterInfoPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CharacterInfoPageToLeftArgs>();
          return _i5.CharacterInfoPage(
              photoHero: args.photoHero, listCharacters: args.listCharacters);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CharacterInfoPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CharacterInfoPageToRightArgs>();
          return _i5.CharacterInfoPage(
              photoHero: args.photoHero, listCharacters: args.listCharacters);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CharacterInfoPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CharacterInfoPageToTopArgs>();
          return _i5.CharacterInfoPage(
              photoHero: args.photoHero, listCharacters: args.listCharacters);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CharacterInfoPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CharacterInfoPageToBottomArgs>();
          return _i5.CharacterInfoPage(
              photoHero: args.photoHero, listCharacters: args.listCharacters);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    VirusesInfoPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.VirusesInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusesInfoPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.VirusesInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusesInfoPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.VirusesInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusesInfoPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.VirusesInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    MapPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.MapPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    MapPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.MapPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    MapPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.MapPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    MapPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.MapPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    QuizPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.QuizPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    QuizPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.QuizPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    QuizPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.QuizPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    QuizPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.QuizPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    ParalaxHistoryPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ParalaxHistoryPageRouteArgs>(
              orElse: () => const ParalaxHistoryPageRouteArgs());
          return _i9.ParalaxHistoryPage(
              mustScrollToEnd: args.mustScrollToEnd,
              mustScrollToMiddle: args.mustScrollToMiddle);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    ParalaxHistoryPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ParalaxHistoryPageToLeftArgs>(
              orElse: () => const ParalaxHistoryPageToLeftArgs());
          return _i9.ParalaxHistoryPage(
              mustScrollToEnd: args.mustScrollToEnd,
              mustScrollToMiddle: args.mustScrollToMiddle);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    ParalaxHistoryPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ParalaxHistoryPageToRightArgs>(
              orElse: () => const ParalaxHistoryPageToRightArgs());
          return _i9.ParalaxHistoryPage(
              mustScrollToEnd: args.mustScrollToEnd,
              mustScrollToMiddle: args.mustScrollToMiddle);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    ParalaxHistoryPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ParalaxHistoryPageToTopArgs>(
              orElse: () => const ParalaxHistoryPageToTopArgs());
          return _i9.ParalaxHistoryPage(
              mustScrollToEnd: args.mustScrollToEnd,
              mustScrollToMiddle: args.mustScrollToMiddle);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    ParalaxHistoryPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ParalaxHistoryPageToBottomArgs>(
              orElse: () => const ParalaxHistoryPageToBottomArgs());
          return _i9.ParalaxHistoryPage(
              mustScrollToEnd: args.mustScrollToEnd,
              mustScrollToMiddle: args.mustScrollToMiddle);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    GlossaryPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.GlossaryPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    GlossaryPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.GlossaryPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    GlossaryPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.GlossaryPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    GlossaryPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.GlossaryPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    PanaromaLeftPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.PanaromaLeftPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PanaromaLeftPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.PanaromaLeftPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PanaromaLeftPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.PanaromaLeftPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PanaromaLeftPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.PanaromaLeftPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    PanaromaRightPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.PanaromaRightPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PanaromaRightPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.PanaromaRightPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PanaromaRightPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.PanaromaRightPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PanaromaRightPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.PanaromaRightPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PathogenProfilePageBottomRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PathogenProfilePageBottomRouteArgs>(
              orElse: () => const PathogenProfilePageBottomRouteArgs());
          return _i13.PathogenProfilePage(
              key: args.key,
              needJumpToPracticeMedicinePart:
                  args.needJumpToPracticeMedicinePart);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PathogenProfilePageRightRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PathogenProfilePageRightRouteArgs>(
              orElse: () => const PathogenProfilePageRightRouteArgs());
          return _i13.PathogenProfilePage(
              key: args.key,
              needJumpToPracticeMedicinePart:
                  args.needJumpToPracticeMedicinePart);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PathogenProfilePageLeftRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PathogenProfilePageLeftRouteArgs>(
              orElse: () => const PathogenProfilePageLeftRouteArgs());
          return _i13.PathogenProfilePage(
              key: args.key,
              needJumpToPracticeMedicinePart:
                  args.needJumpToPracticeMedicinePart);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    KeepGoingPageLeftRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i14.KeepGoingPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    KeepGoingPageBottomRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i14.KeepGoingPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    QuitMedicinePageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i15.QuitMedicinePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    QuitMedicinePageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i15.QuitMedicinePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    QuitMedicinePageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i15.QuitMedicinePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    QuitMedicinePageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i15.QuitMedicinePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    PracticeMedicineToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i16.PracticeMedicine();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PracticeMedicineToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i16.PracticeMedicine();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PracticeMedicineToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i16.PracticeMedicine();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    PracticeMedicineToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i16.PracticeMedicine();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    BodyInfoPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i17.BodyInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    BodyInfoPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i17.BodyInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    BodyInfoPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i17.BodyInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    BodyInfoPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i17.BodyInfoPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusLocationPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i18.VirusLocationPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusLocationPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i18.VirusLocationPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusLocationPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i18.VirusLocationPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusLocationPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i18.VirusLocationPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusLocationPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i18.VirusLocationPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    DocumentPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i19.DocumentPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    DocumentPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i19.DocumentPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    DocumentPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i19.DocumentPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    DocumentPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i19.DocumentPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    DeadOfSocratesPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<DeadOfSocratesPageRouteArgs>();
          return _i20.DeadOfSocratesPage(
              key: args.key, fromKeepGoing: args.fromKeepGoing);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    DeadOfSocratesPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<DeadOfSocratesPageToLeftArgs>();
          return _i20.DeadOfSocratesPage(
              key: args.key, fromKeepGoing: args.fromKeepGoing);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    DeadOfSocratesPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<DeadOfSocratesPageToRightArgs>();
          return _i20.DeadOfSocratesPage(
              key: args.key, fromKeepGoing: args.fromKeepGoing);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    DeadOfSocratesPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<DeadOfSocratesPageToTopArgs>();
          return _i20.DeadOfSocratesPage(
              key: args.key, fromKeepGoing: args.fromKeepGoing);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    DeadOfSocratesPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<DeadOfSocratesPageToBottomArgs>();
          return _i20.DeadOfSocratesPage(
              key: args.key, fromKeepGoing: args.fromKeepGoing);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    EndOfWarPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i21.EndOfWarPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    EndOfWarPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i21.EndOfWarPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    EndOfWarPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i21.EndOfWarPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    EndOfWarPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i21.EndOfWarPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    IrlNikosPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i22.IrlNikosPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    IrlNikosPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i22.IrlNikosPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    IrlNikosPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i22.IrlNikosPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    IrlNikosPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i22.IrlNikosPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    GianaPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i23.GianaPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    GianaPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i23.GianaPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    GianaPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i23.GianaPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    GianaPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i23.GianaPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    AboutBookPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i24.AboutBookPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    AboutBookPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i24.AboutBookPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    AboutBookPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i24.AboutBookPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    AboutBookPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i24.AboutBookPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    CreditsPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i25.CreditsPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CreditsPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i25.CreditsPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CreditsPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i25.CreditsPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CreditsPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i25.CreditsPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    FurtherReadingPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i26.FurtherReadingPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    FurtherReadingPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i26.FurtherReadingPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    FurtherReadingPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i26.FurtherReadingPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    FurtherReadingPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i26.FurtherReadingPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    CopyrightPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i27.CopyrightPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CopyrightPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i27.CopyrightPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CopyrightPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i27.CopyrightPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    CopyrightPageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i27.CopyrightPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
    SourcePageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i28.SourcePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    SourcePageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i28.SourcePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    SourcePageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i28.SourcePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    SourcePageToBottom.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i28.SourcePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
        barrierDismissible: false),
    VirusLocationSecondPageToLeft.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i30.VirusLocationSecondPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusLocationSecondPageToRight.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i30.VirusLocationSecondPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideRight,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusLocationSecondPageToTop.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i30.VirusLocationSecondPage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    VirusLocationSecondPageToBottom.name: (routeData) =>
        _i1.CustomPage<dynamic>(
            routeData: routeData,
            builder: (_) {
              return const _i30.VirusLocationSecondPage();
            },
            transitionsBuilder: _i1.TransitionsBuilders.slideTop,
            durationInMilliseconds: 500,
            opaque: true,
            barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LeandingPageRoute.name, path: '/leanding-page'),
        _i1.RouteConfig(LeandingPageToLeft.name, path: '/leanding-page'),
        _i1.RouteConfig(LeandingPageToRight.name, path: '/leanding-page'),
        _i1.RouteConfig(LeandingPageToTop.name, path: '/leanding-page'),
        _i1.RouteConfig(LeandingPageToBottom.name, path: '/leanding-page'),
        _i1.RouteConfig(CharacrterPageRoute.name, path: '/characrter-page'),
        _i1.RouteConfig(CharacterPageToLeft.name, path: '/characrter-page'),
        _i1.RouteConfig(CharacterPageToRight.name, path: '/characrter-page'),
        _i1.RouteConfig(CharacterPageToTop.name, path: '/characrter-page'),
        _i1.RouteConfig(CharacterPageToBottom.name, path: '/characrter-page'),
        _i1.RouteConfig(CharacterInfoPageRoute.name,
            path: '/character-info-page'),
        _i1.RouteConfig(CharacterInfoPageToLeft.name,
            path: '/character-info-page'),
        _i1.RouteConfig(CharacterInfoPageToRight.name,
            path: '/character-info-page'),
        _i1.RouteConfig(CharacterInfoPageToTop.name,
            path: '/character-info-page'),
        _i1.RouteConfig(CharacterInfoPageToBottom.name,
            path: '/character-info-page'),
        _i1.RouteConfig(VirusesInfoPageRoute.name, path: '/viruses-info-page'),
        _i1.RouteConfig(VirusesInfoPageToLeft.name, path: '/viruses-info-page'),
        _i1.RouteConfig(VirusesInfoPageToRight.name,
            path: '/viruses-info-page'),
        _i1.RouteConfig(VirusesInfoPageToTop.name, path: '/viruses-info-page'),
        _i1.RouteConfig(VirusesInfoPageToBottom.name,
            path: '/viruses-info-page'),
        _i1.RouteConfig(MapPageRoute.name, path: '/map-page'),
        _i1.RouteConfig(MapPageToLeft.name, path: '/map-page'),
        _i1.RouteConfig(MapPageToRight.name, path: '/map-page'),
        _i1.RouteConfig(MapPageToTop.name, path: '/map-page'),
        _i1.RouteConfig(MapPageToBottom.name, path: '/map-page'),
        _i1.RouteConfig(QuizPageRoute.name, path: '/quiz-page'),
        _i1.RouteConfig(QuizPageToLeft.name, path: '/quiz-page'),
        _i1.RouteConfig(QuizPageToRight.name, path: '/quiz-page'),
        _i1.RouteConfig(QuizPageToTop.name, path: '/quiz-page'),
        _i1.RouteConfig(QuizPageToBottom.name, path: '/quiz-page'),
        _i1.RouteConfig(ParalaxHistoryPageRoute.name,
            path: '/paralax-history-page'),
        _i1.RouteConfig(ParalaxHistoryPageToLeft.name,
            path: '/paralax-history-page'),
        _i1.RouteConfig(ParalaxHistoryPageToRight.name,
            path: '/paralax-history-page'),
        _i1.RouteConfig(ParalaxHistoryPageToTop.name,
            path: '/paralax-history-page'),
        _i1.RouteConfig(ParalaxHistoryPageToBottom.name,
            path: '/paralax-history-page'),
        _i1.RouteConfig(GlossaryPageRoute.name, path: '/glossary-page'),
        _i1.RouteConfig(GlossaryPageToLeft.name, path: '/glossary-page'),
        _i1.RouteConfig(GlossaryPageToRight.name, path: '/glossary-page'),
        _i1.RouteConfig(GlossaryPageToTop.name, path: '/glossary-page'),
        _i1.RouteConfig(GlossaryPageToBottom.name, path: '/glossary-page'),
        _i1.RouteConfig(PanaromaLeftPageRoute.name,
            path: '/panaroma-left-page'),
        _i1.RouteConfig(PanaromaLeftPageToLeft.name,
            path: '/panaroma-left-page'),
        _i1.RouteConfig(PanaromaLeftPageToRight.name,
            path: '/panaroma-left-page'),
        _i1.RouteConfig(PanaromaLeftPageToTop.name,
            path: '/panaroma-left-page'),
        _i1.RouteConfig(PanaromaLeftPageToBottom.name,
            path: '/panaroma-left-page'),
        _i1.RouteConfig(PanaromaRightPageRoute.name,
            path: '/panaroma-right-page'),
        _i1.RouteConfig(PanaromaRightPageToLeft.name,
            path: '/panaroma-right-page'),
        _i1.RouteConfig(PanaromaRightPageToRight.name,
            path: '/panaroma-right-page'),
        _i1.RouteConfig(PanaromaRightPageToTop.name,
            path: '/panaroma-right-page'),
        _i1.RouteConfig(PanaromaRightPageToBottom.name,
            path: '/panaroma-right-page'),
        _i1.RouteConfig(PathogenProfilePageBottomRoute.name,
            path: '/pathogen-profile-page'),
        _i1.RouteConfig(PathogenProfilePageRightRoute.name,
            path: '/pathogen-profile-page'),
        _i1.RouteConfig(PathogenProfilePageLeftRoute.name,
            path: '/pathogen-profile-page'),
        _i1.RouteConfig(KeepGoingPageLeftRoute.name, path: '/keep-going-page'),
        _i1.RouteConfig(KeepGoingPageBottomRoute.name,
            path: '/keep-going-page'),
        _i1.RouteConfig(QuitMedicinePageRoute.name,
            path: '/quit-medicine-page'),
        _i1.RouteConfig(QuitMedicinePageToLeft.name,
            path: '/quit-medicine-page'),
        _i1.RouteConfig(QuitMedicinePageToRight.name,
            path: '/quit-medicine-page'),
        _i1.RouteConfig(QuitMedicinePageToTop.name,
            path: '/quit-medicine-page'),
        _i1.RouteConfig(QuitMedicinePageToBottom.name,
            path: '/quit-medicine-page'),
        _i1.RouteConfig(PracticeMedicineRoute.name, path: '/practice-medicine'),
        _i1.RouteConfig(PracticeMedicineToLeft.name,
            path: '/practice-medicine'),
        _i1.RouteConfig(PracticeMedicineToRight.name,
            path: '/practice-medicine'),
        _i1.RouteConfig(PracticeMedicineToTop.name, path: '/practice-medicine'),
        _i1.RouteConfig(PracticeMedicineToBottom.name,
            path: '/practice-medicine'),
        _i1.RouteConfig(BodyInfoPageRoute.name, path: '/'),
        _i1.RouteConfig(BodyInfoPageToLeft.name, path: '/body-info-page'),
        _i1.RouteConfig(BodyInfoPageToRight.name, path: '/body-info-page'),
        _i1.RouteConfig(BodyInfoPageToTop.name, path: '/body-info-page'),
        _i1.RouteConfig(BodyInfoPageToBottom.name, path: '/body-info-page'),
        _i1.RouteConfig(VirusLocationPageRoute.name,
            path: '/virus-location-page'),
        _i1.RouteConfig(VirusLocationPageToLeft.name,
            path: '/virus-location-page'),
        _i1.RouteConfig(VirusLocationPageToRight.name,
            path: '/virus-location-page'),
        _i1.RouteConfig(VirusLocationPageToTop.name,
            path: '/virus-location-page'),
        _i1.RouteConfig(VirusLocationPageToBottom.name,
            path: '/virus-location-page'),
        _i1.RouteConfig(DocumentPageRoute.name, path: '/document-page'),
        _i1.RouteConfig(DocumentPageToLeft.name, path: '/document-page'),
        _i1.RouteConfig(DocumentPageToRight.name, path: '/document-page'),
        _i1.RouteConfig(DocumentPageToTop.name, path: '/document-page'),
        _i1.RouteConfig(DocumentPageToBottom.name, path: '/document-page'),
        _i1.RouteConfig(DeadOfSocratesPageRoute.name,
            path: '/dead-of-socrates-page'),
        _i1.RouteConfig(DeadOfSocratesPageToLeft.name,
            path: '/dead-of-socrates-page'),
        _i1.RouteConfig(DeadOfSocratesPageToRight.name,
            path: '/dead-of-socrates-page'),
        _i1.RouteConfig(DeadOfSocratesPageToTop.name,
            path: '/dead-of-socrates-page'),
        _i1.RouteConfig(DeadOfSocratesPageToBottom.name,
            path: '/dead-of-socrates-page'),
        _i1.RouteConfig(EndOfWarPageRoute.name, path: '/end-of-war-page'),
        _i1.RouteConfig(EndOfWarPageToLeft.name, path: '/end-of-war-page'),
        _i1.RouteConfig(EndOfWarPageToRight.name, path: '/end-of-war-page'),
        _i1.RouteConfig(EndOfWarPageToTop.name, path: '/end-of-war-page'),
        _i1.RouteConfig(EndOfWarPageToBottom.name, path: '/end-of-war-page'),
        _i1.RouteConfig(IrlNikosPageRoute.name, path: '/irl-nikos-page'),
        _i1.RouteConfig(IrlNikosPageToLeft.name, path: '/irl-nikos-page'),
        _i1.RouteConfig(IrlNikosPageToRight.name, path: '/irl-nikos-page'),
        _i1.RouteConfig(IrlNikosPageToTop.name, path: '/irl-nikos-page'),
        _i1.RouteConfig(IrlNikosPageToBottom.name, path: '/irl-nikos-page'),
        _i1.RouteConfig(GianaPageRoute.name, path: '/giana-page'),
        _i1.RouteConfig(GianaPageToLeft.name, path: '/giana-page'),
        _i1.RouteConfig(GianaPageToRight.name, path: '/giana-page'),
        _i1.RouteConfig(GianaPageToTop.name, path: '/giana-page'),
        _i1.RouteConfig(GianaPageToBottom.name, path: '/giana-page'),
        _i1.RouteConfig(AboutBookPageRoute.name, path: '/about-book-page'),
        _i1.RouteConfig(AboutBookPageToLeft.name, path: '/about-book-page'),
        _i1.RouteConfig(AboutBookPageToRight.name, path: '/about-book-page'),
        _i1.RouteConfig(AboutBookPageToTop.name, path: '/about-book-page'),
        _i1.RouteConfig(AboutBookPageToBottom.name, path: '/about-book-page'),
        _i1.RouteConfig(CreditsPageRoute.name, path: '/credits-page'),
        _i1.RouteConfig(CreditsPageToLeft.name, path: '/credits-page'),
        _i1.RouteConfig(CreditsPageToRight.name, path: '/credits-page'),
        _i1.RouteConfig(CreditsPageToTop.name, path: '/credits-page'),
        _i1.RouteConfig(CreditsPageToBottom.name, path: '/credits-page'),
        _i1.RouteConfig(FurtherReadingPageRoute.name,
            path: '/further-reading-page'),
        _i1.RouteConfig(FurtherReadingPageToLeft.name,
            path: '/further-reading-page'),
        _i1.RouteConfig(FurtherReadingPageToRight.name,
            path: '/further-reading-page'),
        _i1.RouteConfig(FurtherReadingPageToTop.name,
            path: '/further-reading-page'),
        _i1.RouteConfig(FurtherReadingPageToBottom.name,
            path: '/further-reading-page'),
        _i1.RouteConfig(CopyrightPageRoute.name, path: '/copyright-page'),
        _i1.RouteConfig(CopyrightPageToLeft.name, path: '/copyright-page'),
        _i1.RouteConfig(CopyrightPageToRight.name, path: '/copyright-page'),
        _i1.RouteConfig(CopyrightPageToTop.name, path: '/copyright-page'),
        _i1.RouteConfig(CopyrightPageToBottom.name, path: '/copyright-page'),
        _i1.RouteConfig(SourcePageRoute.name, path: '/source-page'),
        _i1.RouteConfig(SourcePageToLeft.name, path: '/source-page'),
        _i1.RouteConfig(SourcePageToRight.name, path: '/source-page'),
        _i1.RouteConfig(SourcePageToTop.name, path: '/source-page'),
        _i1.RouteConfig(SourcePageToBottom.name, path: '/source-page'),
        _i1.RouteConfig(NavigationPageRoute.name, path: '/navigation-page'),
        _i1.RouteConfig(VirusLocationSecondPageRoute.name,
            path: '/virus-location-second-page'),
        _i1.RouteConfig(VirusLocationSecondPageToLeft.name,
            path: '/virus-location-second-page'),
        _i1.RouteConfig(VirusLocationSecondPageToRight.name,
            path: '/virus-location-second-page'),
        _i1.RouteConfig(VirusLocationSecondPageToTop.name,
            path: '/virus-location-second-page'),
        _i1.RouteConfig(VirusLocationSecondPageToBottom.name,
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

class LeandingPageToLeft extends _i1.PageRouteInfo<LeandingPageToLeftArgs> {
  LeandingPageToLeft({bool? navigateFromNavigatorPage})
      : super(name,
            path: '/leanding-page',
            args: LeandingPageToLeftArgs(
                navigateFromNavigatorPage: navigateFromNavigatorPage));

  static const String name = 'LeandingPageToLeft';
}

class LeandingPageToLeftArgs {
  const LeandingPageToLeftArgs({this.navigateFromNavigatorPage});

  final bool? navigateFromNavigatorPage;
}

class LeandingPageToRight extends _i1.PageRouteInfo<LeandingPageToRightArgs> {
  LeandingPageToRight({bool? navigateFromNavigatorPage})
      : super(name,
            path: '/leanding-page',
            args: LeandingPageToRightArgs(
                navigateFromNavigatorPage: navigateFromNavigatorPage));

  static const String name = 'LeandingPageToRight';
}

class LeandingPageToRightArgs {
  const LeandingPageToRightArgs({this.navigateFromNavigatorPage});

  final bool? navigateFromNavigatorPage;
}

class LeandingPageToTop extends _i1.PageRouteInfo<LeandingPageToTopArgs> {
  LeandingPageToTop({bool? navigateFromNavigatorPage})
      : super(name,
            path: '/leanding-page',
            args: LeandingPageToTopArgs(
                navigateFromNavigatorPage: navigateFromNavigatorPage));

  static const String name = 'LeandingPageToTop';
}

class LeandingPageToTopArgs {
  const LeandingPageToTopArgs({this.navigateFromNavigatorPage});

  final bool? navigateFromNavigatorPage;
}

class LeandingPageToBottom extends _i1.PageRouteInfo<LeandingPageToBottomArgs> {
  LeandingPageToBottom({bool? navigateFromNavigatorPage})
      : super(name,
            path: '/leanding-page',
            args: LeandingPageToBottomArgs(
                navigateFromNavigatorPage: navigateFromNavigatorPage));

  static const String name = 'LeandingPageToBottom';
}

class LeandingPageToBottomArgs {
  const LeandingPageToBottomArgs({this.navigateFromNavigatorPage});

  final bool? navigateFromNavigatorPage;
}

class CharacrterPageRoute extends _i1.PageRouteInfo {
  const CharacrterPageRoute() : super(name, path: '/characrter-page');

  static const String name = 'CharacrterPageRoute';
}

class CharacterPageToLeft extends _i1.PageRouteInfo {
  const CharacterPageToLeft() : super(name, path: '/characrter-page');

  static const String name = 'CharacterPageToLeft';
}

class CharacterPageToRight extends _i1.PageRouteInfo {
  const CharacterPageToRight() : super(name, path: '/characrter-page');

  static const String name = 'CharacterPageToRight';
}

class CharacterPageToTop extends _i1.PageRouteInfo {
  const CharacterPageToTop() : super(name, path: '/characrter-page');

  static const String name = 'CharacterPageToTop';
}

class CharacterPageToBottom extends _i1.PageRouteInfo {
  const CharacterPageToBottom() : super(name, path: '/characrter-page');

  static const String name = 'CharacterPageToBottom';
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

class CharacterInfoPageToLeft
    extends _i1.PageRouteInfo<CharacterInfoPageToLeftArgs> {
  CharacterInfoPageToLeft(
      {required _i31.CharacterModelNotifier photoHero,
      required List<_i31.CharacterModelNotifier> listCharacters})
      : super(name,
            path: '/character-info-page',
            args: CharacterInfoPageToLeftArgs(
                photoHero: photoHero, listCharacters: listCharacters));

  static const String name = 'CharacterInfoPageToLeft';
}

class CharacterInfoPageToLeftArgs {
  const CharacterInfoPageToLeftArgs(
      {required this.photoHero, required this.listCharacters});

  final _i31.CharacterModelNotifier photoHero;

  final List<_i31.CharacterModelNotifier> listCharacters;
}

class CharacterInfoPageToRight
    extends _i1.PageRouteInfo<CharacterInfoPageToRightArgs> {
  CharacterInfoPageToRight(
      {required _i31.CharacterModelNotifier photoHero,
      required List<_i31.CharacterModelNotifier> listCharacters})
      : super(name,
            path: '/character-info-page',
            args: CharacterInfoPageToRightArgs(
                photoHero: photoHero, listCharacters: listCharacters));

  static const String name = 'CharacterInfoPageToRight';
}

class CharacterInfoPageToRightArgs {
  const CharacterInfoPageToRightArgs(
      {required this.photoHero, required this.listCharacters});

  final _i31.CharacterModelNotifier photoHero;

  final List<_i31.CharacterModelNotifier> listCharacters;
}

class CharacterInfoPageToTop
    extends _i1.PageRouteInfo<CharacterInfoPageToTopArgs> {
  CharacterInfoPageToTop(
      {required _i31.CharacterModelNotifier photoHero,
      required List<_i31.CharacterModelNotifier> listCharacters})
      : super(name,
            path: '/character-info-page',
            args: CharacterInfoPageToTopArgs(
                photoHero: photoHero, listCharacters: listCharacters));

  static const String name = 'CharacterInfoPageToTop';
}

class CharacterInfoPageToTopArgs {
  const CharacterInfoPageToTopArgs(
      {required this.photoHero, required this.listCharacters});

  final _i31.CharacterModelNotifier photoHero;

  final List<_i31.CharacterModelNotifier> listCharacters;
}

class CharacterInfoPageToBottom
    extends _i1.PageRouteInfo<CharacterInfoPageToBottomArgs> {
  CharacterInfoPageToBottom(
      {required _i31.CharacterModelNotifier photoHero,
      required List<_i31.CharacterModelNotifier> listCharacters})
      : super(name,
            path: '/character-info-page',
            args: CharacterInfoPageToBottomArgs(
                photoHero: photoHero, listCharacters: listCharacters));

  static const String name = 'CharacterInfoPageToBottom';
}

class CharacterInfoPageToBottomArgs {
  const CharacterInfoPageToBottomArgs(
      {required this.photoHero, required this.listCharacters});

  final _i31.CharacterModelNotifier photoHero;

  final List<_i31.CharacterModelNotifier> listCharacters;
}

class VirusesInfoPageRoute extends _i1.PageRouteInfo {
  const VirusesInfoPageRoute() : super(name, path: '/viruses-info-page');

  static const String name = 'VirusesInfoPageRoute';
}

class VirusesInfoPageToLeft extends _i1.PageRouteInfo {
  const VirusesInfoPageToLeft() : super(name, path: '/viruses-info-page');

  static const String name = 'VirusesInfoPageToLeft';
}

class VirusesInfoPageToRight extends _i1.PageRouteInfo {
  const VirusesInfoPageToRight() : super(name, path: '/viruses-info-page');

  static const String name = 'VirusesInfoPageToRight';
}

class VirusesInfoPageToTop extends _i1.PageRouteInfo {
  const VirusesInfoPageToTop() : super(name, path: '/viruses-info-page');

  static const String name = 'VirusesInfoPageToTop';
}

class VirusesInfoPageToBottom extends _i1.PageRouteInfo {
  const VirusesInfoPageToBottom() : super(name, path: '/viruses-info-page');

  static const String name = 'VirusesInfoPageToBottom';
}

class MapPageRoute extends _i1.PageRouteInfo {
  const MapPageRoute() : super(name, path: '/map-page');

  static const String name = 'MapPageRoute';
}

class MapPageToLeft extends _i1.PageRouteInfo {
  const MapPageToLeft() : super(name, path: '/map-page');

  static const String name = 'MapPageToLeft';
}

class MapPageToRight extends _i1.PageRouteInfo {
  const MapPageToRight() : super(name, path: '/map-page');

  static const String name = 'MapPageToRight';
}

class MapPageToTop extends _i1.PageRouteInfo {
  const MapPageToTop() : super(name, path: '/map-page');

  static const String name = 'MapPageToTop';
}

class MapPageToBottom extends _i1.PageRouteInfo {
  const MapPageToBottom() : super(name, path: '/map-page');

  static const String name = 'MapPageToBottom';
}

class QuizPageRoute extends _i1.PageRouteInfo {
  const QuizPageRoute() : super(name, path: '/quiz-page');

  static const String name = 'QuizPageRoute';
}

class QuizPageToLeft extends _i1.PageRouteInfo {
  const QuizPageToLeft() : super(name, path: '/quiz-page');

  static const String name = 'QuizPageToLeft';
}

class QuizPageToRight extends _i1.PageRouteInfo {
  const QuizPageToRight() : super(name, path: '/quiz-page');

  static const String name = 'QuizPageToRight';
}

class QuizPageToTop extends _i1.PageRouteInfo {
  const QuizPageToTop() : super(name, path: '/quiz-page');

  static const String name = 'QuizPageToTop';
}

class QuizPageToBottom extends _i1.PageRouteInfo {
  const QuizPageToBottom() : super(name, path: '/quiz-page');

  static const String name = 'QuizPageToBottom';
}

class ParalaxHistoryPageRoute
    extends _i1.PageRouteInfo<ParalaxHistoryPageRouteArgs> {
  ParalaxHistoryPageRoute({bool? mustScrollToEnd, bool? mustScrollToMiddle})
      : super(name,
            path: '/paralax-history-page',
            args: ParalaxHistoryPageRouteArgs(
                mustScrollToEnd: mustScrollToEnd,
                mustScrollToMiddle: mustScrollToMiddle));

  static const String name = 'ParalaxHistoryPageRoute';
}

class ParalaxHistoryPageRouteArgs {
  const ParalaxHistoryPageRouteArgs(
      {this.mustScrollToEnd, this.mustScrollToMiddle});

  final bool? mustScrollToEnd;

  final bool? mustScrollToMiddle;
}

class ParalaxHistoryPageToLeft
    extends _i1.PageRouteInfo<ParalaxHistoryPageToLeftArgs> {
  ParalaxHistoryPageToLeft({bool? mustScrollToEnd, bool? mustScrollToMiddle})
      : super(name,
            path: '/paralax-history-page',
            args: ParalaxHistoryPageToLeftArgs(
                mustScrollToEnd: mustScrollToEnd,
                mustScrollToMiddle: mustScrollToMiddle));

  static const String name = 'ParalaxHistoryPageToLeft';
}

class ParalaxHistoryPageToLeftArgs {
  const ParalaxHistoryPageToLeftArgs(
      {this.mustScrollToEnd, this.mustScrollToMiddle});

  final bool? mustScrollToEnd;

  final bool? mustScrollToMiddle;
}

class ParalaxHistoryPageToRight
    extends _i1.PageRouteInfo<ParalaxHistoryPageToRightArgs> {
  ParalaxHistoryPageToRight({bool? mustScrollToEnd, bool? mustScrollToMiddle})
      : super(name,
            path: '/paralax-history-page',
            args: ParalaxHistoryPageToRightArgs(
                mustScrollToEnd: mustScrollToEnd,
                mustScrollToMiddle: mustScrollToMiddle));

  static const String name = 'ParalaxHistoryPageToRight';
}

class ParalaxHistoryPageToRightArgs {
  const ParalaxHistoryPageToRightArgs(
      {this.mustScrollToEnd, this.mustScrollToMiddle});

  final bool? mustScrollToEnd;

  final bool? mustScrollToMiddle;
}

class ParalaxHistoryPageToTop
    extends _i1.PageRouteInfo<ParalaxHistoryPageToTopArgs> {
  ParalaxHistoryPageToTop({bool? mustScrollToEnd, bool? mustScrollToMiddle})
      : super(name,
            path: '/paralax-history-page',
            args: ParalaxHistoryPageToTopArgs(
                mustScrollToEnd: mustScrollToEnd,
                mustScrollToMiddle: mustScrollToMiddle));

  static const String name = 'ParalaxHistoryPageToTop';
}

class ParalaxHistoryPageToTopArgs {
  const ParalaxHistoryPageToTopArgs(
      {this.mustScrollToEnd, this.mustScrollToMiddle});

  final bool? mustScrollToEnd;

  final bool? mustScrollToMiddle;
}

class ParalaxHistoryPageToBottom
    extends _i1.PageRouteInfo<ParalaxHistoryPageToBottomArgs> {
  ParalaxHistoryPageToBottom({bool? mustScrollToEnd, bool? mustScrollToMiddle})
      : super(name,
            path: '/paralax-history-page',
            args: ParalaxHistoryPageToBottomArgs(
                mustScrollToEnd: mustScrollToEnd,
                mustScrollToMiddle: mustScrollToMiddle));

  static const String name = 'ParalaxHistoryPageToBottom';
}

class ParalaxHistoryPageToBottomArgs {
  const ParalaxHistoryPageToBottomArgs(
      {this.mustScrollToEnd, this.mustScrollToMiddle});

  final bool? mustScrollToEnd;

  final bool? mustScrollToMiddle;
}

class GlossaryPageRoute extends _i1.PageRouteInfo {
  const GlossaryPageRoute() : super(name, path: '/glossary-page');

  static const String name = 'GlossaryPageRoute';
}

class GlossaryPageToLeft extends _i1.PageRouteInfo {
  const GlossaryPageToLeft() : super(name, path: '/glossary-page');

  static const String name = 'GlossaryPageToLeft';
}

class GlossaryPageToRight extends _i1.PageRouteInfo {
  const GlossaryPageToRight() : super(name, path: '/glossary-page');

  static const String name = 'GlossaryPageToRight';
}

class GlossaryPageToTop extends _i1.PageRouteInfo {
  const GlossaryPageToTop() : super(name, path: '/glossary-page');

  static const String name = 'GlossaryPageToTop';
}

class GlossaryPageToBottom extends _i1.PageRouteInfo {
  const GlossaryPageToBottom() : super(name, path: '/glossary-page');

  static const String name = 'GlossaryPageToBottom';
}

class PanaromaLeftPageRoute extends _i1.PageRouteInfo {
  const PanaromaLeftPageRoute() : super(name, path: '/panaroma-left-page');

  static const String name = 'PanaromaLeftPageRoute';
}

class PanaromaLeftPageToLeft extends _i1.PageRouteInfo {
  const PanaromaLeftPageToLeft() : super(name, path: '/panaroma-left-page');

  static const String name = 'PanaromaLeftPageToLeft';
}

class PanaromaLeftPageToRight extends _i1.PageRouteInfo {
  const PanaromaLeftPageToRight() : super(name, path: '/panaroma-left-page');

  static const String name = 'PanaromaLeftPageToRight';
}

class PanaromaLeftPageToTop extends _i1.PageRouteInfo {
  const PanaromaLeftPageToTop() : super(name, path: '/panaroma-left-page');

  static const String name = 'PanaromaLeftPageToTop';
}

class PanaromaLeftPageToBottom extends _i1.PageRouteInfo {
  const PanaromaLeftPageToBottom() : super(name, path: '/panaroma-left-page');

  static const String name = 'PanaromaLeftPageToBottom';
}

class PanaromaRightPageRoute extends _i1.PageRouteInfo {
  const PanaromaRightPageRoute() : super(name, path: '/panaroma-right-page');

  static const String name = 'PanaromaRightPageRoute';
}

class PanaromaRightPageToLeft extends _i1.PageRouteInfo {
  const PanaromaRightPageToLeft() : super(name, path: '/panaroma-right-page');

  static const String name = 'PanaromaRightPageToLeft';
}

class PanaromaRightPageToRight extends _i1.PageRouteInfo {
  const PanaromaRightPageToRight() : super(name, path: '/panaroma-right-page');

  static const String name = 'PanaromaRightPageToRight';
}

class PanaromaRightPageToTop extends _i1.PageRouteInfo {
  const PanaromaRightPageToTop() : super(name, path: '/panaroma-right-page');

  static const String name = 'PanaromaRightPageToTop';
}

class PanaromaRightPageToBottom extends _i1.PageRouteInfo {
  const PanaromaRightPageToBottom() : super(name, path: '/panaroma-right-page');

  static const String name = 'PanaromaRightPageToBottom';
}

class PathogenProfilePageBottomRoute
    extends _i1.PageRouteInfo<PathogenProfilePageBottomRouteArgs> {
  PathogenProfilePageBottomRoute(
      {_i2.Key? key, bool? needJumpToPracticeMedicinePart})
      : super(name,
            path: '/pathogen-profile-page',
            args: PathogenProfilePageBottomRouteArgs(
                key: key,
                needJumpToPracticeMedicinePart:
                    needJumpToPracticeMedicinePart));

  static const String name = 'PathogenProfilePageBottomRoute';
}

class PathogenProfilePageBottomRouteArgs {
  const PathogenProfilePageBottomRouteArgs(
      {this.key, this.needJumpToPracticeMedicinePart});

  final _i2.Key? key;

  final bool? needJumpToPracticeMedicinePart;
}

class PathogenProfilePageRightRoute
    extends _i1.PageRouteInfo<PathogenProfilePageRightRouteArgs> {
  PathogenProfilePageRightRoute(
      {_i2.Key? key, bool? needJumpToPracticeMedicinePart})
      : super(name,
            path: '/pathogen-profile-page',
            args: PathogenProfilePageRightRouteArgs(
                key: key,
                needJumpToPracticeMedicinePart:
                    needJumpToPracticeMedicinePart));

  static const String name = 'PathogenProfilePageRightRoute';
}

class PathogenProfilePageRightRouteArgs {
  const PathogenProfilePageRightRouteArgs(
      {this.key, this.needJumpToPracticeMedicinePart});

  final _i2.Key? key;

  final bool? needJumpToPracticeMedicinePart;
}

class PathogenProfilePageLeftRoute
    extends _i1.PageRouteInfo<PathogenProfilePageLeftRouteArgs> {
  PathogenProfilePageLeftRoute(
      {_i2.Key? key, bool? needJumpToPracticeMedicinePart})
      : super(name,
            path: '/pathogen-profile-page',
            args: PathogenProfilePageLeftRouteArgs(
                key: key,
                needJumpToPracticeMedicinePart:
                    needJumpToPracticeMedicinePart));

  static const String name = 'PathogenProfilePageLeftRoute';
}

class PathogenProfilePageLeftRouteArgs {
  const PathogenProfilePageLeftRouteArgs(
      {this.key, this.needJumpToPracticeMedicinePart});

  final _i2.Key? key;

  final bool? needJumpToPracticeMedicinePart;
}

class KeepGoingPageLeftRoute extends _i1.PageRouteInfo {
  const KeepGoingPageLeftRoute() : super(name, path: '/keep-going-page');

  static const String name = 'KeepGoingPageLeftRoute';
}

class KeepGoingPageBottomRoute extends _i1.PageRouteInfo {
  const KeepGoingPageBottomRoute() : super(name, path: '/keep-going-page');

  static const String name = 'KeepGoingPageBottomRoute';
}

class QuitMedicinePageRoute extends _i1.PageRouteInfo {
  const QuitMedicinePageRoute() : super(name, path: '/quit-medicine-page');

  static const String name = 'QuitMedicinePageRoute';
}

class QuitMedicinePageToLeft extends _i1.PageRouteInfo {
  const QuitMedicinePageToLeft() : super(name, path: '/quit-medicine-page');

  static const String name = 'QuitMedicinePageToLeft';
}

class QuitMedicinePageToRight extends _i1.PageRouteInfo {
  const QuitMedicinePageToRight() : super(name, path: '/quit-medicine-page');

  static const String name = 'QuitMedicinePageToRight';
}

class QuitMedicinePageToTop extends _i1.PageRouteInfo {
  const QuitMedicinePageToTop() : super(name, path: '/quit-medicine-page');

  static const String name = 'QuitMedicinePageToTop';
}

class QuitMedicinePageToBottom extends _i1.PageRouteInfo {
  const QuitMedicinePageToBottom() : super(name, path: '/quit-medicine-page');

  static const String name = 'QuitMedicinePageToBottom';
}

class PracticeMedicineRoute extends _i1.PageRouteInfo {
  const PracticeMedicineRoute() : super(name, path: '/practice-medicine');

  static const String name = 'PracticeMedicineRoute';
}

class PracticeMedicineToLeft extends _i1.PageRouteInfo {
  const PracticeMedicineToLeft() : super(name, path: '/practice-medicine');

  static const String name = 'PracticeMedicineToLeft';
}

class PracticeMedicineToRight extends _i1.PageRouteInfo {
  const PracticeMedicineToRight() : super(name, path: '/practice-medicine');

  static const String name = 'PracticeMedicineToRight';
}

class PracticeMedicineToTop extends _i1.PageRouteInfo {
  const PracticeMedicineToTop() : super(name, path: '/practice-medicine');

  static const String name = 'PracticeMedicineToTop';
}

class PracticeMedicineToBottom extends _i1.PageRouteInfo {
  const PracticeMedicineToBottom() : super(name, path: '/practice-medicine');

  static const String name = 'PracticeMedicineToBottom';
}

class BodyInfoPageRoute extends _i1.PageRouteInfo {
  const BodyInfoPageRoute() : super(name, path: '/');

  static const String name = 'BodyInfoPageRoute';
}

class BodyInfoPageToLeft extends _i1.PageRouteInfo {
  const BodyInfoPageToLeft() : super(name, path: '/body-info-page');

  static const String name = 'BodyInfoPageToLeft';
}

class BodyInfoPageToRight extends _i1.PageRouteInfo {
  const BodyInfoPageToRight() : super(name, path: '/body-info-page');

  static const String name = 'BodyInfoPageToRight';
}

class BodyInfoPageToTop extends _i1.PageRouteInfo {
  const BodyInfoPageToTop() : super(name, path: '/body-info-page');

  static const String name = 'BodyInfoPageToTop';
}

class BodyInfoPageToBottom extends _i1.PageRouteInfo {
  const BodyInfoPageToBottom() : super(name, path: '/body-info-page');

  static const String name = 'BodyInfoPageToBottom';
}

class VirusLocationPageRoute extends _i1.PageRouteInfo {
  const VirusLocationPageRoute() : super(name, path: '/virus-location-page');

  static const String name = 'VirusLocationPageRoute';
}

class VirusLocationPageToLeft extends _i1.PageRouteInfo {
  const VirusLocationPageToLeft() : super(name, path: '/virus-location-page');

  static const String name = 'VirusLocationPageToLeft';
}

class VirusLocationPageToRight extends _i1.PageRouteInfo {
  const VirusLocationPageToRight() : super(name, path: '/virus-location-page');

  static const String name = 'VirusLocationPageToRight';
}

class VirusLocationPageToTop extends _i1.PageRouteInfo {
  const VirusLocationPageToTop() : super(name, path: '/virus-location-page');

  static const String name = 'VirusLocationPageToTop';
}

class VirusLocationPageToBottom extends _i1.PageRouteInfo {
  const VirusLocationPageToBottom() : super(name, path: '/virus-location-page');

  static const String name = 'VirusLocationPageToBottom';
}

class DocumentPageRoute extends _i1.PageRouteInfo {
  const DocumentPageRoute() : super(name, path: '/document-page');

  static const String name = 'DocumentPageRoute';
}

class DocumentPageToLeft extends _i1.PageRouteInfo {
  const DocumentPageToLeft() : super(name, path: '/document-page');

  static const String name = 'DocumentPageToLeft';
}

class DocumentPageToRight extends _i1.PageRouteInfo {
  const DocumentPageToRight() : super(name, path: '/document-page');

  static const String name = 'DocumentPageToRight';
}

class DocumentPageToTop extends _i1.PageRouteInfo {
  const DocumentPageToTop() : super(name, path: '/document-page');

  static const String name = 'DocumentPageToTop';
}

class DocumentPageToBottom extends _i1.PageRouteInfo {
  const DocumentPageToBottom() : super(name, path: '/document-page');

  static const String name = 'DocumentPageToBottom';
}

class DeadOfSocratesPageRoute
    extends _i1.PageRouteInfo<DeadOfSocratesPageRouteArgs> {
  DeadOfSocratesPageRoute({_i2.Key? key, required bool fromKeepGoing})
      : super(name,
            path: '/dead-of-socrates-page',
            args: DeadOfSocratesPageRouteArgs(
                key: key, fromKeepGoing: fromKeepGoing));

  static const String name = 'DeadOfSocratesPageRoute';
}

class DeadOfSocratesPageRouteArgs {
  const DeadOfSocratesPageRouteArgs({this.key, required this.fromKeepGoing});

  final _i2.Key? key;

  final bool fromKeepGoing;
}

class DeadOfSocratesPageToLeft
    extends _i1.PageRouteInfo<DeadOfSocratesPageToLeftArgs> {
  DeadOfSocratesPageToLeft({_i2.Key? key, required bool fromKeepGoing})
      : super(name,
            path: '/dead-of-socrates-page',
            args: DeadOfSocratesPageToLeftArgs(
                key: key, fromKeepGoing: fromKeepGoing));

  static const String name = 'DeadOfSocratesPageToLeft';
}

class DeadOfSocratesPageToLeftArgs {
  const DeadOfSocratesPageToLeftArgs({this.key, required this.fromKeepGoing});

  final _i2.Key? key;

  final bool fromKeepGoing;
}

class DeadOfSocratesPageToRight
    extends _i1.PageRouteInfo<DeadOfSocratesPageToRightArgs> {
  DeadOfSocratesPageToRight({_i2.Key? key, required bool fromKeepGoing})
      : super(name,
            path: '/dead-of-socrates-page',
            args: DeadOfSocratesPageToRightArgs(
                key: key, fromKeepGoing: fromKeepGoing));

  static const String name = 'DeadOfSocratesPageToRight';
}

class DeadOfSocratesPageToRightArgs {
  const DeadOfSocratesPageToRightArgs({this.key, required this.fromKeepGoing});

  final _i2.Key? key;

  final bool fromKeepGoing;
}

class DeadOfSocratesPageToTop
    extends _i1.PageRouteInfo<DeadOfSocratesPageToTopArgs> {
  DeadOfSocratesPageToTop({_i2.Key? key, required bool fromKeepGoing})
      : super(name,
            path: '/dead-of-socrates-page',
            args: DeadOfSocratesPageToTopArgs(
                key: key, fromKeepGoing: fromKeepGoing));

  static const String name = 'DeadOfSocratesPageToTop';
}

class DeadOfSocratesPageToTopArgs {
  const DeadOfSocratesPageToTopArgs({this.key, required this.fromKeepGoing});

  final _i2.Key? key;

  final bool fromKeepGoing;
}

class DeadOfSocratesPageToBottom
    extends _i1.PageRouteInfo<DeadOfSocratesPageToBottomArgs> {
  DeadOfSocratesPageToBottom({_i2.Key? key, required bool fromKeepGoing})
      : super(name,
            path: '/dead-of-socrates-page',
            args: DeadOfSocratesPageToBottomArgs(
                key: key, fromKeepGoing: fromKeepGoing));

  static const String name = 'DeadOfSocratesPageToBottom';
}

class DeadOfSocratesPageToBottomArgs {
  const DeadOfSocratesPageToBottomArgs({this.key, required this.fromKeepGoing});

  final _i2.Key? key;

  final bool fromKeepGoing;
}

class EndOfWarPageRoute extends _i1.PageRouteInfo {
  const EndOfWarPageRoute() : super(name, path: '/end-of-war-page');

  static const String name = 'EndOfWarPageRoute';
}

class EndOfWarPageToLeft extends _i1.PageRouteInfo {
  const EndOfWarPageToLeft() : super(name, path: '/end-of-war-page');

  static const String name = 'EndOfWarPageToLeft';
}

class EndOfWarPageToRight extends _i1.PageRouteInfo {
  const EndOfWarPageToRight() : super(name, path: '/end-of-war-page');

  static const String name = 'EndOfWarPageToRight';
}

class EndOfWarPageToTop extends _i1.PageRouteInfo {
  const EndOfWarPageToTop() : super(name, path: '/end-of-war-page');

  static const String name = 'EndOfWarPageToTop';
}

class EndOfWarPageToBottom extends _i1.PageRouteInfo {
  const EndOfWarPageToBottom() : super(name, path: '/end-of-war-page');

  static const String name = 'EndOfWarPageToBottom';
}

class IrlNikosPageRoute extends _i1.PageRouteInfo {
  const IrlNikosPageRoute() : super(name, path: '/irl-nikos-page');

  static const String name = 'IrlNikosPageRoute';
}

class IrlNikosPageToLeft extends _i1.PageRouteInfo {
  const IrlNikosPageToLeft() : super(name, path: '/irl-nikos-page');

  static const String name = 'IrlNikosPageToLeft';
}

class IrlNikosPageToRight extends _i1.PageRouteInfo {
  const IrlNikosPageToRight() : super(name, path: '/irl-nikos-page');

  static const String name = 'IrlNikosPageToRight';
}

class IrlNikosPageToTop extends _i1.PageRouteInfo {
  const IrlNikosPageToTop() : super(name, path: '/irl-nikos-page');

  static const String name = 'IrlNikosPageToTop';
}

class IrlNikosPageToBottom extends _i1.PageRouteInfo {
  const IrlNikosPageToBottom() : super(name, path: '/irl-nikos-page');

  static const String name = 'IrlNikosPageToBottom';
}

class GianaPageRoute extends _i1.PageRouteInfo {
  const GianaPageRoute() : super(name, path: '/giana-page');

  static const String name = 'GianaPageRoute';
}

class GianaPageToLeft extends _i1.PageRouteInfo {
  const GianaPageToLeft() : super(name, path: '/giana-page');

  static const String name = 'GianaPageToLeft';
}

class GianaPageToRight extends _i1.PageRouteInfo {
  const GianaPageToRight() : super(name, path: '/giana-page');

  static const String name = 'GianaPageToRight';
}

class GianaPageToTop extends _i1.PageRouteInfo {
  const GianaPageToTop() : super(name, path: '/giana-page');

  static const String name = 'GianaPageToTop';
}

class GianaPageToBottom extends _i1.PageRouteInfo {
  const GianaPageToBottom() : super(name, path: '/giana-page');

  static const String name = 'GianaPageToBottom';
}

class AboutBookPageRoute extends _i1.PageRouteInfo {
  const AboutBookPageRoute() : super(name, path: '/about-book-page');

  static const String name = 'AboutBookPageRoute';
}

class AboutBookPageToLeft extends _i1.PageRouteInfo {
  const AboutBookPageToLeft() : super(name, path: '/about-book-page');

  static const String name = 'AboutBookPageToLeft';
}

class AboutBookPageToRight extends _i1.PageRouteInfo {
  const AboutBookPageToRight() : super(name, path: '/about-book-page');

  static const String name = 'AboutBookPageToRight';
}

class AboutBookPageToTop extends _i1.PageRouteInfo {
  const AboutBookPageToTop() : super(name, path: '/about-book-page');

  static const String name = 'AboutBookPageToTop';
}

class AboutBookPageToBottom extends _i1.PageRouteInfo {
  const AboutBookPageToBottom() : super(name, path: '/about-book-page');

  static const String name = 'AboutBookPageToBottom';
}

class CreditsPageRoute extends _i1.PageRouteInfo {
  const CreditsPageRoute() : super(name, path: '/credits-page');

  static const String name = 'CreditsPageRoute';
}

class CreditsPageToLeft extends _i1.PageRouteInfo {
  const CreditsPageToLeft() : super(name, path: '/credits-page');

  static const String name = 'CreditsPageToLeft';
}

class CreditsPageToRight extends _i1.PageRouteInfo {
  const CreditsPageToRight() : super(name, path: '/credits-page');

  static const String name = 'CreditsPageToRight';
}

class CreditsPageToTop extends _i1.PageRouteInfo {
  const CreditsPageToTop() : super(name, path: '/credits-page');

  static const String name = 'CreditsPageToTop';
}

class CreditsPageToBottom extends _i1.PageRouteInfo {
  const CreditsPageToBottom() : super(name, path: '/credits-page');

  static const String name = 'CreditsPageToBottom';
}

class FurtherReadingPageRoute extends _i1.PageRouteInfo {
  const FurtherReadingPageRoute() : super(name, path: '/further-reading-page');

  static const String name = 'FurtherReadingPageRoute';
}

class FurtherReadingPageToLeft extends _i1.PageRouteInfo {
  const FurtherReadingPageToLeft() : super(name, path: '/further-reading-page');

  static const String name = 'FurtherReadingPageToLeft';
}

class FurtherReadingPageToRight extends _i1.PageRouteInfo {
  const FurtherReadingPageToRight()
      : super(name, path: '/further-reading-page');

  static const String name = 'FurtherReadingPageToRight';
}

class FurtherReadingPageToTop extends _i1.PageRouteInfo {
  const FurtherReadingPageToTop() : super(name, path: '/further-reading-page');

  static const String name = 'FurtherReadingPageToTop';
}

class FurtherReadingPageToBottom extends _i1.PageRouteInfo {
  const FurtherReadingPageToBottom()
      : super(name, path: '/further-reading-page');

  static const String name = 'FurtherReadingPageToBottom';
}

class CopyrightPageRoute extends _i1.PageRouteInfo {
  const CopyrightPageRoute() : super(name, path: '/copyright-page');

  static const String name = 'CopyrightPageRoute';
}

class CopyrightPageToLeft extends _i1.PageRouteInfo {
  const CopyrightPageToLeft() : super(name, path: '/copyright-page');

  static const String name = 'CopyrightPageToLeft';
}

class CopyrightPageToRight extends _i1.PageRouteInfo {
  const CopyrightPageToRight() : super(name, path: '/copyright-page');

  static const String name = 'CopyrightPageToRight';
}

class CopyrightPageToTop extends _i1.PageRouteInfo {
  const CopyrightPageToTop() : super(name, path: '/copyright-page');

  static const String name = 'CopyrightPageToTop';
}

class CopyrightPageToBottom extends _i1.PageRouteInfo {
  const CopyrightPageToBottom() : super(name, path: '/copyright-page');

  static const String name = 'CopyrightPageToBottom';
}

class SourcePageRoute extends _i1.PageRouteInfo {
  const SourcePageRoute() : super(name, path: '/source-page');

  static const String name = 'SourcePageRoute';
}

class SourcePageToLeft extends _i1.PageRouteInfo {
  const SourcePageToLeft() : super(name, path: '/source-page');

  static const String name = 'SourcePageToLeft';
}

class SourcePageToRight extends _i1.PageRouteInfo {
  const SourcePageToRight() : super(name, path: '/source-page');

  static const String name = 'SourcePageToRight';
}

class SourcePageToTop extends _i1.PageRouteInfo {
  const SourcePageToTop() : super(name, path: '/source-page');

  static const String name = 'SourcePageToTop';
}

class SourcePageToBottom extends _i1.PageRouteInfo {
  const SourcePageToBottom() : super(name, path: '/source-page');

  static const String name = 'SourcePageToBottom';
}

class NavigationPageRoute extends _i1.PageRouteInfo {
  const NavigationPageRoute() : super(name, path: '/navigation-page');

  static const String name = 'NavigationPageRoute';
}

class VirusLocationSecondPageRoute extends _i1.PageRouteInfo {
  const VirusLocationSecondPageRoute()
      : super(name, path: '/virus-location-second-page');

  static const String name = 'VirusLocationSecondPageRoute';
}

class VirusLocationSecondPageToLeft extends _i1.PageRouteInfo {
  const VirusLocationSecondPageToLeft()
      : super(name, path: '/virus-location-second-page');

  static const String name = 'VirusLocationSecondPageToLeft';
}

class VirusLocationSecondPageToRight extends _i1.PageRouteInfo {
  const VirusLocationSecondPageToRight()
      : super(name, path: '/virus-location-second-page');

  static const String name = 'VirusLocationSecondPageToRight';
}

class VirusLocationSecondPageToTop extends _i1.PageRouteInfo {
  const VirusLocationSecondPageToTop()
      : super(name, path: '/virus-location-second-page');

  static const String name = 'VirusLocationSecondPageToTop';
}

class VirusLocationSecondPageToBottom extends _i1.PageRouteInfo {
  const VirusLocationSecondPageToBottom()
      : super(name, path: '/virus-location-second-page');

  static const String name = 'VirusLocationSecondPageToBottom';
}
