import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wb_warehouse/data_management/common/data_manager.dart';
import 'package:wb_warehouse/data_management/common/network_client.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';
import 'package:wb_warehouse/router/app_router.dart';
import 'package:wb_warehouse/utils/locale/locale_provider.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wb_warehouse/utils/themes/wb_theme_data.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _injectedDependencies(),
      child: Consumer3<DataManager, ThemeProvider, LocaleProvider>(
        builder: (_, dataManager, themeProvider, localeProvider, ___) {
          return MultiProvider(
            providers: _injectedRepositories(dataManager),
            child: MaterialApp.router(
              routeInformationParser: _appRouter.defaultRouteParser(),
              routerDelegate: _appRouter.delegate(),
              title: 'WB Warehouse',
              theme: themeProvider.isLightTheme ? WbThemeData.lightTheme : WbThemeData.darkTheme,
              locale: localeProvider.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            ),
          );
        },
      ),
    );
  }

  List<SingleChildWidget> _injectedDependencies() {
    return [
      Provider<DataManager>(create: (_) => DataManager(NetworkClient())),
      ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider()),
    ];
  }

  List<SingleChildWidget> _injectedRepositories(DataManager dataManager) {
    return [
      Provider(create: (_) => RestOfGoodsRepository(dataManager.restOfGoodsDataProvider)),
    ];
  }
}
