import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/utils/assets.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

class EmptyWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const EmptyWidget({
    super.key,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeProvider>().appTheme;
    final subtitle = this.subtitle;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Assets.emptyListPlaceholder),
        const SizedBox(height: 24),
        Text(title ?? context.localizations.empty, style: appTheme.emptyWidgetTitleStyle),
        const SizedBox(height: 8),
        if (subtitle != null)
          Text(
            subtitle,
            style: appTheme.emptyWidgetSubtitleStyle,
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
