import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onTap, required this.backgroundColor, required this.iconColor});
  final IconData icon;
 final void Function()? onTap;
 final Color backgroundColor;
 final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Icon(icon,size: 26,color: iconColor,),
      ),
    );
  }
}