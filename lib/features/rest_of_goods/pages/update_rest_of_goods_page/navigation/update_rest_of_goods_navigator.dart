import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class UpdateRestOfGoodsNavigator {
  final StackRouter _router;

  UpdateRestOfGoodsNavigator(BuildContext context) : _router = context.router;

  void goHome({bool needToUpdate = false}) {
    _router.pop(needToUpdate);
  }
}
