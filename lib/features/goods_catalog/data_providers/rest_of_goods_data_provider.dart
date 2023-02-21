import 'package:wb_warehouse/data_management/common/data_provider.dart';
import 'package:wb_warehouse/data_management/common/network_client.dart';
import 'package:wb_warehouse/features/goods_catalog/dto/response/warhouses_list_response_dto.dart';

class RestOfGoodsDataProvider extends DataProvider {
  RestOfGoodsDataProvider({required super.networkClient});

  Future<List<WarhousesListResponseDto>> getWarhousesList() async {
    final accessor = getApiAccessor<List>('/api/v2/warehouses', NetworkClientType.standart);
    final response = await accessor();

    return response.map((e) => WarhousesListResponseDto.fromJson(e)).toList();
  }
}
