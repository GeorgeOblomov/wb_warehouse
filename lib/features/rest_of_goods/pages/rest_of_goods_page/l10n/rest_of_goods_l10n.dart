import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/locale/base_l10n.dart';

class RestOfGoodsL10n extends BaseL10n {
  RestOfGoodsL10n(super.context);

  String get updateDataButtonTitle => context.localizations.updateButtonTitle;

  String get updateRestOfGoodsButtonTitle => context.localizations.updateRestOfGoodsButtonTitle;

  String get nameColumnTitle => context.localizations.restOfGoodsName;

  String get supplierArticleColumnTitle => context.localizations.restOfGoodsSupplierArticle;

  String get barcodeColumnTitle => context.localizations.restOfGoodsBarcode;

  String get quantityColumnTitle => context.localizations.restOfGoodsQuantity;

  String get costPriceColumnTitle => context.localizations.restOfGoodsCostPrice;

  String get totalPriceColumnTitle => context.localizations.restOfGoodsTotalCostPrice;

  String get pictureColumnTitle => context.localizations.restOfGoodsPicture;

  String get updateRestOfGoods => context.localizations.updateRestOfGoods;
}
