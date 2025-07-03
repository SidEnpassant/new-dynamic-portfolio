import 'package:flutter/material.dart';

class ProfileOverviewSection extends StatelessWidget {
  const ProfileOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: EdgeInsets.only(
            top: isMobile ? 32 : 80,
            left: isMobile ? 8 : 0,
            right: isMobile ? 8 : 0,
            bottom: isMobile ? 24 : 40,
          ),
          child:
              isMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _ChessCard(isMobile: true),
                      const SizedBox(height: 32),
                      _LinksAndLocation(isMobile: true),
                    ],
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 500, child: _ChessCard(isMobile: false)),
                      const SizedBox(width: 56),
                      SizedBox(
                        width: 370,
                        child: _LinksAndLocation(isMobile: false),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}

class _ChessCard extends StatelessWidget {
  final bool isMobile;
  const _ChessCard({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : 40,
        vertical: isMobile ? 20 : 32,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF10202B),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF3ED598).withOpacity(0.18)),
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
              const Icon(Icons.star, color: Color(0xFFC6FCA6), size: 20),
              const SizedBox(width: 10),
              Text(
                'Playing chess as a hobby',
                style: TextStyle(
                  fontFamily: 'Ravenna Serial ExtraBold',
                  fontWeight: FontWeight.w900,
                  fontSize: isMobile ? 18 : 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'FIDE rated - 1473 , plays tournament occasionally.',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
              fontSize: isMobile ? 14 : 17,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 28),
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double maxImgWidth = isMobile ? 160 : 320;
                double maxImgHeight = isMobile ? 120 : 180;
                return Image.asset(
                  'assets/images/chess.png',
                  width: maxImgWidth,
                  height: maxImgHeight,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LinksAndLocation extends StatelessWidget {
  final bool isMobile;
  const _LinksAndLocation({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 36,
            vertical: isMobile ? 24 : 56,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF10202B),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0xFF3ED598).withOpacity(0.18),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3ED598).withOpacity(0.18),
                blurRadius: 48,
                offset: const Offset(-24, -24),
                spreadRadius: 0,
              ),
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
                  const Icon(Icons.star, color: Color(0xFFC6FCA6), size: 20),
                  const SizedBox(width: 10),
                  Text(
                    'My links',
                    style: TextStyle(
                      fontFamily: 'Ravenna Serial ExtraBold',
                      fontWeight: FontWeight.w900,
                      fontSize: isMobile ? 18 : 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Here are my links.',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                  fontSize: isMobile ? 13 : 16,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _SocialIcon(
                    asset: 'assets/icons/linkedin.png',
                    size: isMobile ? 60 : 76,
                  ),
                  const SizedBox(width: 28),
                  _SocialIcon(
                    asset: 'assets/icons/github.png',
                    size: isMobile ? 60 : 76,
                  ),
                  const SizedBox(width: 28),
                  _SocialIcon(
                    asset: 'assets/icons/leetcode.png',
                    size: isMobile ? 60 : 76,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Column(
          children: [
            Text(
              "I'am from",
              style: TextStyle(
                fontFamily: 'Ravenna Serial ExtraBold',
                fontWeight: FontWeight.w900,
                fontSize: isMobile ? 26 : 36,
                color: Colors.white,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'KOLKATA',
              style: TextStyle(
                fontFamily: 'Ravenna Serial ExtraBold',
                fontWeight: FontWeight.w900,
                fontSize: isMobile ? 60 : 110,
                color: const Color(0xFFC6FCA6),
                height: 1.0,
                letterSpacing: 2.5,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final String asset;
  final double size;
  const _SocialIcon({required this.asset, this.size = 44});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFF081B28),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
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
          width: size * 0.62,
          height: size * 0.62,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
