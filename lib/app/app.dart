import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/router/app_router.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';
import 'package:wb_warehouse/utils/themes/wb_theme_data.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeProvider>(create: (_) => ThemeProvider()),
      ],
      // (egrischenkov): Lately it will be used as repositories provider.
      // I use it because I need access to "DataManager", which will be injected through the MultiProvider
      child: Consumer<ThemeProvider>(
        builder: (_, themeProvider, ___) {
          return MaterialApp.router(
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
            title: 'WB Warehouse',
            theme: themeProvider.isLightTheme ? WbThemeData.lightTheme : WbThemeData.darkTheme,
          );
        },
      ),
    );
  }
}
