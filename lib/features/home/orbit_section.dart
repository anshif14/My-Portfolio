import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../common/image_contants.dart';

class OrbitSection extends StatefulWidget {
  const OrbitSection({super.key});

  @override
  State<OrbitSection> createState() => _OrbitSectionState();
}

class _OrbitSectionState extends State<OrbitSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
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
    
    return VisibilityDetector(
      key: const Key('orbit-section'),
      onVisibilityChanged: _handleVisibilityChanged,
      child: Column(
        children: [
          const SizedBox(height: 100),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Image.asset(
              ImageConstants.orbitImage,
              height: height * 0.85,
            ),
          ),
        ],
      ),
    );
  }
}
