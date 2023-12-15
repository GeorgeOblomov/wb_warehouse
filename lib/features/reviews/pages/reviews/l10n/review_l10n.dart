import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/locale/base_l10n.dart';

class ReviewsL10n extends BaseL10n {
  ReviewsL10n(super.localizations);

  String get reviewsTabTitle => context.localizations.reviewsReviewTabTitle;

  String get questionsTabTitle => context.localizations.reviewsQuestionsTabTitle;

  String get somethingWentWrong => context.localizations.somethingWentWrong;
}
