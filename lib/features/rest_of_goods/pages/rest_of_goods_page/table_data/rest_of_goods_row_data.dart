import 'package:wb_warehouse/common/base_row_data.dart';

class RestOfGoodsRowData extends BaseRowData {
  final String supplierArticle;
  final int quantity;

  RestOfGoodsRowData({
    super.pictureUrl,
    required super.name,
    required this.supplierArticle,
    required super.barcode,
    required this.quantity,
    bool? isSelected,
  }) : super(
          isSelected: isSelected ?? false,
        );
}
