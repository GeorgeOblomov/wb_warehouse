import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/locale/base_l10n.dart';

class UpdateRestOfGoodsL10n extends BaseL10n {
  UpdateRestOfGoodsL10n(super.context);

  String get pageTitle => context.localizations.updateRestOfGoodsPageTitle;

  String get bottomButtonTitle => context.localizations.updateRestOfGoodsBottomButtonTitle;

  String get confirmDialogTitle => context.localizations.updateRestOfGoodsConfirmDialogTitle;

  String get confirmDialogAgree => context.localizations.updateRestOfGoodsConfirmDialogAgree;

  String get confirmDialogDisagree => context.localizations.updateRestOfGoodsConfirmDialogDisagree;
}
