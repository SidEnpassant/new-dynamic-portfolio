// import 'package:flutter/material.dart';

// class HeroAboutSection extends StatelessWidget {
//   const HeroAboutSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isMobile = width < 900;
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: const Color(0xFF081B28),
//         image: DecorationImage(
//           image: AssetImage(
//             'assets/images/hero_bg.png',
//           ), // Place your custom background image here
//           fit: BoxFit.cover,
//         ),
//       ),
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 16 : 0,
//         vertical: isMobile ? 32 : 64,
//       ),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1100),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Heading
//               Text.rich(
//                 TextSpan(
//                   children: [
//                     const TextSpan(
//                       text: 'Building super useful\n',
//                       style: TextStyle(
//                         fontFamily: 'Ravenna Serial ExtraBold',
//                         fontWeight: FontWeight.w900,
//                         fontSize: 55,
//                         color: Color(0xFFE5E7E7),
//                         height: 1.16,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'android applications',
//                       style: TextStyle(
//                         fontFamily: 'Ravenna Serial ExtraBold',
//                         fontWeight: FontWeight.w900,
//                         fontSize: 55,
//                         color: Color(0xFFC6FCA6),
//                         height: 1.16,
//                       ),
//                     ),
//                     const TextSpan(
//                       text: ' to live life.',
//                       style: TextStyle(
//                         fontFamily: 'Ravenna Serial ExtraBold',
//                         fontWeight: FontWeight.w900,
//                         fontSize: 55,
//                         color: Color(0xFFE5E7E7),
//                         height: 1.16,
//                       ),
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//               const SizedBox(height: 32),
//               // Name and button row
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text.rich(
//                     TextSpan(
//                       children: [
//                         const TextSpan(
//                           text: 'Hi , myself ',
//                           style: TextStyle(
//                             fontFamily: 'Ravenna Serial ExtraBold',
//                             fontWeight: FontWeight.w800,
//                             fontSize: 36,
//                             color: Colors.white,
//                           ),
//                         ),
//                         TextSpan(
//                           text: 'Siddhes Das',
//                           style: TextStyle(
//                             fontFamily: 'Ravenna Serial ExtraBold',
//                             fontWeight: FontWeight.w800,
//                             fontSize: 36,
//                             color: Color(0xFFC6FCA6),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 24),
//                   SizedBox(
//                     height: 40,
//                     child: OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         side: const BorderSide(color: Colors.white, width: 1),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         padding: const EdgeInsets.symmetric(horizontal: 24),
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         'Download resume',
//                         style: TextStyle(
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 13,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40),
//               // About row
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Avatar
//                   CircleAvatar(
//                     radius: 60,
//                     backgroundImage: AssetImage(
//                       'assets/images/avatar.png',
//                     ), // Replace with your avatar asset
//                     backgroundColor: Colors.transparent,
//                   ),
//                   const SizedBox(width: 32),
//                   // About text and badge
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'I am building ',
//                                 style: TextStyle(
//                                   fontFamily: 'Manrope',
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                   height: 1.5,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: 'super useful android applications',
//                                 style: TextStyle(
//                                   fontFamily: 'Manrope',
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 16,
//                                   color: Color(0xFFC6FCA6),
//                                   height: 1.5,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text:
//                                     ' besides holding a strong interests towards designing and developing cool and ',
//                                 style: TextStyle(
//                                   fontFamily: 'Manrope',
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                   height: 1.5,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text:
//                                     'custom UI /UX and attractive user interfaces',
//                                 style: TextStyle(
//                                   fontFamily: 'Manrope',
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 16,
//                                   color: Color(0xFFC6FCA6),
//                                   height: 1.5,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text:
//                                     '. Focused towards building products , besides work also a FIDE rated chess player',
//                                 style: TextStyle(
//                                   fontFamily: 'Manrope',
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                   height: 1.5,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                         // Currently Learning badge
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 10,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.transparent,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(
//                                 Icons.star,
//                                 color: Color(0xFFC6FCA6),
//                                 size: 22,
//                               ),
//                               const SizedBox(width: 8),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: const [
//                                   Text(
//                                     'Currently Learning',
//                                     style: TextStyle(
//                                       fontFamily: 'Ravenna Serial ExtraBold',
//                                       fontWeight: FontWeight.w900,
//                                       fontSize: 16,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(height: 2),
//                                   Text(
//                                     'Getting detailed insights on flutter and dart',
//                                     style: TextStyle(
//                                       fontFamily: 'Manrope',
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 13,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
