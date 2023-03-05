class RestOfGoodsRowData {
  final String? pictureUrl;
  final String name;
  final String supplierArticle;
  final String barcode;
  final int quantity;
  bool isSelected;

  RestOfGoodsRowData({
    this.pictureUrl,
    required this.name,
    required this.supplierArticle,
    required this.barcode,
    required this.quantity,
    this.isSelected = false,
  });
}
