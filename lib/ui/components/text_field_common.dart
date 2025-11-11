import 'package:flutter/material.dart';

class TextFieldCommon extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final Color? fillColor;

  const TextFieldCommon({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
      ),
    );
  }
}
