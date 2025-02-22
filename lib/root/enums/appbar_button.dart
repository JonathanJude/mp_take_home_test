import 'package:flutter/material.dart';
import 'package:mp_take_home_test/common/utils/extensions/ext.dart';

import '../../common/widgets/animations/ripple_button.dart';
import 'app_tabs.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.tab,
    required this.currentTab,
    required this.onChanged,
    required this.animation,
    this.showBorder = true,
  });
  final AppTabs tab;
  final AppTabs currentTab;
  final Function(AppTabs) onChanged;
  final Animation<double> animation;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final index = AppTabs.values.toList().indexOf(tab);
    final pageIndex = AppTabs.values.toList().indexOf(currentTab);

    final onHideBorder = !showBorder;

    return RippleButton(
      onTap: () {
        onChanged.call(tab);
      },
      rippleAnimation: animation,
      width: pageIndex == index ? 55 : 47,
      height: pageIndex == index ? 55 : 47,
      showRipple: pageIndex == index,
      onHideBorder: onHideBorder,
      decoration: BoxDecoration(
        color: pageIndex == index && !onHideBorder
            ? const Color(0xFFFC9E12)
            : pageIndex == 0
                ? Colors.black26
                : context.colorScheme.onSurface,
        shape: BoxShape.circle,
        border: onHideBorder && pageIndex == index
            ? Border.all(color: context.colorScheme.surface, width: 1)
            : null,
      ),
      child: tab.buildIcon(context, isSelected: currentTab == tab),
      // child: SvgPicture.asset(
      //   navbarIcons.values.toList()[index],
      //   color: context.colorScheme.surface,
      //   height: pageIndex == index ? 28 : null,
      // ),
      // child: e.buildTab(isSelected: widget.currentTab == e),
    );
  }
}
