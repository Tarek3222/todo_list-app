import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText,  this.onChanged, this.validator, this.obscureText = false, this.maxLines=1, this.label, });
  final String hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final int? maxLines;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
            cursorColor: Colors.grey,
            obscureText: obscureText!,
            validator: validator,
            onChanged: onChanged ,
            maxLines:maxLines ,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:const TextStyle(
                color: kPrimaryColor,
              ),
              labelText: label,
              errorStyle:const TextStyle(color: Colors.red,fontFamily: 'Kalam'),
              labelStyle:const TextStyle(color: kPrimaryColor),
              fillColor: Colors.grey[100],
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:const BorderSide(color:  kPrimaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:const BorderSide(color: kPrimaryColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:const BorderSide(color:  Colors.red),
              ),
            ),
          );
  }
}