import 'package:anshif_portolio/common/color_pallette.dart';
import 'package:anshif_portolio/common/image_contants.dart';
import 'package:anshif_portolio/features/home/landing_section.dart';
import 'package:anshif_portolio/features/home/orbit_section.dart';
import 'package:anshif_portolio/features/home/work_experience_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.darkBackground,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                LandingSection(),
                Positioned(
                  right: 0,
                  child: Image.asset(
                    ImageConstants.glowEffect1,
                    height: 400,
                  ),
                ),
              ],
            ),
            const WorkExperienceSection(),
            const OrbitSection(),
          ],
        ),
      ),
    );
  }
}
