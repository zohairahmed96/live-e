import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/ui/components/Button/app_outlined_button.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/components/spending_pie_chart.dart';
import 'package:liv_e/ui/viewmodels/dashboard/spending_overview_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../components/Button/gradient_button.dart';

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

  static const kHeaderBlue = AppColor.cE4F6FF;
  static const kLightBlue = Color(0xFF3CA4DC);
  static const kDarkBlue = Color(0xFF334EA0);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SpendingOverviewViewModel>();

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        toolbarHeight: ch(80),
        elevation: 0,
        backgroundColor: kHeaderBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.c3CA4DC,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: AppText(
          txt: 'Spending Overview',
          fontSize: AppFontSize.f22,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: cw(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: SpendingPieChartFL(slices: vm.slices),
                  ),
                  SizedBox(width: cw(34)),
                  Padding(
                    padding: EdgeInsets.only(top: ch(108)),
                    child: _LegendFL(slices: vm.slices),
                  ),
                ],
              ),
              SizedBox(height: 2.0.h),

              // stats card
              Container(
                width: cw(370),
                height: ch(161),
                padding: EdgeInsets.symmetric(horizontal: cw(14)),
                decoration: BoxDecoration(
                  color: AppColor.c3CA4DC.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  // border: Border.all(color: AppColor.c3CA4DC),
                ),
                child: Column(
                  children: [
                    SizedBox(height: ch(20)),
                    _rowKV(
                      k: 'Total Spent',
                      v: '\$${vm.totalSpent.toStringAsFixed(0)}',
                    ),
                    SizedBox(height: ch(12)),
                    // SizedBox(height: 1.2.h),
                    Divider(
                      color: AppColor.c3CA4DC.withOpacity(0.4),
                      indent: cw(2),
                      endIndent: cw(2),
                    ),
                    // SizedBox(height: ch(12)),
                    _rowKV(
                      k: 'Budget Goal',
                      v: '\$${vm.budgetGoal.toStringAsFixed(0)}',
                      isBudget: true,
                      progress: vm.progress,
                    ),
                    Divider(
                      color: AppColor.c3CA4DC.withOpacity(0.4),
                      indent: cw(2),
                      endIndent: cw(2),
                    ),

                    _rowKV(
                      k: 'Remaining',
                      v: '\$${vm.remaining.toStringAsFixed(0)}',
                    ),
                  ],
                ),
              ),

              SizedBox(height: ch(29)),

              Row(
                children: [
                  Expanded(
                    child: AppOutlinedButton(
                      onPressed: () => {},
                      text: "View Details",
                      borderColor: kLightBlue,
                    ),
                  ),
                  SizedBox(width: 3.6.w),
                  Expanded(
                    child: GradientButton(
                      label: 'Set New Budget',
                      onPressed: () {},
                      height: ch(54),
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
}

Widget _rowKV({
  required String k,
  required String v,
  bool isBudget = false,
  double progress = 0,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            txt: k,
            fontSize: AppFontSize.f16,
            fontWeight: FontWeight.w500,
          ),
          AppText(
            txt: v,
            fontSize: AppFontSize.f16,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      if (isBudget == true) ...[
        SizedBox(height: ch(12)),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            height: ch(8),
            width: cw(341), // optional width (recommended)
            child: Stack(
              children: [
                Container(color: const Color(0xFFE9EEF8)),
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: (progress ?? 0).clamp(0.0, 1.0),
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
        ),
        SizedBox(height: ch(12)),
      ],
    ],
  );
}

class _LegendFL extends StatelessWidget {
  final List<SpendingSliceData> slices;
  const _LegendFL({required this.slices});

  @override
  Widget build(BuildContext context) {
    final order = [
      ...slices.where((s) => s.label.toLowerCase().startsWith('food')),
      ...slices.where((s) => s.label.toLowerCase().contains('transport')),
      ...slices.where((s) => s.label.toLowerCase().startsWith('entertain')),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: order.map((s) {
        return Padding(
          padding: EdgeInsets.only(bottom: 1.2.h),
          child: Row(
            children: [
              Container(
                width: cw(19),
                height: cw(19),
                decoration: BoxDecoration(
                  color: s.color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(width: cw(7)),
              AppText(txt: s.label, fontWeight: FontWeight.w600),
            ],
          ),
        );
      }).toList(),
    );
  }
}
