import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_wm.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/tabs/reviews/reviews_tab_route.dart';

@RoutePage(name: ReviewsTabRoute.name)
class ReviewsTab extends StatelessWidget {
  final ReviewsWm wm;

  const ReviewsTab({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
