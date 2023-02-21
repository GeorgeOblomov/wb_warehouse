import 'package:wb_warehouse/data_management/common/data_provider.dart';
import 'package:wb_warehouse/data_management/common/network_client.dart';
import 'package:wb_warehouse/features/goods_catalog/data_providers/rest_of_goods_data_provider.dart';

class DataManager {
  final NetworkClient _networkClient;
  final Map<DataProviderType, DataProvider> _providers = {};

  DataManager(this._networkClient);

  RestOfGoodsDataProvider get restOfGoodsDataProvider =>
      _getOrCreateProvider(DataProviderType.restOfGoods) as RestOfGoodsDataProvider;

  DataProvider _getOrCreateProvider(DataProviderType type) {
    if (_providers.containsKey(type)) {
      return _providers[type]!;
    }

    switch (type) {
      case DataProviderType.restOfGoods:
        return RestOfGoodsDataProvider(networkClient: _networkClient);
      default:
        throw ArgumentError('Cannot create provider of type ${type.toString()}');
    }
  }
}
