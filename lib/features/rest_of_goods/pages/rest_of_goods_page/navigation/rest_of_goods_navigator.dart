import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_wm.dart';

// ignore_for_file: unused_field
class RestOfGoodsNavigator {
  final BuildContext _context;
  final StackRouter _router;

  RestOfGoodsNavigator(this._context) : _router = _context.router;

  Future<FilterType?> showFiltersDialog({FilterType? initialType}) async {
    final selectedType = await showDialog(
      context: _context,
      builder: (_) {
        int selectedRadio = initialType == null ? 0 : FilterType.values.indexOf(initialType);

        return AlertDialog(
          title: const Text('Выберите фильтр поиска'),
          content: StatefulBuilder(builder: (_, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: List<Widget>.generate(FilterType.values.length, (int index) {
                return RadioListTile<int>(
                  value: index,
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    setState(() => selectedRadio = value!);
                  },
                  title: Text(FilterType.values[index].toString()),
                );
              }),
            );
          }),
          actions: [
            TextButton(
              onPressed: () => _router.pop(FilterType.values[selectedRadio]),
              child: const Text('Выбрать'),
            ),
          ],
          actionsPadding: const EdgeInsets.all(16),
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
        );
      },
    );

    return selectedType;
  }
}
