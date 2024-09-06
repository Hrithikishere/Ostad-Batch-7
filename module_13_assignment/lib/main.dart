import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module_13_assignment/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            shadowColor: WidgetStateProperty.all(Colors.grey),
            elevation: WidgetStateProperty.all(2),
            shape: WidgetStateProperty.all(
              const CircleBorder(),
            ),
            iconColor: WidgetStateProperty.all(Colors.grey),
            iconSize: WidgetStateProperty.all(20),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.red),
            fixedSize: WidgetStateProperty.all(
              Size((MediaQuery.of(context).size.width * 0.9), 50),
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15),
            ),
            elevation: WidgetStateProperty.all(2),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
