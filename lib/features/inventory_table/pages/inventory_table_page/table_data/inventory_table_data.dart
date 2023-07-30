import 'package:wb_warehouse/common/base_row_data.dart';

class InventoryTableData extends BaseRowData {
  final int nmId;
  final String supplierArticle;
  final num purchasePrice;
  final num packagingCost;
  final num costPrice;
  final num feePercent;
  final num wbLogistics;
  final num taxRate;
  final num discountedPrice;
  final num profit;
  final num marginality;
  final num retailPrice;
  final num webSiteDiscount;

  InventoryTableData({
    String? pictureUrl,
    required this.nmId,
    required String name,
    required String barcode,
    required this.supplierArticle,
    required this.purchasePrice,
    required this.packagingCost,
    required this.costPrice,
    required this.feePercent,
    required this.wbLogistics,
    required this.taxRate,
    required this.discountedPrice,
    required this.profit,
    required this.marginality,
    required this.retailPrice,
    required this.webSiteDiscount,
    bool? isSelected,
  }) : super(
          pictureUrl: pictureUrl,
          name: name,
          barcode: barcode,
          isSelected: isSelected ?? false,
        );
}
