// lib/ui/views/health/health_wellness_view.dart
import 'package:flutter/material.dart';
import 'package:liv_e/ui/components/medication.dart';
import 'package:liv_e/ui/components/white_action_row.dart';
import 'package:liv_e/ui/viewmodels/dashboard/health_wellness_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// import '../../components/medication_tile.dart';
// import '../../components/white_action_row.dart';
// import '../../components/library_thumb.dart';
// import '../../viewmodels/health/health_wellness_viewmodel.dart';

class HealthWellnessView extends StatelessWidget {
  const HealthWellnessView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HealthWellnessViewModel(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  static const headerBg = Color(0xFFE8F3FF);
  static const brandBlue = Color(0xFF3CA4DC);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HealthWellnessViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: headerBg,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Health & Wellness',
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
              // --- Medication ---
              Text(
                'Medication',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 11.5.sp,
                  color: const Color(0xFF0B101B),
                ),
              ),
              SizedBox(height: 1.2.h),
              MedicationTile(
                icon: Icons.medication_outlined,
                timeLabel: '8:00 AM',
                value: vm.medMorning,
                onChanged: vm.toggleMorning,
              ),
              MedicationTile(
                icon: Icons.medication_outlined,
                timeLabel: '5:00 PM',
                value: vm.medEvening,
                onChanged: vm.toggleEvening,
              ),
              SizedBox(height: 1.8.h),

              // --- Doctor Visits band + tile ---
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 3.6.w,
                  vertical: 1.2.h,
                ),
                color: headerBg,
                child: Text(
                  'Doctor Visits',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                    color: const Color(0xFF0B101B),
                  ),
                ),
              ),
              SizedBox(height: 1.2.h),
              WhiteActionRow(
                leading: Icon(
                  Icons.medical_information_rounded,
                  color: brandBlue,
                  size: 24,
                ),
                title: 'Doctor Visits',
                onTap: () {},
              ),
              SizedBox(height: 1.8.h),

              // --- Wellness Library band + 3 thumbs ---
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 3.6.w,
                  vertical: 1.2.h,
                ),
                color: headerBg,
                child: Text(
                  'Wellness Library',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                    color: const Color(0xFF0B101B),
                  ),
                ),
              ),
              SizedBox(height: 1.2.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //   //   LibraryThumb(imagePath: 'assets/images/fitness.jpg', label: 'Fitness'),
              //   //   LibraryThumb(imagePath: 'assets/images/hygiene.jpg', label: 'Hygiene'),
              //   //   LibraryThumb(imagePath: 'assets/images/mental.jpg', label: 'Mental'),
              //   // ],
              // ),
              SizedBox(height: 1.8.h),

              // --- Mood Tracker band + faces ---
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 3.6.w,
                  vertical: 1.2.h,
                ),
                color: brandBlue,
                child: Text(
                  'Mood Tracker',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 1.6.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.6.h),
                decoration: BoxDecoration(
                  color: brandBlue,
                  borderRadius: BorderRadius.circular(0), // band look
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _moodButton(context, vm, 0, Icons.emoji_emotions_rounded),
                    _moodButton(
                      context,
                      vm,
                      1,
                      Icons.sentiment_neutral_rounded,
                    ),
                    _moodButton(
                      context,
                      vm,
                      2,
                      Icons.sentiment_dissatisfied_rounded,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _moodButton(
    BuildContext context,
    HealthWellnessViewModel vm,
    int idx,
    IconData ic,
  ) {
    final selected = vm.mood == idx;
    return InkWell(
      onTap: () => vm.setMood(idx),
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          color: selected ? Colors.white.withOpacity(.15) : Colors.transparent,
        ),
        child: Icon(ic, color: Colors.white, size: 28),
      ),
    );
  }
}
