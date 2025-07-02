// import 'package:flutter/material.dart';

// class AboutSection extends StatelessWidget {
//   const AboutSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isMobile = width < 700;
//     return Container(
//       width: double.infinity,
//       color: const Color(0xFF081B28),
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 24 : 0,
//         vertical: isMobile ? 24 : 32,
//       ),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 900),
//           child:
//               isMobile
//                   ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 60,
//                         backgroundImage: AssetImage(
//                           'assets/images/avatar.png',
//                         ), // Replace with your avatar asset
//                         backgroundColor: Colors.transparent,
//                       ),
//                       const SizedBox(height: 24),
//                       ConstrainedBox(
//                         constraints: const BoxConstraints(maxWidth: 600),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               'I am building super useful android applications besides holding a strong interests towards designing and developing cool and custom UI /UX and attractive user interfaces. Focused towards building products, besides work also a FIDE rated chess player',
//                               style: TextStyle(
//                                 fontFamily: 'Manrope',
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 14,
//                                 color: Colors.white,
//                                 height: 1.5,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(height: 16),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.star,
//                                   color: Color(0xFFC6FCA6),
//                                   size: 18,
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Text(
//                                   'Currently Learning: Getting detailed insights on flutter and dart',
//                                   style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: 12,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//                   : Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 110,
//                         backgroundImage: AssetImage(
//                           'assets/images/avatar.png',
//                         ), // Replace with your avatar asset
//                         backgroundColor: Colors.transparent,
//                       ),
//                       const SizedBox(width: 48),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             ConstrainedBox(
//                               constraints: const BoxConstraints(maxWidth: 700),
//                               child: Text(
//                                 'I am building super useful android applications besides holding a strong interests towards designing and developing cool and custom UI /UX and attractive user interfaces. Focused towards building products, besides work also a FIDE rated chess player',
//                                 style: TextStyle(
//                                   fontFamily: 'Manrope',
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                   height: 1.5,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.star,
//                                   color: Color(0xFFC6FCA6),
//                                   size: 24,
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Text(
//                                   'Currently Learning: Getting detailed insights on flutter and dart',
//                                   style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: 16,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//         ),
//       ),
//     );
//   }
// }
