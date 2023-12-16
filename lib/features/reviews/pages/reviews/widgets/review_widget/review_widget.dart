import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/common/ui/common_button.dart';
import 'package:wb_warehouse/features/reviews/dto/response/review_dto.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/models/review_response_entity.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';
import 'review_wm.dart';

class ReviewWidget extends ElementaryWidget<ReviewWidgetModel> {
  ReviewWidget({
    required ReviewDto review,
    required ValueChanged<ReviewResponseEntity> onAnswer,
    Key? key,
  }) : super(
          (context) => defaultReviewWidgetModelFactory(
            context,
            review,
            onAnswer,
          ),
          key: key,
        );

  @override
  Widget build(ReviewWidgetModel wm) {
    return _ReviewItemWidget(wm: wm);
  }
}

class _ReviewItemWidget extends StatefulWidget {
  final ReviewWidgetModel wm;

  const _ReviewItemWidget({required this.wm});

  @override
  State<_ReviewItemWidget> createState() => _ReviewItemWidgetState();
}

class _ReviewItemWidgetState extends State<_ReviewItemWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localizations;
    final appTheme = context.watch<ThemeProvider>().appTheme;
    final review = widget.wm.review;

    return AnimatedContainer(
      duration: const Duration(microseconds: 200),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appTheme.restGoodItemWidgetBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 3,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.productDetails.productName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: appTheme.commonTextButtonColor, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(review.userName, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 8),
                    Text(review.text, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.reviewValuationTitle),
                  const SizedBox(height: 8),
                  _ValuationWidget(valuation: review.productValuation),
                ],
              ),
              const SizedBox(width: 112),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.reviewDateTitle),
                  const SizedBox(height: 8),
                  Text(review.createdDate),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: _expandeCard,
            child: Text(expanded ? l10n.reviewHideButtonTitle : l10n.reviewAnswerButtonTitle),
          ),
          if (expanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: l10n.reviewAnswerFieldLabel,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Material(
                        child: CommonButton(
                      title: l10n.reviewResponseButtonTitle,
                      onTap: widget.wm.onAnswerTap,
                    )),
                    const SizedBox(width: 8),
                    Material(
                        child: CommonButton(
                      title: l10n.reviewGenerateButtonTitle,
                      onTap: widget.wm.onGenerateTap,
                    )),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _expandeCard() {
    setState(() {
      expanded = !expanded;
    });
  }
}

class _ValuationWidget extends StatelessWidget {
  final int valuation;

  const _ValuationWidget({required this.valuation});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
      width: 30,
      child: Placeholder(),
    );
  }
}
