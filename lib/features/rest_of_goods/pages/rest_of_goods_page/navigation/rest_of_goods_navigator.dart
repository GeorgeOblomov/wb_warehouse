import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/common/ui/table_widget/network_picture_dialog.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_wm.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/models/update_rest_of_goods_initial_data.dart';
import 'package:wb_warehouse/router/app_router.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';

// ignore_for_file: unused_field
class RestOfGoodsNavigator {
  final BuildContext _context;
  final StackRouter _router;

  RestOfGoodsNavigator(this._context) : _router = _context.router;

  Future<void> showPictureDialog(String url) {
    return showDialog(
      context: _context,
      builder: (_) {
        return NetworkPictureDialog(url: url);
      },
    );
  }

  Future<FilterType?> showFiltersDialog({
    FilterType? initialType,
    required String Function(FilterType) getFilterTitle,
  }) async {
    int selectedRadio = initialType == null ? 0 : FilterType.values.indexOf(initialType);
    final selectedType = await showDialog(
      context: _context,
      builder: (_) {
        return AlertDialog(
          title: Text(_context.localizations.restOfGoodsChooseSearchFilterTitle),
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
                  title: Text(getFilterTitle(FilterType.values[index])),
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
      return FilterType.values[selectedRadio];
    });

    return selectedType;
  }

  void goToUpdateRestOfGoodsPage(UpdateRestOfGoodsInitialData initialData) {
    _router.push(UpdateRestOfGoodsRoute(initialData: initialData));
  }
}
