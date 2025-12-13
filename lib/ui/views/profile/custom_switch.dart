import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.width = 45,
    this.height = 26,
  });

  @override
  Widget build(BuildContext context) {
    final double padding = 3;
    final double thumbSize = height - (padding * 2);

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height),
          color: value
              ? AppColor
                    .c3CA4DC // active track
              : AppColor.cC4EBFF, // inactive track
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: thumbSize,
            height: thumbSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: value
                  ? Colors
                        .white // active thumb
                  : AppColor.c3CA4DC, // inactive thumb
            ),
          ),
        ),
      ),
    );
  }
}
