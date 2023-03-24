import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:surf_logger/surf_logger.dart';
import 'package:wb_warehouse/common/base_row_data.dart';
import 'package:wb_warehouse/common/ui/table_widget/network_picture_dialog.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget_data.dart';
import 'package:wb_warehouse/data_management/models/base_goods_model.dart';
import 'package:wb_warehouse/utils/error_handling/wb_error_handler.dart';

abstract class BaseGoodsWm<W extends ElementaryWidget, M extends ElementaryModel> extends WidgetModel<W, M> {
  final searchTextController = TextEditingController();

  @protected
  final loadingController = StreamController<bool>.broadcast();
  @protected
  final tableDataController = BehaviorSubject<TableWidgetData>();

  @protected
  final errorHandler = WBErrorHandler();

  @protected
  var loadedRows = <BaseRowData>[];

  BaseGoodsWm(super.model);

  TableWidgetData organizeTableData(List<BaseRowData> data);

  Stream<bool> get loadingStream => loadingController.stream;
  Stream<TableWidgetData> get tableDataStream => tableDataController.stream;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    initialLoading();
  }

  @override
  void dispose() {
    loadingController.close();
    tableDataController.close();
    searchTextController.dispose();
    super.dispose();
  }

  void onDataUpdateTap() {
    initialLoading();
  }

  void onPictureTap(String url) {
    showDialog(
      context: context,
      builder: (_) {
        return NetworkPictureDialog(url: url);
      },
    );
  }

  @protected
  Future<void> initialLoading() async {
    loadingController.add(true);
    try {
      loadedRows = await (model as BaseGoodsModel).getGoodsTableData();
      tableDataController.add(organizeTableData(loadedRows));
    } catch (e, st) {
      Logger.e('Error on $this goods data: $e.\n$st');
      errorHandler.handleError(context, e);
    } finally {
      loadingController.add(false);
    }
  }
}
