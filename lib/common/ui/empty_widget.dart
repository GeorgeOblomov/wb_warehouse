import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/utils/assets.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

// ignore_for_file: unused_element
class EmptyWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool withSubtitle;

  const EmptyWidget({
    Key? key,
    this.title,
    this.subtitle,
    this.withSubtitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeProvider>().appTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Assets.emptyListPlaceholder),
        const SizedBox(height: 24),
        Text(title ?? context.localizations.empty, style: appTheme.emptyWidgetTitleStyle),
        const SizedBox(height: 8),
        if (withSubtitle)
          Text(
            subtitle ?? context.localizations.addNewGoods,
            style: appTheme.emptyWidgetSubtitleStyle,
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
