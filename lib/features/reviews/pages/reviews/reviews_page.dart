import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/di/reviews_wm_builder.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/models/review_tab_entity.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_page_route.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_wm.dart';

@RoutePage(name: ReviewsPageRoute.name)
class ReviewsPage extends ElementaryWidget<ReviewsWm> {
  const ReviewsPage({
    super.key,
  }) : super(createReviewWm);

  @override
  Widget build(ReviewsWm wm) {
    return AutoTabsRouter.tabBar(
      routes: wm.routes,
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(82),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: TabBar(
                onTap: tabsRouter.setActiveIndex,
                labelPadding: EdgeInsets.zero,
                controller: controller,
                tabs: ReviewsTabEntity.values
                    .map(
                      (e) => Tab(
                        height: 50,
                        child: Center(
                          child: Text(
                            e.title(wm.l10n),
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
