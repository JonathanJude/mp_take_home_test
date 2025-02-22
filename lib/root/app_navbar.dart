import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mp_take_home_test/common/utils/extensions/animations.dart';

import 'enums/app_tabs.dart';
import 'enums/appbar_button.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({
    super.key,
    this.currentTab = AppTabs.home,
    required this.onChanged,
  });
  final AppTabs currentTab;
  final Function(AppTabs) onChanged;

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rippleAnimation;
  bool _onHideBorder = false;
  late double _begin, _end;

  @override
  void initState() {
    super.initState();
    _begin = 30;
    _end = 20;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _hideBorder() {
    if (mounted) {
      setState(() {
        _onHideBorder = false;
      });
    }
  }

  void _onDisplayBorder() {
    if (mounted) {
      setState(() {
        _onHideBorder = true;
      });
    }
  }

  void _onTap() {
    _onDisplayBorder();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 48,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black.withOpacity(0.8),
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: AppTabs.values.map((e) {
          return AppBarButton(
            tab: e,
            currentTab: widget.currentTab,
            onChanged: (e) {
              _onTap();
              widget.onChanged.call(e);
            },
            animation: _rippleAnimation,
            showBorder: !_onHideBorder,
          );
        }).toList(),
      ),
    ).slideInFromBottom(
      delay: 3000.ms,
      animationDuration: 2500.ms,
      begin: 1.8,
    );
  }
}
