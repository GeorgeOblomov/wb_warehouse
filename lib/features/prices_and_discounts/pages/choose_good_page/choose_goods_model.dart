import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/prices_and_discounts/repositories/prices_and_discounts_repository.dart';

class ChooseGoodsModel extends ElementaryModel {
  // ignore: unused_field
  final PricesAndDiscountsRepository _repository;

  ChooseGoodsModel(this._repository);
}
