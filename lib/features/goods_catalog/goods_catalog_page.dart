import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/utils/assets.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

class GoodsCatalogPage extends StatelessWidget {
  const GoodsCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: _EmptyWidget()),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeProvider>().appTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Assets.emptyListPlaceholder),
        const SizedBox(height: 24),
        Text('Пусто', style: theme.emptyWidgetTitleStyle),
        const SizedBox(height: 8),
        Text(
          'Добавляйте новые товары\nи они появятся здесь!',
          style: theme.emptyWidgetSubtitleStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
