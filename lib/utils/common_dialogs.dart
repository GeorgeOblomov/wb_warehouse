import 'package:flutter/material.dart';

Future<bool?> showConfirmDialog({
  required BuildContext context,
  required String title,
  required String agreeText,
  required String disagreeText,
}) {
  return showDialog<bool>(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text(title),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(disagreeText)),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text(agreeText)),
        ],
      );
    },
    barrierDismissible: false,
  );
}
