import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mp_take_home_test/common/utils/extensions/animations.dart';

import 'decor_container.dart';
import 'decor_slider.dart';

class DecorShowcaseWidget extends StatelessWidget {
  const DecorShowcaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: const Column(
        children: [
          DecorContainer(
            heightFactor: 0.22,
            imageUrl: "assets/images/home_image_3.jpg",
            child: DecorSlideWidget(
              text: "Gladkova St., 25",
                    showFullSlide: true,
            ),
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DecorContainer(
                  heightFactor: 0.44,
                  imageUrl: "assets/images/home_image_1.jpg",
                  child: DecorSlideWidget(
                    text: "Gubina St., 11",
                    milliseconds: 3600,
                    showFullSlide: false,
                    sliderWidth: 0.44,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    DecorContainer(
                      heightFactor: 0.21,
                      imageUrl: "assets/images/home_image_2.jpg",
                      child: DecorSlideWidget(
                        showFullSlide: false,
                        text: "Sedova St., 22",
                        milliseconds: 3600,
                        sliderWidth: 0.42,
                      ),
                    ),
                    SizedBox(height: 8),
                    DecorContainer(
                      heightFactor: 0.22,
                      imageUrl: "assets/images/home_image_1.jpg",
                      child: DecorSlideWidget(
                        text: "Sedova St., 22",
                        milliseconds: 3600,
                        showFullSlide: false,
                        sliderWidth: 0.42,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 70),
        ],
      ),
    ).slideInFromBottom(
      delay: 2700.ms,
      animationDuration: 1200.ms,
      begin: 1,
    );
  }
}
