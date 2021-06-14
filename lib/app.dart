import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/base/base.dart';
import 'package:history_of_adventures/yani.dart';

import 'widgets/animated_fade_in.dart';
import 'widgets/responsive_layout_builder.dart';

class _App extends StatelessWidget {
  final ThemeData? theme;

  const _App({Key? key, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set Navigator key.
      navigatorKey: AppKeys.navigatorkey,

      // Remove debug banner.
      debugShowCheckedModeBanner: false,

      // Set Builder function.
      builder: (BuildContext context, Widget? widget) {
        return MediaQuery(
          child: widget!,
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
            platformBrightness: Brightness.light,
            invertColors: false,
          ),
        );
      },

      // Default Theme.
      theme: theme,

      // Localiztion delegates from flutter localizations package
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      // Set Locales.
      supportedLocales: AppLocalizations.supportedLocales,

      // Set language.
      locale: const Locale('hy'),
      home: LotieTest(),
      // App's named routes.
      // routes: AppRoutes.routes,
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedFadeIn(
      // child: _App(theme: AppThemes.standard,),
      child: ResponsiveLayoutBuilder(
        small: (_, __) => _App(theme: AppThemes.small),
        medium: (_, __) => _App(theme: AppThemes.medium),
        large: (_, __) => _App(theme: AppThemes.standard),
      ),
    );
  }
}
