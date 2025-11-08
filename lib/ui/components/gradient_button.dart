import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final bool expand;           // full width by default
  final double? height;        // optional custom height
  final BorderRadius? radius;

  const GradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.expand = true,
    this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final br = radius ?? BorderRadius.circular(30);

    final button = ClipRRect(
      borderRadius: br,
      child: Material(
        color: Colors.transparent,              // allow gradient to show
        child: Ink(                             // Ink + decoration = ripple on gradient
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF55B4FF), Color(0xFF2D6DD6)],
            ),
          ),
          child: InkWell(
            onTap: (loading || onPressed == null) ? null : onPressed,
            child: SizedBox(
              height: height ?? 6.2.h,
              child: Center(
                child: loading
                    ? const SizedBox(
                        width: 22, height: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2,
                        ),
                      )
                    : Text(
                        label,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.5.sp,
                          letterSpacing: .2,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );

    if (!expand) return button;

    return SizedBox(width: double.infinity, child: button);
  }
}
