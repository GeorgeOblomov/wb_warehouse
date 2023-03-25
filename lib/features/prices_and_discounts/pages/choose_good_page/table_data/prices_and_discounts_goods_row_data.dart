import 'package:wb_warehouse/common/base_row_data.dart';

class PricesAndDiscountsGoodsRowData extends BaseRowData {
  final int nmID;
  final num price;
  final int discount;

  PricesAndDiscountsGoodsRowData({
    required this.nmID,
    String? pictureUrl,
    required String name,
    required String barcode,
    required this.price,
    required this.discount,
    bool? isSelected,
  }) : super(
          pictureUrl: pictureUrl,
          name: name,
          barcode: barcode,
          isSelected: isSelected ?? false,
        );
}
