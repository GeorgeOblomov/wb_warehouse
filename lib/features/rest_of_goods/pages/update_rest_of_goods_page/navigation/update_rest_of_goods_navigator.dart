import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/router/app_router.dart';

class UpdateRestOfGoodsNavigator {
  final BuildContext _context;
  final StackRouter _router;

  UpdateRestOfGoodsNavigator(this._context) : _router = _context.router;

  Future<bool?> showConfirmDialog(String title, String agreeText, String disagreeText) {
    return showDialog<bool>(
      context: _context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          actions: [
            TextButton(onPressed: () => _router.pop(false), child: Text(disagreeText)),
            TextButton(onPressed: () => _router.pop(true), child: Text(agreeText)),
          ],
        );
      },
      barrierDismissible: false,
    );
  }

  void goHome() {
    _router.replaceAll([const HomeRoute()]);
  }
}
