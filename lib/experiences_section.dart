import 'package:flutter/material.dart';

class ExperiencesSection extends StatelessWidget {
  const ExperiencesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 0,
            vertical: isMobile ? 40 : 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'MY EXPERIENCES',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 14 : 16,
                  color: const Color(0xFFC6FCA6),
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Where I've Been Employed",
                style: TextStyle(
                  fontFamily: 'Ravenna Serial ExtraBold',
                  fontWeight: FontWeight.w900,
                  fontSize: isMobile ? 32 : 48,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80),
              _ExperienceItem(
                isMobile: isMobile,
                role: 'SDE Intern - Flutter',
                company: 'HeyDoc AI',
                dateLocation: 'Sept 2025 - Present / Remote, India',
                description:
                    'Designed key features HeyDoc AI mobile application and integrated API and functionalities, worked on dashboard for hospitals and doctors, matched figma designs and worked on agentic platform',
              ),
              // Divider(
              //   color: Colors.white.withOpacity(0.1),
              //   height: 64,
              //   thickness: 1,
              // ),
              // _ExperienceItem(
              //   isMobile: isMobile,
              //   role: 'Product Designer',
              //   company: 'Betterplace',
              //   dateLocation: 'May - Aug 2023 / Bangalore, India',
              //   description:
              //       'Designed key features for embedding in-platform data widgets, charts, and objects to generate technical reports. Designed interactions for users to',
              // ),
              // Divider(
              //   color: Colors.white.withOpacity(0.1),
              //   height: 64,
              //   thickness: 1,
              // ),
              // _ExperienceItem(
              //   isMobile: isMobile,
              //   role: 'Product Design Intern',
              //   company: 'Able Jobs',
              //   dateLocation: 'May - Aug 2022 / Bangalore, India',
              //   description:
              //       'Designed key features for embedding in-platform data widgets, charts, and objects to generate technical reports. Designed interactions for users to',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final bool isMobile;
  final String role;
  final String company;
  final String dateLocation;
  final String description;

  const _ExperienceItem({
    required this.isMobile,
    required this.role,
    required this.company,
    required this.dateLocation,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$role, ',
                  style: const TextStyle(
                    fontFamily: 'Ravenna Serial ExtraBold',
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: company,
                  style: const TextStyle(
                    fontFamily: 'Ravenna Serial ExtraBold',
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Color(0xFF3ED598), 
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            dateLocation,
            style: const TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.white.withOpacity(0.7),
              height: 1.6,
            ),
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$role, ',
                      style: const TextStyle(
                        fontFamily: 'Ravenna Serial ExtraBold',
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: company,
                      style: const TextStyle(
                        fontFamily: 'Ravenna Serial ExtraBold',
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        color: Color(0xFF3ED598), 
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                dateLocation,
                style: const TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            description,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.white.withOpacity(0.7),
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
