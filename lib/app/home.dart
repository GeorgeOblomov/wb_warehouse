import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/goods_catalog/goods_catalog_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Каталог товаров',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.warehouse),
              label: 'Приход',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Профиль',
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            GoodsCatalogPage(),
            GoodsCatalogPage(),
            GoodsCatalogPage(),
          ],
        ),
      ),
    );
  }
}
