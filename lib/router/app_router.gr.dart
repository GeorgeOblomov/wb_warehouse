// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChooseGoodsPageRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseGoodsPage(),
      );
    },
    GoodsToUpdatePageRouter.name: (routeData) {
      final args = routeData.argsAs<GoodsToUpdatePageRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GoodsToUpdatePage(
          initialData: args.initialData,
          key: args.key,
        ),
      );
    },
    HomePageRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    ProfilePageRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    RestOfGoodsPageRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RestOfGoodsPage(),
      );
    },
    ReviewsPageRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReviewsPage(),
      );
    },
    UpdateRestOfGoodsPageRouter.name: (routeData) {
      final args = routeData.argsAs<UpdateRestOfGoodsPageRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdateRestOfGoodsPage(
          initialData: args.initialData,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [ChooseGoodsPage]
class ChooseGoodsPageRouter extends PageRouteInfo<void> {
  const ChooseGoodsPageRouter({List<PageRouteInfo>? children})
      : super(
          ChooseGoodsPageRouter.name,
          initialChildren: children,
        );

  static const String name = 'ChooseGoodsPageRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GoodsToUpdatePage]
class GoodsToUpdatePageRouter
    extends PageRouteInfo<GoodsToUpdatePageRouterArgs> {
  GoodsToUpdatePageRouter({
    required GoodsToUpdateInitialData initialData,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          GoodsToUpdatePageRouter.name,
          args: GoodsToUpdatePageRouterArgs(
            initialData: initialData,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GoodsToUpdatePageRouter';

  static const PageInfo<GoodsToUpdatePageRouterArgs> page =
      PageInfo<GoodsToUpdatePageRouterArgs>(name);
}

class GoodsToUpdatePageRouterArgs {
  const GoodsToUpdatePageRouterArgs({
    required this.initialData,
    this.key,
  });

  final GoodsToUpdateInitialData initialData;

  final Key? key;

  @override
  String toString() {
    return 'GoodsToUpdatePageRouterArgs{initialData: $initialData, key: $key}';
  }
}

/// generated route for
/// [HomePage]
class HomePageRouter extends PageRouteInfo<void> {
  const HomePageRouter({List<PageRouteInfo>? children})
      : super(
          HomePageRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfilePageRouter extends PageRouteInfo<void> {
  const ProfilePageRouter({List<PageRouteInfo>? children})
      : super(
          ProfilePageRouter.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePageRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RestOfGoodsPage]
class RestOfGoodsPageRouter extends PageRouteInfo<void> {
  const RestOfGoodsPageRouter({List<PageRouteInfo>? children})
      : super(
          RestOfGoodsPageRouter.name,
          initialChildren: children,
        );

  static const String name = 'RestOfGoodsPageRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReviewsPage]
class ReviewsPageRouter extends PageRouteInfo<void> {
  const ReviewsPageRouter({List<PageRouteInfo>? children})
      : super(
          ReviewsPageRouter.name,
          initialChildren: children,
        );

  static const String name = 'ReviewsPageRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdateRestOfGoodsPage]
class UpdateRestOfGoodsPageRouter
    extends PageRouteInfo<UpdateRestOfGoodsPageRouterArgs> {
  UpdateRestOfGoodsPageRouter({
    required UpdateRestOfGoodsInitialData initialData,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UpdateRestOfGoodsPageRouter.name,
          args: UpdateRestOfGoodsPageRouterArgs(
            initialData: initialData,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateRestOfGoodsPageRouter';

  static const PageInfo<UpdateRestOfGoodsPageRouterArgs> page =
      PageInfo<UpdateRestOfGoodsPageRouterArgs>(name);
}

class UpdateRestOfGoodsPageRouterArgs {
  const UpdateRestOfGoodsPageRouterArgs({
    required this.initialData,
    this.key,
  });

  final UpdateRestOfGoodsInitialData initialData;

  final Key? key;

  @override
  String toString() {
    return 'UpdateRestOfGoodsPageRouterArgs{initialData: $initialData, key: $key}';
  }
}
