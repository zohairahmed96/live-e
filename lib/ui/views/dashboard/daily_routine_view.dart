import 'package:flutter/material.dart';
import 'package:liv_e/ui/components/chore_tile.dart';
import 'package:liv_e/ui/components/reminder_card.dart';
import 'package:liv_e/ui/viewmodels/dashboard/daily_routine_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
// import '../../components/gradient_button.dart';
// import '../../components/reminder_card.dart';
// import '../../components/chore_tile.dart';
// import '../../viewmodels/routine/daily_routine_viewmodel.dart';

class DailyRoutineView extends StatelessWidget {
  const DailyRoutineView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DailyRoutineViewModel(),
      child: const _DailyRoutineBody(),
    );
  }
}

class _DailyRoutineBody extends StatelessWidget {
  const _DailyRoutineBody();

  static const Color brandBlue = Color(0xFF3CA4DC);
  static const Color headerBg = Color(0xFFE8F3FF);
  static const Color borderColor = Color(0xFFE6E6E6);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DailyRoutineViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: headerBg,
        centerTitle: true,
        title: Text(
          'Daily Routine & Reminders',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 13.sp,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Reminder Cards
              ...List.generate(vm.reminders.length, (i) {
                final r = vm.reminders[i];
                return ReminderCard(
                  // imagePath: r.image,
                  title: r.title,
                  time: r.time,
                  enabled: r.enabled,
                  onChanged: (v) => vm.toggleReminder(i, v),
                  borderColor: borderColor,
                  imagePath: '',
                );
              }),
              SizedBox(height: 1.8.h),

              // Add Reminder Button
              Center(
                child: Container(
                  width: 60.w,
                  height: 6.2.h,
                  decoration: BoxDecoration(
                    color: brandBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton.icon(
                    icon: const Icon(Icons.add, color: Colors.white, size: 20),
                    label: const Text(
                      "Add Reminder",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),

              SizedBox(height: 3.h),

              // Chore Chart Header Band
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                color: headerBg,
                child: Text(
                  'Chore Chart',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11.5.sp,
                    color: const Color(0xFF0B101B),
                  ),
                ),
              ),
              SizedBox(height: 1.5.h),

              // Chore Tiles
              ...List.generate(vm.chores.length, (i) {
                final c = vm.chores[i];
                return ChoreTile(
                  leading: c.icon,
                  title: c.title,
                  done: c.done,
                  onChanged: (v) => vm.toggleChore(i, v),
                );
              }),

              SizedBox(height: 3.h),

              // Daily Routine Chart
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Daily Routine Chart',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11.5.sp,
                    color: const Color(0xFF0B101B),
                  ),
                ),
              ),
              SizedBox(height: 1.5.h),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Morning',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Afternoon',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.5.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 5.h,
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        color: const Color(0xFFEAF2FF),
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 10,
                            ),
                            overlayShape: SliderComponentShape.noOverlay,
                            activeTrackColor: Colors.transparent,
                            inactiveTrackColor: Colors.transparent,
                            thumbColor: Colors.white,
                            trackHeight: 8,
                          ),
                          child: Slider(
                            value: vm.routinePos,
                            onChanged: vm.setRoutine,
                            min: 0,
                            max: 1,
                            divisions: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
