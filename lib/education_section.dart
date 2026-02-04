import 'package:flutter/material.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

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
                'My Education',
                style: TextStyle(
                  fontFamily: 'Ravenna Serial ExtraBold',
                  fontWeight: FontWeight.w900,
                  fontSize: isMobile ? 36 : 56,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 80),
              _EducationItem(
                isMobile: isMobile,
                institution: 'NAVA NALANDA HIGH SCHOOL',
                yearLocation: '2020 - 2022 / KOLKATA',
                description:
                    'Completed my class 11 and 12 from Nava\nNalanda High School in Computer Science ,\nmaths , physics , chemistry',
              ),
              Divider(
                color: Colors.white.withOpacity(0.1),
                height: 64,
                thickness: 1,
              ),
              _EducationItem(
                isMobile: isMobile,
                institution: 'CIEM',
                yearLocation: '2022 - 2026 / KOLKATA',
                description:
                    'Pursuing BTech in Computer Science and\nEngineering and also strengthening core cs\nfundamentals - OS , DBMS , CN etc..',
              ),
               Divider(
                color: Colors.white.withOpacity(0.1),
                height: 64,
                thickness: 1,
              ),
              const SizedBox(height: 80),
               Container(
                width: double.infinity,
                height: 1,
                color: Colors.white.withOpacity(0.5),
               )
            ],
          ),
        ),
      ),
    );
  }
}

class _EducationItem extends StatelessWidget {
  final bool isMobile;
  final String institution;
  final String yearLocation;
  final String description;

  const _EducationItem({
    required this.isMobile,
    required this.institution,
    required this.yearLocation,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            institution,
            style: const TextStyle(
              fontFamily: 'Ravenna Serial ExtraBold',
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            yearLocation,
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
              Text(
                institution,
                style: const TextStyle(
                  fontFamily: 'Ravenna Serial ExtraBold',
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                yearLocation,
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
