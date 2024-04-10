import 'package:betonchel_manager/l10n/l10n.dart';
import 'package:betonchel_manager/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BetonchelManagerApp extends StatefulWidget {
  const BetonchelManagerApp({super.key});

  @override
  State<BetonchelManagerApp> createState() => _BetonchelManagerAppState();
}

class _BetonchelManagerAppState extends State<BetonchelManagerApp> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: (context, child) => SafeArea(child: child!),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.supportedLocales,
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
