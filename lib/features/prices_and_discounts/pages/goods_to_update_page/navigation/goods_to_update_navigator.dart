import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// ignore_for_file: unused_field
class GoodsToUpdateNavigator {
  final BuildContext _context;
  final StackRouter _router;

  GoodsToUpdateNavigator(this._context) : _router = _context.router;

  void goHome({bool needToUpdate = false}) {
    _router.pop(needToUpdate);
  }
}
