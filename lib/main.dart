import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/home/home_page.dart';
import 'common/color_pallette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anshif Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.preahvihearTextTheme(),
        scaffoldBackgroundColor: ColorPalette.darkBackground,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
