import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FontSizeSlider extends StatefulWidget {
  const FontSizeSlider({super.key});

  @override
  State<FontSizeSlider> createState() => _FontSizeSliderState();
}

class _FontSizeSliderState extends State<FontSizeSlider> {
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
      width: 48.w,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('small', style: _labelStyle()),
              Text('medium', style: _labelStyle()),
              Text('large', style: _labelStyle()),
            ],
          ),
        ],
      ),
    );
  }
}
