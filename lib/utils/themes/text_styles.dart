import 'package:flutter/material.dart';

// ignore_for_file: member-ordering
class TextStyles {
  static const _baseBlackTextStyle = TextStyle(color: Color(0xFF111E29));
  static const _baseWhiteTextStyle = TextStyle(color: Colors.white);

  static final base14Black = _baseBlackTextStyle.copyWith(fontSize: 14);
  static final base14White = _baseWhiteTextStyle.copyWith(fontSize: 14);
  static final base14Grey = base14Black.copyWith(color: const Color(0xFF7C7E92));
  static final base18Grey = base14Grey.copyWith(fontSize: 18);
}
