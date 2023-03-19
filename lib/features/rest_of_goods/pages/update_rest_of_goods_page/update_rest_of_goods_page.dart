import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/common/ui/common_button.dart';
import 'package:wb_warehouse/common/ui/empty_widget.dart';
import 'package:wb_warehouse/common/ui/progress_indicator_widget.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/di/update_rest_of_goods_wm_builder.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/models/rest_good_item_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/models/update_rest_of_goods_initial_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/update_rest_of_goods_wm.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/widgets/rest_good_item_widget.dart';

class UpdateRestOfGoodsPage extends ElementaryWidget<UpdateRestOfGoodsWm> {
  UpdateRestOfGoodsPage({
    required UpdateRestOfGoodsInitialData initialData,
    super.key,
  }) : super((context) => createUpdateRestOfGoodsWm(context, initialData));

  @override
  Widget build(wm) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(wm.pageTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<bool>(
              initialData: false,
              stream: wm.loadingStream,
              builder: (context, isLoading) {
                if (isLoading.data ?? true) {
                  return const Center(child: ProgressIndicatorWidget());
                }

                return StreamBuilder<Iterable<RestGoodItemData>>(
                  stream: wm.restOfGoodsItemsStream,
                  builder: (_, restOfGoodsData) {
                    if (restOfGoodsData.hasData && (restOfGoodsData.data?.isNotEmpty ?? false)) {
                      return Expanded(
                        child: GridView.count(
                          padding: const EdgeInsets.all(16),
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 5,
                          children: restOfGoodsData.data!.map((e) {
                            return RestGoodItemWidget(
                              url: e.url,
                              name: e.name,
                              barcode: e.barcode,
                              amount: e.amount,
                              onDelete: () => wm.onDeleteItem(e),
                              onAmountChanged: (value) => wm.onItemAmountChange(e, value),
                              key: ValueKey(e.barcode),
                            );
                          }).toList(),
                        ),
                      );
                    }

                    return const Expanded(child: EmptyWidget());
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            StreamBuilder<bool>(
              initialData: true,
              stream: wm.canContinueStream,
              builder: (context, canContinue) {
                return CommonButton(
                  title: wm.bottomButtonTitle,
                  isActive: canContinue.data ?? false,
                  onTap: wm.onContinue,
                  width: 150,
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
