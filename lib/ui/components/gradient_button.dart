// lib/ui/components/gradient_button.dart
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool loading;
  final bool expand; // full width by default
  final double? height; // optional custom height
  final BorderRadius? radius;
  final Gradient? gradient;

  const GradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.expand = true,
    this.height,
    this.radius,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ Safe height: use Sizer if ready else 48
    double safeH;
    try {
      safeH = height ?? 6.2.h;
    } catch (_) {
      safeH = height ?? 48.0;
    }

    final br = radius ?? BorderRadius.circular(30);

    final button = ClipRRect(
      borderRadius: br,
      child: Material(
        color: Colors.transparent, // allow gradient to show
        child: Ink(
          // Ink + decoration = ripple on gradient
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF3CA4DC), Color(0xFF334EA0)],
            ),
          ),
          child: InkWell(
            onTap: (loading || onPressed == null) ? null : onPressed,
            child: SizedBox(
              height: safeH,
              child: Center(
                child: loading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        label,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.5.sp, // ok: evaluated inside build
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
