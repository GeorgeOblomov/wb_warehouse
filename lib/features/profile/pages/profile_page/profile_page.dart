import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/di/profile_wm_builder.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/profile_wm.dart';

class ProfilePage extends ElementaryWidget<ProfileWm> {
  const ProfilePage({
    super.key,
  }) : super(createProfileWm);

  @override
  Widget build(ProfileWm wm) {
    throw UnimplementedError();
  }
}
