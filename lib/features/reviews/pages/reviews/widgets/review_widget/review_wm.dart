import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/features/reviews/dto/response/review_dto.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/models/review_response_entity.dart';
import 'package:wb_warehouse/features/reviews/repositories/chat_gpt_repository.dart';
import 'review_model.dart';
import 'review_widget.dart';

ReviewWidgetModel defaultReviewWidgetModelFactory(
  BuildContext context,
  ReviewDto review,
  ValueChanged<ReviewResponseEntity> onAnswer,
) {
  return ReviewWidgetModel(
    onAnswer,
    review,
    ReviewModel(context.read<ChatGPTRepository>()),
  );
}

class ReviewWidgetModel extends WidgetModel<ReviewWidget, ReviewModel> {
  final ReviewDto review;
  final answerAvailable = ValueNotifier<bool>(false);

  final ValueChanged<ReviewResponseEntity> _onAnswer;

  late final TextEditingController _textEditingController = TextEditingController();

  String get _userInput => _textEditingController.text;

  ReviewWidgetModel(
    this._onAnswer,
    this.review,
    super.model,
  );

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _textEditingController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void onGenerateTap() {}

  void onAnswerTap() {
    _onAnswer(ReviewResponseEntity(id: review.id, text: _userInput));
  }

  void _onTextChanged() {
    answerAvailable.value = _userInput.isNotEmpty;
  }
}
