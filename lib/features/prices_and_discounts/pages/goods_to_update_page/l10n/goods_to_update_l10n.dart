import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/locale/base_l10n.dart';

class GoodsToUpdateL10n extends BaseL10n {
  GoodsToUpdateL10n(super.context);

  String get goodsToUpdatePageTitle => context.localizations.goodsToUpdatePageTitle;

  String get goodsToUpdatePricesButtonTitle => context.localizations.goodsToUpdatePricesButtonTitle;

  String get goodsToUpdateDiscountsButtonTitle => context.localizations.goodsToUpdateDiscountsButtonTitle;

  String get goodsToUpdatePricesConfirmDialogTitle => context.localizations.goodsToUpdatePricesConfirmDialogTitle;

  String get goodsToUpdateDiscountsConfirmDialogTitle => context.localizations.goodsToUpdateDiscountsConfirmDialogTitle;

  String get goodsToUpdateConfirmDialogAgreeText => context.localizations.goodsToUpdateConfirmDialogAgreeText;

  String get goodsToUpdateConfirmDialogDisagreeText => context.localizations.goodsToUpdateConfirmDialogDisagreeText;
}
