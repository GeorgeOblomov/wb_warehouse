import 'package:wb_warehouse/features/goods_catalog/data_providers/rest_of_goods_data_provider.dart';
import 'package:wb_warehouse/features/goods_catalog/dto/response/warhouse_list_response_dto.dart';

class RestOfGoodsRepository {
  final RestOfGoodsDataProvider _dataProvider;

  RestOfGoodsRepository(this._dataProvider);

  Future<WarhousesListResponseDto> getWarhousesList() {
    return _dataProvider.getWarhousesList();
  }
}
