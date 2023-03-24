import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/locale/base_l10n.dart';

class ChooseGoodsL10n extends BaseL10n {
  ChooseGoodsL10n(super.context);

  String get updateDataButtonTitle => context.localizations.updateButtonTitle;

  String get pictureColumnTitle => context.localizations.pricesAndDiscountsPicture;

  String get nameColumnTitle => context.localizations.pricesAndDiscountsName;

  String get barcodeColumnTitle => context.localizations.pricesAndDiscountsBarcode;

  String get priceColumnTitle => context.localizations.pricesAndDiscountsPrice;

  String get discountColumnTitle => context.localizations.pricesAndDiscountsDiscount;

  String get updatePriceAndDiscountColumnTitle => context.localizations.pricesAndDiscountsUpdate;

  String get updatePricesAndDiscountsButtonTitle => context.localizations.pricesAndDiscountsUpdate;
}
