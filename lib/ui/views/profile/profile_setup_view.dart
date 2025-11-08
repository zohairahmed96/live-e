import 'dart:io';
import 'package:flutter/material.dart';
import 'package:liv_e/ui/components/app_dropdown.dart';
import 'package:liv_e/ui/components/app_text_field.dart';
import 'package:liv_e/ui/components/gradient_button.dart';
import 'package:liv_e/ui/viewmodels/profile/profile_setup_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProfileSetupView extends StatelessWidget {
  const ProfileSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileSetupViewModel(),
      child: const _ProfileSetupBody(),
    );
  }
}

class _ProfileSetupBody extends StatelessWidget {
  const _ProfileSetupBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileSetupViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE8F3FF), // light-blue band like mock
        centerTitle: true,
        title: Text(
          'Profile Setup',
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
          child: Form(
            key: vm.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // subtitle
                Text(
                  'Lorem ipsum dolor sit adipisce.',
                  style: TextStyle(color: Colors.black45, fontSize: 10.sp),
                ),
                SizedBox(height: 1.8.h),

                // ✅ Upload row: avatar LEFT, text RIGHT (tap anywhere to pick)
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: vm.pickImage,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 11.0.h,
                          height: 11.0.h,
                          color: const Color(0xFFEAF6FF),
                          child: vm.photoPath == null
                              ? const Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Color(0xFF2D6DD6),
                                )
                              : Image.file(
                                  File(vm.photoPath!),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SizedBox(width: 3.6.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upload Your Picture',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp,
                              color: const Color(0xFF0B101B),
                            ),
                          ),
                          SizedBox(height: .2.h),
                          Text(
                            '(Optional)',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 9.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.0.h),

                // Fields
                AppTextField(
                  controller: vm.nameCtrl,
                  label: 'Full Name',
                  hint: 'yournamehere',
                  prefix: const Icon(Icons.person_outline),
                  validator: (v) => vm.notEmpty(v, 'full name'),
                ),
                SizedBox(height: 1.2.h),

                AppTextField(
                  controller: vm.ageCtrl,
                  label: 'Your Age',
                  hint: '25',
                  keyboard: TextInputType.number,
                  prefix: const Icon(Icons.calendar_today_outlined),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return null; // optional
                    final n = int.tryParse(v.trim());
                    if (n == null || n < 1 || n > 130) return 'Enter valid age';
                    return null;
                  },
                ),
                SizedBox(height: 1.2.h),

                AppTextField(
                  controller: vm.emailCtrl,
                  label: 'Email',
                  hint: 'yourname@gmail.com',
                  keyboard: TextInputType.emailAddress,
                  prefix: const Icon(Icons.email_outlined),
                  validator: vm.emailValidator,
                ),
                SizedBox(height: 1.2.h),

                // Dropdown style like mock (with chevron)
                AppDropdown<String>(
                  label: 'Disability (optional)',
                  hint: 'Select Type',
                  value: vm.disability,
                  items: const [
                    DropdownMenuItem(value: 'Autism', child: Text('Autism')),
                    DropdownMenuItem(
                      value: 'Down Syndrome',
                      child: Text('Down Syndrome'),
                    ),
                    DropdownMenuItem(value: 'ADHD', child: Text('ADHD')),
                    DropdownMenuItem(
                      value: 'Hearing Impairment',
                      child: Text('Hearing Impairment'),
                    ),
                    DropdownMenuItem(value: 'Other', child: Text('Other')),
                  ],
                  onChanged: (v) {
                    vm.disability = v;
                    // vm.notifyListeners();
                  },
                ),

                SizedBox(height: 1.8.h),
                const Divider(color: Color(0xFFE0E0E0), thickness: 1),
                SizedBox(height: 1.6.h),

                // Section title
                Text(
                  'Caregiver contact info',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                    color: const Color(0xFF0B101B),
                  ),
                ),
                SizedBox(height: 1.2.h),

                AppTextField(
                  controller: vm.cgRelationCtrl,
                  label: 'Relation',
                  hint: 'Mother, Father, child',
                  prefix: const Icon(Icons.groups_outlined),
                  validator: (v) => vm.notEmpty(v, 'relation'),
                ),
                SizedBox(height: 1.2.h),

                AppTextField(
                  controller: vm.cgPhoneCtrl,
                  label: 'Phone Number',
                  hint: '+91 223 456 7890',
                  keyboard: TextInputType.phone,
                  prefix: const Icon(Icons.call_outlined),
                  validator: vm.phoneValidator,
                ),
                SizedBox(height: 1.2.h),

                AppTextField(
                  controller: vm.cgEmailCtrl,
                  label: 'Email (Optional)',
                  hint: 'yourname@gmail.com',
                  keyboard: TextInputType.emailAddress,
                  prefix: const Icon(Icons.email_outlined),
                ),
                SizedBox(height: 1.6.h),

                // ✅ Grey capsule switches like mock (each own chip)
                _capsuleSwitch(
                  label: 'Daily Reminders',
                  value: vm.dailyReminders,
                  onChanged: (v) {
                    vm.dailyReminders = v;
                    // vm.notifyListeners();
                  },
                ),
                _capsuleSwitch(
                  label: 'Visual Schedules',
                  value: vm.visualSchedules,
                  onChanged: (v) {
                    vm.visualSchedules = v;
                    // vm.notifyListeners();
                  },
                ),
                _capsuleSwitch(
                  label: 'Emergency Alerts',
                  value: vm.emergencyAlerts,
                  onChanged: (v) {
                    vm.emergencyAlerts = v;
                    // vm.notifyListeners();
                  },
                ),
                _capsuleSwitch(
                  label: 'Caregiver Notifications',
                  value: vm.caregiverNotifications,
                  onChanged: (v) {
                    vm.caregiverNotifications = v;
                    // vm.notifyListeners();
                  },
                ),

                SizedBox(height: 2.2.h),

                // Bottom CTA
                GradientButton(
                  label: 'Continue',
                  loading: vm.loading,
                  onPressed: () => vm.submit(context),
                ),
                SizedBox(height: 3.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ----- helpers -----
  Widget _capsuleSwitch({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.0.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      height: 6.8.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6F8), // light grey chip like mock
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF2D6DD6),
          ),
        ],
      ),
    );
  }
}
