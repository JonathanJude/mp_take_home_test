import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mp_take_home_test/common/utils/extensions/animations.dart';
import 'package:mp_take_home_test/common/utils/extensions/ext.dart';

import '../../common/widgets/animations/ripple_button.dart';
import '../models/map_floating_button_enum.dart';

class MapFloatingButton extends StatelessWidget {
  const MapFloatingButton({
    super.key,
    required this.button,
    required this.overlayController,
    required this.scaleAnimation,
    required this.rippleAnimation,
    required this.child,
    required this.isSelected,
    required this.onChanged,
    this.showBorder = true,
  });

  final MapFloatingButtonEnum button;
  final OverlayPortalController overlayController;
  final Animation<double> scaleAnimation;
  final Animation<double> rippleAnimation;
  final Widget child;
  final bool isSelected;
  final Function(MapFloatingButtonEnum) onChanged;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final index = MapFloatingButtonEnum.values.toList().indexOf(button);
    final onHideBorder = !showBorder;

    return OverlayPortal(
      controller: overlayController,
      overlayChildBuilder: (context) {
        // overlay dialog
        return Positioned(
          bottom: context.h(0.175),
          left: 30,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Transform.scale(
              scale: scaleAnimation.value,
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 14,
                  top: 6,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: child,
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: RippleButton(
          showRipple: isSelected,
          onHideBorder: onHideBorder,
          strokeWidth: 3,
          onTap: () {
            onChanged.call(button);
          },
          height: 45,
          width: 45,
          padding: const EdgeInsets.all(14),
          rippleAnimation: rippleAnimation,
          decoration: BoxDecoration(
            color: Colors.grey.shade700.withOpacity(0.7),
            shape: BoxShape.circle,
            border: !onHideBorder
                ? null
                : Border.all(
                    color: context.colorScheme.surface.withOpacity(0.8),
                    width: 1,
                  ),
          ),
          child: Transform.rotate(
            angle: index == 0 ? 0 : 1.0,
            child: button.icon(context),
          ),
        ).scale(
          animationDuration: 1500.ms,
          delay: 200.ms,
        ),
      ),
    );
  }
}
