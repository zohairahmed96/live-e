import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SpendingSliceData {
  final String label;
  final double percent; // 0..100
  final Color color;
  const SpendingSliceData(this.label, this.percent, this.color);
}

/// Donut pie exactly like mock: thick ring, big white center,
/// bold % labels inside, white separators.
class SpendingPieChartFL extends StatelessWidget {
  final List<SpendingSliceData> slices;
  const SpendingPieChartFL({super.key, required this.slices});

  @override
  Widget build(BuildContext context) {
    double size;
    try {
      size = 42.w;
    } catch (_) {
      size = 168;
    } // slightly larger donut

    return SizedBox(
      width: size,
      height: size,
      child: PieChart(
        PieChartData(
          // start angle so the BIG 60% sits on the left like mock
          startDegreeOffset: 200, // tweak to match your screenshot layout
          centerSpaceColor: Colors.white,
          centerSpaceRadius: size * 0.32, // bigger hole
          sectionsSpace: 10, // thick white separators
          sections: _sections(size),
        ),
      ),
    );
  }

  List<PieChartSectionData> _sections(double size) {
    // Ensure order: Entertainment(60), Food(25), Transport(15)
    final ordered = [
      ...slices.where((s) => s.label.toLowerCase().startsWith('entertain')),
      ...slices.where((s) => s.label.toLowerCase().startsWith('food')),
      ...slices.where((s) => s.label.toLowerCase().contains('transport')),
    ];

    return ordered.map((s) {
      return PieChartSectionData(
        color: s.color,
        value: s.percent,
        radius: size * 0.56, // thick ring
        borderSide: const BorderSide(color: Colors.white, width: 10),
        title: '${s.percent.toStringAsFixed(0)}%',
        titleStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 11.sp,
        ),
        // move labels slightly outward on small wedges
        titlePositionPercentageOffset: s.percent >= 50 ? 0.55 : 0.70,
      );
    }).toList();
  }
}
