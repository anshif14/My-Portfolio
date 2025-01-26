import 'package:anshif_portolio/common/color_pallette.dart';
import 'package:anshif_portolio/common/variables.dart';
import 'package:flutter/material.dart';
import 'landing_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorPalette.backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height:height*0.1 ,
              width: width,
              color: ColorPalette.AppbarbackGroundColor,
            ),
            LandingSection(),
          ],
        ),
      ),
    );
  }
}
