import 'package:wb_warehouse/common/base_row_data.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/base_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/text_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget_data.dart';
import 'package:wb_warehouse/common/wm/base_goods_wm.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/choose_goods_model.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/choose_goods_page.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/l10n/choose_goods_l10n.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/navigation/choose_goods_navigator.dart';

class ChooseGoodsWm extends BaseGoodsWm<ChooseGoodsPage, ChooseGoodsModel> {
  final ChooseGoodsL10n _l10n;
  // ignore: unused_field
  final ChooseGoodsNavigator _navigator;

  ChooseGoodsWm(
    this._l10n,
    this._navigator,
    super.model,
  );

  String get updateDataButtonTitle => _l10n.updateDataButtonTitle;

  void onSearchInput(String query) {}

  @override
  TableWidgetData organizeTableData(List<BaseRowData> data) {
    return TableWidgetData(
      columnNames: ['lolkek'],
      rows: data
          .map((e) => <BaseCellWidget>[
                const TextCellWidget(title: 'lolkek'),
              ])
          .toList(),
    );
  }
}
