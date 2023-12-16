import 'package:flutter/material.dart';
import 'package:wb_warehouse/common/ui/common_button.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';

class ReviewsErrorWidget extends StatelessWidget {
  final VoidCallback onUpdate;

  const ReviewsErrorWidget({required this.onUpdate, super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.localizations;

    return Center(
      child: Column(
        children: [
          Text(l10n.somethingWentWrong),
          const SizedBox(height: 16),
          CommonButton(title: l10n.updateButtonTitle, onTap: onUpdate),
        ],
      ),
    );
  }
}
