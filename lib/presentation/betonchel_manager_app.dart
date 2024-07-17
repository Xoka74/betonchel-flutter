import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/l10n/l10n.dart';
import 'package:betonchel_manager/navigation/web_router.dart';
import 'package:betonchel_manager/presentation/res/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BetonchelManagerApp extends StatefulWidget {
  const BetonchelManagerApp({super.key});

  @override
  State<BetonchelManagerApp> createState() => _BetonchelManagerAppState();
}

class _BetonchelManagerAppState extends State<BetonchelManagerApp> {
  late final RootStackRouter _appRouter;

  @override
  void initState() {
    _appRouter = locator<WebRouter>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints(
      breakpoints: const [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
        Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
      child: MaterialApp.router(
        title: 'Betonchel Manager',
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
        theme: AppThemes.light,
        builder: (context, child) => SafeArea(child: child!),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.supportedLocales,
      ),
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();

    super.dispose();
  }
}
