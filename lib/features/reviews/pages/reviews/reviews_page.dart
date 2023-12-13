import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/di/reviews_wm_builder.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_page_route.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_wm.dart';

@RoutePage(name: ReviewsPageRoute.name)
class ReviewsPage extends ElementaryWidget<ReviewsWm> {
  const ReviewsPage({
    super.key,
  }) : super(createReviewWm);

  @override
  Widget build(ReviewsWm wm) {
    return const Placeholder();
  }
}
