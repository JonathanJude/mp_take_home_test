import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mp_take_home_test/common/utils/extensions/ext.dart';

import '../models/items_position_model.dart';

class MapMarketItemWidget extends StatelessWidget {
  const MapMarketItemWidget({
    super.key,
    required this.item,
    required this.isExpanded,
    required this.animation,
  });

  final ItemsPositionModel item;
  final bool isExpanded;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.h(item.position.dy),
      left: context.w(item.position.dx),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Align(
            alignment: Alignment.bottomLeft,
            child: Transform.scale(
              scale: animation.value,
              alignment: Alignment.bottomLeft,
              child: AnimatedContainer(
                duration: 800.ms,
                width: !isExpanded ? 35 : 75,
                padding: EdgeInsets.symmetric(
                    horizontal: !isExpanded ? 8 : 12, vertical: 12),
                decoration: BoxDecoration(
                    color: context.colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )),
                child: !isExpanded
                    ? Icon(
                        Icons.apartment_rounded,
                        color: context.colorScheme.surface,
                        size: 20,
                      )
                    : AutoSizeText(
                        item.name,
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          color: context.colorScheme.surface,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
