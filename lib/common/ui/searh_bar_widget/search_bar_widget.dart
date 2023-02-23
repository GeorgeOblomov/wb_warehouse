import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/utils/assets.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final bool isEnabled;
  final EdgeInsets? padding;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  const SearchBarWidget({
    this.textEditingController,
    this.padding = EdgeInsets.zero,
    this.isEnabled = true,
    this.suffixIcon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<ThemeProvider>().appTheme;

    return Material(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: context.localizations.searchBarHint,
            hintStyle: TextStyle(color: appTheme.searchBarElementsColor),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: SvgPicture.asset(Assets.searchIcon, color: appTheme.searchBarElementsColor),
            ),
            suffixIcon: Padding(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12), child: suffixIcon),
            filled: true,
            fillColor: appTheme.searchBarFillColor,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: appTheme.searchBarFillColor),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: appTheme.searchBarFillColor),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          readOnly: !isEnabled,
          onTap: onTap,
        ),
      ),
    );
  }
}
