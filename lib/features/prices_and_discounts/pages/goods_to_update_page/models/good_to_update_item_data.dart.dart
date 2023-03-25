class GoodToUpdateItemData {
  final int nmID;
  final String? pictureUrl;
  final String name;
  final String barcode;
  num price;
  int discount;

  GoodToUpdateItemData({
    required this.nmID,
    this.pictureUrl,
    required this.name,
    required this.barcode,
    required this.price,
    required this.discount,
  });
}
