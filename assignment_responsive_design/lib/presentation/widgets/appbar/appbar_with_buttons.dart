import 'package:flutter/material.dart';

class AppbarWithButtons extends StatelessWidget {
  const AppbarWithButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'HUMMING\nBIRD.',
          style: TextStyle(fontSize: 16),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child:
                  const Text('Episodes', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('About', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ],
    );
  }
}
