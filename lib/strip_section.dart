import 'package:flutter/material.dart';

class StripSection extends StatelessWidget {
  const StripSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Image.asset(
        'assets/images/strip1.png',
        fit: BoxFit.cover,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
