import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:union_state/union_state.dart';
import 'package:wb_warehouse/common/ui/empty_widget.dart';
import 'package:wb_warehouse/common/ui/progress_indicator_widget.dart';
import 'package:wb_warehouse/features/reviews/dto/response/review_dto.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_wm.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/tabs/reviews/reviews_tab_route.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/widgets/review_widget/review_widget.dart';

@RoutePage(name: ReviewsTabRoute.name)
class ReviewsTab extends StatelessWidget {
  final ReviewsWm wm;

  const ReviewsTab({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return UnionStateListenableBuilder(
      loadingBuilder: (_, __) => const Center(child: ProgressIndicatorWidget()),
      failureBuilder: (_, __, ___) => Center(child: Text(wm.l10n.somethingWentWrong)),
      unionStateListenable: wm.reviewsState,
      builder: (_, reviews) {
        return _ReviewTabState(wm: wm, reviews: reviews);
      },
    );
  }
}

class _ReviewTabState extends StatelessWidget {
  final ReviewsWm wm;
  final List<ReviewDto> reviews;

  const _ReviewTabState({required this.wm, required this.reviews});

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) return const EmptyWidget();
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: reviews.length,
      itemBuilder: (_, index) => ReviewWidget(review: reviews[index]),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
