import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/locale/base_l10n.dart';

class ProfileL10n extends BaseL10n {
  ProfileL10n(super.localizations);

  String get themeItemTitle => context.localizations.profilePageThemeItemTitle;

  String get localeItemTitle => context.localizations.profilePageLocaleItemTitle;
}
