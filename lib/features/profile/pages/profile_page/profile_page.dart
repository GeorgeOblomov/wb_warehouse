import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/di/profile_wm_builder.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/profile_wm.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/widgets/profile_item_widget.dart';
import 'package:wb_warehouse/utils/assets.dart';

class ProfilePage extends ElementaryWidget<ProfileWm> {
  const ProfilePage({
    super.key,
  }) : super(createProfileWm);

  @override
  Widget build(ProfileWm wm) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: constraints.maxWidth / 4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                      margin: const EdgeInsets.only(left: 16, top: 16),
                      // ignore: sort_child_properties_last
                      child: Image.asset(Assets.logo),
                      clipBehavior: Clip.hardEdge,
                    ),
                    const SizedBox(width: 16),
                    ProfileItemWidget(
                      title: wm.themeItemTitle,
                      leading: const Icon(Icons.color_lens),
                      onTap: wm.onThemeItemTap,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(),
                    ),
                    ProfileItemWidget(
                      title: wm.localeItemTitle,
                      leading: const Icon(Icons.language),
                      onTap: wm.onLocaleItemTap,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
