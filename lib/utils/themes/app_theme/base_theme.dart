import 'package:flutter/material.dart';

abstract class BaseTheme {
  /// Empty widget.
  abstract final TextStyle emptyWidgetTitleStyle;
  abstract final TextStyle emptyWidgetSubtitleStyle;

  /// Search bar widget.
  abstract Color searchBarFillColor;
  abstract Color searchBarElementsColor;

  /// Table widget.
  abstract Color tableRowFillColor;
}
