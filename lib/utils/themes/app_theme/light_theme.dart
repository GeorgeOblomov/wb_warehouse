import 'package:flutter/material.dart';
import 'package:wb_warehouse/utils/themes/app_theme/base_theme.dart';
import 'package:wb_warehouse/utils/themes/text_styles.dart';

class LightTheme extends BaseTheme {
  /// Empty widget.
  @override
  TextStyle get emptyWidgetTitleStyle => TextStyles.base18Grey;

  @override
  TextStyle get emptyWidgetSubtitleStyle => TextStyles.base14Grey;
}
