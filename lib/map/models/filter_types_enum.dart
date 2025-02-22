import 'package:flutter/material.dart';
import 'package:mp_take_home_test/common/styles/colors_ext.dart';
import 'package:mp_take_home_test/common/utils/extensions/ext.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../common/svg_assets.dart';

enum FilterTypes {
  cosyAreas,
  price,
  infrastructure,
  withoutAnyLayer;

  String get title {
    switch (this) {
      case cosyAreas:
        return 'Cosy areas';
      case price:
        return 'Price';
      case infrastructure:
        return 'Infrastructure';
      case withoutAnyLayer:
        return 'Without any layer';
    }
  }

  Widget icon(
    BuildContext context, {
    bool isSelected = false,
  }) {
    final color = isSelected
        ? context.colorScheme.primary.colorFilter
        : context.colorScheme.secondary.colorFilter;

    switch (this) {
      case cosyAreas:
        return SvgPicture.asset(
          SvgAssets.shield,
          height: 20,
          colorFilter: color,
        );
      case price:
        return SvgPicture.asset(
          SvgAssets.wallet,
          height: 20,
          colorFilter: color,
        );
      case infrastructure:
        return SvgPicture.asset(
          SvgAssets.trash,
          height: 20,
          colorFilter: color,
        );
      case withoutAnyLayer:
        return SvgPicture.asset(
          SvgAssets.filterMap,
          height: 20,
          colorFilter: color,
        );
    }
  }
}
