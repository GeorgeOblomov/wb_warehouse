import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/router/app_router.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // (grischenkov): Lately here going to be some providers which will be injected for entire app
        Provider<ThemeProvider>(create: (_) => ThemeProvider()),
      ],
      // (egrischenkov): Lately it will be used as repositories provider.
      // I use it because I need access to "DataManager", which will be injected through the MultiProvider
      child: Consumer(
        builder: (_, __, ___) {
          return MaterialApp.router(
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            title: 'WB Warehouse',
          );
        },
      ),
    );
  }
}
