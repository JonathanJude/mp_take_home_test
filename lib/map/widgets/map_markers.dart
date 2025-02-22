import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../models/items_position_model.dart';
import 'map_market_item_widget.dart';

class MapMarkers extends StatefulWidget {
  const MapMarkers({super.key, required this.isExpanded});

  final bool isExpanded;

  @override
  State<MapMarkers> createState() => _MapMarkersState();
}

class _MapMarkersState extends State<MapMarkers>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: 1200.ms);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool overlayExpanded = widget.isExpanded;
    return Stack(
      children: mapMarkerItems
          .map((e) => MapMarketItemWidget(
                item: e,
                isExpanded: overlayExpanded,
                animation: _animation,
              ))
          .toList(),
    );
  }
}
