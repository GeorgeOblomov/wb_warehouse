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
      final args = routeData.argsAs<UpdateRestOfGoodsRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: UpdateRestOfGoodsPage(
          initialData: args.initialData,
          key: args.key,
        ),
      );
    },
    GoodsToUpdateRoute.name: (routeData) {
      final args = routeData.argsAs<GoodsToUpdateRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: GoodsToUpdatePage(
          initialData: args.initialData,
          key: args.key,
        ),
      );
    },
    RestOfGoodsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const RestOfGoodsPage(),
      );
    },
    ChooseGoodsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const ChooseGoodsPage(),
      );
    },
    InventoryTableRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const InventoryTablePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
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
              ChooseGoodsRoute.name,
              path: 'second',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              InventoryTableRoute.name,
              path: 'third',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              ProfileRoute.name,
              path: 'fourth',
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
        RouteConfig(
          GoodsToUpdateRoute.name,
          path: '/goods-to-update-page',
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
class UpdateRestOfGoodsRoute extends PageRouteInfo<UpdateRestOfGoodsRouteArgs> {
  UpdateRestOfGoodsRoute({
    required UpdateRestOfGoodsInitialData initialData,
    Key? key,
  }) : super(
          UpdateRestOfGoodsRoute.name,
          path: '/update-rest-of-goods-page',
          args: UpdateRestOfGoodsRouteArgs(
            initialData: initialData,
            key: key,
          ),
        );

  static const String name = 'UpdateRestOfGoodsRoute';
}

class UpdateRestOfGoodsRouteArgs {
  const UpdateRestOfGoodsRouteArgs({
    required this.initialData,
    this.key,
  });

  final UpdateRestOfGoodsInitialData initialData;

  final Key? key;

  @override
  String toString() {
    return 'UpdateRestOfGoodsRouteArgs{initialData: $initialData, key: $key}';
  }
}

/// generated route for
/// [GoodsToUpdatePage]
class GoodsToUpdateRoute extends PageRouteInfo<GoodsToUpdateRouteArgs> {
  GoodsToUpdateRoute({
    required GoodsToUpdateInitialData initialData,
    Key? key,
  }) : super(
          GoodsToUpdateRoute.name,
          path: '/goods-to-update-page',
          args: GoodsToUpdateRouteArgs(
            initialData: initialData,
            key: key,
          ),
        );

  static const String name = 'GoodsToUpdateRoute';
}

class GoodsToUpdateRouteArgs {
  const GoodsToUpdateRouteArgs({
    required this.initialData,
    this.key,
  });

  final GoodsToUpdateInitialData initialData;

  final Key? key;

  @override
  String toString() {
    return 'GoodsToUpdateRouteArgs{initialData: $initialData, key: $key}';
  }
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

/// generated route for
/// [ChooseGoodsPage]
class ChooseGoodsRoute extends PageRouteInfo<void> {
  const ChooseGoodsRoute()
      : super(
          ChooseGoodsRoute.name,
          path: 'second',
        );

  static const String name = 'ChooseGoodsRoute';
}

/// generated route for
/// [InventoryTablePage]
class InventoryTableRoute extends PageRouteInfo<void> {
  const InventoryTableRoute()
      : super(
          InventoryTableRoute.name,
          path: 'third',
        );

  static const String name = 'InventoryTableRoute';
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'fourth',
        );

  static const String name = 'ProfileRoute';
}
