import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'review_model.dart';
import 'review_widget.dart';

ReviewWidgetModel defaultReviewWidgetModelFactory(BuildContext context) {
  return ReviewWidgetModel(ReviewModel());
}

class ReviewWidgetModel extends WidgetModel<ReviewWidget, ReviewModel> {
  ReviewWidgetModel(super.model);

  void onGoodTap() {}
}
