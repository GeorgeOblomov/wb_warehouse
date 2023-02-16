import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/app/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [
        // (grischenkov): Lately here going to be some providers which will be injected for entire app
      ],
      // (egrischenkov): Lately it will be used as repositories provider.
      // I use it because I need access to "DataManager", which will be injected through the MultiProvider
      child: Consumer(
        builder: (_, __, ___) {
          return const MaterialApp(
            title: 'WB Warehouse',
            home: Home(),
          );
        },
      ),
    );
  }
}
