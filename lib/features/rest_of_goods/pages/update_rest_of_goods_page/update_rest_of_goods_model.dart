import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/rest_of_goods_stock_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';

class UpdateRestOfGoodsModel extends ElementaryModel {
  final RestOfGoodsRepository _repository;

  UpdateRestOfGoodsModel(this._repository);

  Future<void> updateRestOfGoods(List<RestOfGoodsStockDto> stocks) async {
    _repository.updateRestOfGoods(stocks);
  }
}
