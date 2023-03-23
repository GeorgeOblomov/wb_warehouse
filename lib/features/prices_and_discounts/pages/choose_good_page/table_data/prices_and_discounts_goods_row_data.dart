import 'package:wb_warehouse/common/base_row_data.dart';

class PricesAndDiscountsGoodsRowData extends BaseRowData {
  final String barcode;
  final num price;
  final int discount;

  PricesAndDiscountsGoodsRowData({
    String? pictureUrl,
    required String name,
    required this.barcode,
    required this.price,
    required this.discount,
  }) : super(pictureUrl: pictureUrl, name: name);
}
