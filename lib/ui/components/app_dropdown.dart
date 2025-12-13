import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:sizer/sizer.dart';

class AppDropdown<T> extends StatelessWidget {
  final String label;
  final String hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final Widget? prefix;
  final String? Function(T?)? validator;

  const AppDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.prefix,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
      borderRadius: BorderRadius.circular(16),
      icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColor.c3CA4DC),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: cw(11.18), right: cw(3)),
          child: prefix ?? const Icon(Icons.accessibility_new_outlined),
        ),
        // prefix ?? const Icon(Icons.accessibility_new_outlined),
        prefixIconConstraints: BoxConstraints(
          minWidth: cw(24),
          minHeight: ch(24),
          maxWidth: cw(32),
          maxHeight: ch(32),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.8.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(
            color: Colors.black12.withOpacity(.06),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: const BorderSide(color: Color(0xFF55B4FF), width: 1.2),
        ),
      ),
    );
  }
}
