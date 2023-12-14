// ignore_for_file: unused_field

import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/l10n/review_l10n.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/navigation/reviews_navigator.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_model.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_page.dart';
import 'package:wb_warehouse/router/app_router.dart';

class ReviewsWm extends WidgetModel<ReviewsPage, ReviewsModel> {
  final ReviewsL10n l10n;
  final ReviewsNavigator _navigator;

  ReviewsWm(
    this.l10n,
    this._navigator,
    super.model,
  );

  List<PageRouteInfo> get routes => [
        ReviewsTabRouter(wm: this),
        QuestionsTabRouter(wm: this),
      ];
}
