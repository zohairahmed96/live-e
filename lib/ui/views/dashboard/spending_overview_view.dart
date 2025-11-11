import 'package:flutter/material.dart';
import 'package:liv_e/ui/components/spending_pie_chart.dart';
import 'package:liv_e/ui/viewmodels/dashboard/spending_overview_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../components/gradient_button.dart';

class SpendingOverviewView extends StatelessWidget {
  const SpendingOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SpendingOverviewViewModel(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  static const kHeaderBlue = Color(0xFFE8F3FF);
  static const kLightBlue = Color(0xFF3CA4DC);
  static const kDarkBlue = Color(0xFF334EA0);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SpendingOverviewViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kHeaderBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Spending Overview',
          style: TextStyle(
            fontSize: 14.5.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0B101B),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // pie + legend (legend right, aligned like mock)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpendingPieChartFL(slices: vm.slices),
                  SizedBox(width: 6.w),
                  Expanded(child: _LegendFL(slices: vm.slices)),
                ],
              ),
              SizedBox(height: 2.0.h),

              // stats card
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 3.6.w,
                  vertical: 1.6.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0x14000000)),
                ),
                child: Column(
                  children: [
                    _bluePillRow(
                      'Total Spent',
                      '\$${vm.totalSpent.toStringAsFixed(0)}',
                    ),
                    SizedBox(height: 1.2.h),

                    _rowKV(
                      'Budget Goal',
                      '\$${vm.budgetGoal.toStringAsFixed(0)}',
                    ),
                    SizedBox(height: .8.h),
                    _budgetBar(vm.progress),
                    SizedBox(height: 1.2.h),

                    _rowKV('Remaining', '\$${vm.remaining.toStringAsFixed(0)}'),
                  ],
                ),
              ),

              SizedBox(height: 2.0.h),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: kLightBlue, width: 1.6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        foregroundColor: kLightBlue,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 11.sp,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 1.8.h),
                      ),
                      onPressed: () {},
                      child: const Text('View Details'),
                    ),
                  ),
                  SizedBox(width: 3.6.w),
                  Expanded(
                    child: GradientButton(
                      label: 'Set New Budget',
                      onPressed: () {},
                      height: 6.0.h,
                      gradient: const LinearGradient(
                        colors: [kLightBlue, kDarkBlue],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.4.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _budgetBar(double progress) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        height: 1.6.h,
        child: Stack(
          children: [
            Container(color: const Color(0xFFE9EEF8)),
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3CA4DC), Color(0xFF76B8F0)],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bluePillRow(String k, String v) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.2.w, vertical: 1.2.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [kLightBlue, kDarkBlue]),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              k,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 10.5.sp,
              ),
            ),
          ),
          Text(
            v,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 10.5.sp,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _rowKV(String k, String v, {Color? accentDot}) {
  return Row(
    children: [
      if (accentDot != null) ...[
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: accentDot, shape: BoxShape.circle),
        ),
        SizedBox(width: 2.w),
      ],
      Expanded(
        child: Text(
          k,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Text(
        v,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

class _LegendFL extends StatelessWidget {
  final List<SpendingSliceData> slices;
  const _LegendFL({required this.slices});

  @override
  Widget build(BuildContext context) {
    // exact order: Food, Transportation, Entertainment (like your image)
    final order = [
      ...slices.where((s) => s.label.toLowerCase().startsWith('food')),
      ...slices.where((s) => s.label.toLowerCase().contains('transport')),
      ...slices.where((s) => s.label.toLowerCase().startsWith('entertain')),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: order.map((s) {
        return Padding(
          padding: EdgeInsets.only(bottom: .9.h),
          child: Row(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: s.color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(width: 2.w),
              Text(
                s.label,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
