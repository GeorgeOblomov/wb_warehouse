import 'package:flutter/material.dart';
import 'package:wb_warehouse/app/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'WB Warehouse',
      home: Home(),
    );
  }
}
