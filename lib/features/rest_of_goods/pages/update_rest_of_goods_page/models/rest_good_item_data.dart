class RestGoodItemData {
  final String? url;
  final String name;
  final String barcode;
  int amount;

  RestGoodItemData({
    this.url,
    required this.name,
    required this.barcode,
    this.amount = 0,
  });
}
