import 'package:flutter/material.dart';
import 'package:module_21_assignment/home_screen.dart';

void main() {
  runApp(const RealTimeLocationTrackerApp());
}

class RealTimeLocationTrackerApp extends StatelessWidget {
  const RealTimeLocationTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

