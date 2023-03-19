import 'package:auto_route/auto_route.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/locale/locale_provider.dart';

// ignore_for_file: unused_field
class ProfileNavigator {
  final BuildContext _context;
  final StackRouter _router;

  ProfileNavigator(this._context) : _router = _context.router;

  Future<LocaleCode?> showLocalesDialog({LocaleCode? initialCode}) async {
    int selectedRadio = initialCode == null ? 0 : LocaleCode.values.indexOf(initialCode);

    return showDialog(
      context: _context,
      builder: (_) {
        return AlertDialog(
          title: Text(_context.localizations.profilePageLocalesDialogTitle),
          content: StatefulBuilder(builder: (_, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: List<Widget>.generate(LocaleCode.values.length, (int index) {
                return RadioListTile<int>(
                  value: index,
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    setState(() => selectedRadio = value!);
                  },
                  title: Text(EnumToString.convertToString(LocaleCode.values[index])),
                );
              }),
            );
          }),
          actionsPadding: const EdgeInsets.all(16),
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
        );
      },
    ).then((_) {
      return LocaleCode.values[selectedRadio];
    });
  }
}
