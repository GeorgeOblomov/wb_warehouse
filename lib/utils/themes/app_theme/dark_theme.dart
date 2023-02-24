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
  Color tableRowFillColor = const Color(0xFFF5F5F5);

  @override
  Color progressIndicatorColor = const Color(0xFF4CAF50);
}
