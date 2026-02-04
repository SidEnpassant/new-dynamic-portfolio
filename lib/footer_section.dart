// import 'package:flutter/material.dart';

// class FooterSection extends StatelessWidget {
//   const FooterSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isMobile = width < 900;

//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.only(
//         top: isMobile ? 60 : 100,
//         bottom: isMobile ? 40 : 60,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'MEAN IT',
//             style: TextStyle(
//               fontFamily: 'Ravenna Serial ExtraBold', // Utilizing the primary display font
//               fontWeight: FontWeight.w900,
//               fontSize: isMobile ? 80 : 200, // Massive size for impact
//               color: const Color(0xFF8D99A2), // Muted grey color from image
//               letterSpacing: 2, // Retract spacing slightly for tight look
//               height: 1, // Tight line height
//             ),
//             textAlign: TextAlign.center,
//           ),
//           // Add any additional footer content if requested later, for now just the big text.
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return SizedBox(
      width: double.infinity,
      height: isMobile ? 160 : 200, // Controls visible footer height
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none, // IMPORTANT → allows overflow
        children: [

          // Main big text
          Positioned(
            bottom: isMobile ? -30 : -50, // pushes text outside
            child: Text(
              'MEAN IT',
              style: TextStyle(
                fontFamily: 'Ravenna Serial ExtraBold',
                fontWeight: FontWeight.w900,
                fontSize: isMobile ? 90 : 220, // slightly larger for figma feel
                color: const Color(0xFF8D99A2),
                letterSpacing: 2,
                height: 0.9, // tighter = more premium look
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
