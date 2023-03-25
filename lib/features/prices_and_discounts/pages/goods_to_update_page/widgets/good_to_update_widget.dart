import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/common/ui/common_network_image_widget.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

class GoodToUpdateWidget extends StatelessWidget {
  final String? url;
  final String name;
  final String barcode;
  final num price;
  final int discount;
  final VoidCallback onDelete;
  final Function(String) onPriceChange;
  final Function(String) onDiscountChange;

  const GoodToUpdateWidget({
    super.key,
    this.url,
    required this.name,
    required this.barcode,
    required this.price,
    required this.discount,
    required this.onDelete,
    required this.onPriceChange,
    required this.onDiscountChange,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeProvider>().appTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: appTheme.restGoodItemWidgetBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 3,
              spreadRadius: 2,
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonNetworkImageWidget(url: url),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text('${context.localizations.goodsToUpdateBarcode} $barcode', overflow: TextOverflow.ellipsis),
                  const Spacer(),
                  TextButton(
                    onPressed: onDelete,
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(context.localizations.delete, textAlign: TextAlign.start),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text('${context.localizations.goodsToUpdatePrice}:', overflow: TextOverflow.ellipsis),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 50,
                      child: TextFormField(
                        initialValue: price.toString(),
                        decoration: const InputDecoration(suffixText: '₽'),
                        onChanged: onPriceChange,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('${context.localizations.goodsToUpdateDiscount}:', overflow: TextOverflow.ellipsis),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 50,
                      child: TextFormField(
                        initialValue: discount.toString(),
                        decoration: const InputDecoration(suffixText: '%'),
                        onChanged: onDiscountChange,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
