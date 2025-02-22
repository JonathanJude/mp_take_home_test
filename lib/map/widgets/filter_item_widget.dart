import 'package:flutter/material.dart';
import 'package:mp_take_home_test/common/utils/extensions/ext.dart';

class FilterItemWidget extends StatelessWidget {
  const FilterItemWidget({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
    this.isSelected = false,
  });

  final Widget icon;
  final GestureTapCallback? onTap;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 12),
            Text(
              text,
              style: context.textTheme.bodySmall?.copyWith(
                color: isSelected
                    ? context.colorScheme.primary
                    : context.colorScheme.secondary,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
