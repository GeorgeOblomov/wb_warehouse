import 'package:wb_warehouse/data_management/common/data_provider.dart';
import 'package:wb_warehouse/data_management/common/network_client.dart';
import 'package:wb_warehouse/features/reviews/dto/request/reply_to_review_request_dto.dart';
import 'package:wb_warehouse/features/reviews/dto/request/reviews_request_dto.dart';
import 'package:wb_warehouse/features/reviews/dto/response/reviews_dto.dart';

class ReviewsDataProvider extends DataProvider {
  ReviewsDataProvider({required super.networkClient});

  Future<ReviewsDto> getReviews(ReviewsRequestDto requestDto) async {
    final accessor = getApiAccessor<Map<String, dynamic>>(
      '/api/v1/feedbacks',
      NetworkClientType.standart,
      ErrorType.content,
    );
    final response = await accessor(requestDto.toJson());

    return ReviewsDto.fromJson(response);
  }

  Future<void> replyToReview(ReplyToReviewRequestDto requestDto) {
    final accessor = patchApiAccessor(
      '/api/v1/feedbacks',
      NetworkClientType.standart,
      ErrorType.content,
    );

    return accessor(requestDto.toJson());
  }
}
