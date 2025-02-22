import 'package:flutter/material.dart';
import 'package:mp_take_home_test/map/models/filter_types_enum.dart';
import 'package:mp_take_home_test/map/models/map_floating_button_enum.dart';

import 'filter_item_widget.dart';
import 'map_floating_button.dart';

class MapButtonsOverlay extends StatefulWidget {
  const MapButtonsOverlay({super.key, required this.animationController});
  final AnimationController animationController;

  @override
  State<MapButtonsOverlay> createState() => _MapButtonsOverlayState();
}

class _MapButtonsOverlayState extends State<MapButtonsOverlay>
    with TickerProviderStateMixin {
  final OverlayPortalController filterOverlayController =
      OverlayPortalController();
  final OverlayPortalController locateOverlayController =
      OverlayPortalController();
  late AnimationController _controller;
  late Animation<double> _rippleAnimation;

  late Animation<double> _animation;
  late double _begin, _end;
  bool _onHideBorder = false;

  MapFloatingButtonEnum _activeMapButton = MapFloatingButtonEnum.filter;

  @override
  void initState() {
    _begin = 20;
    _end = 15;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = CurvedAnimation(
        parent: widget.animationController, curve: Curves.linear);

    _rippleAnimation = Tween<double>(
      begin: _begin,
      end: _end,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _hideBorder();
        _controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _hideBorder() {
    setState(() {
      _onHideBorder = false;
    });
  }

  void _onDisplayBorder() {
    setState(() {
      _onHideBorder = true;
    });
  }

  void _onTap() {
    _onDisplayBorder();
    _controller.forward();
    setState(() {
      widget.animationController.forward();

      filterOverlayController.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Column(
          children: MapFloatingButtonEnum.values
              .map((e) => MapFloatingButton(
                    button: e,
                    overlayController: e == MapFloatingButtonEnum.filter
                        ? filterOverlayController
                        : locateOverlayController,
                    scaleAnimation: _animation,
                    rippleAnimation: _rippleAnimation,
                    isSelected: e == _activeMapButton,
                    showBorder: !_onHideBorder,
                    onChanged: (m) {
                      _onTap();
                      setState(() {
                        _activeMapButton = m;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: FilterTypes.values
                          .map((e) => FilterItemWidget(
                                icon: e.icon(
                                  context,
                                  isSelected: e == FilterTypes.price,
                                ),
                                text: e.title,
                                isSelected: e == FilterTypes.price,
                                onTap: () {
                                  setState(() {
                                    widget.animationController.reverse();
                                  });
                                },
                              ))
                          .toList(),
                    ),
                  ))
              .toList(),
        );
      },
    );
  }
}
