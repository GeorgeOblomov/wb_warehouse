import 'package:wb_warehouse/features/prices_and_discounts/data_providers/prices_and_discounts_data_provider.dart';
import 'package:wb_warehouse/features/prices_and_discounts/dto/request/discounts_request_dto.dart';
import 'package:wb_warehouse/features/prices_and_discounts/dto/request/prices_request_dto.dart';
import 'package:wb_warehouse/features/prices_and_discounts/dto/response/prices_and_discounts_good_response_dto.dart';

class PricesAndDiscountsRepository {
  final PricesAndDiscountsDataProvider _dataProvider;

  PricesAndDiscountsRepository(this._dataProvider);

  Future<List<PricesAndDiscountsGoodResponseDto>> getPricesAndDiscountsGoods() {
    return _dataProvider.getPricesAndDiscountsGoods();
  }

  Future<void> updatePrices(List<PricesRequestDto> pricesRequests) {
    return _dataProvider.updatePrices(pricesRequests);
  }

  Future<void> updateDiscounts(List<DiscountsRequestDto> discountsRequests) {
    return _dataProvider.updateDiscounts(discountsRequests);
  }
}
