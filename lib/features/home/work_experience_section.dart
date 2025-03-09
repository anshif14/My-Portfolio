import 'package:anshif_portolio/common/image_contants.dart';
import 'package:anshif_portolio/common/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../common/color_pallette.dart';

class WorkExperienceSection extends StatefulWidget {
  const WorkExperienceSection({super.key});

  @override
  State<WorkExperienceSection> createState() => _WorkExperienceSectionState();
}

class _WorkExperienceSectionState extends State<WorkExperienceSection> with SingleTickerProviderStateMixin {
  List icons = [
    ImageConstants.work1,
    ImageConstants.work2,
    ImageConstants.work3,
    ImageConstants.work4,
  ];

  late AnimationController _controller;
  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;
  final List<bool> _isHovered = List.generate(4, (_) => false);
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _slideAnimations = List.generate(
      4,
          (index) {
        final startTime = 0.2 + (index * 0.1);
        final endTime = 0.5 + (index * 0.1);
        return Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(startTime, endTime, curve: Curves.easeOutCubic),
          ),
        );
      },
    );

    _fadeAnimations = List.generate(
      4,
          (index) {
        final startTime = 0.2 + (index * 0.1);
        final endTime = 0.5 + (index * 0.1);
        return Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(startTime, endTime, curve: Curves.easeOutCubic),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.3 && !_hasAnimated) {
      _controller.forward();
      _hasAnimated = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return VisibilityDetector(
      key: const Key('work-experience-section'),
      onVisibilityChanged: _handleVisibilityChanged,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorPalette.darkBackground,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                ImageConstants.glowEffect1,
                height: height * 0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.3),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
                      ),
                    ),
                    child: FadeTransition(
                      opacity: Tween<double>(
                        begin: 0.0,
                        end: 1.0,
                      ).animate(
                        CurvedAnimation(
                          parent: _controller,
                          curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
                        ),
                      ),
                      child: Text(
                        'Work Experience',
                        style: GoogleFonts.preahvihear(
                          fontSize: 50,
                          color: ColorPalette.primaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 4,
                    children: List.generate(
                      4,
                          (index) => SlideTransition(
                        position: _slideAnimations[index],
                        child: FadeTransition(
                          opacity: _fadeAnimations[index],
                          child: _buildExperienceCard(
                            index == 0
                                ? 'Zartek technologies'
                                : index == 1
                                ? 'First Logic Meta LAB'
                                : index == 2
                                ? 'First Logic Institute of Technology'
                                : 'Softroniics',
                            'Take your client onboard seamlessly by our amazing tool of digital onboard process.',
                            icons[index],
                            index,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard(String title, String description, String icon, int index) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered[index] = true),
      onExit: (_) => setState(() => _isHovered[index] = false),
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 200),
        tween: Tween<double>(begin: 0, end: _isHovered[index] ? 1 : 0),
        builder: (context, double value, child) {
          return Transform.scale(
            scale: 1 + (0.02 * value),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorPalette.primaryPurple.withOpacity(0.2 + (0.1 * value)),
                    ColorPalette.darkBackground.withOpacity(0.8),
                  ],
                ),
                border: Border.all(
                  color: ColorPalette.primaryPurple.withOpacity(0.3 + (0.2 * value)),
                  width: 1 + value,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorPalette.primaryPurple.withOpacity(0.2 * value),
                    blurRadius: 20 * value,
                    spreadRadius: 2 * value,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1 + (0.1 * value),
                      child: Image.asset(
                        icon,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.preahvihear(
                              fontSize: 24,
                              color: ColorPalette.primaryText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            description,
                            style: GoogleFonts.preahvihear(
                              fontSize: 14,
                              color: ColorPalette.secondaryText,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Transform.scale(
                        scale: 1 + (0.1 * value),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: ColorPalette.primaryPurple.withOpacity(0.2 + (0.1 * value)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                          child: Text(
                            'LEARN MORE',
                            style: GoogleFonts.preahvihear(
                              fontSize: 12,
                              color: ColorPalette.primaryPurple,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
