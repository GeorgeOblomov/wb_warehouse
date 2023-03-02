class TableWidgetData {
  final List<String> columnNames;
  final List<List<String?>> rows;

  TableWidgetData({
    required this.columnNames,
    required this.rows,
  }) : assert(rows.every((element) => element.length == columnNames.length));
}
