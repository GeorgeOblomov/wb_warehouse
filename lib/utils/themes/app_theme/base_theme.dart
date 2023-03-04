import 'package:flutter/material.dart';

abstract class BaseTheme {
  /// Empty widget.
  abstract final TextStyle emptyWidgetTitleStyle;
  abstract final TextStyle emptyWidgetSubtitleStyle;

  /// Search bar widget.
  abstract Color searchBarFillColor;
  abstract Color searchBarElementsColor;
  abstract Color filtersIconColor;

  /// Table widget.
  abstract Color tableRowFillColor;

  /// Circular progress indicator.
  abstract Color progressIndicatorColor;

  /// Common button.
  abstract Color commonButttonActiveBackgroundColor;
  abstract Color commonButtonInactiveBackgroundColor;
  abstract TextStyle commonButtonActiveTitleColor;
  abstract TextStyle commonButtonInactiveTitleColor;

  /// Network picture cell.
  abstract Color networkPictureCellErrorIconColor;
}
