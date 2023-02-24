import 'package:flutter/material.dart';
import 'package:wb_warehouse/utils/themes/app_theme/base_theme.dart';
import 'package:wb_warehouse/utils/themes/text_styles.dart';

class DarkTheme extends BaseTheme {
  @override
  TextStyle get emptyWidgetTitleStyle => TextStyles.base18Grey;

  @override
  TextStyle get emptyWidgetSubtitleStyle => TextStyles.base14Grey;

  @override
  Color searchBarElementsColor = const Color(0xFF7C7E92);

  @override
  Color searchBarFillColor = const Color(0xFF4CAF50);

  @override
  Color filtersIconColor = const Color(0xFF4CAF50);

  @override
  Color tableRowFillColor = const Color(0xFFF5F5F5);

  @override
  Color progressIndicatorColor = const Color(0xFF4CAF50);

  @override
  Color commonButtonInactiveBackgroundColor = const Color(0xFFF5F5F5);

  @override
  Color commonButttonActiveBackgroundColor = const Color(0xFF4CAF50);

  @override
  TextStyle commonButtonActiveTitleColor = TextStyles.base14White.copyWith(fontWeight: FontWeight.w700);

  @override
  TextStyle commonButtonInactiveTitleColor = TextStyles.baseDarkGrey.copyWith(fontWeight: FontWeight.w700);
}
