// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    GoodsCatalogRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const GoodsCatalogPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            RouteConfig(
              GoodsCatalogRoute.name,
              path: 'first',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              GoodsCatalogRoute.name,
              path: 'first',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              GoodsCatalogRoute.name,
              path: 'first',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              '#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'first',
              fullMatch: true,
            ),
          ],
        )
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [GoodsCatalogPage]
class GoodsCatalogRoute extends PageRouteInfo<void> {
  const GoodsCatalogRoute()
      : super(
          GoodsCatalogRoute.name,
          path: 'first',
        );

  static const String name = 'GoodsCatalogRoute';
}
