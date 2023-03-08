import 'package:flutter/material.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/base_cell_widget.dart';

class CheckBoxCellWidget extends BaseCellWidget {
  final bool initialValue;
  final ValueChanged<bool?> onChanged;

  const CheckBoxCellWidget({required this.initialValue, required this.onChanged, super.key});

  @override
  Widget child(BuildContext context) {
    return _Checkbox(initialValue: initialValue, onChanged: onChanged);
  }
}

class _Checkbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool?> onChanged;

  const _Checkbox({required this.initialValue, required this.onChanged});

  @override
  State<_Checkbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<_Checkbox> {
  bool? _selected;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _selected ?? widget.initialValue,
      onChanged: (selected) {
        setState(() {
          _selected = selected;
        });
        widget.onChanged(selected);
      },
    );
  }
}
