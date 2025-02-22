import 'package:flutter/material.dart';
import 'package:mp_take_home_test/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moniepoint Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber.shade700,
        ),
        useMaterial3: true,
      ),
      home: const App(),
    );
  }
}
