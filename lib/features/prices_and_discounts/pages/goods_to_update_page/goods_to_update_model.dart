import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/prices_and_discounts/dto/request/discounts_request_dto.dart';
import 'package:wb_warehouse/features/prices_and_discounts/dto/request/prices_request_dto.dart';
import 'package:wb_warehouse/features/prices_and_discounts/repositories/prices_and_discounts_repository.dart';

class GoodsToUpdateModel extends ElementaryModel {
  final PricesAndDiscountsRepository _repository;

  GoodsToUpdateModel(this._repository);

  Future<void> updatePrices(List<PricesRequestDto> pricesRequests) {
    return _repository.updatePrices(pricesRequests);
  }

  Future<void> updateDiscounts(List<DiscountsRequestDto> discountsRequests) {
    return _repository.updateDiscounts(discountsRequests);
  }
}
