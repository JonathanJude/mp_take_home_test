import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'ripple_painter.dart';

class RippleButton extends StatelessWidget {
  const RippleButton({
    super.key,
    required this.onTap,
    this.onHideBorder = false,
    required this.child,
    this.showRipple = false,
    this.width,
    this.height,
    this.padding,
    this.decoration,
    this.strokeWidth,
    required this.rippleAnimation,
  });
  final VoidCallback onTap;
  final bool onHideBorder;
  final Widget child;
  final bool showRipple;
  final double? width;
  final double? height;
  final double? strokeWidth;

  final EdgeInsets? padding;
  final Decoration? decoration;
  final Animation<double> rippleAnimation;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      containedInkWell: true,
      highlightShape: BoxShape.circle,
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: 300.ms,
        padding: padding ?? const EdgeInsets.all(12),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        decoration: decoration,
        child: Stack(
          fit: StackFit.expand,
          children: [
            showRipple
                ? AnimatedBuilder(
                    animation: rippleAnimation,
                    builder: (context, child) {
                      return !onHideBorder
                          ? const SizedBox.shrink()
                          : Center(
                              child: CustomPaint(
                                painter: RipplePainter(rippleAnimation.value,
                                    strokeWidth: strokeWidth),
                              ),
                            );
                    },
                  )
                : const SizedBox.shrink(),
            child,
          ],
        ),
      ),
    );
  }
}
