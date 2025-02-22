import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mp_take_home_test/app.dart';
import 'package:mp_take_home_test/common/utils/extensions/animations.dart';
import 'package:mp_take_home_test/common/utils/extensions/ext.dart';

class ListOfVariantsButton extends StatelessWidget {
  const ListOfVariantsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.h(0.11),
      right: 20,
      child: Card(
          elevation: 0,
          shape: const StadiumBorder(),
          color: Colors.grey.shade700.withOpacity(0.7),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Icon(
                  Icons.sort_rounded,
                  color: context.colorScheme.surface.withOpacity(0.7),
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  'List of variants',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.surface.withOpacity(0.7),
                    fontFamily: kFontFamily,
                  ),
                ),
              ],
            ),
          )).scale(
        animationDuration: 1400.ms,
        delay: 200.ms,
      ),
    );
  }
}
