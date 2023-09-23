
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/AppDimensions.dart';
/*-------------------------------------------------------------------------------------------------------*/
// This widget will show custom textfield used in app..
/*-------------------------------------------------------------------------------------------------------*/
class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Icon prefixIcon;
  final bool obscureText;

  TextFormFieldWidget({
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.black),
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        ),
      ),
    );
  }
}