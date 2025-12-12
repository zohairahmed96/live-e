import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:sizer/sizer.dart';

class GlobalSlider extends StatefulWidget {
  const GlobalSlider({super.key});

  @override
  State<GlobalSlider> createState() => _GlobalSliderState();
}

class _GlobalSliderState extends State<GlobalSlider> {
  double v = 0.6; // knob near "Medium" as in mock

  TextStyle _labelStyle() => const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 9,
    color: Colors.black54,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cw(370),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              overlayShape: SliderComponentShape.noOverlay,
              activeTrackColor: const Color(0xFF9AD4F1),
              inactiveTrackColor: const Color(0xFFE0EFF9),
              thumbColor: const Color(0xFF3CA4DC),
            ),
            child: Slider(value: v, onChanged: (x) => setState(() => v = x)),
          ),
        ],
      ),
    );
  }
}
