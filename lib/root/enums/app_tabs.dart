import 'package:flutter/material.dart';
import 'package:mp_take_home_test/common/styles/colors_ext.dart';
import 'package:mp_take_home_test/common/utils/extensions/ext.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../common/svg_assets.dart';
import '../../home/home_view.dart';
import '../../map/map_view.dart';
import '../empty_view.dart';

enum AppTabs {
  search,
  message,
  home,
  wishlist,
  profile;

  Widget buildIcon(
    BuildContext context, {
    bool isSelected = false,
  }) {
    Widget icon() => SvgPicture.asset(
          iconPath,
          colorFilter: context.colorScheme.surface.colorFilter,
          height: isSelected ? 28 : null,
        );

    return icon();
  }

  IconData get icon {
    switch (this) {
      case search:
        return Icons.search;
      case message:
        return Icons.message;
      case home:
        return Icons.home;
      case wishlist:
        return Icons.favorite;
      case profile:
        return Icons.person;
    }
  }

  String get iconPath {
    switch (this) {
      case search:
        return SvgAssets.search;
      case message:
        return SvgAssets.chat;
      case home:
        return SvgAssets.home;
      case wishlist:
        return SvgAssets.heart;
      case profile:
        return SvgAssets.profile;
    }
  }

  Widget get buildWidget {
    switch (this) {
      case message:
      case wishlist:
      case profile:
        return EmptyView(text: name);
      case search:
        return const MapView();
      case home:
        return const HomeView();
    }
  }

  Widget buildTab({
    bool isSelected = false,
  }) {
    return _navbarItem(icon: icon, selected: isSelected);
  }
}

Widget _navbarItem({
  required IconData icon,
  required bool selected,
}) {
  // return InkResponseWidget(
  //                 index: index,
  //                 showRipple: iconIndex == index,
  //                 onHideBorder: _onHideBorder,
  //                 strokeWidth: 3,
  //                 onTap: () {
  //                   _onTap();
  //                   setState(() {
  //                     iconIndex = index;
  //                   });
  //                 },
  //                 height: 45,
  //                 width: 45,
  //                 padding: const EdgeInsets.all(14),
  //                 rippleAnimation: _rippleAnimation,
  //                 decoration: BoxDecoration(
  //                   color: Colors.grey.shade700.withOpacity(0.7),
  //                   shape: BoxShape.circle,
  //                   border: !_onHideBorder
  //                       ? null
  //                       : Border.all(
  //                           color: context.colorScheme.surface.withOpacity(0.8),
  //                           width: 1,
  //                         ),
  //                 ),
  //                 child: Transform.rotate(
  //                   angle: index == 0 ? 0 : 1.0,
  //                   child: SvgPicture.asset(
  //                     index == 0 ? ImagesPaths.layers : ImagesPaths.mapArrow,
  //                     color: context.colorScheme.surface.withOpacity(0.8),
  //                     height: 17,
  //                     width: 20,
  //                   ),
  //                 ),
  //               ).scale(animationDuration: 1500.ms, delay: 200.ms),

  return Container(
    padding: EdgeInsets.all(selected ? 15 : 10),
    decoration: BoxDecoration(
      color: selected ? const Color(0xFFEB9D29) : Colors.black,
      shape: BoxShape.circle,
    ),
    child: Icon(
      icon,
      size: 22,
      color: Colors.white,
    ),
  );
}
