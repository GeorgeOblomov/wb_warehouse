import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/good_details_page/good_details_model.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/good_details_page/good_details_page.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/good_details_page/l10n/good_details_l10n.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/good_details_page/navigation/good_details_navigator.dart';

// ignore_for_file: unused_field
class GoodDetailsWm extends WidgetModel<GoodDetailsPage, GoodDetailsModel> {
  final GoodDetailsL10n _l10n;
  final GoodDetailsNavigator _navigator;

  GoodDetailsWm(
    this._l10n,
    this._navigator,
    super.model,
  );
}
