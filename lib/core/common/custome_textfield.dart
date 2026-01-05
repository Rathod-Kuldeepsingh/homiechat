// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homiechat/config/theme/app_theme.dart';

class CustomeTextfield extends StatelessWidget {
  const CustomeTextfield({
    super.key,
    required this.controller,
    required this.HintText,
    this.ObscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.focusnode,
    this.Validator,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String HintText;
  final bool ObscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusnode;
  final String? Function(String?)? Validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: ObscureText,
      keyboardType: keyboardType,
      focusNode: focusnode,
      validator: Validator,
      inputFormatters: inputFormatters,
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      decoration: InputDecoration(
        hintText: HintText,
        filled: true,
        fillColor: const Color.fromARGB(255, 245, 245, 245),
        hintStyle: Theme.of(context).textTheme.labelMedium,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1.5,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1.5, color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
