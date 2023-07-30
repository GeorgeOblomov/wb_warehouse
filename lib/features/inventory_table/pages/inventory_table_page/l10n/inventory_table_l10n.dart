import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/locale/base_l10n.dart';

class InventoryTableL10n extends BaseL10n {
  InventoryTableL10n(super.context);

  String get updateDataButtonTitle => context.localizations.updateButtonTitle;

  String get pictureColumnTitle => context.localizations.inventoryPictureColumnTitle;

  String get editButtonTitle => context.localizations.inventoryEditButtonTitle;

  String get wbArticle => context.localizations.inventoryWBArticle;

  String get goodArticle => context.localizations.inventoryGoodArticle;

  String get goodName => context.localizations.inventoryGoodName;

  String get purchasePrice => context.localizations.inventoryPurchasePrice;

  String get packagingCost => context.localizations.inventoryPackagingCost;

  String get costPrice => context.localizations.inventoryCostPrice;

  String get feePercent => context.localizations.inventoryFeePercent;

  String get wbLogistics => context.localizations.inventoryWBLogistics;

  String get taxRate => context.localizations.inventoryTaxRate;

  String get discountedPrice => context.localizations.inventoryDiscountedPrice;

  String get profit => context.localizations.inventoryProfit;

  String get marginality => context.localizations.inventoryMarginality;

  String get retailPrice => context.localizations.inventoryRetailPrice;

  String get webSiteDiscount => context.localizations.inventoryWebSiteDiscount;
}
