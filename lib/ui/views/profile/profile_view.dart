import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:liv_e/core/routes/app_routes.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:liv_e/ui/components/Button/gradient_button.dart';
import 'package:liv_e/ui/viewmodels/profile/profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: const _ProfileBody(),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE8F3FF), // light blue like mock
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 14.sp,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 3.2.h), // top space under header
              // Avatar
              Container(
                width: 13.5.h,
                height: 13.5.h,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F1FF),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  ImagePaths.peopleIconBlue,
                  width: cw(101),
                  height: ch(101),
                ),
              ),

              SizedBox(height: ch(14)),

              // Name & email (centered)
              AppText(
                txt: vm.name,
                fontSize: AppFontSize.f24,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ch(6)),
              AppText(
                txt: vm.email,
                fontSize: AppFontSize.f18,
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: ch(22)),

              // Edit Profile button (compact, pill)
              SizedBox(
                width: cw(170),
                child: GradientButton(
                  label: 'Edit Profile',
                  // onPressed: () => vm.editProfile(context),
                  expand: false,
                  height: 5.2.h,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.dailyRoutine);
                  },
                ),
              ),

              // “Setting” header
              SizedBox(height: ch(46)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: .4.w),
                  child: AppText(
                    txt: 'Settings',
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSize.f20,
                    color: AppColor.black,
                  ),
                ),
              ),
              SizedBox(height: ch(13)),

              // Card
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 3.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(.06),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _rowSwitch(
                      context,
                      icon: ImagePaths.location,
                      iconBg: const Color(0xFFE3F2FF),
                      title: 'Location',
                      value: vm.location,
                      onChanged: vm.toggleLocation,
                      isSwitch: true,
                    ),
                    _thinDivider(),
                    _rowSwitch(
                      context,
                      icon: ImagePaths.privacy,
                      iconBg: const Color(0xFFEFF5FF),
                      title: 'Privacy',
                      value: vm.privacy,
                      onChanged: vm.togglePrivacy,
                      isSwitch: true,
                    ),
                    _thinDivider(),
                    _rowSwitch(
                      context,
                      icon: ImagePaths.notification,
                      iconBg: const Color(0xFFF2F6FF),
                      title: 'Notifications',
                      value: vm.notifications,
                      onChanged: vm.toggleNotifications,
                      isSwitch: true,
                    ),

                    // Logout row (no trailing chevron per mock)
                    _thinDivider(),
                    _rowSwitch(
                      context,
                      icon: ImagePaths.logout,
                      iconBg: AppColor.cEF1616.withOpacity(0.2),
                      title: 'Logout',
                      value: vm.notifications,
                      onChanged: vm.toggleNotifications,
                      isSwitch: false,
                    ),

                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, AppRoutes.notifications);
                    //   },
                    //   child: Container(
                    //     height: 7.h,
                    //     padding: EdgeInsets.symmetric(horizontal: cw(20)),
                    //     child: Row(
                    //       children: [
                    //         _iconBadge(
                    //           ImagePaths.logout,
                    //           const Color(0xFFFFEBEE),
                    //           const Color(0xFFE53935),
                    //         ),
                    //         SizedBox(width: 3.6.w),
                    //         Text(
                    //           'Logout',
                    //           style: TextStyle(
                    //             color: const Color(0xFFE53935),
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 11.sp,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---- private UI helpers ----

  Widget _rowSwitch(
    BuildContext context, {
    required String icon,
    required Color iconBg,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    required bool isSwitch,
  }) {
    return SizedBox(
      height: 7.h, // fixed row height for consistent spacing like mock
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: cw(20)),
        child: Row(
          children: [
            _iconBadge(icon, iconBg, const Color(0xFF2D6DD6)),
            SizedBox(width: cw(4)),
            Expanded(
              child: AppText(
                txt: title,
                fontSize: AppFontSize.f16,
                fontWeight: FontWeight.w500,
                color: isSwitch ? AppColor.black : AppColor.cEF1616,
                // style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            isSwitch
                ? Switch.adaptive(
                    value: value,
                    onChanged: onChanged,
                    activeColor: AppColor.c3CA4DC,
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _iconBadge(String icon, Color bg, Color fg) {
    return Container(
      width: 33,
      height: 33,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(icon, width: cw(18), height: ch(18)),
    );
  }

  Widget _thinDivider() =>
      const Divider(height: 1, thickness: .8, color: Color(0xFFF1F2F4));
}
