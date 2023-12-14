import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_wm.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/tabs/questions/questions_tab_route.dart';

@RoutePage(name: QuestionsTabRoute.name)
class QuestionsTab extends StatelessWidget {
  final ReviewsWm wm;
  const QuestionsTab({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
