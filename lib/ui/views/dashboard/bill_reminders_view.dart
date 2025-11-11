import 'package:flutter/material.dart';
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

              _BlueCalendar(
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
class _BlueCalendar extends StatelessWidget {
  final DateTime month;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final bool Function(DateTime) isReminder;
  final void Function(DateTime) onDayTap;

  const _BlueCalendar({
    required this.month,
    required this.onPrev,
    required this.onNext,
    required this.isReminder,
    required this.onDayTap,
  });

  static const kBlue = Color(0xFF3CA4DC);
  static const _weekdayLabels = [
    'Sun',
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT',
  ];

  @override
  Widget build(BuildContext context) {
    final first = DateTime(month.year, month.month, 1);
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final startWeekday = first.weekday % 7; // 0=Sun..6=Sat
    final cells = startWeekday + daysInMonth;
    final rows = (cells / 7).ceil();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.6.w, vertical: 1.6.h),
      decoration: BoxDecoration(
        color: kBlue,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          // Top row (year, month, calendar icon)
          Row(
            children: [
              Text(
                '${month.year}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 11.sp,
                ),
              ),
              const Spacer(),
              Text(
                _monthName(month.month).toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  fontSize: 10.sp,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.calendar_today_rounded,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
          SizedBox(height: 1.2.h),

          // Weekday header (white tabs)
          Row(
            children: [
              IconButton(
                onPressed: onPrev,
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (i) {
                    final isWeekend = i == 0 || i == 6;
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 1.2.w,
                        vertical: .6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _weekdayLabels[i],
                        style: TextStyle(
                          color: kBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 8.sp,
                          letterSpacing: .2,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              IconButton(
                onPressed: onNext,
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.0.h),

          // Dates grid
          Column(
            children: List.generate(rows, (r) {
              return Padding(
                padding: EdgeInsets.only(bottom: .8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (c) {
                    final index = r * 7 + c;
                    final dayNum = index - startWeekday + 1;
                    if (dayNum < 1 || dayNum > daysInMonth) {
                      return SizedBox(width: 8.w, height: 4.8.h); // empty cell
                    }
                    final date = DateTime(month.year, month.month, dayNum);
                    final isWeekend = c == 0 || c == 6;
                    final isHighlighted = isWeekend || isReminder(date);

                    return GestureDetector(
                      onTap: () => onDayTap(date),
                      child: Container(
                        width: 8.w,
                        height: 4.8.h,
                        decoration: BoxDecoration(
                          color: isHighlighted
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '$dayNum',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isHighlighted
                                ? kBlue
                                : Colors.white, // rule you gave
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  String _monthName(int m) {
    const names = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return names[m - 1];
  }
}
