import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/common/ui/common_button.dart';
import 'package:wb_warehouse/common/ui/progress_indicator_widget.dart';
import 'package:wb_warehouse/common/ui/searh_bar_widget/search_bar_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget_data.dart';
import 'package:wb_warehouse/features/inventory_table/pages/inventory_table_page/di/inventory_table_wm_builder.dart';
import 'package:wb_warehouse/features/inventory_table/pages/inventory_table_page/inventory_table_wm.dart';

class InventoryTablePage extends ElementaryWidget<InventoryTableWm> {
  const InventoryTablePage({super.key}) : super(createInventoryTableWm);

  @override
  Widget build(wm) {
    return Scaffold(
      body: StreamBuilder<bool>(
        stream: wm.loadingStream,
        builder: (_, isLoading) {
          if (isLoading.data ?? true) {
            return const Center(child: ProgressIndicatorWidget());
          }

          return Column(
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SearchBarWidget(
                      textEditingController: wm.searchTextController,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      isEnabled: true,
                      onChanged: wm.onSearchInput,
                    ),
                  ),
                  StreamBuilder<bool>(
                    initialData: false,
                    stream: wm.isUpdataButtonActiveStream,
                    builder: (context, isActive) {
                      return CommonButton(
                        title: wm.editButtonTitle,
                        isActive: isActive.data ?? false,
                        onTap: wm.onEditTap,
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  CommonButton(
                    title: wm.updateDataButtonTitle,
                    onTap: wm.onDataUpdateTap,
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 8),
              StreamBuilder<TableWidgetData>(
                stream: wm.tableDataStream,
                builder: (_, tableData) {
                  if (tableData.data == null) {
                    return const SizedBox.shrink();
                  }

                  return Expanded(child: TableWidget(data: tableData.data!));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
