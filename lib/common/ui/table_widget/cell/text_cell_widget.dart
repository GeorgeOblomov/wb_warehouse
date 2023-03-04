import 'package:flutter/material.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/base_cell_widget.dart';

class TextCellWidget extends BaseCellWidget {
  final String title;

  const TextCellWidget({
    required this.title,
    super.onTap,
    super.key,
  });

  @override
  Widget child(BuildContext context) {
    return Text(title);
  }
}
