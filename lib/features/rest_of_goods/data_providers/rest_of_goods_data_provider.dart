import 'package:wb_warehouse/data_management/common/data_provider.dart';
import 'package:wb_warehouse/data_management/common/network_client.dart';
import 'package:wb_warehouse/data_management/common/network_client_type.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/barcodes_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/update_rest_of_goods_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/warehouse_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/rest_of_goods_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/warehouse_goods_response_dto.dart';
import 'package:wb_warehouse/utils/constants.dart';

class RestOfGoodsDataProvider extends DataProvider {
  RestOfGoodsDataProvider({required super.networkClient});

  Future<WarehouseGoodsResponseDto> getWarehouseGoods(WarehouseRequestDto requestDto) async {
    final accessor = postApiAccessor<Map<String, dynamic>>(
      '/content/v2/get/cards/list?locale=ru',
      NetworkClientType.content,
      ErrorType.content,
    );
    final response = await accessor(requestDto.toJson());

    return WarehouseGoodsResponseDto.fromJson(response);
  }

  Future<RestOfGoodsResponseDto> getRestOfGoods(BarcodesRequestDto requestDto) async {
    final accessor = postApiAccessor<Map<String, dynamic>>(
      '/api/v3/stocks/$warehouseId',
      NetworkClientType.marketplace,
      ErrorType.marketplace,
    );
    final response = await accessor(requestDto.toJson());

    return RestOfGoodsResponseDto.fromJson(response);
  }

  Future updateRestOfGoods(UpdateRestOfGoodsRequestDto requestDto) async {
    final accessor = putApiAccessor<Map<String, dynamic>>(
      '/api/v3/stocks/$warehouseId',
      NetworkClientType.content,
      ErrorType.marketplace,
    );

    return accessor(requestDto.toJson());
  }
}
