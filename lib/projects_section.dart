// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ProjectsSection extends StatefulWidget {
//   const ProjectsSection({super.key});

//   @override
//   State<ProjectsSection> createState() => _ProjectsSectionState();
// }

// class _ProjectsSectionState extends State<ProjectsSection> {
//   final ScrollController _scrollController = ScrollController();
//   Timer? _timer;
//   bool _isAutoScrolling = true;

//   final List<ProjectItem> _projects = [
//     ProjectItem(
//       title: "Curating STUD experiences\nwhile XINGXANG",
//       description:
//           "I am building super useful android applications besides holding a strong interests towards designing and developing cool and custom UI /UX and attractive user interfaces .",
//       imageAsset: "assets/images/projectsectionmockup2.png",
//       githubUrl: "https://github.com/SidEnpassant",
//     ),
//     ProjectItem(
//       title: "Curating STUD experiences\nwhile aasasbwd",
//       description:
//           "I am building super useful android applications besides holding a strong interests towards designing and developing cool and custom UI /UX and attractive user interfaces .",
//       imageAsset: "assets/images/projectsectionmockup3.png",
//       githubUrl: "https://github.com/SidEnpassant",
//     ),
//      ProjectItem(
//       title: "Climate Change Impact\non Agriculture",
//        description:
//           "Full stack news application providing latest insights on global topics.",
//       imageAsset: "assets/images/projectsectionmockup1.png",
//       githubUrl: "https://github.com/SidEnpassant",
//       isPortraitOnly: true, 
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _startAutoScroll();
//   }

//   void _startAutoScroll() {
//     _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
//       if (!_isAutoScrolling) return;

//       if (_scrollController.hasClients) {
//         double newOffset = _scrollController.offset + 2.0; // Slow scroll speed
//         if (newOffset >= _scrollController.position.maxScrollExtent) {
//           // Reset to start or reverse? Let's just reset for infinite feel or bounce
//           // For a simple implementation, let's reverse or jump to start. 
//           // Given the request "slowly auto scroll side by side", cycling back is common.
//            // However, simple linear scroll until end then jump back is easier to implement robustly without complex infinite lists.
//            // Let's implement a 'bounce' or simply stop at end? 
//            // User said "auto scroll side by side". 
//            // Let's make it scroll to end then jump to start for loop effect.
//            _scrollController.jumpTo(0);
//         } else {
//           _scrollController.jumpTo(newOffset);
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isMobile = width < 900;

//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 40.0, top: 40),
//           child: Text(
//             "PROJECT 'S",
//             style: TextStyle(
//               fontFamily: 'Ravenna Serial ExtraBold',
//               fontWeight: FontWeight.w900,
//               fontSize: isMobile ? 36 : 64,
//               color: const Color(0xFFC6FCA6), 
//               letterSpacing: 1.5,
//             ),
//           ),
//         ),
//         SizedBox(
//           height: isMobile ? 450 : 550, // Height for the cards
//           child: Listener(
//             onPointerDown: (_) {
//               setState(() {
//                 _isAutoScrolling = false;
//               });
//             },
//             onPointerUp: (_) {
//               setState(() {
//                 // Optional: resume auto scroll after delay?
//                 // User might want to manually scroll now. 
//                 // Let's keep it paused or resume after a long delay.
//                 // For now, let's just pause on interaction.
//                 // To resume, we can use a timer.
//                 Future.delayed(const Duration(seconds: 2), () {
//                   if (mounted) {
//                     setState(() {
//                       _isAutoScrolling = true;
//                     });
//                   }
//                 });
//               });
//             },
//             child: ListView.separated(
//               controller: _scrollController,
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 80),
//               itemCount: _projects.length,
//               separatorBuilder: (context, index) => const SizedBox(width: 32),
//               itemBuilder: (context, index) {
//                 return _ProjectCard(item: _projects[index], isMobile: isMobile);
//               },
//             ),
//           ),
//         ),
//         const SizedBox(height: 60),
//       ],
//     );
//   }
// }

// class ProjectItem {
//   final String title;
//   final String description;
//   final String imageAsset;
//   final String githubUrl;
//   final bool isPortraitOnly;

//   ProjectItem({
//     required this.title,
//     required this.description,
//     required this.imageAsset,
//     required this.githubUrl,
//     this.isPortraitOnly = false,
//   });
// }

// class _ProjectCard extends StatelessWidget {
//   final ProjectItem item;
//   final bool isMobile;

//   const _ProjectCard({
//     required this.item,
//     required this.isMobile,
//   });

