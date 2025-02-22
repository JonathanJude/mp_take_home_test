import 'package:flutter/material.dart';

import 'root/app_navbar.dart';
import 'root/enums/app_tabs.dart';

const kOrangeColor = Color(0xFFF1BB6C);
const kSecondaryTextColor = Color(0xFF978C74);
const kFontFamily = "EuclidCircular";

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppTabs selectedTab = AppTabs.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          selectedTab.buildWidget,
          Positioned(
            right: 0,
            left: 0,
            bottom: 24,
            child: AppNavBar(
              currentTab: selectedTab,
              onChanged: (t) {
                setState(() {
                  selectedTab = t;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
