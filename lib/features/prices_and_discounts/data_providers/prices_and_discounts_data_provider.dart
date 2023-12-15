import 'package:wb_warehouse/data_management/common/data_provider.dart';
import 'package:wb_warehouse/data_management/common/network_client.dart';
import 'package:wb_warehouse/data_management/common/network_client_type.dart';
import 'package:wb_warehouse/features/prices_and_discounts/dto/request/discounts_request_dto.dart';
import 'package:wb_warehouse/features/prices_and_discounts/dto/request/prices_request_dto.dart';
import 'package:wb_warehouse/features/prices_and_discounts/dto/response/prices_and_discounts_good_response_dto.dart';

class PricesAndDiscountsDataProvider extends DataProvider {
  PricesAndDiscountsDataProvider({required super.networkClient});

  Future<List<PricesAndDiscountsGoodResponseDto>> getPricesAndDiscountsGoods() async {
    final accessor = getApiAccessor<List>(
      '/public/api/v1/info?quantity=0',
      NetworkClientType.prices,
      ErrorType.marketplace,
    );
    final response = await accessor();

    return List.from(response.map((good) => PricesAndDiscountsGoodResponseDto.fromJson(good)));
  }

  Future<void> updatePrices(List<PricesRequestDto> pricesRequests) {
    final accessor = postApiAccessor(
      '/public/api/v1/prices',
      NetworkClientType.content,
      ErrorType.marketplace,
    );

    return accessor(pricesRequests.map((e) => e.toJson()).toList());
  }

  Future<void> updateDiscounts(List<DiscountsRequestDto> discountsRequests) {
    final accessor = postApiAccessor(
      '/public/api/v1/updateDiscounts',
      NetworkClientType.content,
      ErrorType.marketplace,
    );

    return accessor(discountsRequests.map((e) => e.toJson()).toList());
  }
}
