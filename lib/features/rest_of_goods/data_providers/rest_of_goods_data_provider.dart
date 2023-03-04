import 'package:wb_warehouse/data_management/common/data_provider.dart';
import 'package:wb_warehouse/data_management/common/network_client.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/barcodes_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/vendor_codes_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/warehouse_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/rest_of_goods_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/warehouse_cards_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/warehouse_goods_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/warehouses_list_response_dto.dart';

class RestOfGoodsDataProvider extends DataProvider {
  RestOfGoodsDataProvider({required super.networkClient});

  Future<Iterable<WarehousesListResponseDto>> getWarehouses() async {
    final accessor = getApiAccessor<List>('/api/v2/warehouses', NetworkClientType.standart);
    final response = await accessor();

    return response.map((e) => WarehousesListResponseDto.fromJson(e));
  }

  Future<WarehouseGoodsResponseDto> getWarehouseGoods(WarehouseRequestDto requestDto) async {
    final accessor = postApiAccessor<Map<String, dynamic>>('/content/v1/cards/cursor/list', NetworkClientType.standart);
    final response = await accessor(requestDto.toJson());

    return WarehouseGoodsResponseDto.fromJson(response);
  }

  Future<RestOfGoodsResponseDto> getRestOfGoods(BarcodesRequestDto requestDto) async {
    /// Temporary hardcoded path parameter (warehouse).
    final accessor = postApiAccessor<Map<String, dynamic>>('/api/v3/stocks/686057', NetworkClientType.standart);
    final response = await accessor(requestDto.toJson());

    return RestOfGoodsResponseDto.fromJson(response);
  }

  Future<WarehouseCardsResponseDto> getWarehouseCards(VendorCodesRequestDto requestDto) async {
    final accessor = postApiAccessor<Map<String, dynamic>>('/content/v1/cards/filter', NetworkClientType.standart);
    final response = await accessor(requestDto.toJson());

    return WarehouseCardsResponseDto.fromJson(response);
  }
}
