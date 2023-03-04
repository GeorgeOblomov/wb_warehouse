import 'package:flutter/material.dart';

// ignore_for_file: sort_child_properties_last
abstract class BaseCellWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const BaseCellWidget({this.onTap, super.key});

  Widget child(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return TableRowInkWell(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: child(context),
      ),
      onTap: onTap,
    );
  }
}
