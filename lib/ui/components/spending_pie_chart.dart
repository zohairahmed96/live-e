// spending_pie_chart.js
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:sizer/sizer.dart';

class SpendingSliceData {
  final String label;
  final double percent;
  final Color color;
  const SpendingSliceData(this.label, this.percent, this.color);
}

class SpendingPieChartFL extends StatelessWidget {
  final List<SpendingSliceData> slices;

  const SpendingPieChartFL({super.key, required this.slices});

  @override
  Widget build(BuildContext context) {
    final size = cw(180);

    return SizedBox(
      width: cw(150),
      height: ch(217),
      child: PieChart(
        PieChartData(
          // Reintroducing sectionsSpace to create gaps between slices
          sectionsSpace: 8, // Adjust this value to control the gap size
          startDegreeOffset: -90,
          centerSpaceColor: Colors
              .white, // Changed back to white to be consistent with the gap background
          centerSpaceRadius: 0,
          sections: _buildSections(size),
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildSections(double size) {
    final ordered = [
      ...slices.where((s) => s.label == "Entertainment"),
      ...slices.where((s) => s.label == "Food"),
      ...slices.where((s) => s.label == "Transportation"),
    ];

    return [
      // Entertainment 60%
      PieChartSectionData(
        color: ordered[0].color,
        value: ordered[0].percent,
        radius: size * 0.5,
        // Adding borderSide back to create the distinct separation
        borderSide: const BorderSide(color: AppColor.transparent, width: 8),
        title: "${ordered[0].percent.toInt()}%",
        titleStyle: _titleStyle(),
        titlePositionPercentageOffset: 0.55,
      ),

      // Food 25%
      PieChartSectionData(
        color: ordered[1].color,
        value: ordered[1].percent,
        radius: size * 0.5,
        // Adding borderSide back
        borderSide: BorderSide(color: AppColor.transparent, width: 8),
        title: "${ordered[1].percent.toInt()}%",
        titleStyle: _titleStyle(),
        titlePositionPercentageOffset: 0.65,
      ),
      // Transportation 15%
      PieChartSectionData(
        color: ordered[2].color,
        value: ordered[2].percent,
        radius: size * 0.5,
        // Adding borderSide back
        borderSide: BorderSide(color: AppColor.transparent, width: 8),
        title: "${ordered[2].percent.toInt()}%",
        titleStyle: _titleStyle(),
        titlePositionPercentageOffset: 0.65,
      ),
    ];
  }

  TextStyle _titleStyle() => TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 12.sp,
  );
}
