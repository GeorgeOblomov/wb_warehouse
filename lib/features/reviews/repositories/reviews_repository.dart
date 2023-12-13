import 'package:wb_warehouse/features/reviews/data_providers/reviews_data_provider.dart';
import 'package:wb_warehouse/features/reviews/dto/request/reply_to_review_request_dto.dart';
import 'package:wb_warehouse/features/reviews/dto/request/reviews_request_dto.dart';
import 'package:wb_warehouse/features/reviews/dto/response/reviews_dto.dart';

class ReviewsRepository {
  final ReviewsDataProvider _dataProvider;

  ReviewsRepository(this._dataProvider);

  Future<ReviewsDto> getReviews() async {
    const requestDto = ReviewsRequestDto(
      isAnswered: false,
      take: 5000,
      skip: 0,
    );

    return _dataProvider.getReviews(requestDto);
  }

  Future<void> replyToReview(String id, String text) {
    final requestDto = ReplyToReviewRequestDto(
      id: id,
      text: text,
    );
    return _dataProvider.replyToReview(requestDto);
  }
}
