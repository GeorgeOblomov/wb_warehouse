import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/reviews/dto/response/reviews_dto.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/models/review_response_entity.dart';
import 'package:wb_warehouse/features/reviews/repositories/reviews_repository.dart';

class ReviewsModel extends ElementaryModel {
  final ReviewsRepository _repository;

  ReviewsModel(this._repository);

  Future<ReviewsDto> getReviews() => _repository.getReviews();

  Future<void> replyToReview(ReviewResponseEntity reviewResponseEntity) {
    return _repository.replyToReview(
      reviewResponseEntity.id,
      reviewResponseEntity.text,
    );
  }
}
