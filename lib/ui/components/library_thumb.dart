// lib/ui/components/library_thumb.dart
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LibraryThumb extends StatelessWidget {
  final String imagePath;
  final String label;
  const LibraryThumb({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    final w = 24.w; // fits 3 across with gaps
    return SizedBox(
      width: w,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath, width: w, height: w, fit: BoxFit.cover),
          ),
          SizedBox(height: .8.h),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
