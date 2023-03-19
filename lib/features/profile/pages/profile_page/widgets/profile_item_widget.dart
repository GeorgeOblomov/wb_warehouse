import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ProfileItemWidget({
    required this.title,
    this.leading,
    this.trailing,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title, overflow: TextOverflow.ellipsis),
      trailing: trailing,
      contentPadding: const EdgeInsets.all(16),
      onTap: onTap,
    );
  }
}
