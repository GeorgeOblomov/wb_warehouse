import 'package:flutter/material.dart';
import 'package:wb_warehouse/common/ui/common_network_image_widget.dart';

class NetworkPictureDialog extends StatelessWidget {
  final String url;

  const NetworkPictureDialog({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: CommonNetworkImageWidget(url: url),
    );
  }
}
