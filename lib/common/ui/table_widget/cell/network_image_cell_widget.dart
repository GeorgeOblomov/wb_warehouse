import 'package:flutter/material.dart';
import 'package:wb_warehouse/common/ui/common_network_image_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/base_cell_widget.dart';

class NetworkImageCellWidget extends BaseCellWidget {
  final String? url;

  const NetworkImageCellWidget({
    required this.url,
    VoidCallback? onTap,
    super.key,
  }) : super(onTap: url == null ? null : onTap);

  @override
  Widget child(BuildContext context) {
    return SizedBox(height: 50, child: CommonNetworkImageWidget(url: url));
  }
}
