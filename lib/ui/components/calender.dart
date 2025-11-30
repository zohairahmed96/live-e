import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:sizer/sizer.dart';

class BlueCalendar extends StatelessWidget {
  final DateTime month;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final bool Function(DateTime) isReminder;
  final void Function(DateTime) onDayTap;

  const BlueCalendar({
    required this.month,
    required this.onPrev,
    required this.onNext,
    required this.isReminder,
    required this.onDayTap,
  });

  static const kBlue = AppColor.c3CA4DC;
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
      padding: EdgeInsets.symmetric(horizontal: cw(19), vertical: ch(18)),
      decoration: BoxDecoration(
        color: kBlue,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          // Top row (year, month, calendar icon)
          Row(
            children: [
              AppText(
                txt: '${month.year}',
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: AppFontSize.f14,
              ),
              // Text(
              //   '${month.year}',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.w700,
              //     fontSize: 11.sp,
              //   ),
              // ),
              const Spacer(),
              AppText(
                txt: _monthName(month.month).toUpperCase(),
                color: AppColor.white,
                fontWeight: FontWeight.w700,
                fontSize: AppFontSize.f14,
                wordspacing: 2,
              ),
              // Text(
              //   _monthName(month.month).toUpperCase(),
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.w700,
              //     letterSpacing: 2,
              //     fontSize: 10.sp,
              //   ),
              // ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: onPrev,
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.chevron_left_rounded,
                  color: AppColor.white,
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (i) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 1.w,
                        vertical: .4.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: AppText(
                        txt: _weekdayLabels[i],
                        color: AppColor.c1B1B1B,
                        fontWeight: FontWeight.w700,
                        wordspacing: 2,
                        fontSize: AppFontSize.f11,
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
          SizedBox(height: ch(10)),

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
                        child: AppText(
                          txt: '$dayNum',
                          fontWeight: FontWeight.w600,
                          color: isHighlighted ? kBlue : Colors.white,
                        ),
                        // Text(
                        //   ,
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w600,
                        //     // rule you gave
                        //     fontSize: 10.sp,
                        //   ),
                        // ),
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
