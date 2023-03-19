import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/l10n/profile_l10n.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/navigation/profile_navigator.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/profile_model.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/profile_wm.dart';

ProfileWm createProfileWm(BuildContext context) {
  return ProfileWm(
    ProfileL10n(context),
    ProfileNavigator(context),
    ProfileModel(),
  );
}
