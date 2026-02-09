import 'package:flutter/material.dart';
import 'dart:math';


class CurrentlyLearningSection extends StatelessWidget {
  const CurrentlyLearningSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 8 : 0,
            vertical: isMobile ? 24 : 40,
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 64,
              vertical: isMobile ? 32 : 56,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF10202B),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xFF3ED598).withOpacity(0.18),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3ED598).withOpacity(0.08),
                  blurRadius: 32,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //     const Icon(Icons.circle, color: Color(0xFFC6FCA6), size: 24),
                //     const SizedBox(width: 12),
                //     Text(
                //       'Currently putting my brain to work.',
                //       style: TextStyle(
                //         fontFamily: 'Ravenna Serial ExtraBold',
                //         fontWeight: FontWeight.w900,
                //         fontSize: isMobile ? 22 : 32,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
                TweenAnimationBuilder(
                  tween: Tween(begin: 40.0, end: 0.0),
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0, value),
                      child: Opacity(
                        opacity: 1 - (value / 40),
                        child: child,
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      /// PULSING ICON
                      TweenAnimationBuilder(
                        tween: Tween(begin: 0.9, end: 1.1),
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                        builder: (_, scale, child) {
                          return Transform.scale(scale: scale, child: child);
                        },
                        child: const Icon(
                          Icons.circle,
                          color: Color(0xFFC6FCA6),
                          size: 24,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Text(
                        'Currently putting my brain to work.',
                        style: TextStyle(
                          fontFamily: 'Ravenna Serial ExtraBold',
                          fontWeight: FontWeight.w900,
                          fontSize: isMobile ? 22 : 32,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),
                Text(
                  'Exploring and learning to unlock new potential.',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    fontSize: isMobile ? 14 : 18,
                    color: Colors.white.withOpacity(0.7),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 56),
                Wrap(
                  spacing: 32,
                  runSpacing: 30,
                  alignment: WrapAlignment.start,
                  children: [
                    _TechCard(asset: 'assets/icons/Go-Logo_White.png', isMobile: isMobile),
                    _TechCard(asset: 'assets/icons/js.png', isMobile: isMobile),
                    _TechCard(asset: 'assets/icons/physics.png', isMobile: isMobile),
                    _TechCard(asset: 'assets/icons/python-programming-language-icon.png', isMobile: isMobile),
                    _TechCard(asset: 'assets/icons/ADK.png', isMobile: isMobile),
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

// class _TechCard extends StatefulWidget {
//   final String asset;
//   final bool isMobile;

//   const _TechCard({
//     required this.asset,
//     required this.isMobile,
//   });

//   @override
//   State<_TechCard> createState() => _TechCardState();
// }

// class _TechCardState extends State<_TechCard> {
//   bool hovering = false;
//   bool pressing = false;

//   @override
//   Widget build(BuildContext context) {
//     double size = widget.isMobile ? 60 : 90;

//     return MouseRegion(
//       onEnter: (_) => setState(() => hovering = true),
//       onExit: (_) {
//         setState(() {
//           hovering = false;
//           pressing = false;
//         });
//       },
//       child: GestureDetector(
//         onTapDown: (_) => setState(() => pressing = true),
//         onTapUp: (_) => setState(() => pressing = false),
//         onTapCancel: () => setState(() => pressing = false),

//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 180),
//           curve: Curves.easeOut,
//           width: size,
//           height: size,
//           transform: Matrix4.identity()
//             ..scale(pressing
//                 ? 0.92
//                 : hovering
//                     ? 1.08
//                     : 1.0),

//           decoration: BoxDecoration(
//             color: const Color(0xFF081B28),
//             borderRadius: BorderRadius.circular(16),

//             /// BORDER ANIMATION
//             border: Border.all(
//               color: hovering
//                   ? const Color(0xFF3ED598)
//                   : Colors.white.withOpacity(0.4),
//               width: hovering ? 1.4 : 1,
//             ),

//             /// GLOW ANIMATION
//             boxShadow: [
//               BoxShadow(
//                 color: hovering
//                     ? const Color(0xFF3ED598).withOpacity(0.35)
//                     : Colors.black.withOpacity(0.10),
//                 blurRadius: hovering ? 22 : 12,
//                 spreadRadius: hovering ? 1 : 0,
//                 offset: const Offset(0, 6),
//               ),
//             ],
//           ),

//           child: Center(
//             child: AnimatedScale(
//               duration: const Duration(milliseconds: 180),
//               scale: pressing ? 0.85 : 1,
//               child: Image.asset(
//                 widget.asset,
//                 width: size * 0.8,
//                 height: size * 0.8,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class _TechCard extends StatefulWidget {
  final String asset;
  final bool isMobile;

  const _TechCard({
    required this.asset,
    required this.isMobile,
  });

  @override
  State<_TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<_TechCard>
    with SingleTickerProviderStateMixin {
  bool hovering = false;
  bool pressing = false;

  Offset pointerOffset = Offset.zero;

  late AnimationController shimmerController;

  @override
  void initState() {
    super.initState();

    shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = widget.isMobile ? 60 : 90;

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.8, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,

      /// ⭐ STAGGER EFFECT
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },

      child: MouseRegion(
        onEnter: (_) => setState(() => hovering = true),
        onExit: (_) {
          setState(() {
            hovering = false;
            pressing = false;
            pointerOffset = Offset.zero;
          });
        },
        onHover: (event) {
          final box = context.findRenderObject() as RenderBox;
          final local = box.globalToLocal(event.position);

          setState(() {
            pointerOffset = Offset(
              (local.dx - size / 2) / 8,
              (local.dy - size / 2) / 8,
            );
          });
        },

        child: GestureDetector(
          onTapDown: (_) => setState(() => pressing = true),
          onTapUp: (_) => setState(() => pressing = false),
          onTapCancel: () => setState(() => pressing = false),

          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            width: size,
            height: size,

            /// 🔥 MAGNETIC + PARALLAX
            transform: Matrix4.identity()
              ..translate(pointerOffset.dx, pointerOffset.dy)
              ..scale(
                pressing
                    ? 0.9
                    : hovering
                        ? 1.12
                        : 1,
              ),

            decoration: BoxDecoration(
              color: const Color(0xFF081B28),
              borderRadius: BorderRadius.circular(16),

              border: Border.all(
                color: hovering
                    ? const Color(0xFF3ED598)
                    : Colors.white.withOpacity(0.4),
                width: hovering ? 1.6 : 1,
              ),

              /// 🔥 CURSOR PROXIMITY GLOW
              boxShadow: [
                BoxShadow(
                  color: hovering
                      ? const Color(0xFF3ED598).withOpacity(0.45)
                      : Colors.black.withOpacity(0.10),
                  blurRadius: hovering ? 28 : 12,
                  spreadRadius: hovering ? 2 : 0,
                  offset: const Offset(0, 8),
                ),
              ],
            ),

            child: Stack(
              children: [
                /// 🔥 GRADIENT SHIMMER
                AnimatedBuilder(
                  animation: shimmerController,
                  builder: (_, __) {
                    return Positioned.fill(
                      child: IgnorePointer(
                        child: Opacity(
                          opacity: hovering ? 0.25 : 0,
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: FractionalTranslation(
                              translation: Offset(
                                  shimmerController.value * 2 - 1, 0),
                              child: Container(
                                width: size,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.white,
                                      Colors.transparent,
                                    ],
                                    stops: [0.2, 0.5, 0.8],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                Center(
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: pressing ? 0.82 : 1,
                    child: Image.asset(
                      widget.asset,
                      width: size * 0.75,
                      height: size * 0.75,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


