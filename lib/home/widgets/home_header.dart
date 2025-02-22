import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mp_take_home_test/common/utils/extensions/animations.dart';

import '../../app.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedSize(
          duration: 800.ms,
          curve: Curves.linear,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 14,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 20,
                  color: kSecondaryTextColor,
                ).animate().fadeInFromLeft(delay: 450.ms, animationDuration: 500.ms),
                const SizedBox(width: 12),
                const Text(
                  "Saint Petersburg",
                  style: TextStyle(
                    color: kSecondaryTextColor,
                    fontFamily: kFontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                ).animate().fadeInFromLeft(delay: 600.ms, animationDuration: 800.ms),
              ],
            ),
          ),
        ).animate(delay: 2000.ms),
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/avatar.png"),
        ).scale(animationDuration: 900.ms),
      ],
    );
  }
}
