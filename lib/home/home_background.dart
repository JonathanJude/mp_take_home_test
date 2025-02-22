import 'package:flutter/material.dart';

import '../app.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({ super.key, required this.child,});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
        children: [
          Container(
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [
                  0.1,
                  0.4,
                  0.6,
                  1,
                ],
                colors: [
                  Colors.white54,
                  kOrangeColor.withOpacity(0.2),
                  kOrangeColor.withOpacity(0.6),
                  kOrangeColor,
                ],
              ),
            ),
            // child: child,
          ),

          Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight),
            child: child,
          ),
        ],
    );
  }
}