import 'package:flutter/material.dart';
import 'package:liv_e/ui/components/calender.dart';
import 'package:liv_e/ui/viewmodels/dashboard/bill_reminders_viewmodel.dart'
    show BillRemindersViewModel;
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../components/light_blue_button.dart';

class BillRemindersView extends StatelessWidget {
  const BillRemindersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BillRemindersViewModel(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  static const kBlue = Color(0xFF3CA4DC); // header back & calendar blue

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BillRemindersViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE8F3FF),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kBlue,
          ), // #3CA4DC
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Bill Reminders',
          style: TextStyle(
            fontSize: 14.5.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
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
              Text(
                'Bill Reminders',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 11.sp,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 1.2.h),

              BlueCalendar(
                month: vm.current,
                isReminder: vm.isReminder,
                onDayTap: vm.toggleReminder,
                onPrev: vm.prevMonth,
                onNext: vm.nextMonth,
              ),

              SizedBox(height: 2.0.h),
              LightBlueButton(
                label: 'Set Reminder',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Set Reminder tapped')),
                  );
                },
              ),
              SizedBox(height: 1.2.h),
              LightBlueButton(
                label: 'Filter Option',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Filter Option tapped')),
                  );
                },
              ),
              SizedBox(height: 2.0.h),
            ],
          ),
        ),
      ),
    );
  }
}

/// Blue calendar exactly like mock (blue panel, white weekend/reminder pills)
