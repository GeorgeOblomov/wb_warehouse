import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/l10n/review_l10n.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/navigation/reviews_navigator.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_model.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_wm.dart';

ReviewsWm createReviewWm(BuildContext context) {
  return ReviewsWm(
    ReviewsL10n(context),
    ReviewsNavigator(context),
    ReviewsModel(),
  );
}
