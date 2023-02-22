import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/router/app_router.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        RestOfGoodsRoute(),
        RestOfGoodsRoute(),
        RestOfGoodsRoute(),
      ],
      builder: (context, child, controller) {
        final tabsRouter = context.tabsRouter;

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: const Icon(Icons.menu), label: context.localizations.goodsCatalog),
              BottomNavigationBarItem(icon: const Icon(Icons.warehouse), label: context.localizations.arrival),
              BottomNavigationBarItem(icon: const Icon(Icons.person_outline), label: context.localizations.profile),
            ],
            onTap: tabsRouter.setActiveIndex,
            currentIndex: tabsRouter.activeIndex,
          ),
        );
      },
    );
  }
}
