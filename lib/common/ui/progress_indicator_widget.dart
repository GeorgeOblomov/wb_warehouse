import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeProvider>().appTheme;

    return CircularProgressIndicator(color: appTheme.progressIndicatorColor);
  }
}
