import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:sizer/sizer.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final TextInputType keyboard;
  final Widget? prefix;
  final String? Function(String?)? validator;

  final bool isPassword; // NEW

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    this.keyboard = TextInputType.text,
    this.prefix,
    this.validator,
    this.isPassword = false, // NEW
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscure = true; // hide password initially

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboard,
      validator: widget.validator,
      obscureText: widget.isPassword ? _obscure : false, // only for password
      style: TextStyle(
        fontSize: AppFontSize.f16,
        fontWeight: FontWeight.normal,
        fontFamily: "Poppins",
        color: AppColor.black,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        // Prefix Icon
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: cw(11.18), right: cw(3)),
          child: widget.prefix,
        ),
        prefixIconConstraints: BoxConstraints(
          maxWidth: cw(27),
          maxHeight: cw(27),
        ),
        // Password eye
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
                child: Icon(
                  _obscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.blue,
                ),
              )
            : null,

        filled: true,
        fillColor: Colors.white,

        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(
            color: Colors.black12.withOpacity(.10),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: const BorderSide(color: Colors.blue, width: 1),
        ),
      ),
    );
  }
}
