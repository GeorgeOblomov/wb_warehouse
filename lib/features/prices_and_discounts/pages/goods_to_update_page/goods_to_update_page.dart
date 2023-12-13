import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/common/ui/common_button.dart';
import 'package:wb_warehouse/common/ui/empty_widget.dart';
import 'package:wb_warehouse/common/ui/progress_indicator_widget.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/di/goods_to_update_wm_builder.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/goods_to_update_page_route.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/goods_to_update_wm.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/models/good_to_update_item_data.dart.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/models/goods_to_update_initial_data.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/widgets/good_to_update_widget.dart';

@RoutePage(name: GoodsToUpdatePageRoute.name)
class GoodsToUpdatePage extends ElementaryWidget<GoodsToUpdateWm> {
  GoodsToUpdatePage({required GoodsToUpdateInitialData initialData, super.key})
      : super((context) => createGoodsToUpdateWm(context, initialData));

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
                  return const Expanded(child: Center(child: ProgressIndicatorWidget()));
                }

                return StreamBuilder<Iterable<GoodToUpdateItemData>>(
                  stream: wm.goodsToUpdateStream,
                  builder: (_, goodsToUpdate) {
                    if (goodsToUpdate.hasData && (goodsToUpdate.data?.isNotEmpty ?? false)) {
                      return Expanded(
                        child: GridView.count(
                          padding: const EdgeInsets.all(16),
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 5,
                          children: goodsToUpdate.data!.map((e) {
                            return GoodToUpdateWidget(
                              key: ValueKey(e.barcode),
                              url: e.pictureUrl,
                              name: e.name,
                              barcode: e.barcode,
                              price: e.price,
                              discount: e.discount,
                              onDelete: () => wm.onDeleteItem(e),
                              onPriceChange: (value) => wm.onPriceChange(e, value),
                              onDiscountChange: (value) => wm.onDiscountChange(e, value),
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
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonButton(
                      title: wm.bottomButtonTitle(isPrices: true),
                      isActive: canContinue.data ?? false,
                      onTap: () => wm.onContinue(isPrices: true),
                    ),
                    const SizedBox(width: 32),
                    CommonButton(
                      title: wm.bottomButtonTitle(isPrices: false),
                      isActive: canContinue.data ?? false,
                      onTap: () => wm.onContinue(isPrices: false),
                    ),
                  ],
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
