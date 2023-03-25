import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Widget? leading;
  final bool isActive;
  final VoidCallback? onTap;
  final double? width;

  const CommonButton({
    required this.title,
    this.leading,
    this.isActive = true,
    this.onTap,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeProvider>().appTheme;

    return InkWell(
      // ignore: sort_child_properties_last
      child: Ink(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: isActive ? appTheme.commonButttonActiveBackgroundColor : appTheme.commonButtonInactiveBackgroundColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 10)],
            Text(
              title,
              style: isActive ? appTheme.commonButtonActiveTitleColor : appTheme.commonButtonInactiveTitleColor,
            ),
          ],
        ),
      ),
      onTap: isActive ? onTap : null,
      borderRadius: BorderRadius.circular(16.0),
    );
  }
}
