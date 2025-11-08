import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int index; // 0..2
  const PageIndicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        final active = i == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: active ? 22 : 6,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(active ? .9 : .35),
            borderRadius: BorderRadius.circular(100),
          ),
        );
      }),
    );
  }
}
