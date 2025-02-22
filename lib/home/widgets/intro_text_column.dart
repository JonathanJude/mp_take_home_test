import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mp_take_home_test/app.dart';
import 'package:mp_take_home_test/common/utils/extensions/animations.dart';

class IntroTextColumn extends StatelessWidget {
  const IntroTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: const Text(
            "Hi, Marina",
            style: TextStyle(
              color: kSecondaryTextColor,
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 24,
            ),
          ).fadeInFromLeft(delay: 1500.ms),
        ),
        const Text(
          "let's select your ",
          style: TextStyle(
            color: Colors.black,
            fontFamily: kFontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 34,
            height: 1.1,
          ),
        ).fadeInFromBottom(delay: 1800.ms, animationDuration: 450.ms),
        const Text(
          "perfect place",
          style: TextStyle(
            color: Colors.black,
            fontFamily: kFontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 34,
            height: 1.1,
          ),
        ).fadeInFromBottom(delay: 2100.ms, animationDuration: 500.ms),
      ],
    );
  }
}
