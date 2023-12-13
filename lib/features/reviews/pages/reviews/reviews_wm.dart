// ignore_for_file: unused_field

import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/l10n/review_l10n.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/navigation/reviews_navigator.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_model.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_page.dart';

class ReviewsWm extends WidgetModel<ReviewsPage, ReviewsModel> {
  final ReviewsL10n _l10n;
  final ReviewsNavigator _navigator;

  ReviewsWm(
    this._l10n,
    this._navigator,
    super.model,
  );
}
