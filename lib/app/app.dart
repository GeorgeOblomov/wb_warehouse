import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wb_warehouse/data_management/common/data_manager.dart';
import 'package:wb_warehouse/features/prices_and_discounts/repositories/prices_and_discounts_repository.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';
import 'package:wb_warehouse/features/reviews/repositories/reviews_repository.dart';
import 'package:wb_warehouse/router/app_router.dart';
import 'package:wb_warehouse/utils/assets.dart';
import 'package:wb_warehouse/utils/constants.dart';
import 'package:wb_warehouse/utils/locale/locale_provider.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wb_warehouse/utils/themes/wb_theme_data.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Image.asset(Assets.logo),
        nextScreen: Consumer3<DataManager, ThemeProvider, LocaleProvider>(
          builder: (_, dataManager, themeProvider, localeProvider, ___) {
            return MultiProvider(
              providers: _injectedRepositories(dataManager),
              child: MaterialApp.router(
                routeInformationParser: _appRouter.defaultRouteParser(),
                routerDelegate: _appRouter.delegate(),
                title: materialAppTitle,
                theme: themeProvider.isLightTheme ? WbThemeData.lightTheme : WbThemeData.darkTheme,
                locale: localeProvider.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                localeResolutionCallback: _setUpDeviceLocaleForApp,
                supportedLocales: AppLocalizations.supportedLocales,
                debugShowCheckedModeBanner: false,
              ),
            );
          },
        ),
        backgroundColor: context.read<ThemeProvider>().appTheme.splashBackgroundColor,
      ),
    );
  }

  List<SingleChildWidget> _injectedRepositories(DataManager dataManager) {
    return [
      Provider(create: (_) => RestOfGoodsRepository(dataManager.restOfGoodsDataProvider)),
      Provider(create: (_) => PricesAndDiscountsRepository(dataManager.pricesAndDiscountsDataProvider)),
      Provider(create: (_) => ReviewsRepository(dataManager.reviewsDataProvider)),
    ];
  }

  Locale _setUpDeviceLocaleForApp(Locale? userLocale, Iterable<Locale> supportedLocales) {
    for (var locale in supportedLocales) {
      if (locale.languageCode == userLocale?.languageCode && locale.countryCode == userLocale?.countryCode) {
        return userLocale!;
      }
    }

    return supportedLocales.first;
  }
}
