import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/di/rest_of_goods_wm_builder.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_wm.dart';
import 'package:wb_warehouse/utils/assets.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

class RestOfGoodsPage extends ElementaryWidget<RestOfGoodsWm> {
  const RestOfGoodsPage({super.key}) : super(createRestOfGoodsWm);

  @override
  Widget build(RestOfGoodsWm wm) {
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
        Text(context.localizations.empty, style: theme.emptyWidgetTitleStyle),
        const SizedBox(height: 8),
        Text(
          context.localizations.addNewGoods,
          style: theme.emptyWidgetSubtitleStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
