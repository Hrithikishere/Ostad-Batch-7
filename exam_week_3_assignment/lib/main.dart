import 'package:exam_week_3_assignment/screen/add_product_screen.dart';
import 'package:exam_week_3_assignment/screen/edit_product_screen.dart';
import 'package:exam_week_3_assignment/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/addProduct': (context) => const AddProductScreen(),
      },
    );
  }
}
