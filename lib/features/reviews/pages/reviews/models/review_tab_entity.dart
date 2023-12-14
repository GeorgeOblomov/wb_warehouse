import 'package:wb_warehouse/features/reviews/pages/reviews/l10n/review_l10n.dart';

enum ReviewsTabEntity {
  reviews,
  questions,
}

extension ReviewsTabEntityX on ReviewsTabEntity {
  String title(ReviewsL10n l10n) {
    switch (this) {
      case ReviewsTabEntity.reviews:
        return l10n.reviewsTabTitle;
      case ReviewsTabEntity.questions:
        return l10n.questionsTabTitle;
    }
  }
}
