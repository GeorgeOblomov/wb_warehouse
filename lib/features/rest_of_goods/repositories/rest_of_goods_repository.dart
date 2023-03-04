import 'package:wb_warehouse/features/rest_of_goods/data_providers/rest_of_goods_data_provider.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/barcodes_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/cursor_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/filter_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/vendor_codes_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/warehouse_goods_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/warehouse_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/rest_of_goods_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/warehouse_cards_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/warehouse_goods_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/warehouses_list_response_dto.dart';
import 'package:wb_warehouse/utils/constants.dart';

class RestOfGoodsRepository {
  final RestOfGoodsDataProvider _dataProvider;

  RestOfGoodsRepository(this._dataProvider);

  Future<Iterable<WarehousesListResponseDto>> getWarehouses() {
    return _dataProvider.getWarehouses();
  }

  Future<WarehouseGoodsResponseDto> getWarehouseGoods() {
    const warehouseRequestDto = WarehouseRequestDto(
      sort: WarehouseGoodsRequestDto(
        cursor: CursorRequestDto(limit: limit),
        filter: FilterRequestDto(withPhoto: withPhotoMode),
      ),
    );

    return _dataProvider.getWarehouseGoods(warehouseRequestDto);
  }

  Future<RestOfGoodsResponseDto> getRestOfGoods(Iterable<String> barcodes) {
    final barcodesRequestDto = BarcodesRequestDto(skus: barcodes);

    return _dataProvider.getRestOfGoods(barcodesRequestDto);
  }

  Future<WarehouseCardsResponseDto> getWarehouseCards(Iterable<String> vendorCodes) {
    final vendorCodesRequestDto = VendorCodesRequestDto(vendorCodes: vendorCodes);

    return _dataProvider.getWarehouseCards(vendorCodesRequestDto);
  }
}
