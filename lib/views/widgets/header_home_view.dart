import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class HeaderHomeView extends StatelessWidget {
  const HeaderHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Jiffy.now().yMMMMd,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'Kalam',
          ),
        ),
        const Text(
          'My Todo List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kalam',
          ),
        ),
      ],
    );
  }
}
