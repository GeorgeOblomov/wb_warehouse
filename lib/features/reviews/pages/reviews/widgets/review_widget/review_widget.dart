import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/reviews/dto/response/review_dto.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/widgets/review_item_widget.dart';
import 'review_wm.dart';

class ReviewWidget extends ElementaryWidget<ReviewWidgetModel> {
  final ReviewDto review;

  const ReviewWidget({
    required this.review,
    WidgetModelFactory wmFactory = defaultReviewWidgetModelFactory,
    Key? key,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ReviewWidgetModel wm) {
    return ReviewItemWidget(
      review: review,
      onGoodTap: wm.onGoodTap,
    );
  }
}
