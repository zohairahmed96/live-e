import 'package:flutter/material.dart';
import '../../../core/utils/image_paths.dart';
import 'package:liv_e/ui/viewmodels/dashboard/financial_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../components/action_blue_card.dart';
import '../../components/info_white_card.dart';

class FinancialManagementView extends StatelessWidget {
  const FinancialManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FinancialViewModel(),
      child: const _FinancialBody(),
    );
  }
}

class _FinancialBody extends StatelessWidget {
  const _FinancialBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<FinancialViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE8F3FF),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Financial Management',
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
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.0.h),

              // ---- Budget Section ----
              Text(
                'Budget',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 11.sp,
                  color: const Color(0xFF0B101B),
                ),
              ),
              SizedBox(height: 1.0.h),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.6.w,
                  vertical: 1.6.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0x14000000)),
                ),
                child: Column(
                  children: [
                    // progress bar
                    Container(
                      height: 1.4.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9EEF8),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: LayoutBuilder(
                        builder: (c, b) => Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: b.maxWidth * vm.budgetProgress,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B83E6),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: .8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Goal', style: TextStyle(color: Colors.black54)),
                        Text('Spent', style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ],
                ),
              ),

              // ---- Due Bill Alerts header ----
              SizedBox(height: 2.2.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 3.6.w,
                  vertical: 1.2.h,
                ),
                decoration: const BoxDecoration(color: Color(0xFF3B83E6)),
                child: Text(
                  'Due Bill Alerts',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                  ),
                ),
              ),
              SizedBox(height: 1.2.h),

              // Bill Reminders blue card (PNG icon)
              ActionBlueCard(
                leading: Image.asset(
                  ImagePaths.reminder,
                  width: 22,
                  height: 22,
                  fit: BoxFit.contain,
                ),
                title: 'Bill Reminders',
                subtitle:
                    'Lorem ipsum is simply dummy text of the printing & typesetting…',
                onTap: () => vm.onBillRemindersTap(context),
              ),

              // ---- Spending Overview ----
              SizedBox(height: 2.2.h),
              Text(
                'Spending Overview',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 11.sp,
                  color: const Color(0xFF0B101B),
                ),
              ),
              SizedBox(height: 1.2.h),

              InfoWhiteCard(
                leading: ImagePaths.logo,
                title: 'Spending',
                subtitle:
                    'Lorem ipsum is simply dummy text of the printing & typesetting…',
                onTap: () => vm.onSpendingTap(context),
              ),

              SizedBox(height: 3.0.h),
            ],
          ),
        ),
      ),
    );
  }
}
