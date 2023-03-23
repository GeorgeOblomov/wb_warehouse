import 'package:wb_warehouse/common/base_row_data.dart';

class PricesAndDiscountsGoodsRowData extends BaseRowData {
  final String barcode;
  final num price;
  final int discount;
  bool isSelected;

  PricesAndDiscountsGoodsRowData({
    String? pictureUrl,
    required String name,
    required this.barcode,
    required this.price,
    required this.discount,
    this.isSelected = false,
  }) : super(pictureUrl: pictureUrl, name: name);
}
