import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                role: 'SDE Intern',
                company: 'HeyDoc AI',
                companyLink: 'https://heydoc.co.in/',
                dateLocation: 'Sept 2025 - Present / Remote, India',
                description:
                    'Developing key features HeyDoc AI mobile application with flutter and dart, integrated APIs and functionalities, working on dashboard for hospitals and doctors, matched figma designs and working on agentic AI platform.',
              ),
              // Divider(
              //   color: Colors.white.withOpacity(0.1),
              //   height: 64,
              //   thickness: 1,
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
  final dynamic companyLink;
  String get faviconUrl => 'https://www.google.com/s2/favicons?sz=64&domain_url=$companyLink';


  const _ExperienceItem({
    required this.isMobile,
    required this.role,
    required this.company,
    required this.dateLocation,
    required this.description,
    required this.companyLink,
  });
      Future<void> _launchLink() async {
      final Uri url = Uri.parse('https://$companyLink');

      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch $companyLink');
      }
    }


  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '$role, ',
                      style: const TextStyle(
                        fontFamily: 'Ravenna Serial ExtraBold',
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      company,
                      style: const TextStyle(
                        fontFamily: 'Ravenna Serial ExtraBold',
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Color(0xFF3ED598),
                      ),
                    ),
                    const SizedBox(width: 8),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: _launchLink,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              faviconUrl,
                              width: isMobile ? 18 : 22,
                              height: isMobile ? 18 : 22,
                              fit: BoxFit.cover,
                      
                              /// VERY IMPORTANT
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: isMobile ? 18 : 22,
                                  height: isMobile ? 18 : 22,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF3ED598).withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Icon(
                                    Icons.open_in_new_rounded,
                                    size: 14,
                                    color: Color(0xFF3ED598),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
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
              Row(
                children: [
                  Text(
                    '$role, ',
                    style: const TextStyle(
                      fontFamily: 'Ravenna Serial ExtraBold',
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    company,
                    style: const TextStyle(
                      fontFamily: 'Ravenna Serial ExtraBold',
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Color(0xFF3ED598),
                    ),
                  ),
                  const SizedBox(width: 10),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: _launchLink,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            faviconUrl,
                            width: isMobile ? 18 : 22,
                            height: isMobile ? 18 : 22,
                            fit: BoxFit.cover,
                    
                            ///VERY IMPORTANT
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: isMobile ? 18 : 22,
                                height: isMobile ? 18 : 22,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3ED598).withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Icon(
                                  Icons.open_in_new_rounded,
                                  size: 14,
                                  color: Color(0xFF3ED598),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  )

                ],
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
