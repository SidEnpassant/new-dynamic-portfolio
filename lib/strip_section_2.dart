import 'package:flutter/material.dart';

class StripSection2 extends StatelessWidget {
  const StripSection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Image.asset(
        'assets/images/strip2.png',
        fit: BoxFit.cover,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
