import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget_data.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

class TableWidget extends StatelessWidget {
  final TableWidgetData data;
  final EdgeInsets? padding;

  const TableWidget({required this.data, this.padding, super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeProvider>().appTheme;

    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _Header(columnNames: data.columnNames),
          const SizedBox(height: 4),
          Expanded(
            child: SingleChildScrollView(
              child: DecoratedBox(
                decoration: BoxDecoration(color: appTheme.tableRowFillColor),
                child: Table(
                  children: data.rows.map((dataList) => _buildRow(dataList)).toList(),
                  border: TableBorder.all(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildRow(List<String?> cells) {
    return TableRow(
      children: cells.map((cell) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Text(cell ?? ''),
        );
      }).toList(),
    );
  }
}

class _Header extends StatelessWidget {
  final List<String> columnNames;

  const _Header({required this.columnNames});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeProvider>().appTheme;

    return DecoratedBox(
      decoration: BoxDecoration(color: appTheme.tableRowFillColor),
      child: Table(
        children: [
          TableRow(
            children: columnNames.map((name) {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: Text(name),
              );
            }).toList(),
          ),
        ],
        border: TableBorder.all(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
