import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:sizer/sizer.dart';

class FontSizeSlider extends StatefulWidget {
  const FontSizeSlider({super.key});

  @override
  State<FontSizeSlider> createState() => _FontSizeSliderState();
}

class _FontSizeSliderState extends State<FontSizeSlider> {
  // 0 = Small, 1 = Medium, 2 = Large
  int index = 1;

  final double trackHeight = 2;
  final double knobSize = 18;
  final Color blue = const Color(0xFF3CA4DC);

  void _onTap(double dx, double width) {
    final third = width / 3;
    setState(() {
      if (dx < third) {
        index = 0;
      } else if (dx < third * 2) {
        index = 1;
      } else {
        index = 2;
      }
    });
  }

  TextStyle _label(bool active) => TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w500,
    color: active ? blue : Colors.black54,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cw(144),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, c) {
              final w = c.maxWidth;
              final positions = [0.0, (w - knobSize) / 2, w - knobSize];

              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTapDown: (d) => _onTap(d.localPosition.dx, w),
                child: SizedBox(
                  height: ch(30),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      // TRACK
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 14,
                        child: Container(height: trackHeight, color: blue),
                      ),

                      // LEFT CAP
                      Positioned(
                        left: 0,
                        top: 8,
                        child: Container(width: 2, height: 14, color: blue),
                      ),

                      // RIGHT CAP
                      Positioned(
                        right: 0,
                        top: 8,
                        child: Container(width: 2, height: 14, color: blue),
                      ),

                      // KNOB
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeOut,
                        left: positions[index],
                        top: 6,
                        child: Container(
                          width: knobSize,
                          height: knobSize,
                          decoration: BoxDecoration(
                            color: blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // LABELS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Small', style: _label(index == 0)),
              Text('Medium', style: _label(index == 1)),
              Text('Large', style: _label(index == 2)),
            ],
          ),
        ],
      ),
    );
  }
}
