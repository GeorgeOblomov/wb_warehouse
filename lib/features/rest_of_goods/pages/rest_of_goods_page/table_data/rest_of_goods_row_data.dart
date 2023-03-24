import 'package:wb_warehouse/common/base_row_data.dart';

class RestOfGoodsRowData extends BaseRowData {
  final String supplierArticle;
  final int quantity;

  RestOfGoodsRowData({
    String? pictureUrl,
    required String name,
    required this.supplierArticle,
    required String barcode,
    required this.quantity,
    bool? isSelected,
  }) : super(
          pictureUrl: pictureUrl,
          name: name,
          barcode: barcode,
          isSelected: isSelected ?? false,
        );
}
