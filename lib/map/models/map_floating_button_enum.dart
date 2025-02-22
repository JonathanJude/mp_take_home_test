import 'package:flutter/material.dart';
import 'package:mp_take_home_test/common/styles/colors_ext.dart';
import 'package:mp_take_home_test/common/utils/extensions/ext.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../common/svg_assets.dart';

enum MapFloatingButtonEnum {
  filter,
  locate;

  Widget icon(BuildContext context) {
    switch (this) {
      case filter:
        return SvgPicture.asset(
          SvgAssets.filterMap,
          colorFilter: context.colorScheme.surface.withOpacity(0.8).colorFilter,
          height: 17,
          width: 20,
        );
      case locate:
        return SvgPicture.asset(
          SvgAssets.locate,
          colorFilter: context.colorScheme.surface.withOpacity(0.8).colorFilter,
          height: 17,
          width: 20,
        );
    }
  }
}
