import 'package:flutter/material.dart';

import 'home_background.dart';
import 'widgets/decor_showcase_widget.dart';
import 'widgets/home_header.dart';
import 'widgets/home_stats_row.dart';
import 'widgets/intro_text_column.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      child: SingleChildScrollView(
        child: HomeBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(),
                    SizedBox(height: 20),
                    IntroTextColumn(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 36.0),
                      child: StatsRowWidget(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),

              //showcase decor
              DecorShowcaseWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
