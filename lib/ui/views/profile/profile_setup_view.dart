import 'dart:io';
import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/app_dropdown.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/components/app_text_field.dart';
import 'package:liv_e/ui/components/Button/gradient_button.dart';
import 'package:liv_e/ui/viewmodels/profile/profile_setup_viewmodel.dart';
import 'package:liv_e/ui/views/profile/custom_switch.dart';
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
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          child: Form(
            key: vm.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: cw(39)),
                AppText(
                  txt: "Profile Setup",
                  fontSize: AppFontSize.f26,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  txt: 'Lorem ipsum dolor sit adipisce.',
                  fontSize: AppFontSize.f16,
                  fontWeight: FontWeight.w400,
                  height: 2,
                ),

                SizedBox(height: ch(44)),

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
                          width: cw(94),
                          height: ch(89),
                          color: AppColor.cDAF2FF,
                          child: vm.photoPath == null
                              ? const Icon(
                                  Icons.person,
                                  size: 40,
                                  color: AppColor.c3CA4DC,
                                )
                              : Image.file(
                                  File(vm.photoPath!),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SizedBox(width: cw(20)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            txt: 'Upload Your Picture',
                            fontSize: AppFontSize.f18,
                            fontWeight: FontWeight.w600,
                          ),
                          AppText(
                            txt: '(Optional)',
                            fontSize: AppFontSize.f15,
                            fontWeight: FontWeight.w400,
                            height: 1.9,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ch(37)),

                // Fields
                AppTextField(
                  controller: vm.nameCtrl,
                  label: 'Full Name',
                  hint: 'yournamehere',
                  prefix: Image.asset(
                    ImagePaths.email,
                    width: cw(23),
                    height: ch(24),
                    color: AppColor.black.withOpacity(0.8),
                  ),
                  validator: (v) => vm.notEmpty(v, 'full name'),
                ),
                SizedBox(height: ch(22)),

                AppTextField(
                  controller: vm.ageCtrl,
                  label: 'Your Age',
                  hint: '25',
                  keyboard: TextInputType.number,
                  prefix: Image.asset(
                    ImagePaths.calender,
                    width: cw(23),
                    height: ch(24),
                    color: AppColor.black.withOpacity(0.8),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return null; // optional
                    final n = int.tryParse(v.trim());
                    if (n == null || n < 1 || n > 130) return 'Enter valid age';
                    return null;
                  },
                ),
                SizedBox(height: ch(22)),

                AppTextField(
                  controller: vm.emailCtrl,
                  label: 'Email',
                  hint: 'yourname@gmail.com',
                  keyboard: TextInputType.emailAddress,
                  prefix: Image.asset(
                    ImagePaths.resendEmail,
                    width: cw(23),
                    height: ch(24),
                    color: AppColor.black.withOpacity(0.6),
                  ),
                  validator: vm.emailValidator,
                ),
                SizedBox(height: ch(22)),

                // Dropdown style like mock (with chevron)
                AppDropdown<String>(
                  label: 'Disability (optional)',
                  hint: 'Select Type',
                  value: vm.disability,
                  prefix: Image.asset(
                    ImagePaths.disable,
                    width: cw(23),
                    height: ch(24),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'Autism',
                      child: AppText(txt: 'Autism'),
                    ),
                    DropdownMenuItem(
                      value: 'Down Syndrome',
                      child: AppText(txt: 'Down Syndrome'),
                    ),
                    DropdownMenuItem(
                      value: 'ADHD',
                      child: AppText(txt: 'ADHD'),
                    ),
                    DropdownMenuItem(
                      value: 'Hearing Impairment',
                      child: AppText(txt: 'Hearing Impairment'),
                    ),
                    DropdownMenuItem(
                      value: 'Other',
                      child: AppText(txt: 'Other'),
                    ),
                  ],
                  onChanged: (v) {
                    vm.disability = v;
                    // vm.notifyListeners();
                  },
                ),

                SizedBox(height: cw(46)),
                const Divider(color: Color(0xFFE0E0E0), thickness: 1),
                SizedBox(height: ch(39)),

                // Section title
                AppText(
                  txt: 'Caregiver contact info',
                  fontSize: AppFontSize.f18,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: ch(22)),

                AppTextField(
                  controller: vm.cgRelationCtrl,
                  label: 'Relation',
                  hint: 'Mother, Father, child',
                  prefix: Image.asset(
                    ImagePaths.email,
                    width: cw(23),
                    height: ch(24),
                    color: AppColor.black.withOpacity(0.8),
                  ),
                  validator: (v) => vm.notEmpty(v, 'relation'),
                ),
                SizedBox(height: ch(22)),

                AppTextField(
                  controller: vm.cgPhoneCtrl,
                  label: 'Phone Number',
                  hint: '+91 223 456 7890',
                  keyboard: TextInputType.phone,
                  prefix: Image.asset(
                    ImagePaths.phone,
                    width: cw(23),
                    height: ch(24),
                    color: AppColor.black.withOpacity(0.8),
                  ),
                  validator: vm.phoneValidator,
                ),
                SizedBox(height: ch(22)),

                AppTextField(
                  controller: vm.cgEmailCtrl,
                  label: 'Email (Optional)',
                  hint: 'yourname@gmail.com',
                  keyboard: TextInputType.emailAddress,
                  prefix: Image.asset(
                    ImagePaths.resendEmail,
                    width: cw(23),
                    height: ch(24),
                    color: AppColor.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: ch(22)),

                // ✅ Grey capsule switches like mock (each own chip)
                _capsuleSwitch(
                  label: 'Daily Reminders',
                  value: vm.dailyReminders,
                  onChanged: (v) {
                    vm.dailyReminders = v;
                    vm.notifyListeners();
                  },
                ),
                SizedBox(height: ch(22)),

                _capsuleSwitch(
                  label: 'Visual Schedules',
                  value: vm.visualSchedules,
                  onChanged: (v) {
                    vm.visualSchedules = v;
                    vm.notifyListeners();
                  },
                ),

                SizedBox(height: ch(22)),
                _capsuleSwitch(
                  label: 'Emergency Alerts',
                  value: vm.emergencyAlerts,
                  onChanged: (v) {
                    vm.emergencyAlerts = v;
                    vm.notifyListeners();
                  },
                ),
                SizedBox(height: ch(22)),

                _capsuleSwitch(
                  label: 'Caregiver Notifications',
                  value: vm.caregiverNotifications,
                  onChanged: (v) {
                    vm.caregiverNotifications = v;
                    vm.notifyListeners();
                  },
                ),
                SizedBox(height: ch(39)),

                // Bottom CTA
                GradientButton(
                  width: cw(372),
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
    // required dynamic vm,
  }) {
    return Container(
      // margin: EdgeInsets.only(bottom: ch(22)),
      padding: EdgeInsets.only(left: cw(20), right: cw(19)),
      height: 6.8.h,
      decoration: BoxDecoration(
        color: AppColor.white, // light grey chip like mock
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColor.cE4E4E4),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppText(
              txt: label,
              fontSize: AppFontSize.f16,
              fontWeight: FontWeight.w500,
            ),
          ),
          CustomSwitch(value: value, onChanged: onChanged),
          // SwitchTheme(
          //   data: SwitchThemeData(
          //     trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          //     trackOutlineWidth: WidgetStateProperty.all(0),
          //   ),
          //   child: Switch.adaptive(
          //     value: value,
          //     onChanged: onChanged,
          //     inactiveTrackColor: AppColor.cDEF5FF,
          //     activeColor: AppColor.c3CA4DC,
          //     thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          //       if (states.contains(WidgetState.selected)) {
          //         return Colors.white; // ✅ active
          //       }
          //       return AppColor.c3CA4DC; // ✅ inactive
          //     }),
          //   ),
          // ),
        ],
      ),
    );
  }
}
