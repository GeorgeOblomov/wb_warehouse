import 'package:wb_warehouse/data_management/common/data_provider.dart';
import 'package:wb_warehouse/data_management/common/network_client.dart';
import 'package:wb_warehouse/features/prices_and_discounts/dto/response/prices_and_discounts_good_response_dto.dart';

class PricesAndDiscountsDataProvider extends DataProvider {
  PricesAndDiscountsDataProvider({required super.networkClient});

  Future<List<PricesAndDiscountsGoodResponseDto>> getPricesAndDiscountsGoods() async {
    final accessor = getApiAccessor<List>(
      '/public/api/v1/info?quantity=0',
      NetworkClientType.standart,
      ErrorType.marketplace,
    );
    final response = await accessor();

    return List.from(response.map((good) => PricesAndDiscountsGoodResponseDto.fromJson(good)));
  }
}
