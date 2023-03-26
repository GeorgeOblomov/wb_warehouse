import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/locale/base_l10n.dart';

class GoodsToUpdateL10n extends BaseL10n {
  GoodsToUpdateL10n(super.context);

  String get goodsToUpdatePageTitle => context.localizations.goodsToUpdatePageTitle;

  String get goodsToUpdateUpdateButtonTitle => context.localizations.goodsToUpdateUpdateButtonTitle;

  String get goodsToUpdateConfirmDialogTitle => context.localizations.goodsToUpdateConfirmDialogTitle;

  String get goodsToUpdateConfirmDialogAgreeText => context.localizations.goodsToUpdateConfirmDialogAgreeText;

  String get goodsToUpdateConfirmDialogDisagreeText => context.localizations.goodsToUpdateConfirmDialogDisagreeText;
}
