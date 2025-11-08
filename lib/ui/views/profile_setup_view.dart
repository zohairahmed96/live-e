import 'dart:io';
import 'package:flutter/material.dart';
import 'package:liv_e/ui/components/gradient_button.dart';
import 'package:liv_e/ui/components/text_field_common.dart';
import 'package:liv_e/ui/viewmodels/profile_setup_viewmodel.dart';
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
        backgroundColor: const Color(0xFFE8F3FF),
        centerTitle: true,
        title: Text(
          'Profile Setup',
          style: TextStyle(
            color: const Color(0xFF0B101B),
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        child: Form(
          key: vm.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar with upload button
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 14.h,
                      height: 14.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF6FF),
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: vm.imagePath == null
                          ? const Icon(
                              Icons.person,
                              size: 58,
                              color: Color(0xFF2380C4),
                            )
                          : Image.file(File(vm.imagePath!), fit: BoxFit.cover),
                    ),
                    SizedBox(height: 1.2.h),
                    Text(
                      'Upload Your Picture',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp,
                        color: const Color(0xFF0B101B),
                      ),
                    ),
                    Text(
                      '(Optional)',
                      style: TextStyle(color: Colors.black45, fontSize: 9.5.sp),
                    ),
                    SizedBox(height: 2.2.h),
                  ],
                ),
              ),

              TextFieldCommon(
                controller: vm.nameCtrl,
                hint: 'yournamehere',
                label: 'Full Name',
                validator: (v) => v!.isEmpty ? 'Enter name' : null,
                prefixIcon: const Icon(Icons.person_outline),
              ),
              SizedBox(height: 1.4.h),

              TextFieldCommon(
                controller: vm.ageCtrl,
                hint: '25',
                label: 'Your Age',
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Enter age' : null,
                prefixIcon: const Icon(Icons.calendar_today_outlined),
              ),
              SizedBox(height: 1.4.h),

              TextFieldCommon(
                controller: vm.emailCtrl,
                hint: 'yourname@gmail.com',
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              SizedBox(height: 1.4.h),

              TextFieldCommon(
                controller: vm.disabilityCtrl,
                hint: 'Select Type',
                label: 'Disability (optional)',
                readOnly: true,
                prefixIcon: const Icon(Icons.accessible_outlined),
                onTap: () {
                  // open bottom sheet later
                },
              ),
              SizedBox(height: 2.0.h),
              const Divider(thickness: 1, color: Color(0xFFE0E0E0)),
              SizedBox(height: 1.8.h),

              Text(
                'Caregiver contact info',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 11.sp,
                  color: const Color(0xFF0B101B),
                ),
              ),
              SizedBox(height: 1.4.h),

              TextFieldCommon(
                controller: vm.caregiverRelationCtrl,
                hint: 'Mother, Father, Child',
                label: 'Relation',
                prefixIcon: const Icon(Icons.family_restroom_outlined),
              ),
              SizedBox(height: 1.4.h),

              TextFieldCommon(
                controller: vm.caregiverPhoneCtrl,
                hint: '+91 223 456 7890',
                label: 'Phone Number',
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone_outlined),
              ),
              SizedBox(height: 1.4.h),

              TextFieldCommon(
                controller: vm.caregiverEmailCtrl,
                hint: 'yourname@gmail.com',
                label: 'Email (Optional)',
                prefixIcon: const Icon(Icons.email_outlined),
              ),

              SizedBox(height: 2.0.h),
              const Divider(thickness: 1, color: Color(0xFFE0E0E0)),
              SizedBox(height: 1.4.h),

              _switchRow(
                'Daily Reminders',
                vm.dailyReminders,
                (v) => vm.toggleSwitch('dailyReminders', v),
              ),
              _switchRow(
                'Visual Schedules',
                vm.visualSchedules,
                (v) => vm.toggleSwitch('visualSchedules', v),
              ),
              _switchRow(
                'Emergency Alerts',
                vm.emergencyAlerts,
                (v) => vm.toggleSwitch('emergencyAlerts', v),
              ),
              _switchRow(
                'Caregiver Notifications',
                vm.caregiverNotifications,
                (v) => vm.toggleSwitch('caregiverNotifications', v),
              ),

              SizedBox(height: 2.8.h),
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
    );
  }

  Widget _switchRow(String label, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11.sp),
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
