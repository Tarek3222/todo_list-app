import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text,required this.onPressed,});
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
             minimumSize: Size(MediaQuery.of(context).size.width, 50),
            ),
            child: Text(text,
            style:const TextStyle(
              color: Colors.white,
              fontFamily: 'Kalam',
              fontSize: 20,
            )
            ),
          );
  }
}