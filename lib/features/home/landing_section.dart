import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../common/color_pallette.dart';
import '../../common/image_contants.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 768;
        return Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          decoration: BoxDecoration(
            color: ColorPalette.darkBackground,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 60.0 : 20.0,
                  vertical: 40.0,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: isDesktop ? 300 : 200,
                            ),
                            child: Image.asset(
                              ImageConstants.avatar,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                children: [
                                  Text(
                                    'Hello World! I Am ',
                                    style: GoogleFonts.preahvihear(
                                      fontSize: isDesktop ? 24 : 20,
                                      color: ColorPalette.primaryText,
                                    ),
                                  ),
                                  Text(
                                    'Muhammad Anshif',
                                    style: GoogleFonts.preahvihear(
                                      fontSize: isDesktop ? 24 : 20,
                                      color: ColorPalette.primaryPurple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              Text(
                                'A Developer who turns',
                                style: GoogleFonts.preahvihear(
                                  fontSize:  50,
                                  color: ColorPalette.primaryText,
                                ),
                              ),

                              Wrap(
                                children: [
                                  Text(
                                    'Coffee into ',
                                    style: GoogleFonts.preahvihear(
                                      fontSize: 50,
                                      color: ColorPalette.primaryText,
                                    ),
                                  ),
                                  SizedBox(

                                    height: 70,
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          ImageConstants.textCircle,
                                          height: 80,
                                          fit: BoxFit.contain,
                                        ),
                                        Positioned(
                                          left: 30,

                                          child: AnimatedTextKit(
                                            animatedTexts: [
                                              TypewriterAnimatedText(
                                                'code',
                                                textStyle: GoogleFonts.preahvihear(
                                                  fontSize:  50,
                                                  color: ColorPalette.primaryPurple,
                                                ),
                                                speed: const Duration(milliseconds: 200),
                                              ),
                                            ],
                                            repeatForever: true,
                                            pause: const Duration(milliseconds: 1000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              Text(
                                'Because if the logic isn’t solid, what else is?',
                                style: GoogleFonts.preahvihear(
                                  fontSize: isDesktop ? 14 : 12,
                                  color: ColorPalette.primaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: isDesktop ? 800 : double.infinity,
                      ),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "I'm a Software Developer.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.preahvihear(
                              fontSize: 50,
                              color: ColorPalette.primaryText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            // alignment: WrapAlignment.le,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            spacing: 4,
                            children: [
                              Text(
                                'Currently, I\'m a Software Developer at ',
                                style: GoogleFonts.preahvihear(
                                  fontSize: 21,
                                  color: ColorPalette.secondaryText,
                                ),
                              ),
                              Container(
                                height: 40 ,width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(image: AssetImage(ImageConstants.zartekLogo),fit: BoxFit.cover)
                                ),
                              )
                              
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'A self-taught Flutter developer with 3+ years of experience, crafting high-performance, cross-platform mobile applications. I focus on creating intuitive and engaging user experiences while ensuring seamless integration with backend systems to deliver scalable and efficient solutions.',
                            // textAlign: TextAlign.center,
                            style: GoogleFonts.preahvihear(
                              fontSize: isDesktop ? 16 : 14,
                              color: ColorPalette.secondaryText,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
