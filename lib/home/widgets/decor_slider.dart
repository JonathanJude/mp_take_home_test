import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mp_take_home_test/common/utils/extensions/animations.dart';
import 'package:mp_take_home_test/common/utils/extensions/ext.dart';

import '../../app.dart';

class DecorSlideWidget extends StatefulWidget {
  const DecorSlideWidget({
    super.key,
    required this.text,
    this.showFullSlide = false,
    this.milliseconds = 3000,
    this.sliderWidth,
  });

  final String text;
  final bool showFullSlide;
  final int milliseconds;
  final double? sliderWidth;

  @override
  State<DecorSlideWidget> createState() => _DecorSlideWidgetState();
}

class _DecorSlideWidgetState extends State<DecorSlideWidget> {
  bool _isTransformed = false;
  bool _hideText = true;
  int _milliseconds = 200;

  @override
  void initState() {
    super.initState();
    _milliseconds = widget.milliseconds;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: _milliseconds), () {
        setState(() {
          _isTransformed = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final sHeight = widget.showFullSlide ? 48.0 : 38.0;
    const sHeight = 48.0;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 12,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1200),
        width:
            _isTransformed ? context.w(widget.sliderWidth ?? 0.9) : 45,
        height: sHeight,
        onEnd: () {
          setState(() {
            _hideText = false;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: sHeight,
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: widget.showFullSlide ? 48 : 4),
                  _hideText
                      ? const SizedBox.shrink()
                      : Text(
                          widget.text,
                          style: const TextStyle(
                            fontSize: 13,
                            fontFamily: kFontFamily,
                          ),
                        ).fadeInFromLeft(
                          delay: 100.ms,
                          animationDuration: 100.ms,
                        ),
                  widget.showFullSlide ? const SizedBox.shrink() : const Spacer(),
                  Container(
                    height: widget.showFullSlide ? 48 : sHeight,
                    width: 48,
                    padding: const EdgeInsets.only(right: 4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
