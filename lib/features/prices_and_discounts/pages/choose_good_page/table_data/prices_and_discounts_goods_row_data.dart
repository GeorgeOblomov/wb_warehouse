import 'package:wb_warehouse/common/base_row_data.dart';

class PricesAndDiscountsGoodsRowData extends BaseRowData {
  final int nmID;
  final num price;
  final int discount;

  PricesAndDiscountsGoodsRowData({
    required this.nmID,
    super.pictureUrl,
    required super.name,
    required super.barcode,
    required this.price,
    required this.discount,
    bool? isSelected,
  }) : super(
          isSelected: isSelected ?? false,
        );
}
