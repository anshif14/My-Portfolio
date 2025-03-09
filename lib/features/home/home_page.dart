import 'package:anshif_portolio/common/color_pallette.dart';
import 'package:anshif_portolio/common/image_contants.dart';
import 'package:anshif_portolio/features/home/landing_section.dart';
import 'package:anshif_portolio/features/home/orbit_section.dart';
import 'package:anshif_portolio/features/home/projects_section.dart';
import 'package:anshif_portolio/features/home/work_experience_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (!_isScrollingDown) {
        setState(() => _isScrollingDown = true);
      }
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      if (_isScrollingDown) {
        setState(() => _isScrollingDown = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.darkBackground,
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
          physics: const ClampingScrollPhysics(),
          platform: TargetPlatform.macOS,
        ),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          trackVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(
              parent: RangeMaintainingScrollPhysics(),
            ),
            child: RepaintBoundary(
              child: Column(
                children: [
                  RepaintBoundary(
                    child: Stack(
                      children: [
                        const LandingSection(),
                        Positioned(
                          right: 0,
                          child: Image.asset(
                            ImageConstants.glowEffect1,
                            height: 400,
                            // cacheWidth: 800, // Optimize image loading
                          ),
                        ),
                      ],
                    ),
                  ),
                  const RepaintBoundary(
                    child: WorkExperienceSection(),
                  ),
                  const RepaintBoundary(
                    child: OrbitSection(),
                  ), const RepaintBoundary(
                    child: ProjectsSection(),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
