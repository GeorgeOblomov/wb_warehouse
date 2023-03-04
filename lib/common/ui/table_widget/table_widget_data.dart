import 'package:wb_warehouse/common/ui/table_widget/cell/base_cell_widget.dart';

class TableWidgetData {
  final List<String> columnNames;
  final List<List<BaseCellWidget>> rows;

  TableWidgetData({
    required this.columnNames,
    required this.rows,
  }) : assert(rows.every((element) => element.length == columnNames.length));
}
