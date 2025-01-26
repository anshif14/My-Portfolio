import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../common/color_pallette.dart';
import '../../common/image_contants.dart';

class LandingSection extends StatefulWidget {
  const LandingSection({super.key});

  @override
  State<LandingSection> createState() => _LandingSectionState();
}

class _LandingSectionState extends State<LandingSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation1;
  late Animation<double> _fadeAnimation2;
  late Animation<double> _fadeAnimation3;
  late Animation<Offset> _slideAnimation1;
  late Animation<Offset> _slideAnimation2;
  late Animation<Offset> _slideAnimation3;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    // First group of animations (Avatar and Hello text)
    _fadeAnimation1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
    ));

    _slideAnimation1 = Tween<Offset>(
      begin: const Offset(-30, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
    ));

    // Second group of animations (Developer who turns coffee...)
    _fadeAnimation2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOutCubic),
    ));

    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(0, 40),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOutCubic),
    ));

    // Third group of animations (Bottom section)
    _fadeAnimation3 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic),
    ));

    _slideAnimation3 = Tween<Offset>(
      begin: const Offset(0, 40),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                          child: FadeTransition(
                            opacity: _fadeAnimation1,
                            child: SlideTransition(
                              position: _slideAnimation1,
                              child: ScaleTransition(
                                scale: _scaleAnimation,
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
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeTransition(
                                opacity: _fadeAnimation1,
                                child: SlideTransition(
                                  position: _slideAnimation1,
                                  child: Wrap(
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
                                ),
                              ),
                              FadeTransition(
                                opacity: _fadeAnimation2,
                                child: SlideTransition(
                                  position: _slideAnimation2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'A Developer who turns',
                                        style: GoogleFonts.preahvihear(
                                          fontSize: 50,
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
                                                          fontSize: 50,
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
                                        'Because if the logic isn\'t solid, what else is?',
                                        style: GoogleFonts.preahvihear(
                                          fontSize: isDesktop ? 14 : 12,
                                          color: ColorPalette.primaryText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    FadeTransition(
                      opacity: _fadeAnimation3,
                      child: SlideTransition(
                        position: _slideAnimation3,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: isDesktop ? 800 : double.infinity,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "I'm a Software Developer.",
                                style: GoogleFonts.preahvihear(
                                  fontSize: 50,
                                  color: ColorPalette.primaryText,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Wrap(
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
                                    height: 40,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(ImageConstants.zartekLogo),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'A self-taught Flutter developer with 3+ years of experience, crafting high-performance, cross-platform mobile applications. I focus on creating intuitive and engaging user experiences while ensuring seamless integration with backend systems to deliver scalable and efficient solutions.',
                                style: GoogleFonts.preahvihear(
                                  fontSize: isDesktop ? 16 : 14,
                                  color: ColorPalette.secondaryText,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),
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
