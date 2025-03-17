import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';

class ProfileTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String title;
  final TextInputType? keyboardType;
  final bool isPassword;

  const ProfileTextfield(
      {super.key,
      required this.hintText,
      required this.title,
      this.controller,
      this.keyboardType,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Tcolor.textfield,
        filled: true,
        labelText: title,
        labelStyle: TextStyle(
            color: Tcolor.placeholder,
            fontSize: 14,
            fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Tcolor.placeholder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Tcolor.placeholder),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