//   Future<void> _launchUrl() async {
//     final Uri uri = Uri.parse(item.githubUrl);
//     try {
//       if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//         debugPrint('Could not launch $uri');
//       }
//     } catch (e) {
//       debugPrint('Error launching URL: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Determine card width
//     double cardWidth = isMobile ? 320 : 800;
//     if (item.isPortraitOnly) {
//        cardWidth = isMobile ? 260 : 350; // Smaller width for portrait only text/image cards if needed, but design shows uniform cards mostly.
//        // Actually the design shows the first card is just a phone. The text might be inside or hidden?
//        // Let's look at the design again. 
//        // The first card looks like just a phone screenshot. 
//        // The others are text + phone.
//        // I will support both layouts.
//     }

//     return Container(
//       width: cardWidth,
//       padding: EdgeInsets.all(isMobile ? 20 : 40),
//       decoration: BoxDecoration(
//         color: const Color(0xFF10202B),
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(
//           color: const Color(0xFF3ED598).withOpacity(0.18),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF3ED598).withOpacity(0.08),
//             blurRadius: 32,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: item.isPortraitOnly 
//       ? Center(
//           child: Image.asset(
//             item.imageAsset,
//             fit: BoxFit.contain,
//           ),
//         )
//       : Flex(
//           direction: isMobile ? Axis.vertical : Axis.horizontal,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 5,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     item.title,
//                     style: TextStyle(
//                       fontFamily: 'Ravenna Serial ExtraBold',
//                       fontWeight: FontWeight.w900,
//                       fontSize: isMobile ? 24 : 32,
//                       color: Colors.white,
//                       height: 1.1,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   // Using RichText to replicate "super useful android applications" in green
//                   // For simplicity based on prompt, I'll attempt to highlight specific keywords if I can, 
//                   // or just style the whole block. 
//                   // The prompt says "with some highlighted green words (rich text)".
//                   // I will parse simple markdown-like syntax or just hardcode for these items.
//                   // For scalability, let's just make the description stylable.
//                   RichText(
//                     text: TextSpan(
//                        style: TextStyle(
//                             fontFamily: 'Manrope',
//                             fontWeight: FontWeight.w500,
//                             fontSize: isMobile ? 14 : 16,
//                             color: Colors.white.withOpacity(0.7),
//                             height: 1.6,
//                           ),
//                       children: _buildDescriptionSpans(item.description),
//                     ),
//                   ),
//                   const SizedBox(height: 32),
//                   MouseRegion(
//                     cursor: SystemMouseCursors.click,
//                     child: GestureDetector(
//                       onTap: _launchUrl,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             const Text(
//                               "Github",
//                               style: TextStyle(
//                                 fontFamily: 'Manrope',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 14,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             const Icon(Icons.arrow_outward, size: 16, color: Colors.black),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//              if (!isMobile) const SizedBox(width: 20),
//              Expanded(
//                flex: 4,
//                child: Center(
//                  child: Image.asset(
//                    item.imageAsset,
//                    fit: BoxFit.contain,
//                    // Ensure image doesn't overflow
//                    height: isMobile ? 200 : 400,
//                  ),
//                ),
//              ),
//           ],
//         ),
//     );
//   }

//   // Simple heuristic helper to highlight "super useful" "android applications" "UI /UX" etc.
//   List<TextSpan> _buildDescriptionSpans(String text) {
//     // Default style
//     final defaultStyle = TextStyle(
//       fontFamily: 'Manrope',
//       fontWeight: FontWeight.w500,
//       fontSize: isMobile ? 14 : 16,
//       color: Colors.white.withOpacity(0.7),
//       height: 1.6,
//     );
    
//     // Highlight style
//     final greenStyle = TextStyle(
//       fontFamily: 'Manrope',
//       fontWeight: FontWeight.w700,
//       fontSize: isMobile ? 14 : 16,
//       color: const Color(0xFFC6FCA6),
//        height: 1.6,
//     );

//     List<TextSpan> spans = [];
    
//     // Naive split for specific phrases based on the screenshot text.
//     if (text.contains("super useful android applications")) {
//        var parts = text.split("super useful android applications");
//        spans.add(TextSpan(text: parts[0], style: defaultStyle));
//        spans.add(TextSpan(text: "super useful android applications", style: greenStyle));
//        if (parts.length > 1) {
//          var secondPart = parts[1];
//          if (secondPart.contains("custom UI /UX and attractive user interfaces")) {
//             var subParts = secondPart.split("custom UI /UX and attractive user interfaces");
//             spans.add(TextSpan(text: subParts[0], style: defaultStyle));
//             spans.add(TextSpan(text: "custom UI /UX and attractive user interfaces", style: greenStyle));
//             if (subParts.length > 1) spans.add(TextSpan(text: subParts[1], style: defaultStyle));
//          } else {
//             spans.add(TextSpan(text: secondPart, style: defaultStyle));
//          }
//        }
//     } else {
//       spans.add(TextSpan(text: text, style: defaultStyle));
//     }
    
//     return spans;
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    final projects = [
      ProjectItem(
        title: "AI Voice Multi-Agent System",
        description:
            "Built an ultra-low latency voice orchestration system using agent architecture. Handles real-time speech, streaming responses, and intelligent routing between specialized agents.",
        imageAsset: "assets/images/projectsectionmockup2.png",
        githubUrl: "https://github.com/SidEnpassant",
        liveUrl: null,
        tags: ["Flutter", "AI", "Realtime", "Agents"],
      ),
      ProjectItem(
        title: "Attendly — Smart Campus Platform",
        description:
            "Designed and developed a modern attendance intelligence platform with analytics dashboards, automated workflows, and scalable backend architecture.",
        imageAsset: "assets/images/projectsectionmockup3.png",
        githubUrl: "https://github.com/SidEnpassant",
        liveUrl: null,
        tags: ["Flutter", "Node", "Analytics", "System Design"],
      ),
      ProjectItem(
        title: "Full Stack News Intelligence App",
        description:
            "A high-performance news platform delivering global insights with optimized APIs, responsive UI, and strong caching strategies.",
        imageAsset: "assets/images/projectsectionmockup1.png",
        githubUrl: "https://github.com/SidEnpassant",
        tags: ["Full Stack", "Performance", "UX"],
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 120,
      ),
      child: Column(
        children: [
          /// SECTION HEADER
          Column(
            children: [
              const Text(
                "SELECTED WORK",
                style: TextStyle(
                  color: Color(0xFFC6FCA6),
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Projects That Define My\nEngineering Taste",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 34 : 56,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ],
          ),

          const SizedBox(height: 80),

          /// PROJECT LIST
          Column(
            children: projects
                .map(
                  (project) => Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: _ProjectCard(
                      item: project,
                      isMobile: isMobile,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

/// DATA MODEL
class ProjectItem {
  final String title;
  final String description;
  final String imageAsset;
  final String githubUrl;
  final String? liveUrl;
  final List<String>? tags;

  ProjectItem({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.githubUrl,
    this.liveUrl,
    this.tags,
  });
}

/// PREMIUM CARD
class _ProjectCard extends StatefulWidget {
  final ProjectItem item;
  final bool isMobile;

  const _ProjectCard({
    required this.item,
    required this.isMobile,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hovering = false;

  Future<void> launch(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = widget.isMobile;

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: hovering
                ? [
                    const Color(0xFF3ED598),
                    const Color(0xFF6FF7C8),
                  ]
                : [
                    Colors.white.withOpacity(0.06),
                    Colors.white.withOpacity(0.01),
                  ],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.all(isMobile ? 20 : 40),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1A22),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: hovering
                    ? const Color(0xFF3ED598).withOpacity(0.2)
                    : Colors.black.withOpacity(0.4),
                blurRadius: 50,
                offset: const Offset(0, 25),
              )
            ],
          ),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            children: [
              /// TEXT SIDE
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TAGS
                    if (widget.item.tags != null)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.item.tags!
                            .map(
                              (tag) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF3ED598).withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  tag,
                                  style: const TextStyle(
                                    color: Color(0xFFC6FCA6),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),

                    const SizedBox(height: 20),

                    /// TITLE
                    Text(
                      widget.item.title,
                      style: TextStyle(
                        fontSize: isMobile ? 26 : 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// DESCRIPTION
                    Text(
                      widget.item.description,
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.white.withOpacity(0.7),
                        height: 1.7,
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// CTA BUTTONS
                    Row(
                      children: [
                        _button(
                          text: "Github",
                          primary: true,
                          onTap: () => launch(widget.item.githubUrl),
                        ),
                        const SizedBox(width: 12),
                        if (widget.item.liveUrl != null)
                          _button(
                            text: "Live",
                            primary: false,
                            onTap: () => launch(widget.item.liveUrl!),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              if (!isMobile) const SizedBox(width: 40),

              /// IMAGE SIDE
              Expanded(
                flex: 4,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 250),
                  scale: hovering ? 1.05 : 1,
                  child: Image.asset(
                    widget.item.imageAsset,
                    height: isMobile ? 240 : 420,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button({
    required String text,
    required bool primary,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: primary ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white24),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: primary ? Colors.black : Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
