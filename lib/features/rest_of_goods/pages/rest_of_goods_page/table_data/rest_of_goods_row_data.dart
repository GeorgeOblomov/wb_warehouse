import 'package:wb_warehouse/common/base_row_data.dart';

class RestOfGoodsRowData extends BaseRowData {
  final String supplierArticle;
  final String barcode;
  final int quantity;
  bool isSelected;

  RestOfGoodsRowData({
    String? pictureUrl,
    required String name,
    required this.supplierArticle,
    required this.barcode,
    required this.quantity,
    this.isSelected = false,
  }) : super(pictureUrl: pictureUrl, name: name);
}
