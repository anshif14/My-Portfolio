import 'package:anshif_portolio/common/image_contants.dart';
import 'package:anshif_portolio/common/variables.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/color_pallette.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final List<ProjectModel> projects = [
    ProjectModel(
      title: 'Example Project',
      description:
          'A web app for visualizing personalized Spotify data. View your top artists, top tracks, recently played tracks, and detailed audio information about each track. Create and save new playlists of recommended tracks based on your existing playlists and more.',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/anshif-4ae5e.firebasestorage.app/o/Screenshot%202025-02-01%20at%2012.48.28%E2%80%AFPM.png?alt=media&token=600beac0-728c-45e1-bf17-f939f1650cfb', // Add your project images
      projectUrl: 'https://your-project-url.com',
    ),
    // Add more projects here
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPalette.darkBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Projects',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectCard(project: projects[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        height: height*0.5,
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: Colors.grey,

          // color: ColorPalette.darkBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: InkWell(
          onTap: () {
            // Add navigation to project URL
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Stack(
              children: [
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Expanded(
                //       flex: 3,
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             widget.project.title,
                //             style: GoogleFonts.poppins(
                //               fontSize: 24,
                //               fontWeight: FontWeight.w600,
                //               color: Colors.white,
                //             ),
                //           ),
                //           const SizedBox(height: 12),
                //           Text(
                //             widget.project.description,
                //             style: GoogleFonts.poppins(
                //               fontSize: 16,
                //               color: Colors.grey[300],
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     const SizedBox(width: 40),
                //   ],
                // ),

                GlassmorphicContainer(
                    child: Text(
                      widget.project.title,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    width: width * 0.7,
                    height: height * 0.2,
                    borderRadius: 12,
                    linearGradient: LinearGradient(colors: [
                      Color(0xFFffffff).withAlpha(10),
                      Color(0xFFFFFFFF).withAlpha(15),
                    ]),
                    border: 2,
                    blur: 1,
                    borderGradient: LinearGradient(colors: [
                      Color(0xFFffffff).withAlpha(10),
                      Color(0xFFFFFFFF).withAlpha(15),
                    ])),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          height: 400,
                          ImageConstants.glowEffect1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          height: 250,
                          widget.project.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectModel {
  final String title;
  final String description;
  final String imageUrl;
  final String projectUrl;

  ProjectModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.projectUrl,
  });
}
