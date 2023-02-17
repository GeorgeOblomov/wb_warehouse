import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/router/app_router.dart';

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
        GoodsCatalogRoute(),
        GoodsCatalogRoute(),
        GoodsCatalogRoute(),
      ],
      builder: (context, child, controller) {
        final tabsRouter = context.tabsRouter;

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Каталог товаров'),
              BottomNavigationBarItem(icon: Icon(Icons.warehouse), label: 'Приход'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Профиль'),
            ],
            onTap: tabsRouter.setActiveIndex,
            currentIndex: tabsRouter.activeIndex,
          ),
        );
      },
    );
  }
}
