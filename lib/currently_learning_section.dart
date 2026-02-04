import 'package:flutter/material.dart';

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
                Row(
                  children: [
                    const Icon(Icons.circle, color: Color(0xFFC6FCA6), size: 24),
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

class _TechCard extends StatelessWidget {
  final String asset;
  final bool isMobile;
  const _TechCard({required this.asset, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double size = isMobile ? 60 : 90;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFF081B28),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          asset,
          width: size * 0.8,
          height: size * 0.8,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
