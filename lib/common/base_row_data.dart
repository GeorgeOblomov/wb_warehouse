class BaseRowData {
  final String? pictureUrl;
  final String name;
  final String barcode;
  bool isSelected;

  BaseRowData({
    required this.pictureUrl,
    required this.name,
    required this.barcode,
    this.isSelected = false,
  });
}
