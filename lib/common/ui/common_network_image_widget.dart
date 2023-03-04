import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/common/ui/progress_indicator_widget.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

class CommonNetworkImageWidget extends StatelessWidget {
  final String? url;

  const CommonNetworkImageWidget({this.url, super.key});

  @override
  Widget build(BuildContext context) {
    if (url != null) {
      return Image.network(
        url!,
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return const Center(child: ProgressIndicatorWidget());
        },
        errorBuilder: (_, __, ___) => const _ErrorWidget(),
      );
    }

    return const _ErrorWidget();
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeProvider>().appTheme;

    return Icon(
      Icons.error,
      color: appTheme.networkPictureCellErrorIconColor,
    );
  }
}
