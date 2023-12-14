import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/locale/base_l10n.dart';

class ReviewsL10n extends BaseL10n {
  ReviewsL10n(super.localizations);

  String get reviewsTabTitle => context.localizations.reviews_review_tab_title;

  String get questionsTabTitle => context.localizations.reviews_questions_tab_title;
}
