import 'package:flutter/material.dart';
import 'package:wb_warehouse/data_management/common/data_error.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';

class WBErrorHandler {
  void handleError(BuildContext context, Object? error) {
    if (error is DataError) {
      final errorText = error.message;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorText ?? context.localizations.somethingWentWrong),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }
}
