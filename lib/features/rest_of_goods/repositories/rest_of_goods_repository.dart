import 'package:wb_warehouse/features/rest_of_goods/data_providers/rest_of_goods_data_provider.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/barcodes_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/cursor_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/filter_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/warehouse_goods_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/rest_of_goods_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/warehouse_goods_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/warehouses_list_response_dto.dart';
import 'package:wb_warehouse/utils/constants.dart';

class RestOfGoodsRepository {
  final RestOfGoodsDataProvider _dataProvider;

  RestOfGoodsRepository(this._dataProvider);

  Future<Iterable<WarehousesListResponseDto>> getWarehouses() {
    return _dataProvider.getWarehouses();
  }

  Future<WarehouseGoodsResponseDto> getWaregouseGoods() {
    const warehouseGoodsRequestDto = WarehouseGoodsRequestDto(
      cursor: CursorRequestDto(limit: limit),
      filter: FilterRequestDto(withPhoto: withPhotoMode),
    );

    return _dataProvider.getWarehouseGoods(warehouseGoodsRequestDto);
  }

  Future<RestOfGoodsResponseDto> getRestOfGoods(List<String> barcodes) {
    final barcodesRequestDto = BarcodesRequestDto(skus: barcodes);

    return _dataProvider.getRestOfGoods(barcodesRequestDto);
  }
}
