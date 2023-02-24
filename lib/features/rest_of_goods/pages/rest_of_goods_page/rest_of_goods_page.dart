import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_logger/surf_logger.dart';
import 'package:wb_warehouse/common/ui/common_button.dart';
import 'package:wb_warehouse/common/ui/searh_bar_widget/search_bar_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/di/rest_of_goods_wm_builder.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_wm.dart';
import 'package:wb_warehouse/utils/assets.dart';

class RestOfGoodsPage extends ElementaryWidget<RestOfGoodsWm> {
  const RestOfGoodsPage({super.key}) : super(createRestOfGoodsWm);

  @override
  Widget build(RestOfGoodsWm wm) {
    return Scaffold(
      body: StreamBuilder<bool>(
        stream: wm.loadingStream,
        builder: (_, isLoading) {
          if (isLoading.data ?? true) {
            return Center(child: CircularProgressIndicator(color: wm.progressIndicatorColor));
          }

          return Column(
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SearchBarWidget(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      isEnabled: true,
                      suffixIcon: IconButton(
                        onPressed: wm.showFiltersDialog,
                        icon: SvgPicture.asset(Assets.filtersIcon, color: wm.filtersIconColor),
                      ),
                    ),
                  ),
                  CommonButton(
                    title: wm.updateButtonTitle,
                    onTap: () {
                      Logger.d('press on update button');
                    },
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

                  return Expanded(child: TableWidget(data: wm.getTableData()));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
