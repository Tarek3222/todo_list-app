import 'package:flutter/material.dart';

class BackgroundHomeView extends StatelessWidget {
  const BackgroundHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        Expanded(child: Container(
          color: Colors.white,
        ),),
      ],
    );
  }
}