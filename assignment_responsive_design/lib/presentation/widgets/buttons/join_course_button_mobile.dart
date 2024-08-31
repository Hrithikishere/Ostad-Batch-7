import 'package:flutter/material.dart';

class JoinCourseButtonMobile extends StatelessWidget {
  const JoinCourseButtonMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF23e796),
        borderRadius: BorderRadius.circular(5),
      ),
      width: 320,
      child: const Text(
        'Join Course',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
