import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/reviews/repositories/chat_gpt_repository.dart';

class ReviewModel extends ElementaryModel {
  // ignore: unused_field
  final ChatGPTRepository _gptRepository;

  ReviewModel(this._gptRepository);
}
