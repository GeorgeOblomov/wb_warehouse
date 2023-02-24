import 'package:wb_warehouse/features/rest_of_goods/data_providers/rest_of_goods_data_provider.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/warhouses_list_response_dto.dart';

class RestOfGoodsRepository {
  final RestOfGoodsDataProvider _dataProvider;

  RestOfGoodsRepository(this._dataProvider);

  Future<List<WarhousesListResponseDto>> getWarhousesList() {
    return _dataProvider.getWarhousesList();
  }
}
