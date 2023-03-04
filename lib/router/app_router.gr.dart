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
    UpdateRestOfGoodsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const UpdateRestOfGoodsPage(),
      );
    },
    RestOfGoodsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const RestOfGoodsPage(),
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
              RestOfGoodsRoute.name,
              path: 'first',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              RestOfGoodsRoute.name,
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
        ),
        RouteConfig(
          UpdateRestOfGoodsRoute.name,
          path: '/update-rest-of-goods-page',
        ),
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
/// [UpdateRestOfGoodsPage]
class UpdateRestOfGoodsRoute extends PageRouteInfo<void> {
  const UpdateRestOfGoodsRoute()
      : super(
          UpdateRestOfGoodsRoute.name,
          path: '/update-rest-of-goods-page',
        );

  static const String name = 'UpdateRestOfGoodsRoute';
}

/// generated route for
/// [RestOfGoodsPage]
class RestOfGoodsRoute extends PageRouteInfo<void> {
  const RestOfGoodsRoute()
      : super(
          RestOfGoodsRoute.name,
          path: 'first',
        );

  static const String name = 'RestOfGoodsRoute';
}
